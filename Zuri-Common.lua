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

-- Utility function takes a table and returns a set
function to_set(t) {
    local set = {}
    for _, v in t do
        set[v] = true
    end
    return set
}

-- Custom equip function that respects items defined in `lockables`
local lockables_set = to_set(lockables)
function _equip(gearset) {
    for slot, item in pairs(gearset)
        if lockables_set[player.equipment[slot].name] then
            disable(slot)
        else
            enable(slot)
        end
    end
    equip(gearset)
}

-- Sets macro page and lockstyle set
function _job_init(macro_book, macro_page, lockstyleset) {
    set_macro_page(macro_book, macro_page)
    send_command('wait 1; input /macro book ' .. macro_book)
    send_command('wait 2; input /macro set ' .. macro_page)
    send_command('wait 3; input /lockstyleset ' .. lockstyleset)
    send_command('input /echo ** Job is ' .. player.main_job .. '/' .. player.sub_job .. '. Macros set to Book ' .. macro_book .. ' Page ' .. macro_page .. '. **')
}

-- Helper functions for set swaps with custom logic

function equip_idle_set()
    equip(sets.idle)

    -- Conditional movespeed gear
    if string.find(world.zone, "Adoulin") and sets.idle.adoulin then
        equip({body = "Councilor's Garb"})
    elseif player.main_job_level == 99 then
        equip({right_ring = "Shneddick Ring"})
    end
end -- equip_idle_set()


function equip_tp_set()
    if buffactive["Elvorseal"] then
        equip(sets.di)
    else
        equip(sets.tp)
    end
end -- equip_tp()


-- Gearswap hooks

function precast(spell, position)
    -- Use WS-specific set if it exists, or fall back to generic WS set
    if spell.type == "WeaponSkill" then
        if sets.precast.WS[spell.english] then
            equip(sets.precast.WS[spell.english])
        else
            equip(sets.precast.WS)
        end
    -- Use JA-specific set if it exists
    elseif spell.type == "JobAbility" and sets.precast.JA[spell.english] then
        equip(sets.precast.JA[spell.english])
    elseif spell.type == "Ranged Attack" then
        equip(sets.precas.RA)
    -- Use spell-specific precast set if it exists
    elseif sets.precast[spell.english] then
        equip(sets.fc, sets.precast[spell.english])
    -- Use fastcast set for magic if nothing else matched
    elseif string.find(spell.type, "Magic") or spell.type == "BardSong" then
        equip(sets.fc)
    end
end -- precast()


function midcast(spell)
    -- Use spell-specific midcast set if it exists
    if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
    -- Use type-specific midcast set if it exists (i.e. elemental magic)
    elseif sets.midcast[spell.type] then
        equip(sets.midcast[spell.type])
    -- Fall back to idle set if nothing else matched
    else
        equip(sets.idle)
    end
end -- midcast()


function aftercast(spell)
    if player.status == "Engaged" then
        equip_tp_set()
    else
        equip_idle_set()
    end
end -- aftercast()


function buff_change(name, gain, buff_details) {
    if name == "Doomed"
        if gain then
            equip(sets.doomed)
            send_command('/p Doomed.')
        else
            send_command('/p Doom off.')
        end
    end
}