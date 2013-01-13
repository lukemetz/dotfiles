-- My Theme, 
-- Modified from
-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons

-- {{{ Main


local to_rgb = function(hex)
   local rgb = {}
   v = tonumber(hex:sub(2,3), 16)
   table.insert(rgb, v)

   v = tonumber(hex:sub(4,5), 16)
   table.insert(rgb, v)
   
   v = tonumber(hex:sub(6,7), 16)
   table.insert(rgb, v)
   return rgb
end

local to_hex = function(value)
   return string.format("#%02X%02X%02X", value[1], value[2], value[3])
end

local delta = function(hex, amount)
   local rgb = to_rgb(hex)
   rgb[1] = rgb[1] + amount
   rgb[2] = rgb[2] + amount
   rgb[3] = rgb[3] + amount
   return to_hex(rgb)
end


local base_dir = "/home/luke/.config/awesome/themes/current/"
theme = {}
theme.wallpaper = "/home/luke/.config/wallpaper/current"
-- }}}

-- {{{ Styles
theme.font      = "monaco 8"
-- palette from http://www.colourlovers.com/palette/581568/y_o_y
bg = "#161616"
pink = "#C94D65"
yellow = "#E7C049"
green = "#92C049"
teal = "#1F6764"

-- {{{ Colors
theme.fg_normal  = delta(bg, 150) --green
theme.fg_focus   = green--delta(green, 50) 
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = bg
theme.bg_focus   = delta(bg, 30) 
theme.bg_urgent  = delta(bg, 50)
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width  = 1 
theme.border_normal = teal 
theme.border_focus  = green 
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = bg 
theme.titlebar_bg_normal = bg 
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
theme.taglist_fg_focus = pink 
theme.taglist_bg_focus = delta(bg, 20) 
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 15
theme.menu_width  = 100
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = base_dir .. "/taglist/squarefz.png"
theme.taglist_squares_unsel = base_dir .. "/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = base_dir .. "/arch-icon.png"
theme.menu_submenu_icon      = "/usr/share/awesome/themes/default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = base_dir .. "/layouts/tile.png"
theme.layout_tileleft   = base_dir .. "/layouts/tileleft.png"
theme.layout_tilebottom = base_dir .. "/layouts/tilebottom.png"
theme.layout_tiletop    = base_dir .. "/layouts/tiletop.png"
theme.layout_fairv      = base_dir .. "/layouts/fairv.png"
theme.layout_fairh      = base_dir .. "/layouts/fairh.png"
theme.layout_spiral     = base_dir .. "/layouts/spiral.png"
theme.layout_dwindle    = base_dir .. "/layouts/dwindle.png"
theme.layout_max        = base_dir .. "/layouts/max.png"
theme.layout_fullscreen = base_dir .. "/layouts/fullscreen.png"
theme.layout_magnifier  = base_dir .. "/layouts/magnifier.png"
theme.layout_floating   = base_dir .. "/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = base_dir .. "/titlebar/close_focus.png"
theme.titlebar_close_button_normal = base_dir .. "/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = base_dir .. "/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = base_dir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = base_dir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = base_dir .. "/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = base_dir .. "/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = base_dir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = base_dir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = base_dir .. "/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = base_dir .. "/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = base_dir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = base_dir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = base_dir .. "/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = base_dir .. "/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = base_dir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = base_dir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = base_dir .. "/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
