function get_sets()
    include('Zuri-Common.lua')
    job_init(2, 9, 15)   -- Macro book, macro page, lockstyle set

    snapshot_roll_cape = { name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Mag. Evasion+15',}}

    -- Artifact: Corsair's / Laksamana's
    -- Relic:    Commodore / Lanun
    -- Empyrean: Navarch's / Chasseur's

    -- Leave these empty
    sets.precast    = {} 
    sets.precast.WS = {}
    sets.precast.JA = {}
    sets.midcast    = {}

    -- Basic sets
    sets.idle = {
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
        back       = "Solemnity Cape",
    }
    sets.TP = {
        main       = "Kaja Sword",
        sub        = "Kaja Knife",
        range      = "Molybdosis",
        ammo       = "Bronze Bullet",

        head       = "Adhemar Bonnet",
        body       = "Adhemar Jacket",
        hands      = "Malignance Gloves",
        legs       = "Meghanada Chausses +2",
        feet       = "Malignance Boots",
        neck       = "Subtlety Spectacles",
        waist      = "Sailfi Belt +1",
        left_ear   = "Telos Earring",
        right_ear  = "Eabani Earring",
        left_ring  = "Mummu Ring",
        right_ring = "Meghanada Ring",
        back       = "Sokolski Mantle", -- Replace with ambu TP cape
    }
    sets.FC = {}

    -- Preshot should contain: Snapshot, Rapid Shot
    sets.precast.RA = {
        ammo       = "Bronze Bullet",
    }
    -- Midshot should contain: R.acc, STP, crit, R.atk, Recycle, etc.
    sets.midcast.RA = {
        head       = "Meghanada Visor +2",
        body       = "Meghanada Cuirie +2",
        hands      = "Meghanada Gloves +2",
        legs       = "Meghanada Chausses +2",
        feet       = "Malignance Boots",
        back       = "Sokolski Mantle",
        neck       = "Caro Necklace",
        waist      = "Eschan Stone",
        left_ring  = "Mummu Ring",
        right_ring = "Meghanada Ring",
        left_ear   = "Telos Earring",
        right_ear  = "Odr Earring",
        back      = snapshot_roll_cape, -- Replace with shooting cape?
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

    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS.melee, {
        right_ear = "Ishvara Earring",
        left_ring = "Rufescent Ring",
    })
    sets.precast.WS["Last Stand"]    = set_combine(sets.precast.WS.ranged, {})
    sets.precast.WS["Leaden Salute"] = set_combine(sets.precast.WS.ranged, {
        -- head      = "Pixie Hairpin +1",
        -- body      = "Lanun Frac",
        -- legs      = "Herculean Trousers", -- AGI/MAB/WSD
        -- feet      = "Lanun Bottes",
        -- neck      = "Comm. Charm +1",
        left_ear  = "Friomisi Earring",
        right_ear = "Moonshade Earring",
        waist     = "Eschan Stone",
    })
    sets.precast.WS["Wildfire"] = set_combine(sets.precast.WS["Leaden Salute"], {})

    -- Job ability sets
    sets.precast.JA["Phantom Roll"] = set_combine(sets.idle, {
        -- Purely defensive
        feet      = "Malignance Boots",
        neck      = "Loricate Torque +1",
        -- right_ear = "Odnowa Earring +1", -- Needs RP

        -- Actually helps with rolls
        range      = "Compensator",
        -- head       = "Lanun Tricorne",   -- Relic
        -- hands      = "Chasseur's Gants", -- Empyrean
        legs       = "Desultor Tassets",
        -- neck       = "Regal Necklace",   -- Replaces Loricate
        left_ring  = "Barataria Ring",
        right_ring = "Luzaf's Ring",
        back       = snapshot_roll_cape,
    })

    sets.precast.JA["Quick Draw"] = {
        body = "Mirke Wardecors",
    }

    -- Use TH for targeted JA's
    sets.precast.JA["Box Step"]   = sets.TH
    sets.precast.JA["Quick Step"] = sets.TH

    -- Other sets
    sets.TH = {
        ammo = "Perfect Lucky Egg",
    }
    sets.DI = set_combine(sets.TP, {
        -- Maximize crit rate and multi-attack for Domain Invasion
    })
    sets.doomed = {
        left_ring  = "Blenmot's Ring +1",
        right_ring = "Blenmot's Ring +1",
    }

end -- get_sets()