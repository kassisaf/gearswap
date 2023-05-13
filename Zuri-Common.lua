-- Add items here to lock them when equipped manually
local lockables = {
    "Warp Ring",
    "Endorsement Ring",
    -- "Trizek Ring",
    "Echad Ring",
    "Emporox's Ring",
    "Caliber Ring",
    "Facility Ring",
    "Dim. Ring (Mea)",
    -- "Dim. Ring (Holla)",
    -- "Dim. Ring (Dem)",
    "Guide Beret",
    "Nexus Cape",
}

local modes = {
    TH = false,
}


-- Sets macro page and lockstyle set
function job_init(macro_book, macro_page, lockstyleset)
    send_command("wait 1; input /macro book " .. macro_book)
    send_command("wait 2; input /macro set " .. macro_page)
    if lockstyleset then
        send_command("wait 3; input /lockstyleset " .. lockstyleset)
    end
    send_command("wait 3; input /echo ** Job is " .. player.main_job .. "/" .. player.sub_job .. ". Macros set to Book " .. macro_book .. " Page " .. macro_page .. ". **")
end


-- Utility function takes a table and returns a set
function to_set(t)
    set = {}
    for _, v in pairs(t) do
        set[v] = true
    end
    return set
end

-- Custom equip function that respects items defined in `lockables`
local lockables_set = to_set(lockables)
function safe_equip(gearset)
    -- For each item in the set, check if player has a lockable item in that slot before equipping
    for slot, item in pairs(gearset) do
        if lockables_set[player.equipment[slot]] then
            disable(slot)
            -- send_command('input /echo ' .. player.equipment[slot] .. ' is equipped, ' .. slot .. ' slot locked.')
        else
            enable(slot)
        end
    end
    equip(gearset)
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

-- Helper functions for set swaps with custom logic

function equip_idle_or_tp_set()
    if player.status == "Engaged" then
        equip_tp_set()
    else
        equip_idle_set()
    end
end -- equip_idle_or_tp_set()


function equip_idle_set()
    -- Conditional movespeed gear
    if string.find(world.zone, "Adoulin") and sets.idle.adoulin then
        safe_equip(sets.idle, {body = "Councilor's Garb"})
    elseif player.main_job_level == 99 then
        safe_equip(sets.idle, {right_ring = "Shneddick Ring"})
    end
end -- equip_idle_set()


function equip_tp_set()
    if buffactive["Elvorseal"] and sets.DI then
        safe_equip(sets.DI)
    elseif modes["TH"] and sets.TH then
        safe_equip(sets.TP)
        safe_equip(sets.TH)
    else
        safe_equip(sets.TP)
    end
end -- equip_tp()


-- Gearswap hooks

function precast(spell, position)
    -- Use WS-specific set if it exists, or fall back to generic WS set
    if spell.type == "WeaponSkill" then
        if sets.precast.WS[spell.english] then
            safe_equip(sets.precast.WS[spell.english])
        else
            safe_equip(sets.precast.WS)
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
    elseif string.find(spell.type, "Magic") or spell.type == "BardSong" then
        safe_equip(sets.FC)
    end
end -- precast()


function midcast(spell)
    -- Use spell-specific midcast set if it exists
    if sets.midcast[spell.english] then
        safe_equip(sets.midcast[spell.english])
    -- Use type-specific midcast set if it exists (i.e. elemental magic)
    elseif sets.midcast[spell.type] then
        safe_equip(sets.midcast[spell.type])
    end
end -- midcast()


function aftercast(spell)
    equip_idle_or_tp_set()
end -- aftercast()


function status_change(new, old)
    equip_idle_or_tp_set()
end -- status_change()


function buff_change(name, gain, buff_details)
    if name == "Doomed" then
        if gain then
            equip(sets.doomed)
            send_command("input /p Doomed.")
        else
            send_command("input /p Doom off.")
        end
    end
end

-- Command usage:
--     //gs c r|reset:  Resets lockables
--     //gs c th:       Toggles TH mode
function self_command(command)
    if command == "r" or command == "reset" then
        unequip_lockables()
    elseif command == "th" then
        modes["TH"] = not modes["TH"]
        send_command("input /echo TH is " .. tostring(modes['TH']) .. ".")
        equip_idle_or_tp_set()
    end
end -- self_command()