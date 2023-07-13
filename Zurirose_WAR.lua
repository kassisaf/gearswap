function get_sets()
    include('Zuri-Common.lua')
--     job_init(2, 2, 17)  -- Macro book, macro page, lockstyle set

    -- Leave these empty
    sets.precast    = {}
    sets.precast.WS = {}
    sets.precast.JA = {}
    sets.midcast    = {}

    -- Basic sets
    sets.idle = {
        main       = "Hepatizon Axe",
        sub        = "Kaja Grip",
        head       = "Nyame Helm",
        body       = "Nyame Mail",
        hands      = "Nyame Gauntlets",
        legs       = "Nyame Flanchard",
        feet       = "Nyame Sollerets",
        neck       = "Loricate Torque +1",
        waist      = "Carrier's Sash",
        left_ear   = "Eabani Earring",
        right_ear  = "Handler's Earring +1",
        left_ring  = "Defending Ring",
        right_ring = "Shneddick Ring",
        back       = "Agema Cape",
    }
    sets.TP = {
        main       = "Hepatizon Axe",
        sub        = "Kaja Grip",
        ammo       = "Focal Orb",
        head       = "Sakpata's Helm",
        body       = "Sakpata's Breastplate",
        hands      = "Sakpata's Gauntlets",
        legs       = "Sakpata's Cuisses",
        feet       = "Sakpata's Leggings",
        neck       = "Subtlety Spectacles",
        waist      = "Sailfi Belt +1",
        left_ear   = "Dignitary's Earring",
        right_ear  = "Boii Earring +1",
        left_ring  = "Chirich Ring +1",
        right_ring = "Petrov Ring",
        back       = "Atheling Mantle",
    }
    sets.FC = {}

    -- Precast sets

    -- Weaponskill sets
    sets.precast.WS.melee = set_combine(full_nyame, {
        ammo       = "Knobkierre",
        hands      = "Meghanada Gloves +2",
        neck       = "Caro Necklace",
        waist      = "Sailfi Belt +1",
        left_ear   = "Moonshade Earring",
        right_ear  = "Thrud Earring",
        left_ring  = "Apate Ring",        -- Get Ilabrat
        right_ring = "Rufescent Ring",    -- Get Regal
        back       = "Phalangite Mantle",
    })

    -- Job ability sets
    
    -- Midcast sets

    -- Other sets
    sets.TH = {
        ammo  = "Perfect Lucky Egg",
    }
    -- Maximize crit rate for Domain Invasion
    -- sets.DI = set_combine(sets.TP, {})
    sets.doomed = {
        left_ring  = "Blenmot's Ring +1",
        right_ring = "Blenmot's Ring +1",
    }

end -- get_sets()