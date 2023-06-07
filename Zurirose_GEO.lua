function get_sets()
    include('Zuri-Common.lua')
    job_init(1, 3, nil)  -- Macro book, macro page, lockstyle set

    idle_cape = {name="Nantosuelta's Cape", augments={'Pet: "Regen"+10','Pet: Damage taken -2%',}} -- Add DT
    nuke_cape = {name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}

    -- Basic sets
    sets.idle = {
        main       = "Malignance Pole",
        sub        = "Kaja Grip",
        range      = "Dunna",
        head       = "Azimuth Hood +2",
        hands      = "Geomancy Mitaines +3",
        body       = "Azimuth Coat +2",
        legs       = "azimuth tights +2",
        feet       = "Azimuth Gaiters +2",
        neck       = "Loricate Torque +1",
        left_ear   = "Handler's Earring +1",
        right_ear  = "Lugalbanda Earring",
        left_ring  = "Defending Ring",
        right_ring = "Shneddick Ring",
        waist      = "Luminary Sash",
        back       = nuke_cape, -- Until I add DT to the other one
    }
    sets.idle_with_pet = set_combine(sets.idle, {
        main      = "Solstice",
        sub       = "Genbu's Shield",
        right_ear = "Handler's Earring",
        feet      = "Bagua Sandals +2",
        back      = idle_cape,
    })
    sets.TP = {
        head       = "Nyame Helm",
        body       = "Nyame Mail",
        hands      = "Nyame Gauntlets",
        legs       = "Nyame Flanchard",
        feet       = "Nyame Sollerets",
        neck       = "Loricate Torque +1",
        left_ring  = "Petrov Ring",
        right_ring = "Apate Ring",
        waist      = "Eschan Stone",
    }
    sets.FC = {
        main       = "Solstice",           -- Fast Cast + 5%
        sub        = "Genbu's Shield",
        range      = "Dunna",              -- Fast Cast + 3%
        head       = "Welkin Crown",       -- Fast Cast +7%
        body       = "Merlinic Jubbah",    -- Fast Cast +10%
        hands      = "Azimuth Gloves +2",  -- Fast Cast +5%
        legs       = "Geomancy Pants +1",  -- Fast Cast +11%
        waist      = "Channeler's Stone",  -- Fast Cast +2%
        left_ear   = "Malignance Earring", -- Fast Cast +4%
        right_ear  = "Loquacious Earring", -- Fast Cast +2%
        left_ring  = "Kishar Ring",        -- Fast Cast +4%
        right_ring = "Naji's Loop",        -- Fast Cast +1%
    }

    -- Precast sets
    sets.precast = {} -- Leave empty
    sets.precast.RA = {}

    -- Weaponskill sets
    sets.precast.WS = {} -- Leave empty
    sets.precast.WS.base = {
        neck  = "Fotia Gorget",
        waist = "Fotia Belt",
    }

    -- Job ability sets
    sets.precast.JA = {}  -- Leave empty
    sets.precast.JA["Full Circle"] = {
        head = "Azimuth Hood +2",
    }
    sets.precast.JA["Radial Arcana"] = {
        feet = "Bagua Sandals +2",
    }
    sets.precast.JA["Bolster"] = {
        body = "Bagua Tunic +3",
    }
    sets.precast.JA["Life Cycle"] = {
        body = "Geomancy Tunic +1",
        back = nuke_cape,
    }
    sets.precast.JA["Mending Halation"] = {
        legs = "Bagua Pants +1",
    }
    sets.precast.JA["Cardinal Chant"] = {
        head = "Geomancy Galero +1",
    }

    -- Midcast sets
    sets.macc = {
        main       = "Malignance Pole",
        sub        = "Kaja Grip",
        ammo       = "Hydrocera",
        head       = "Azimuth Hood +2",
        body       = "Azimuth Coat +2",
        hands      = "Azimuth Gloves +2",
        legs       = "Azimuth Tights +2",
        feet       = "Azimuth Gaiters +2",
        neck       = "Bagua Charm +1",
        left_ear   = "Malignance Earring",
        right_ear  = "Dignitary's Earring",
        left_ring  = "Stikini Ring",
        right_ring = "Stikini Ring",
        back       = nuke_cape,
        waist      = "Luminary Sash",
    }
    sets.midcast = {} -- Leave empty
    sets.midcast["Geomancy"] = {
        main       = "Solstice",             -- Handbell skill +5
        sub        = "Genbu's Shield",
        range      = "Dunna",
        head       = "Azimuth Hood +2",      -- Geomancy skill +20
        body       = "Bagua Tunic +3",       -- Geomancy skill +16
        hands      = "Geomancy Mitaines +3", -- Geomancy skill +17
        legs       = "Bagua Pants +1",       -- Geomancy skill +15
        feet       = "Azimuth Gaiters +2",   -- Indi duration +25
        neck       = "Bagua Charm +1",       -- Geomancy +6
        left_ring  = "Stikini Ring",         -- Combined skill +10
        right_ring = "Stikini Ring",         -- Combined skill +10
        back       = "Lifestream Cape",      -- Geomancy skill +10
    }
    sets.midcast["Elemental Magic"] = set_combine(sets.macc,{
        main       = "Daybreak",
        sub        = "Genbu's Shield",
        ammo       = "Hydrocera", -- Get Pemphredo Tathlum
        head       = "Azimuth Hood +2",
        body       = "Azimuth Coat +2",
        hands      = "Azimuth Gloves +2",
        legs       = "Azimuth Tights +2",
        feet       = "Azimuth Gaiters +2",
        neck       = "Sanctity Necklace",
        left_ear   = "Malignance Earring",
        right_ear  = "Azimuth Earring",
        left_ring  = "Jhakri Ring",
        right_ring = "Stikini Ring",
        waist      = "Refoccilation Stone",
        back       = nuke_cape,
    })
    sets.midcast["Enhancing Magic"] = {
        -- sub        = "Ammurapi Shield",     -- Enhancing duration +10%
        neck       = "Incanter's Torque",
        left_ring  = "Stikini Ring",
        right_ring = "Stikini Ring",
        waist      = "Siegel Sash",         -- Enhancing cast time -8%
    }
    sets.midcast["Enfeebling Magic"] = set_combine(sets.macc, {
        neck       = "Incanter's Torque",
        left_ring  = "Stikini Ring",
        right_ring = "Stikini Ring",
        right_ring = "Kishar Ring", -- Enfeebling duration +10%
    })
    sets.midcast["Dark Magic"] = set_combine(sets.macc, {
        right_ring = "Evanescence Ring",
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
        left_ear   = "Meili Earring",
        right_ear  = "Fili Earring",
        left_ring  = "Stikini Ring",
        right_ring = "Stikini Ring",
        back       = "Solemnity Cape",
        waist      = "Luminary Sash",
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