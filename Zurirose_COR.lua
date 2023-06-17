function get_sets()
    include('Zuri-Common.lua')
    job_init(2, 9, 15)  -- Macro book, macro page, lockstyle set

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
        main       = "Kaja Knife",
        sub        = "Gleti's Knife",
        range      = "Anarchy",
        ammo       = "Bronze Bullet",

        head       = "Adhemar Bonnet",
        body       = "Adhemar Jacket",
        hands      = "Meghanada Gloves +2",
        legs       = "Meghanada Chausses +2",
        feet       = "Malignance Boots",
        neck       = "Subtlety Spectacles",
        waist      = "Sailfi Belt +1",
        left_ear   = "Eabani Earring",
        right_ear  = "Odr Earring",
        left_ring  = "Mummu Ring",
        right_ring = "Meghanada Ring",
        back       = "Sokolski Mantle",
    }
    sets.FC = {}

    -- Precast sets
    sets.precast = {}  -- Leave empty
    sets.precast.RA = {
        ammo       = "Anarchy",
        head       = "Meghanada Visor",
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

    -- Weaponskill sets
    sets.precast.WS = {} -- Leave Empty
    sets.precast.WS.base = {
        -- ammo       = "Yetshila",
        -- head       = "Skulker's Bonnet +2",
        -- -- body       = "Meghanada Cuirie +2",
        -- body       = "Skulker's Vest +2",
        -- hands      = "Meghanada Gloves +2",
        -- legs       = "Meghanada Chausses +2",
        -- feet       = "Skulker's Poulaines +2",
        -- neck       = "Caro Necklace",
        -- waist      = "Grunfeld Rope",
        -- left_ear   = "Moonshade Earring",
        -- right_ear  = "Odr Earring",
        -- -- left_ring  = "Ilabrat Ring",
        -- -- right_ring = "Regal Ring",
        -- left_ring  = "Apate Ring",
        -- right_ring = "Rufescent Ring",
        -- back       = "Toutatis's Cape",
    }
    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS.base,{
        right_ear = "Ishvara Earring",
    })

    -- Job ability sets
    sets.precast.JA = {}  -- Leave empty
    sets.precast.JA["Phantom Roll"] = {
        left_ring  = "Barataria Ring",
        right_ring = "Luzaf's Ring",
    }

    -- Use TH for targeted JA's
    sets.precast.JA["Box Step"] = sets.th
    sets.precast.JA["Quick Step"] = sets.th
    
    -- Midcast sets
    sets.midcast = {} -- Leave empty

    -- Other sets
    sets.TH = {
        ammo  = "Perfect Lucky Egg",
    }
    -- Maximize crit rate for Domain Invasion
    sets.DI = set_combine(sets.TP, {
        -- main       = "Voluspa Knife",
        -- sub        = "Shijo",
        -- ammo       = "Yetshila",
        -- hands      = "Mummu Wrists +2",
        -- left_ear   = "Odr Earring",
        -- left_ring  = "Mummu Ring",
        -- right_ring = "Meghanada Ring",
    })
    sets.doomed = {
        left_ring  = "Blenmot's Ring +1",
        right_ring = "Blenmot's Ring +1",
    }

end -- get_sets()