function get_sets()
    include('Zuri-Common.lua')
    job_init(2, 1, 17)  -- Macro book, macro page, lockstyle set

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
        -- main       = "Kaja Sword",
        -- sub        = "Kaja Knife",
        range      = empty,
        ammo       = "Expeditious Pinion",

        head       = "Adhemar Bonnet",
        body       = "Adhemar Jacket",
        hands      = "Malignance Gloves",
        legs       = "Meghanada Chausses +2",
        feet       = "Malignance Boots",
        neck       = "Subtlety Spectacles",
        waist      = "Sailfi Belt +1",
        left_ear   = "Brutal Earring",        -- Get Sherida
        right_ear  = "Telos Earring",
        left_ring  = "Rajas Ring",
        right_ring = "Petrov Ring",
        back       = "Atheling Mantle",       -- Replace with ambu TP cape
    }
    sets.FC = {}

    -- Preshot should contain: Snapshot, Rapid Shot
    sets.precast.RA = {
        range      = "Jinx Discus",
        ammo       = empty,
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
    }

    -- Precast sets

    -- Weaponskill sets
    sets.precast.WS.melee = {
        head      = "Meghanada Visor +2",
        body      = "Meghanada Cuirie +2",
        hands     = "Meghanada Gloves +2",
        legs      = "Meghanada Chausses +2",
        feet      = "Meghanada Jambeaux +2",
        back      = "Sokolski Mantle",
        neck      = "Caro Necklace",
        left_ear  = "Moonshade Earring",
        right_ear = "Odr Earring",
        left_ring = "Meghanada Ring",
        left_ring = "Rufescent Ring",
        waist     = "Sailfi Belt +1",
        -- back      = snapshot_roll_cape,
    }
    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS.melee, {
        right_ear  = "Ishvara Earring",
        left_ring  = "Rufescent Ring",
        right_ring = "Sapphire Ring",
    })

    -- Job ability sets

    -- Use TH for targeted JA's
    -- sets.precast.JA["Box Step"]   = sets.TH

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