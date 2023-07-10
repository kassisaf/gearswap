function get_sets()
    include('Zuri-Common.lua')
    job_init(2, 9, 14)   -- Macro book, macro page, lockstyle set

    -- Leave these empty
    sets.precast    = {}
    sets.precast.WS = {}
    sets.precast.JA = {}
    sets.midcast    = {}

    -- Gear Aliases
    bullets = {
        physical = "Eminent Bullet",
        magic = "Orichalcum Bullet",
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
    roll_knife = {name="Lanun Knife", augments={'Path: C'}}
    stp_knife = {name="Lanun Knife", augments={'Path: A'}}

    -- JSE Notes:
    -- Artifact: Corsair's / Laksamana's
    -- Relic:    Commodore / Lanun
    -- Empyrean: Navarch's / Chasseur's
    af_head     = "Laksamana's Tricorne"
    af_body     = "Laksamana's Frac +2"
    af_hands    = "Laksamana's Gants +1"
    af_legs     = "Laksamana's Trews +1"
    af_feet     = "Laksamana's Bottes +1"
    relic_head  = "Lanun Tricorne"
    relic_body  = "Lanun Frac +3"
    relic_hands = "Lanun Gants +1"
    relic_legs  = "Lanun Trews"
    relic_feet  = "Lanun Bottes +1"
    empy_head   = "Chasseur's Tricorne +2"
    empy_body   = "Chasseur's Frac +2"
    empy_hands  = "Chasseur's Gants +2"
    empy_legs   = "Chasseur's Culottes +2"
    empy_feet   = "Chasseur's Bottes +2"
    jse_neck    = "Commodore Charm +1"

    -- Basic sets
    sets.idle = {
        main       = "Naegling",
        -- sub        = "Gleti's Knife",
        range      = "Ataktos",
        sub        = "Tauret",
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
        right_ear  = "Meili Earring",
        left_ring  = "Defending Ring",
        right_ring = "Shneddick Ring",
        back       = snapshot_roll_cape,
    }
    sets.TP = set_combine(sets.idle, {
        head       = "Adhemar Bonnet",
        body       = "Adhemar Jacket",
        hands      = "Malignance Gloves",
        legs       = "Meghanada Chausses +2",
        feet       = "Malignance Boots",
        neck       = "Sanctity Necklace",
        waist      = "Sailfi Belt +1",
        left_ear   = "Sherida Earring",
        right_ear  = "Eabani Earring",
        left_ring  = "Rajas Ring",
        right_ring = "Petrov Ring",
        back       = "Atheling Mantle",       -- Replace with ambu TP cape
    })
    sets.FC = {
        neck       = "Magoraga Beads",
        left_ear   = "Loquacious Earring",
        right_ring = "Kishar Ring",
        waist      = "Sailfi Belt +1",
    }

    -- Preshot should contain: Snapshot, Rapid Shot
    -- Snapshot caps at 70 (-10% from gifts)
    -- Rapid shot reduces delay up to 50%, proc rate caps at 99%
    sets.precast.RA = {
        ammo  = bullets["physical"],
        -- 44 Snapshot, 29 Rapid Shot
        head  = empy_head,          -- 16 Rapid Shot
        body  = "Ikenga's Vest",    -- 9 Snapshot
        hands = "Ikenga's Gloves",  -- 7 Snapshot
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
        neck       = "Sanctity Necklace",  -- Iskur Gorget
        waist      = "Eschan Stone",
        left_ring  = "Mummu Ring",         -- Dingir, Ilabrat
        right_ring = "Meghanada Ring",
        left_ear   = "Telos Earring",
        right_ear  = "Odr Earring",
        back       = snapshot_roll_cape,   -- Replace with shooting cape?
    }

    -- Precast sets

    -- Weaponskill sets
    sets.precast.WS.melee = set_combine(full_nyame, {
        hands      = "Meghanada Gloves +2",
        back       = "Sokolski Mantle",
        neck       = "Fotia Gorget",
        waist      = "Fotia Belt",
        left_ear   = "Moonshade Earring",
        right_ear  = "Ishvara Earring",
        left_ring  = "Rufescent Ring",
        right_ring = "Apate Ring",
        back       = leaden_salute_cape,
    })
    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS.melee, {
        -- neck  = "Republican Platinum Medal",
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
        right_ear = "Telos Earring",
        back      = leaden_salute_cape,   -- Replace with WS capes
    })
    sets.precast.WS["Leaden Salute"] = set_combine(sets.precast.WS.ranged, {
        ammo       = bullets["magic"],    -- Orichalcum
        head       = "Pixie Hairpin +1",
        body       = relic_body,
        hands      = "Nyame Gauntlets",
        legs       = "Nyame Flanchard",
        feet       = "Nyame Sollerets",   -- Get relic +3
        neck       = jse_neck,
        left_ear   = "Friomisi Earring",
        right_ear  = "Moonshade Earring",
        left_ring  = "Archon Ring",
        right_ring = "Apate Ring",        -- Get Dingir
        waist      = "Hachirin-no-Obi",
        back       = leaden_salute_cape,
    })
    sets.precast.WS["Wildfire"] = set_combine(sets.precast.WS["Leaden Salute"], {
        waist = "Eschan Stone",
    })
    sets.precast.WS["Hot Shot"] = sets.precast.WS["Wildfire"]
    sets.precast.WS["Aeolian Edge"] = sets.precast.WS["Wildfire"]

    -- Job ability sets

    -- Rolls
    sets.precast.JA["Phantom Roll"] = set_combine(sets.idle, {
        -- Purely defensive
        feet      = "Malignance Boots",
        neck      = "Loricate Torque +1",
        -- right_ear = "Odnowa Earring +1", -- Needs more RP

        -- Actually helps with rolls
        main       = roll_knife,
        range      = "Compensator",
        head       = relic_head,
        hands      = empy_hands,
        legs       = "Desultor Tassets",
        -- neck       = "Regal Necklace",   -- Replaces Loricate
        -- left_ring  = "Barataria Ring", -- Swap for defensive option after finishing RP on lanun knife
        left_ring  = "Defending Ring",
        right_ring = "Luzaf's Ring",
        back       = snapshot_roll_cape,
    })
    sets.precast.JA["Blitzer's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {
        head = empy_head,
    })
    sets.precast.JA["Tactician's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {
        body = empy_body,
    })
    sets.precast.JA["Caster's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {
        legs = empy_legs,
    })
    sets.precast.JA["Courser's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {
        feet = empy_feet,
    })

    -- Other JA's
    sets.precast.JA["Fold"] = {
        hands = relic_hands,
    }
    sets.precast.JA["Random Deal"] = {
        body = relic_body,
    }
    sets.precast.JA["Snake Eye"] = {
        legs = relic_legs,
    }
    sets.precast.JA["Triple Shot"] = {
        body = empy_body,
    }
    sets.precast.JA["Wild Card"] = {
        feet = relic_feet,
    }
    sets.precast.JA["Quick Draw"] = {
        body = "Mirke Wardecors",
        feet = af_feet,
    }

    sets.precast.JA["Curing Waltz"] = {
        left_ring  = "Defending Ring",
        right_ring = "Asklepian Ring",
    }
    sets.precast.JA["Curing Waltz II"]  = sets.precast.JA["Curing Waltz"]
    sets.precast.JA["Curing Waltz III"] = sets.precast.JA["Curing Waltz"]

    -- Use TH for targeted JA's
    sets.precast.JA["Box Step"] = sets.TH
    sets.precast.JA["Quick Step"] = sets.TH

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
        main = stp_knife,
        sub  = roll_knife,
        neck = jse_neck,
    }

end -- get_sets()