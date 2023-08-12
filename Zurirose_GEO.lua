function get_sets()
    include('Zuri-Common.lua')
    job_init(1, 3, 18)  -- Macro book, macro page, lockstyle set

    -- Leave these empty
    sets.precast    = {}
    sets.precast.WS = {}
    sets.precast.JA = {}
    sets.midcast    = {}

    -- Gear aliases
    idle_cape = {name="Nantosuelta's Cape", augments={
        -- TODO: Add defensive stats
        'Pet: "Regen"+10',
        'Pet: Damage taken -2%',
    }}
    nuke_cape = {name="Nantosuelta's Cape", augments={
        'INT+20',
        'Mag. Acc+20 /Mag. Dmg.+20',
        'INT+10',
        '"Mag.Atk.Bns."+10',
        'Damage taken-5%',
    }}

    af_head     = "Geomancy Galero +1"
    af_body     = "Geomancy Tunic +1"
    af_hands    = "Geomancy Mitaines +3"
    af_legs     = "Geomanic Pants +1"
    af_feet     = "Geomancy Sandals +1"
    relic_head  = "Bagua Galero"
    relic_body  = "Bagua Tunic +3"
    -- relic_hands = ""
    relic_legs  = "Bagua Pants +2"
    relic_feet  = "Bagua Sandals +2"
    empy_head   = "Azimuth Hood +2"
    empy_body   = "Azimuth Coat +2"
    empy_hands  = "Azimuth Gloves +2"
    empy_legs   = "Azimuth Tights +3"
    empy_feet   = "Azimuth Gaiters +2"
    jse_neck    = "Bagua Charm +1"

    -- Basic sets
    sets.idle = {
        main       = "Malignance Pole",
        sub        = "Kaja Grip",
        range      = "Dunna",
        head       = empy_head,
        body       = empy_body,
        hands      = af_hands,
        legs       = "Nyame Flanchard",
        feet       = empy_feet,
        neck       = "Loricate Torque +1",
        left_ear   = "Handler's Earring +1",
        right_ear  = "Lugalbanda Earring",
        left_ring  = "Defending Ring",
        right_ring = "Shneddick Ring",
        waist      = "Carrier's Sash",
        back       = nuke_cape, -- Until I add DT to the other one
    }
    sets.idle_with_pet = set_combine(sets.idle, {
        main      = "Solstice",
        sub       = "Genbu's Shield",
        right_ear = "Handler's Earring",
        feet      = relic_feet,
        back      = idle_cape,

        -- Telchine augs: pet DT -4%, pet regen +3
        -- head  = "Telchine Cap",
        -- legs  = "Telchine Braconi",
        -- feet  = "Bagua Sandals +3",
        -- waist = "Isa Belt"
    })
    sets.TP = set_combine(full_nyame, {
        neck       = "Loricate Torque +1",
        left_ear   = "Telos Earring",
        right_ear  = "Brutal Earring",
        left_ring  = "Chirich Ring +1",
        right_ring = "Petrov Ring",
        waist      = "Eschan Stone",
    })
    sets.FC = {
        -- TODO optimize with haste
        main       = "Solstice",           -- Fast Cast +5%
        sub        = "Genbu's Shield",
        range      = "Dunna",              -- Fast Cast +3%
        head       = vanya_head_d,         -- Fast Cast +10%
        body       = "Merlinic Jubbah",    -- Fast Cast +10%
        hands      = empy_hands,           -- Fast Cast +5%
        legs       = af_legs,              -- Fast Cast +11%
        waist      = "Channeler's Stone",  -- Fast Cast +2%
        left_ear   = "Malignance Earring", -- Fast Cast +4%
        right_ear  = "Loquacious Earring", -- Fast Cast +2%
        left_ring  = "Kishar Ring",        -- Fast Cast +4%
        right_ring = "Naji's Loop",        -- Fast Cast +1%
    }
    sets.macc = {
        main       = "Malignance Pole",
        sub        = "Kaja Grip",
        ammo       = "Hydrocera",
        head       = empy_head,
        body       = empy_body,
        hands      = empy_hands,
        legs       = empy_legs,
        feet       = empy_feet,
        neck       = jse_neck,
        left_ear   = "Malignance Earring",
        right_ear  = "Dignitary's Earring",
        left_ring  = "Stikini Ring",
        right_ring = "Stikini Ring",
        back       = nuke_cape,
        waist      = "Acuity Belt +1",
    }

    -- Precast sets
    sets.precast.RA = {}
    sets.precast["Cure"] = {
        right_ear = "Mendicant's Earring",
    }

    -- Weaponskill sets
    sets.precast.WS.melee = {
        neck  = "Fotia Gorget",
        waist = "Fotia Belt",
    }

    -- Job ability sets
    sets.precast.JA["Full Circle"] = {
        head = empy_head,
    }
    sets.precast.JA["Radial Arcana"] = {
        feet = relic_feet,
    }
    sets.precast.JA["Bolster"] = {
        body = relic_body,
    }
    sets.precast.JA["Life Cycle"] = {
        body = "Geomancy Tunic +1",
        back = nuke_cape,
    }
    sets.precast.JA["Mending Halation"] = {
        legs = relic_legs,
    }
    sets.precast.JA["Cardinal Chant"] = {
        head = af_head,
    }

    -- Midcast sets
    sets.midcast["Geomancy"] = {
        main       = "Solstice",
        sub        = "Genbu's Shield",
        range      = "Dunna",
        head       = empy_head,
        body       = relic_body,
        hands      = af_hands,
        legs       = relic_legs,
        feet       = empy_feet,
        neck       = jse_neck,
        left_ring  = "Stikini Ring",
        right_ring = "Stikini Ring",
        left_ear   = "Handler's Earring +1",
        right_ear  = "Handler's Earring",
        back       = "Lifestream Cape",
        waist      = "Isa Belt",
    }
    sets.midcast["Elemental Magic"] = set_combine(sets.macc,{
        main       = "Daybreak",
        sub        = "Ammurapi Shield",
        ammo       = "Ghastly Tathlum +1",
        head       = empy_head,
        body       = empy_body,
        hands      = empy_hands,
        legs       = empy_legs,
        feet       = empy_feet,
        neck       = "Mizukage-no-Kubikazari",
        left_ear   = "Malignance Earring",
        right_ear  = "Azimuth Earring",        -- Regal earring > Barkarole earring
        left_ring  = "Shiva Ring +1",
        right_ring = "Jhakri Ring",            -- Freke Ring
        waist      = "Acuity Belt +1",         -- Better than refoc. for now? Get Sacro Cord
        back       = nuke_cape,
    })
    sets.midcast["Enhancing Magic"] = {
        main       = "Daybreak",
        sub        = "Ammurapi Shield",   -- Enhancing duration +10%
        neck       = "Incanter's Torque",
        left_ring  = "Stikini Ring",
        right_ring = "Stikini Ring",
        waist      = "Siegel Sash",       -- Enhancing cast time -8%
    }
    sets.midcast["Enfeebling Magic"] = set_combine(sets.macc, {
        neck       = "Incanter's Torque",
        left_ring  = "Stikini Ring",
        right_ring = "Kishar Ring", -- Enfeebling duration +10%
    })
    sets.midcast["Dark Magic"] = set_combine(sets.macc, {
        right_ring = "Evanescence Ring",
    })
    sets.midcast["Stoneskin"] = set_combine(sets.midcast["Enhancing Magic"], {
        -- legs = "Shedir Seraweels", -- Stoneskin +35
        neck  = "Nodens Gorget", -- Stoneskin +30
        waist = "Siegel Sash",   -- Stoneskin +20
        -- left_ear = "Earthcry Earring", -- Stoneskin +10
    })
    sets.midcast["Aquaveil"] = set_combine(sets.midcast["Enhancing Magic"], {
        head = "Chironic Hat", -- Aquaveil +1
        -- legs = "Shedir Seraweels" -- Aquaveil +1
    })
    sets.midcast["Aspir"] = {
        
    }

    sets.midcast["Cure"] = {
        main       = "Daybreak",
        sub        = "Ammurapi Shield",
        ammo       = "Hydrocera",
        head       = vanya_head_b,
        body       = vanya_body_b,
        hands      = vanya_hands_b,
        legs       = vanya_legs_b,
        feet       = vanya_feet_b,
        neck       = "Incanter's Torque",
        left_ear   = "Meili Earring",
        right_ear  = "Mendicant's Earring",
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