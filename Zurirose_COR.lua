function get_sets()
    include('Zuri-Common.lua')
    job_init(2, 9, 15)   -- Macro book, macro page, lockstyle set

    -- Leave these empty
    sets.precast    = {}
    sets.precast.WS = {}
    sets.precast.JA = {}
    sets.midcast    = {}

    -- Gear Aliases
    bullets = "Eminent Bullet" -- TODO add commands to switch bullets
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

    -- JSE Notes:
    -- Artifact: Corsair's / Laksamana's
    -- Relic:    Commodore / Lanun
    -- Empyrean: Navarch's / Chasseur's
    af_head     = "Corsair's Tricorne"
    af_body     = "Laksamana's Frac"
    af_hands    = "Laksamana's Gants"
    af_legs     = "Corsair's Culottes"
    af_feet     = "Laksamana's Bottes"
    relic_head  = "Commodore Tricorne"
    relic_body  = "Commodore Frac"
    relic_hands = "Commodore Gants"
    relic_legs  = "Commodore Trews"
    relic_feet  = "Commodore Bottes"
    empy_head   = "Navarch's Tricorne +1"
    empy_body   = "Navarch's Frac +2"
    empy_hands  = "Chasseur's Gants"
    empy_legs   = "Navarch's Culottes +1"
    -- empy_feet   = "Navarch's Bottes +1"

    -- Basic sets
    sets.idle = {
        main       = "Kaja Sword",
        sub        = "Kaja Knife",
        range      = "Molybdosis",
        ammo       = bullets,
        
        head       = "Nyame Helm",
        body       = "Nyame Mail",
        hands      = "Nyame Gauntlets",
        legs       = "Nyame Flanchard",
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
        ammo       = bullets,

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
        ammo  = bullets,

        head  = "Ikenga's Hat",
        body  = "Ikenga's Vest",
        hands = "Ikenga's Gloves",
        legs  = "Ikenga's Trousers",
        feet  = "Ikenga's Clogs",
        back  = snapshot_roll_cape,
    }
    -- Midshot should contain: R.acc, STP, crit, R.atk, Recycle, etc.
    sets.midcast.RA = {
        head       = "Meghanada Visor +2",
        body       = "Meghanada Cuirie +2",
        hands      = "Meghanada Gloves +2",
        legs       = "Meghanada Chausses +2",
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
    sets.precast.WS.melee = {
        head      = "Meghanada Visor +2",
        body      = "Meghanada Cuirie +2",   -- Replace with AF
        hands     = "Meghanada Gloves +2",
        legs      = "Meghanada Chausses +2",
        feet      = "Meghanada Jambeaux +2", -- Replace with Relic
        back      = "Sokolski Mantle",
        neck      = "Caro Necklace",
        left_ear  = "Moonshade Earring",
        right_ear = "Odr Earring",
        left_ring = "Meghanada Ring",
        left_ring = "Rufescent Ring",
        waist     = "Sailfi Belt +1",
        back      = snapshot_roll_cape,
    }
    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS.melee, {
        right_ear  = "Ishvara Earring",
        left_ring  = "Rufescent Ring",
        right_ring = "Apate Ring",
    })

    sets.precast.WS.ranged = set_combine(sets.midcast.RA, {
        head      = "Meghanada Visor +2",
        body      = "Meghanada Cuirie +2",
        hands     = "Meghanada Gloves +2",
        legs      = "Malignance Tights",
        feet      = "Malignance Boots",    -- Replace with Relic
        left_ear  = "Moonshade Earring",
        right_ear = "Telos Earring",
        left_ring = "Apate Ring",
        back      = snapshot_roll_cape,    -- Replace with WS capes
    })
    -- sets.precast.WS["Last Stand"] = set_combine(sets.precast.WS.ranged, {})
    sets.precast.WS["Leaden Salute"] = set_combine(sets.precast.WS.ranged, {
        head      = "Ikenga's Hat",        -- Replace with Pixie Hairpin +1
        body      = "Ikenga's Vest",       -- Replace with relic
        hands     = "Meghanada Gloves +2",
        legs      = "Ikenga's Trousers",   -- Replace with RP nyame?
        feet      = "Ikenga's Clogs",      -- Replace with relic
        neck      = "Comm. Charm +1",
        left_ear  = "Friomisi Earring",
        right_ear = "Moonshade Earring",
        waist     = "Eschan Stone",
        back      = leaden_salute_cape,
    })
    sets.precast.WS["Wildfire"] = sets.precast.WS["Leaden Salute"]
    sets.precast.WS["Hot Shot"] = sets.precast.WS["Leaden Salute"]

    -- Job ability sets
    sets.precast.JA["Phantom Roll"] = set_combine(sets.idle, {
        -- Purely defensive
        feet      = "Malignance Boots",
        neck      = "Loricate Torque +1",
        -- right_ear = "Odnowa Earring +1", -- Needs RP

        -- Actually helps with rolls
        range      = "Compensator",
        -- head       = relic_head,
        hands      = empy_hands,
        legs       = "Desultor Tassets",
        -- neck       = "Regal Necklace",   -- Replaces Loricate
        left_ring  = "Barataria Ring",
        right_ring = "Luzaf's Ring",
        back       = snapshot_roll_cape,
    })
    -- sets.precast.JA["Blitzer's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {
    --     head = empy_head,
    -- })
    -- sets.precast.JA["Tactician's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {
    --     body = empy_body,
    -- })
    -- sets.precast.JA["Caster's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {
    --     legs = empy_legs,
    -- })
    -- sets.precast.JA["Courser's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {
    --     feet = empy_feet,
    -- })

    sets.precast.JA["Quick Draw"] = {
        body = "Mirke Wardecors",
    }

    -- Use TH for targeted JA's
    sets.precast.JA["Box Step"]   = sets.TH
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

end -- get_sets()