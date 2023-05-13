function get_sets()
    include('Zuri-Common.lua')
    job_init(1, 1, nil)  -- Macro book, macro page, lockstyle set

    -- Basic sets
    sets.idle = {
        head       = "",
        body       = "",
        hands      = "",
        legs       = "",
        feet       = "",
        neck       = "",
        waist      = "",
        left_ear   = "",
        right_ear  = "",
        left_ring  = "",
        right_ring = "",
        back       = "",
    }
    sets.TP = {
        main       = "",
        sub        = "",
        range      = empty,
        ammo       = "",
        head       = "",
        body       = "",
        hands      = "",
        legs       = "",
        feet       = "",
        neck       = "",
        waist      = "",
        left_ear   = "",
        right_ear  = "",
        left_ring  = "",
        right_ring = "",
        back       = "",
    }
    sets.FC = {}

    -- Precast sets
    sets.precast = {}
    sets.precast.RA = {}

    -- Weaponskill sets
    sets.precast.WS = {}
    sets.precast.WS["SomeWS"] = set_combine(sets.precast.WS,{
    })

    -- Job ability sets
    sets.precast.JA = {}
    sets.precast.JA["SomeJA"] = {}
    
    -- Midcast sets
    sets.midcast = {}

    -- Other sets
    sets.TH = set_combine(sets.tp, {
        ammo  = "Perfect Lucky Egg",
        head  = "White Rarab Cap +1",
        -- waist = "Chaac Belt",
    })
    -- Maximize crit rate for Domain Invasion
    sets.DI = set_combine(sets.tp, {
    })
    sets.doomed = {
        left_ring  = "Blenmot's Ring +1",
        right_ring = "Blenmot's Ring +1",
    }

end -- get_sets()
