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
    roll_knife = {name="Lanun Knife", augments={'Path: C',}}
    tp_knife = {name="Lanun Knife", augments={'Path: A',}}

    -- JSE Notes:
    -- Artifact: Corsair's / Laksamana's
    -- Relic:    Commodore / Lanun
    -- Empyrean: Navarch's / Chasseur's
    af_head     = "Laksamana's Tricorne"
    af_body     = "Laksamana's Frac +1"
    af_hands    = "Laksamana's Gants +1"
    af_legs     = "Laksamana's Trews +1"
    af_feet     = "Laksamana's Bottes +1"
    relic_head  = "Lanun Tricorne"
    relic_body  = "Lanun Frac"
    relic_hands = "Lanun Gants +1"
    relic_legs  = "Lanun Trews"
    relic_feet  = "Lanun Bottes"
    empy_head   = "Chasseur's Tricorne +2"
    empy_body   = "Chasseur's Frac +2"
    empy_hands  = "Chasseur's Gants +2"
    empy_legs   = "Chasseur's Culottes +2"
    empy_feet   = "Chasseur's Bottes +2"
    jse_neck    = "Commodore Charm +1"

    -- Basic sets
    sets.idle = {
        main       = "Kaja Sword",
        sub        = "Kaja Knife",
        range      = "Molybdosis",
        ammo       = bullets["physical"],

        -- main       = "Bronze Knife",
        -- sub        = "Bronze Knife",
        -- range      = "Anarchy",
        -- ammo       = "Bronze Bullet",
        
        head       = "Nyame Helm",
        body       = empy_body,
        hands      = "Nyame Gauntlets",
        legs       = empy_legs,
        feet       = "Nyame Sollerets",
        neck       = "Loricate Torque +1",
        waist      = "Eschan Stone",
        left_ear   = "Eabani Earring",
        right_ear  = "Meili Earring",
        left_ring  = "Defending Ring",
        right_ring = "Shneddick Ring",
        back       = snapshot_roll_cape,
    }
    sets.TP = {
        main       = "Kaja Sword",
        sub        = "Kaja Knife",
        range      = "Molybdosis",
        ammo       = bullets["physical"],

        -- main       = "Bronze Knife",
        -- sub        = "Bronze Knife",
        -- range      = "Anarchy",
        -- ammo       = "Bronze Bullet",

        head       = "Adhemar Bonnet",
        body       = "Adhemar Jacket",
        hands      = "Malignance Gloves",
        legs       = "Meghanada Chausses +2",
        feet       = "Malignance Boots",
        neck       = "Sanctity Necklace",
        waist      = "Sailfi Belt +1",
        left_ear   = "Brutal Earring",        -- Get Sherida
        right_ear  = "Eabani Earring",
        left_ring  = "Rajas Ring",
        right_ring = "Petrov Ring",
        back       = "Atheling Mantle",       -- Replace with ambu TP cape
    }
    sets.FC = {}

    -- Preshot should contain: Snapshot, Rapid Shot
    sets.precast.RA = {
        ammo  = bullets["physical"],

        head  = "Ikenga's Hat",
        body  = "Ikenga's Vest",
        hands = "Ikenga's Gloves",
        legs  = "Ikenga's Trousers",
        feet  = "Ikenga's Clogs",
        back  = snapshot_roll_cape,
        neck  = jse_neck,
    }
    -- Midshot should contain: R.acc, STP, crit, R.atk, Recycle, etc.
    sets.midcast.RA = {
        head       = "Meghanada Visor +2",
        body       = empy_body,
        hands      = empy_hands,
        legs       = empy_legs,
        feet       = "Malignance Boots",
        back       = "Sokolski Mantle",
        neck       = "Sanctity Necklace",
        waist      = "Eschan Stone",
        left_ring  = "Mummu Ring",
        right_ring = "Meghanada Ring",
        left_ear   = "Telos Earring",
        right_ear  = "Odr Earring",
        back       = snapshot_roll_cape,      -- Replace with shooting cape?
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
        body      = empy_body,
        hands     = empy_hands,
        legs      = "Malignance Tights",
        feet      = "Malignance Boots",   -- Replace with Relic
        right_ear = "Telos Earring",
        back      = leaden_salute_cape,   -- Replace with WS capes
    })
    sets.precast.WS["Leaden Salute"] = set_combine(sets.precast.WS.ranged, {
        ammo       = bullets["magic"], -- Orichalcum
        head       = "Pixie Hairpin +1",
        body       = "Nyame Mail",
        legs       = "Nyame Flanchard",
        feet       = "Nyame Sollerets",
        neck       = "Sanctity Necklace", -- JSE neck after RP
        -- neck       = jse_neck,
        left_ear   = "Friomisi Earring",
        right_ear  = "Moonshade Earring",
        left_ring  = "Archon Ring",
        -- right_ring = "Dingir Ring",
        right_ring = "Shiva Ring +1", -- Loaner from Chiz
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
        left_ring  = "Barataria Ring",
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
        main = tp_knife,
        sub  = roll_knife,
        neck = jse_neck,
    }

end -- get_sets()