local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = "Tango (terminal.sexy)"
config.window_background_opacity = 1

config.default_prog = {"C:\\Program Files\\PowerShell\\7\\pwsh.exe"}
config.font = wezterm.font_with_fallback {'MesloLGS NF'}

config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 500
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_ease_in = "Constant"

config.mouse_bindings = {{
    event = {
        Up = {
            streak = 1,
            button = 'Left'
        }
    },
    mods = 'NONE',
    action = act.CopyTo 'ClipboardAndPrimarySelection'
}, {
    event = {
        Down = {
            streak = 1,
            button = 'Right'
        }
    },
    mods = 'NONE',
    action = act.PasteFrom 'Clipboard'
}}

config.keys = {{
    key = 'V',
    mods = 'CTRL',
    action = act.PasteFrom 'Clipboard'
}, {
    key = 'V',
    mods = 'CTRL',
    action = act.PasteFrom 'PrimarySelection'
}}

config.enable_scroll_bar = true
config.min_scroll_bar_height = '2cell'

config.colors = {
    cursor_fg = "#ffffff",
    cursor_bg = "#ffffff",
    cursor_border = "#ffffff"
}

config.background = {{
    source = {
        File = 'C:\\Users\\juglans\\Pictures\\81041584_p0.jpg'
    },
    width = '100%',
    repeat_x = 'NoRepeat',
    hsb = {
        brightness = 0.05
    }
}}

return config
