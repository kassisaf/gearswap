function get_sets()
    include('Zuri-Common.lua')
    -- job_init(2, 2, 17)  -- Macro book, macro page, lockstyle set

    -- Basic sets
    sets.idle = {
        main       = "Homestead Cesti",
        head       = "Hizamaru Somen",
        body       = "Hizamaru Haramaki",
        hands      = "Hizamaru Kote",
        legs       = "Hizamaru Hizayoroi",
        feet       = "Hizamaru Sune-Ate +1",
        neck       = "Focus Collar",
        waist      = "White Belt",
        left_ear   = "Raising Earring",
        -- right_ear  = "Bloodbead Earring",
        left_ring  = "Rufescent Ring",
        right_ring = "Hizamaru Ring",
    }
    sets.TP = sets.idle
    sets.FC = {}

    -- Precast sets
    sets.precast = {}  -- Leave empty
    sets.precast.RA = {

    }

    -- Weaponskill sets
    sets.precast.WS = {} -- Leave Empty
    sets.precast.WS.melee = {
    }
    -- sets.precast.WS["Rudra's Storm"] = sets.precast.WS.melee
    -- sets.precast.WS["Evisceration"] = set_combine(sets.precast.WS.melee,{
    -- })

    -- Job ability sets
    sets.precast.JA = {}  -- Leave empty
    -- sets.precast.JA["Conspirator"] = {
    -- }
    
    -- Midcast sets
    sets.midcast = {} -- Leave empty

    -- Other sets
    sets.TH = {
        -- ammo  = "Perfect Lucky Egg",
    }
    -- Maximize crit rate for Domain Invasion
    sets.DI = set_combine(sets.TP, {
    })
    sets.doomed = {
        -- left_ring  = "Blenmot's Ring +1",
        -- right_ring = "Blenmot's Ring +1",
    }

end -- get_sets()