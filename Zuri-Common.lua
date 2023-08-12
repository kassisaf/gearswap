include('Mote-Mappings.lua')
include('Zuri-Globals.lua')


----------------------
-- Helper functions --
----------------------

-- Generic table to set converter (equivalent to S{} in other Gearswap libs)
function to_set(t)
    set = {}
    for _, v in pairs(t) do
        set[v] = true
    end
    return set
end

function ends_with(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end

---------------------
-- Misc. variables --
---------------------

ENABLED_OR_DISABLED = { ["true"] = "enabled", ["false"] = "disabled" }

lockables_set = to_set(lockables) -- from Zuri-Settings.lua


------------------------
-- Modes and commands --
------------------------

-- State flags for various modes and settings
local modes = {
    TH = false,
    weapon_lock = false,
    has_pet = false,
    dummy_songs = false,
    debug = false,
}

-- Function for toggling boolean modes via macro or console commands
function toggle_mode(key)
    if modes[key] ~= nil then
        modes[key] = not modes[key]
        send_command("input /echo " .. key .. " mode " .. ENABLED_OR_DISABLED[tostring(modes[key])])
        equip_idle_or_tp_set()
    else
        send_command("input /echo Warning: tried to toggle " .. key .. " mode but key does not exist. (Check Zuri-Common `modes` table)")
    end
end

function print_spell_info_if_debug_enabled(spell)
    if modes["debug"] then
        send_command('input /echo precast spell.english:' .. spell.english .. ', type: ' .. spell.type .. ', action_type:' .. spell.action_type .. ', element: ' .. spell.element)
    end
end

----------------------------------------------
-- Utility functions for use in job scripts --
----------------------------------------------

function load_job_specific_addons()
    if player.main_job == "BLU" then
        send_command("lua l blualert")
    else
        send_command("lua u blualert")
    end
end

-- Sets macro page and lockstyle set, to be called on job load
function job_init(macro_book, macro_page, lockstyleset)
    send_command("wait 1; input /macro book " .. macro_book)
    send_command("wait 2; input /macro set " .. macro_page)
    if lockstyleset then
        send_command("wait 3; input /lockstyleset " .. lockstyleset)
    end
    send_command("wait 3; input /echo ** Job is " .. player.main_job .. "/" .. player.sub_job .. ". Macros set to Book " .. macro_book .. " Page " .. macro_page .. ". **")

    load_job_specific_addons()
end

--------------------------------------------------------
-- Locking logic for specific manually-equipped items --
--------------------------------------------------------

-- Custom equip function that respects items defined in `lockables`
function safe_equip(gearset, skip_recheck)
    -- Skip lockables check only if explicitly specified
    if not skip_recheck then
        -- If weapon lock is on, don't equip main or sub
        if modes["weapon_lock"] then
            disable("main", "sub")
        end
        -- If player is wearing a lockable item in any slot in this gearset, disable that slot
        if gearset then
            for slot, item in pairs(gearset) do
                if lockables_set[player.equipment[slot]] then
                    disable(slot)
                    send_command('input /echo ' .. player.equipment[slot] .. ' is equipped, ' .. slot .. ' is locked.')
                end
            end
        end
    end

    -- Equip the gearset, combining TH gear if TH mode is enabled
    if modes["TH"] and sets.TH then
        equip(gearset, sets.TH)
    elseif sets.dynamis_rp and string.find(world.zone, "Dynamis") then
        equip(gearset, sets.dynamis_rp)
    else
        equip(gearset)
    end
end

function handle_elemental_obi(spell)
    use_obi = spell.action_type == "Magic" or spell.type == "WeaponSkill" or spell.type ~= "CorsairShot"
    -- world.weather_element reports SCH weather over zone weather, if present
    if use_obi and (spell.element == world.weather_element or spell.element == world.day_element) then
        equip({waist = "Hachirin-no-Obi"})
    end
end

------------------------------------------------------
-- Helper functions for set swaps with custom logic --
------------------------------------------------------

function equip_idle_or_tp_set()
    if player.status == "Engaged" then
        equip_tp_set()
    else
        equip_idle_set()
    end
end -- equip_idle_or_tp_set()

function equip_idle_set()
    if modes["has_pet"] and sets.idle_with_pet then
        safe_equip(sets.idle_with_pet)
    else
        safe_equip(sets.idle)
    end
    
    if string.find(world.zone, "Adoulin") then
        equip({body = "Councilor's Garb"})
    end
end -- equip_idle_set()

function equip_tp_set()
    if buffactive["Elvorseal"] and sets.DI then
        safe_equip(sets.DI)
    else
        safe_equip(sets.TP)
    end
end -- equip_tp()

function equip_base_song_set(spell)
    if spell.target.type == "MONSTER" or string.find(spell.english, "Lullaby") then
        safe_equip(sets.midcast["DebuffSong"])
    else -- Buff song
        safe_equip(sets.midcast["BuffSong"])
    end
end

function equip_instrument(spell)
    if string.find(spell.english, "Horde Lullaby II") then
        instrument_to_equip = instrument_lullaby_h2
    elseif string.find(spell.english, "Lullaby") then
        instrument_to_equip = instrument_lullaby
    elseif modes["dummy_songs"] then
        instrument_to_equip = instrument_dummy
    else
        instrument_to_equip = instrument_general
    end
    equip({range = instrument_to_equip, ammo = empty})
end

function equip_roll_set(spell)
    -- Equip generic roll set first
    safe_equip(sets.precast.JA["Phantom Roll"])
    -- Add in set for specific roll if it exists
    if sets.precast.JA[spell.english] then
        safe_equip(sets.precast.JA[spell.english])
    end
end

-----------------------------
-- Standard Gearswap Hooks --
-----------------------------

function precast(spell, position)
    print_spell_info_if_debug_enabled(spell)

    if spell.action_type == "Ranged Attack" then
        safe_equip(sets.precast.RA)
        return
    end

    -- FC first for all magic
    if spell.action_type == "Magic" then
        safe_equip(sets.FC)
    end

    -- Use WS-specific set if it exists, or fall back to generic ranged or melee WS set
    if spell.type == "WeaponSkill" then
        if sets.precast.WS[spell.english] then
            safe_equip(sets.precast.WS[spell.english])
        elseif ranged_weaponskills[spell.english] then
            safe_equip(sets.precast.WS.ranged)
        else
            safe_equip(sets.precast.WS.melee)
        end
    -- Treat Double-Up as a roll (luzaf's and roll+ gear apply)
    elseif player.main_job == "COR" and (spell.english == "Double-Up" or spell.type == "CorsairRoll") then
        equip_roll_set(spell)
    -- General handing if nothing more specific matches above
    -- Check for set based on spell name first
    elseif sets.precast[spell.english] then
        safe_equip(sets.precast[spell.english])
    -- Then spell type
    elseif sets.precast[spell.type] then
        safe_equip(sets.precast[spell.type])
    elseif spell_maps[spell.english] and sets.precast[spell_maps[spell.english]] then
        safe_equip(sets.precast[spell_maps[spell.english]])
    end

    -- Only handle obi in precast for offensive abilities (WS, cor shots, etc.)
    if spell.action_type == "Ability" and player.target.type == "MONSTER" then
        handle_elemental_obi(spell)
    end
end -- precast()

function midcast(spell)
    print_spell_info_if_debug_enabled(spell)

    if spell.action_type == "Ranged Attack" then
        safe_equip(sets.midcast.RA)
        return
    end

    -- Transition from precast to idle unless action is WS or JA
    if spell.action_type == "Magic" then
        equip_idle_or_tp_set()
    end

    -- Then equip base set for spell type
    if spell.type == "BardSong" then
        equip_base_song_set(spell)
    elseif sets.midcast[spell.skill] then
        safe_equip(sets.midcast[spell.skill])
    elseif sets.midcast[spell.type] then
        safe_equip(sets.midcast[spell.type])
    end

    -- Then, if we have spell-specific gear, equip that last
    -- Look for exact matches first, then try the tiered spell map (i.e. sets.midcast["Fire IV"] and then sets.midcast.Fire)
    if sets.midcast[spell.english] then
        safe_equip(sets.midcast[spell.english])
    elseif spell_maps[spell.english] and sets.midcast[spell_maps[spell.english]] then
        safe_equip(sets.midcast[spell_maps[spell.english]])
    end

    -- Equip the appropriate instrument last
    if spell.type == "BardSong" then
        equip_instrument(spell)
    elseif spell.english == "Holy Water" then
        equip(holy_water_set)
    end

    -- Always handle obi in midcast
    handle_elemental_obi(spell)
end -- midcast()

function aftercast(spell)
    if string.find(spell.english, "Lullaby") or (player.main_job == "BRD" and player.equipment['range'] == empty) then
        equip({range = instrument_general, ammo = empty})
    end
    equip_idle_or_tp_set()
end -- aftercast()

function status_change(new, old)
    equip_idle_or_tp_set()
end -- status_change()

function pet_change(pet, gain)
    modes["has_pet"] = gain
    equip_idle_or_tp_set()
end -- pet_change()

function buff_change(name, gain, buff_details)
    -- if name == "Doom" then
    --     if gain then
    --         equip(sets.doomed)
    --         send_command("input /p Doomed.")
    --     else 
    --         equip_idle_or_tp_set()
    --         send_command("input /p Doom removed.")
    --     end
    -- end
end -- buff_change()

-- Command usage:
--  //gs c u|update: Calls an update to equip idle or TP set
--  //gs c th:       Toggles TH mode
--  //gs c melee:    Locks/unlocks main and sub slots
function self_command(command)
    if command == "u" or command == "update" then
        equip_idle_or_tp_set()
    elseif command == "th" then
        toggle_mode("TH")
        equip_idle_or_tp_set()
    elseif command == "dummy" then
        toggle_mode("dummy_songs")
    elseif command == "melee" then
        toggle_mode("weapon_lock")
    elseif command == "debug" then
        send_command("gs showswaps")
        send_command("gs debugmode")
        toggle_mode("debug")
    end
end -- self_command()