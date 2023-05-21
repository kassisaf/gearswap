function get_sets()
    include('Zuri-Common.lua')
    job_init(1, 1, nil)  -- Macro book, macro page, lockstyle set

    -- Basic sets
    sets.idle = {
        main       = "Sangoma",
        sub        = "Genbu's Shield",
        range      = "Gjallarhorn",
        head       = "Fili Calot +2",
        body       = "Inyanga Jubbah +2",
        hands      = "Fili Manchettes +2",
        legs       = "Fili Rhingrave +2",
        feet       = "Inyanga Crackows +2",
        neck       = "Loricate Torque",
        waist      = "Sailfi Belt +1",
        left_ear   = "Handler's Earring +1",
        right_ear  = "Handler's Earring",
        left_ring  = "Shneddick Ring",
        right_ring = "Defending Ring",
        back       = "Intarabus's Cape",
    }
    sets.TP = {
        main       = "Kaja Sword",
        sub        = "Centovente",
        -- ammo       = "",
        -- head       = "",
        -- body       = "",
        -- hands      = "",
        -- legs       = "",
        -- feet       = "",
        neck       = "Subtlety Spectacles",
        waist      = "Sailfi Belt +1",
        left_ear   = "Eabani Earring",
        right_ear  = "Suppanomimi",
        left_ring  = "Petrov Ring",
        right_ring = "Apate Ring",
        -- back       = "",
    }
    sets.FC = {
        head       = "Welkin Crown",        -- Fast Cast +7%
        body       = "Inyanga Jubbah +2",   -- Fast Cast +14%
        hands      = "Inyan. Dastanas +2",
        legs       = "Ayanmo Cosciales +2", -- Fast Cast +6%
        feet       = "Fili Cothurnes +2",   -- Fast Cast +10%
        waist      = "Channeler's Stone",   -- Fast Cast +2%
        left_ear   = "Malignance Earring",  -- Fast Cast +4%
        right_ear  = "Loquacious Earring",  -- Fast Cast +2%
        left_ring  = "Kishar Ring",         -- Fast Cast +4%
        right_ring = "Naji's Loop",         -- Fast Cast +1%
        back       = "Intarabus's Cape",    -- Fast Cast +10%
    }

    -- Precast sets
    sets.precast = {} -- Leave empty
    sets.precast.RA = {}

    -- Weaponskill sets
    sets.precast.WS = {} -- Leave empty
    sets.precast.WS.base = {
        -- ammo       = "Yetshila",
        body       = "Bihu Justaucorps +3",
        neck       = "Fotia Gorget",
        waist      = "Fotia Belt",
        left_ear   = "Ishvara Earring",
        right_ear  = "Moonshade Earring",
        left_ring  = "Rufescent Ring",
        right_ring = "Apate Ring",
        back       = "Phalangite Mantle",
    }

    -- Job ability sets
    sets.precast.JA = {}  -- Leave empty
    sets.precast.JA["Soul Voice"] = {
        legs = "Bihu Cannions" -- Soul Voice duration +30s
    }
    sets.precast.JA["Nightingale"] = {
        feet = "Bihu Slippers +2" -- Nightingale duration +20s (with full merits)
    }
    sets.precast.JA["Troubador"] = {
        body = "Bihu Justaucorps +3" -- Troubador duration +20s (with full merits)
    }

    -- Midcast sets
    sets.macc = {
        main       = "Kaja Knife",
        sub        = "Genbu's Shield",
        range      = "Gjallarhorn",
        -- left_ear   = "Malignance Earring",
        right_ear  = "Dignitary's Earring",
        left_ring  = "Stikini Ring",
        right_ring = "Stikini Ring",
    }
    sets.midcast = {} -- Leave empty
    sets.midcast["EnhancingMagic"] = {
        -- sub        = "Ammurapi Shield",     -- Enhancing duration +10%
        hands      = "Inyanga Dastanas +2",
        neck       = "Incanter's Torque",
        left_ring  = "Stikini Ring",
        right_ring = "Stikini Ring",
        waist      = "Siegel Sash",         -- Enhancing cast time -8%
    }
    sets.midcast["EnfeeblingMagic"] = set_combine(sets.macc, {
        right_ring = "Kishar Ring", -- Enfeebling duration +10%
    })
    sets.midcast["Stoneskin"] = {
        -- legs     = "Shedir Seraweels", -- Stoneskin +35
        neck     = "Nodens Gorget",    -- Stoneskin +30
        -- left_ear = "Earthcry Earring", -- Stoneskin +10
        waist    = "Siegel Sash",      -- Stoneskin +20
    }
    sets.midcast["Aquaveil"] = {
        head = "Chironic Hat", -- Aquaveil +1
        -- legs = "Shedir Seraweels" -- Aquaveil +1
    }

    sets.midcast["BuffSong"] = {
        main       = "Kali",
        sub        = "Genbu's Shield",
        head       = "Fili Calot +2",
        body       = "Fili Hongreline +2",
        hands      = "Fili Manchettes +2",
        legs       = "Inyanga Shalwar +2",
        feet       = "Brioso Slippers +2",
        neck       = "Moonbow Whistle +1",
        -- waist      = "Flume Belt +1",
        left_ear   = "Hermetic Earring",
        right_ear  = "Fili Earring",
        left_ring  = "Stikini Ring",
        right_ring = "Stikini Ring",
        back       = "Intarabus's Cape",
    }
    sets.midcast["DebuffSong"] = set_combine(sets.midcast["BuffSong"], {
        feet  = "Fili Cothurnes +2",
        waist = "Luminary Sash",
    })
    -- No swaps needed for minuet, march, madrigal
    sets.midcast["Paeon"] = {
        feet = "Fili Cothurnes +2",
    }
    sets.midcast["Prelude"] = {
        feet = "Fili Cothurnes +2",
    }
    sets.midcast["Sentinel's Scherzo"] = {
        feet = "Fili Cothurnes +2",
    }
    sets.midcast["Lullaby"] = {
        range = "Blurred Harp +1",
    }

    sets.midcast["Cure"] = {
        main       = "Daybreak",
        sub        = "Genbu's Shield",
        ammo       = "Hydrocera",
        head       = "Vanya Hood",
        body       = "Vanya Robe",
        hands      = "Vanya Cuffs",
        legs       = "Vanya Slops",
        feet       = "Vanya Clogs",
        neck       = "Incanter's Torque",
        waist      = "Luminary Sash",
        left_ear   = "Meili Earring",
        right_ear  = "Fili Earring",
        left_ring  = "Stikini Ring",
        right_ring = "Stikini Ring",
        back       = "Solemnity Cape",
    }
    sets.midcast["Curaga"] = sets.midcast["Cure"]

    -- Other sets
    sets.TH = {
        ammo  = "Perfect Lucky Egg",
        head  = "White Rarab Cap +1",
        -- waist = "Chaac Belt",
    }
    -- Maximize crit rate for Domain Invasion
    sets.DI = set_combine(sets.tp, {
    })
    sets.doomed = {
        left_ring  = "Blenmot's Ring +1",
        right_ring = "Blenmot's Ring +1",
    }

end -- get_sets()