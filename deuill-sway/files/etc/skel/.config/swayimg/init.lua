-- General config
swayimg.set_mode("viewer")                -- mode at startup
swayimg.enable_decoration(false)          -- window title/buttons/borders
swayimg.enable_overlay(true)              -- window overlay mode
swayimg.enable_exif_orientation(true)     -- image orientation by EXIF

-- Image list configuration
swayimg.imagelist.set_order("numeric")    -- list order
swayimg.imagelist.enable_adjacent(true)   -- add adjacent files from same dir
swayimg.imagelist.enable_fsmon(true)      -- enable file system monitoring

-- Text overlay configuration
swayimg.text.set_font("Iosevka")          -- font name
swayimg.text.set_size(12)                 -- font size in pixels
swayimg.text.set_spacing(0)               -- line spacing
swayimg.text.set_padding(10)              -- padding from window edge
swayimg.text.set_foreground(0xfffefefe)   -- foreground text color
swayimg.text.set_background(0xcc000000)   -- text background color
swayimg.text.set_shadow(0xff333333)       -- text shadow color

-- Image viewer mode
swayimg.viewer.set_window_background(0xcc000000) -- window background color
swayimg.viewer.set_text("topleft", {             -- top left text block scheme
  "File: {name}",
  "Format: {format}",
  "File size: {sizehr}",
  "File time: {time}"
})
swayimg.viewer.set_text("topright", {            -- top right text block scheme
  "Image: {list.index} of {list.total}",
  "Frame: {frame.index} of {frame.total}",
  "Size: {frame.width}x{frame.height}"
})
swayimg.viewer.set_text("bottomleft", {          -- bottom left text block scheme
  "Scale: {scale}",
  "Size: {frame.width}x{frame.height}"
})

-- Gallery mode
swayimg.gallery.set_thumb_size(300)                 -- thumbnail size in pixels
swayimg.gallery.set_border_color(0xffab4642)        -- border color for selected thumbnail
swayimg.gallery.set_selected_scale(1.15)            -- scale for selected thumbnail
swayimg.gallery.set_selected_color(0xff333333)      -- background color for selected thumbnail
swayimg.gallery.set_unselected_color(0xff202020)    -- background color for unselected thumbnail
swayimg.gallery.set_window_color(0xcc000000)        -- window background color
swayimg.gallery.limit_cache(100)                    -- number of thumbnails stored in memory
swayimg.gallery.enable_preload(false)               -- preloading invisible thumbnails
swayimg.gallery.enable_pstore(false)                -- enable persistent storage for thumbnails
swayimg.gallery.set_text("bottomright", {           -- top left text block scheme
  "File: {name}"
})

-- Keybindings
swayimg.viewer.on_key("Left", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(math.floor(pos.x + wnd.width / 10), pos.y);
end)

swayimg.viewer.on_mouse("Ctrl-ScrollUp", function()
  local pos = swayimg.get_mouse_pos()
  local scale = swayimg.viewer.get_scale()
  scale = scale + scale / 10
  swayimg.viewer.set_abs_scale(scale, pos.x, pos.y);
end)

swayimg.viewer.on_key("h", function() swayimg.viewer.switch_image("prev") end)
swayimg.viewer.on_key("l", function() swayimg.viewer.switch_image("next") end)
swayimg.viewer.on_key("k", function() swayimg.viewer.switch_image("prev") end)
swayimg.viewer.on_key("j", function() swayimg.viewer.switch_image("next") end)
swayimg.viewer.on_key("Space", function() swayimg.viewer.switch_image("next") end)

swayimg.viewer.on_key("g", function() swayimg.viewer.switch_image("first") end)
swayimg.viewer.on_key("G", function() swayimg.viewer.switch_image("last") end)

swayimg.viewer.on_key("Escape", swayimg.exit)
swayimg.viewer.on_key("q", swayimg.exit)

swayimg.gallery.on_key("Return", function() swayimg.set_mode("viewer") end)

swayimg.gallery.on_key("Left", function() swayimg.gallery.switch_image("left") end)
swayimg.gallery.on_key("Right", function() swayimg.gallery.switch_image("right") end)
swayimg.gallery.on_key("Up", function() swayimg.gallery.switch_image("up") end)
swayimg.gallery.on_key("Down", function() swayimg.gallery.switch_image("down") end)

swayimg.gallery.on_key("h", function() swayimg.gallery.switch_image("left") end)
swayimg.gallery.on_key("l", function() swayimg.gallery.switch_image("right") end)
swayimg.gallery.on_key("k", function() swayimg.gallery.switch_image("up") end)
swayimg.gallery.on_key("j", function() swayimg.gallery.switch_image("down") end)

swayimg.gallery.on_key("g", function() swayimg.gallery.switch_image("first") end)
swayimg.gallery.on_key("G", function() swayimg.gallery.switch_image("last") end)

swayimg.gallery.on_key("q", swayimg.exit)
