local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Gruvbox Material (Gogh)'

-- For Hyprland
config.enable_wayland = false

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

config.font_size = 16.0
config.font = wezterm.font("FiraCode Nerd Font", { weight = 'Regular' })
-- config.font = wezterm.font_with_fallback('JetBrains Mono')

return config
