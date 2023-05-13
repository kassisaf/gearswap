function get_sets()
    sets.precast = {}
    sets.precast.WS = {}
    sets.precast.JA = {}
    sets.midcast = {}

    -- Basic sets
    sets.idle = {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Anu Torque",
        waist="Sailfi Belt +1",
        left_ear="Eabani Earring",
        right_ear="Handler's Earring +1",
        left_ring="Defending Ring",
        right_ring="Shneddick Ring",
        back="Solemnity Cape",
    }
    sets.idle.adoulin = set_combine(sets.idle, {
        body="Councilor's Garb",
    })
    sets.tp = {
        main="Kaja Knife",
        sub="Shijo",
        ammo="Focal Orb",
        head="Skulker's Bonnet +2",
        body="Adhemar Jacket",
        hands="Malignance Gloves",
        legs="Meghanada Chausses +1",
        feet="Plunderer's Poulaines +1",
        neck="Anu Torque",
        waist="Sailfi Belt +1",
        left_ear="Eabani Earring",
        right_ear="Skulker's Earring",
        left_ring="Petrov Ring",
        -- left_ring="Epona's Ring",
        right_ring="Meghanada Ring",
        back="Canny Cape",
    }
    sets.th = set_combine(sets.tp, {
        hands="Assassin's Armlets +2",
        feet="Skulker's Poulaines +2",
    })
    sets.ra = {
        head="Meghanada Visor",
        body="Pursuer's Doublet",
        left_ear="Odr Earring",
        left_ring="Behemoth Ring",
        right_ring="Behemoth Ring",
    }
    sets.fc = {}

    -- Weaponskill sets
    sets.precast.WS = {
        ammo="Yetshila",
        head="Skulker's Bonnet +2",
        body="Skulker's Vest +2",
        hands="Malignance Gloves",
        legs="Meghanada Chausses +1",
        feet="Skulker's Poulaines +2",
        neck="Caro Necklace",
        waist="Grunfeld Rope",
        left_ear="Moonshade Earring",
        right_ear="Odr Earring",
        -- left_ring="Ilabrat Ring",
        -- right_ring="Regal Ring",
        left_ring="Apate Ring",
        right_ring="Rufescent Ring",
        back="Canny Cape",
    }
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS,{
    })
    sets.precast.WS["Evisceration"] = set_combine(sets.precast.WS,{
        ammo="Yetshila",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ring="Mummu Ring",
    })
    sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS,{
        ammo="Hydrocera",
        legs="Limbo Trousers",
        neck="Deviant Necklace",
        waist="Eschan Stone",
        left_ring="Stikini Ring",
        right_ring="Stikini Ring",
    })
    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS,{
        right_ear="Ishvara Earring",
    })

    -- Job ability sets
    sets.precast.JA["Conspirator"] = {
        body="Skulker's Vest +2",
    }
    sets.precast.JA["Flee"] = {
        feet="Rogue's Poulaines",
    }
    sets.precast.JA["Perfect Dodge"] = {
        hands="Assassin's Armlets +2",  -- +10 seconds
    }
    -- Use TH for targeted JA's
    sets.precast.JA["Despoil"] = set_combine(sets.th, {
        legs="Raider's Culottes +1",
        feet="Skulker's Poulaines +1",
    })
    sets.precast.JA["Mug"] = set_combine(sets.th, {
        head="Assassin's Bonnet +1",
    })
    sets.precast.JA["Steal"] = set_combine(sets.th, {
        head="Rogue's Bonnet",       -- Steal +1
        hands="Thief's Kote",        -- Steal +3
        legs="Assassin's Culottes",  -- Steal +5
        feet="Rogue's Poulaines",    -- Steal +2
    })
    sets.precast.JA["Box Step"] = sets.th
    sets.precast.JA["Quick Step"] = sets.th

    -- Maximize crit rate for Domain Invasion
    sets.di = set_combine(sets.tp, {
        main="Voluspa Knife",
        sub="Shijo",
        ammo="Yetshila",
        hands="Mummu Wrists +1",
        left_ear="Odr Earring",
        left_ring="Mummu Ring",
        right_ring="Meghanada Ring",
    })
end -- get_sets()


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
        equip(sets.ra)
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
    if buffactive["Elvorseal"] and player.status == "Engaged" then
        equip(sets.di)
    elseif string.find(world.zone, "Adoulin") and sets.idle.adoulin then
        equip(sets.idle.adoulin)
    else
        equip(sets.idle)
    end
end -- aftercast()