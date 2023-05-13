-- TODO: movespeed gear

-- TODO: add function for swapping macro page and lockstyle
-- function select_default_macro_book()
--     -- Default macro set/book
--     if player.sub_job == 'DNC' then
--         set_macro_page(1, 1)
--     elseif player.sub_job == 'WAR' then
--         set_macro_page(2, 1)
--     elseif player.sub_job == 'NIN' then
--         set_macro_page(3, 1)
--     else
--         set_macro_page(1, 1)
--     end
-- end

-- function set_lockstyle()
--     send_command('wait 2; input /lockstyleset ' .. lockstyleset)
-- end

-- Items that will be locked if equipped manually
lock_items = {}
lock_items["ring"] = S{
    "Warp Ring",
    "Endorsement Ring",
    -- "Trizek Ring",
    "Echad Ring",
    "Emporox's Ring",
    "Caliber Ring",
    "Dim. Ring (Mea)",
    -- "Dim. Ring (Holla)",
    -- "Dim. Ring (Dem)",
}
lock_items["head"] = S{
    "Guide Beret",
}
