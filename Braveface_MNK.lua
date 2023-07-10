function get_sets()
    include('Zuri-Common.lua')
    -- job_init(2, 2, 17)  -- Macro book, macro page, lockstyle set

    -- Leave these empty
    sets.precast    = {}
    sets.precast.WS = {}
    sets.precast.JA = {}
    sets.midcast    = {}

    -- Basic sets
    sets.idle = {
        main       = "Kaja Knuckles",
        head       = "Hizamaru Somen +2",
        body       = "Mummu Jacket +2",
        hands      = "Mummu Wrists +2",
        legs       = "Mummu Kecks +2",
        feet       = "Mummu Gamashes +2",
        back       = "Segomo's Mantle",
        neck       = "Subtlety Spectacles",
        waist      = "White Belt",
        left_ear   = "Odr Earring",
        right_ear  = "Bloodbead Earring",
        left_ring  = "Mummu Ring",
        right_ring = "Hizamaru Ring",
    }
    sets.TP = sets.idle
    sets.FC = {}

    -- Precast sets
    sets.precast.RA = {}

    -- Weaponskill sets
    sets.precast.WS.melee = {
        left_ring = "Rufescent Ring",
    }
    -- sets.precast.WS["Rudra's Storm"] = sets.precast.WS.melee
    -- sets.precast.WS["Evisceration"] = set_combine(sets.precast.WS.melee,{
    -- })

    -- Job ability sets
    -- sets.precast.JA["Conspirator"] = {
    -- }
    
    -- Midcast sets

    -- Other sets
    sets.TH = {
        -- ammo  = "Perfect Lucky Egg",
    }
    -- Maximize crit rate for Domain Invasion
    sets.DI = set_combine(sets.TP, {})
    sets.doomed = {
        -- left_ring  = "Blenmot's Ring +1",
        -- right_ring = "Blenmot's Ring +1",
    }

end -- get_sets()