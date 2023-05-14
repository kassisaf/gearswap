include('Mote-Mappings.lua')
include('Zuri-Settings.lua')

ENABLED_OR_DISABLED = { ["true"] = "enabled", ["false"] = "disabled" }

-- Generic table to set converter (equivalent to S{} in other Gearswap libs)
function to_set(t)
    set = {}
    for _, v in pairs(t) do
        set[v] = true
    end
    return set
end

lockables_set = to_set(lockables)

------------------------
-- Modes and commands --
------------------------

-- State flags for various modes and settings
local modes = {
    TH = false,
    weapon_lock = false,
    -- skillup = false,  -- TODO: Implement skillup mode
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

-- Command usage:
--     //gs c r|reset:  Resets lockables
--     //gs c th:       Toggles TH mode
--     //gs c melee:    Locks/unlocks main and sub
function self_command(command)
    if command == "r" or command == "reset" then
        unequip_lockables()
    elseif command == "th" then
        toggle_mode("TH")
    elseif command == "melee" then
        toggle_mode("weapon_lock")
    end
end -- self_command()


----------------------------------------------
-- Utility functions for use in job scripts --
----------------------------------------------

-- Sets macro page and lockstyle set, to be called on job load
function job_init(macro_book, macro_page, lockstyleset)
    send_command("wait 1; input /macro book " .. macro_book)
    send_command("wait 2; input /macro set " .. macro_page)
    if lockstyleset then
        send_command("wait 3; input /lockstyleset " .. lockstyleset)
    end
    send_command("wait 3; input /echo ** Job is " .. player.main_job .. "/" .. player.sub_job .. ". Macros set to Book " .. macro_book .. " Page " .. macro_page .. ". **")
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
        -- If player is wearing a lockable item in any slot in the gearset, disable that slot
        for slot, item in pairs(gearset) do
            if lockables_set[player.equipment[slot]] then
                disable(slot)
                -- send_command('input /echo ' .. player.equipment[slot] .. ' is equipped, ' .. slot .. ' slot locked.')
            else
                enable(slot)
            end
        end
    end

    -- Equip the gearset, combining TH gear if TH mode is enabled
    if modes["TH"] and sets.TH then
        equip(gearset, sets.TH)
    else
        equip(gearset)
    end
end

-- Re-enables all slots where lockables are current equipped
function reset_lockables()
    for slot, item in pairs(player.equipment) do
        if lockables_set[item] then
            enable(slot)
        end
    end
    equip_idle_or_tp_set()
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
    -- Conditional movespeed gear
    if pet.isvalid and set.idle.pet_active then
        safe_equip(sets.idle_with_pet)
    elseif string.find(world.zone, "Adoulin") and sets.idle.adoulin then
        safe_equip(sets.idle, {body = "Councilor's Garb"})
    elseif player.main_job_level == 99 then
        safe_equip(sets.idle, {right_ring = "Shneddick Ring"})
    else
        safe_equip(sets.idle)
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
        safe_equip(sets.midcast["BuffSong"])
    else
        safe_equip(sets.midcast["DebuffSong"])
    end
end

function equip_spell_set(spell)
end


-----------------------------
-- Standard Gearswap Hooks --
-----------------------------

function precast(spell, position)
    -- Use WS-specific set if it exists, or fall back to generic WS set
    if spell.type == "WeaponSkill" then
        if sets.precast.WS[spell.english] then
            safe_equip(sets.precast.WS[spell.english])
        else
            safe_equip(sets.precast.WS.base)
        end
    -- Use JA-specific set if it exists
    elseif spell.type == "JobAbility" and sets.precast.JA[spell.english] then
        safe_equip(sets.precast.JA[spell.english])
    elseif spell.type == "Ranged Attack" then
        safe_equip(sets.precast.RA)
    -- Use spell-specific precast set if it exists
    elseif sets.precast[spell.english] then
        safe_equip(sets.precast[spell.english])
    -- Use fastcast set for magic if nothing else matched
    elseif spell.type ~= "JobAbility" and spell.type ~= "WeaponSkill" then
        safe_equip(sets.FC)
    end
end -- precast()

function midcast(spell)
    -- First, equip base set for spell type
    if spell.type == "BardSong" then
        equip_base_song_set(spell)
    elseif sets.midcast[spell.type] then
        safe_equip(sets.midcast[spell.type])
    end

    -- Then, if we have spell-specific gear, equip that on top
    -- Look for exact matches first, then try the tiered spell map (i.e. sets.midcast["Fire IV"] and then sets.midcast.Fire)
    if sets.midcast[spell.english] then
        safe_equip(sets.midcast[spell.english], true)
    elseif spell_maps[spell.english] and sets.midcast[spell_maps[spell.english]] then
        safe_equip(sets.midcast[spell_maps[spell.english]], true)
    end
end -- midcast()

function aftercast(spell)
    equip_idle_or_tp_set()
end -- aftercast()

function status_change(new, old)
    equip_idle_or_tp_set()
end -- status_change()

function buff_change(name, gain, buff_details)
    if name == "Doom" then
        if gain then
            equip(sets.doomed)
            send_command("input /p Doomed.")
        else 
            equip_idle_or_tp_set()
            send_command("input /p Doom removed.")
        end
    end
end
