function get_sets()
    include('Zuri-Logic.lua')
    job_init(2, 9, 15)   -- Macro book, macro page, lockstyle set

    -- Leave these empty
    sets.precast    = {}
    sets.precast.WS = {}
    sets.midcast    = {}

    -- Gear Aliases
    bullets = {
        physical = "Eminent Bullet",
        magic    = "Orichalcum Bullet",
    }
    snapshot_roll_cape = {name="Camulus's Mantle", augments={
        'INT+20',
        'Eva.+20 /Mag. Eva.+20',
        'Mag. Evasion+10',
        '"Snapshot"+10',
        'Mag. Evasion+15',
    }}
    leaden_salute_cape = {name="Camulus's Mantle", augments={
        'AGI+20',
        'Mag. Acc+20 /Mag. Dmg.+20',
        'AGI+10',
        'Weapon skill damage +10%',
        'Damage taken-5%',
    }}
    melee_tp_cape = {name="Camulus's Mantle", augments={
        'DEX+20',
        'Accuracy+20 Attack+20',
        'Accuracy+10',
        '"Dbl.Atk."+10',
        'Damage taken-5%',
    }}
    savage_cape = {name="Camulus's Mantle", augments={
        'STR+20',
        'Accuracy+20 Attack+20',
        'STR+10',
        'Weapon skill damage +10%',
        'Damage taken-5%',
    }}
    roll_knife = {name="Lanun Knife", augments={'Path: C'}}
    stp_knife = {name="Lanun Knife", augments={'Path: A'}}

    -- JSE Notes:
    -- Artifact: Corsair's / Laksamana's
    -- Relic:    Commodore / Lanun
    -- Empyrean: Navarch's / Chasseur's
    af_head     = "Laksamana's Tricorne"
    af_body     = "Laksamana's Frac +3"
    af_hands    = "Laksamana's Gants +1"
    af_legs     = "Laksamana's Trews +1"
    af_feet     = "Laksamana's Bottes +1" -- Upgrade these for quick draw
    relic_head  = "Lanun Tricorne"
    relic_body  = "Lanun Frac +3"
    relic_hands = "Lanun Gants +1"
    relic_legs  = "Lanun Trews"
    relic_feet  = "Lanun Bottes +3"
    empy_head   = "Chasseur's Tricorne +2"
    empy_body   = "Chasseur's Frac +2"
    empy_hands  = "Chasseur's Gants +2"
    empy_legs   = "Chasseur's Culottes +2"
    empy_feet   = "Chasseur's Bottes +3"
    jse_neck    = "Commodore Charm +1"

    -- Basic sets
    sets.idle = {
        main       = "Naegling",
        -- sub        = "Gleti's Knife",
        sub        = "Tauret",
        range      = "Ataktos",
        -- range      = "Molybdosis",
        ammo       = bullets["physical"],
        head       = "Nyame Helm",
        body       = empy_body,
        hands      = "Nyame Gauntlets",
        legs       = empy_legs,
        feet       = "Nyame Sollerets",
        neck       = "Loricate Torque +1",
        waist      = "Carrier's Sash",
        left_ear   = "Eabani Earring",
        right_ear  = "Meili Earring",      -- Odnowa Earring +1 once it has more RP
        left_ring  = "Defending Ring",
        right_ring = "Shneddick Ring",
        back       = snapshot_roll_cape,
    }
    sets.TP = set_combine(sets.idle, {
        -- head       = "Malignance Chapeau",
        -- body       = "Adhemar Jacket",
        -- hands      = "Malignance Gloves",
        -- feet       = "Malignance Boots",
        
        legs       = empy_legs,

        neck       = "Loricate Torque +1", -- Sacrificing neck for DT, consider using ring slot instead after Iskur Gorget
        waist      = "Sailfi Belt +1",
        left_ear   = "Eabani Earring",
        right_ear  = "Telos Earring",
        left_ring  = "Chirich Ring +1",
        right_ring = "Petrov Ring",
        back       = melee_tp_cape,
    })
    sets.FC = {
        neck       = "Magoraga Beads",
        left_ear   = "Loquacious Earring",
        right_ring = "Kishar Ring",
        waist      = "Sailfi Belt +1",
    }

    -- Shooting sets
    -- Preshot should contain: Snapshot, Rapid Shot
    -- Snapshot caps at 70 (-10% from gifts)
    -- Rapid shot reduces delay up to 50%, proc rate caps at 99%
    sets.precast.RA = {
        ammo  = bullets["physical"],
        -- 46 Snapshot, 29 Rapid Shot
        head  = empy_head,          -- 16 Rapid Shot
        body  = "Ikenga's Vest",    -- 9 Snapshot
        hands = relic_hands,        -- 9 Snapshot
        legs  = "Adhemar Kecks +1", -- 10 Snapshot, 13 Rapid Shot
        feet  = "Ikenga's Clogs",   -- 5 Snapshot
        neck  = jse_neck,           -- 3 Snapshot
        back  = snapshot_roll_cape, -- 10 Snapshot
        -- waist = "Yemaya Belt",
    }
    -- Midshot should contain: R.acc, STP, crit, R.atk, Recycle, etc.
    sets.midcast.RA = {
        head       = "Meghanada Visor +2", -- Ikenga after RP
        body       = empy_body,
        hands      = empy_hands,
        legs       = empy_legs,
        feet       = "Malignance Boots",
        back       = "Sokolski Mantle",
        neck       = "Marked Gorget",  -- Iskur Gorget
        waist      = "Eschan Stone",
        left_ring  = "Cacoethic Ring +1",
        right_ring = "Cacoethic Ring",
        left_ear   = "Telos Earring",
        right_ear  = "Beyla Earring",
        back       = leaden_salute_cape,   -- Replace with shooting cape?
    }

    -- Precast sets

    -- Weaponskill sets
    sets.precast.WS.melee = set_combine(full_nyame, {
        hands      = "Meghanada Gloves +2",
        neck       = "Fotia Gorget",
        waist      = "Fotia Belt",
        left_ear   = "Moonshade Earring",
        right_ear  = "Ishvara Earring",
        left_ring  = "Rufescent Ring",
        right_ring = "Apate Ring",
        back       = leaden_salute_cape, -- 10% WSD
    })
    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS.melee, {
        neck  = "Republican Platinum Medal",
        waist = "Sailfi Belt +1",
    })

    -- Default ranged WS assumes physical
    sets.precast.WS.ranged = set_combine(sets.precast.WS.melee, {
        ammo      = bullets["physical"],
        head      = "Meghanada Visor +2",
        body      = relic_body,
        hands     = empy_hands,
        legs      = "Malignance Tights",
        feet      = "Malignance Boots",   -- Replace with Relic
        left_ear  = "Ishvara Earring",
        right_ear = "Telos Earring",
        back      = leaden_salute_cape,   -- Replace with WS capes
    })
    sets.precast.WS["Leaden Salute"] = set_combine(sets.precast.WS.ranged, {
        ammo       = bullets["magic"],    -- Orichalcum
        head       = "Pixie Hairpin +1",
        body       = relic_body,
        hands      = "Nyame Gauntlets",
        legs       = "Nyame Flanchard",
        feet       = relic_feet,
        neck       = jse_neck,
        left_ear   = "Friomisi Earring",
        right_ear  = "Moonshade Earring",
        left_ring  = "Archon Ring",
        right_ring = "Apate Ring",        -- Get Dingir Ring
        waist      = "Eschan Stone",      -- 7 macc, 7 mab  (Hachirin will override if weather/day appropriate)
        back       = savage_cape,
    })
    sets.precast.WS["Wildfire"] = set_combine(sets.precast.WS["Leaden Salute"], {
        waist = "Eschan Stone",
    })
    sets.precast.WS["Hot Shot"] = set_combine(sets.precast.WS["Leaden Salute"], {
        ammo       = bullets["magic"],     -- Orichalcum
        head       = "Malignance Chapeau",
        body       = af_body,
        hands      = "Malignance Gloves",
        legs       = empy_legs,
        feet       = empy_feet,
        left_ring  = "Cacoethic Ring +1",
        right_ring = "Cacoethic Ring",
        left_ear   = "Telos Earring",
        right_ear  = "Beyla Earring",
        waist      = "Hachirin-no-Obi",
        back       = leaden_salute_cape,
    })
    sets.precast.WS["Last Stand"] = set_combine(sets.precast.WS.ranged, {
        neck  = "Fotia Gorget",
        waist = "Fotia Belt",
    })

    sets.precast.WS["Aeolian Edge"] = sets.precast.WS["Wildfire"]
    
    -- Job ability sets

    -- Rolls
    sets.precast["Phantom Roll"] = set_combine(sets.idle, {
        -- Purely defensive
        feet       = "Malignance Boots",
        left_ring  = "Defending Ring",

        -- Actually helps with rolls
        main       = roll_knife,
        range      = "Compensator",
        head       = relic_head,
        hands      = empy_hands,
        legs       = "Desultor Tassets",
        -- neck       = "Regal Necklace",
        right_ring = "Luzaf's Ring",
        back       = snapshot_roll_cape,
    })
    sets.precast["Blitzer's Roll"] = set_combine(sets.precast["Phantom Roll"], {
        head = empy_head,
    })
    sets.precast["Tactician's Roll"] = set_combine(sets.precast["Phantom Roll"], {
        body = empy_body,
    })
    sets.precast["Caster's Roll"] = set_combine(sets.precast["Phantom Roll"], {
        legs = empy_legs,
    })
    sets.precast["Courser's Roll"] = set_combine(sets.precast["Phantom Roll"], {
        feet = empy_feet,
    })

    -- Other JA's
    sets.precast["Fold"] = {
        hands = relic_hands,
    }
    sets.precast["Random Deal"] = {
        body = relic_body,
    }
    sets.precast["Snake Eye"] = {
        legs = relic_legs,
    }
    sets.precast["Wild Card"] = {
        feet = relic_feet,
    }

    -- Quick Draw sets
    -- Fallback STP set for any shots that aren't specified by name
    sets.precast["CorsairShot"] = {
        ammo       = bullets["magic"],
        head       = "Malignance Chapeau",
        body       = "Mirke Wardecors",
        hands      = "Malignance Gloves",
        legs       = "Malignance Tights",
        feet       = empy_feet,             -- Empy quickdraw traight gives 25/28/31% bonus to next elemental damage of same element
        neck       = "Marked Gorget",       -- Iskur Gorget
        left_ear   = "Telos Earring",
        right_ear  = "Dignitary's Earring",
        left_ring  = "Chirich Ring +1",
        right_ring = "Rajas Ring",          -- STP +5 without the enmity from Petrov
        waist      = "Eschan Stone",
        back       = leaden_salute_cape,    -- Replace with quickdraw_cape: AGI/MDmg/STP/MAB
    }
    quick_draw_acc = set_combine(sets.precast["CorsairShot"], {
        head       = af_head,
        hands      = af_hands,
        feet       = af_feet,               -- AF quickdraw trait gives flat damage +20 and macc +20
        neck       = jse_neck,
        left_ear   = "Chasseur's Earring",  -- 9 macc
        right_ear  = "Dignitary's Earring",
        left_ring  = "Stikini Ring",
        right_ring = "Stikini Ring",
    })
    sets.precast["Light Shot"] = quick_draw_acc
    sets.precast["Dark Shot"]  = set_combine(quick_draw_acc, {
        right_ring = "Archon Ring",
    })

    -- All Curing and Divine waltzes fall back to Waltz when spell mappings are checked
    sets.precast["Waltz"] = {
        body       = "Passion Jacket",
        left_ring  = "Defending Ring",
        right_ring = "Asklepian Ring",
    }

    -- Use TH for targeted JA's
    sets.precast["Box Step"]   = sets.TH
    sets.precast["Quick Step"] = sets.TH

    -- Midcast sets
    sets.midcast["Utsusemi"] = set_combine(sets.idle, {
        neck = "Magoraga Beads",
        body = "Passion Jacket",
    })

    -- Other sets
    sets.TH = {
        ammo = "Perfect Lucky Egg",
        head = "Herculean Helm",
    }
    sets.DI = set_combine(sets.TP, {
        -- Maximize crit rate and multi-attack for Domain Invasion
    })
    sets.doomed = {
        left_ring  = "Blenmot's Ring +1",
        right_ring = "Blenmot's Ring +1",
    }
    sets.dynamis_rp = {
        sub  = stp_knife,
        -- neck = jse_neck,
    }

end -- get_sets()