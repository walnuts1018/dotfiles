local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- check os
local windows = wezterm.target_triple == "x86_64-pc-windows-msvc"
local mac_x86 = wezterm.target_triple == "x86_64-apple-darwin"
local mac_arm = wezterm.target_triple == "aarch64-apple-darwin"
local mac = mac_x86 or mac_arm
local linux = wezterm.target_triple == "x86_64-unknown-linux-gnu"

if mac or linux then
    config.default_prog = {"zsh"}
elseif windows then
    config.default_prog = {"pwsh.exe"}
end

config.color_scheme = "Tango (terminal.sexy)"
config.window_background_opacity = 1
config.font = wezterm.font_with_fallback {'MesloLGS NF'}
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 500
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_ease_in = "Constant"

config.mouse_bindings = {{
    event = {
        Down = {
            streak = 1,
            button = 'Right'
        }
    },
    mods = 'NONE',
    -- action = act.PasteFrom 'Clipboard'
    action = wezterm.action_callback(function(window, pane)
        selection_text = window:get_selection_text_for_pane(pane)
        is_selection_active = string.len(selection_text) ~= 0
        wezterm.log_info("is_selection_active: " .. tostring(is_selection_active))
        if is_selection_active then
            window:perform_action(wezterm.action.CopyTo('ClipboardAndPrimarySelection'), pane)
            window:perform_action(act.ClearSelection, pane)
        else
            window:perform_action(wezterm.action.PasteFrom('Clipboard'), pane)
        end
    end)
}}

local controlKey = mac and 'CMD' or 'CTRL'

config.keys = {{
    key = 'V',
    mods = controlKey,
    action = act.PasteFrom 'Clipboard'
}, {
    key = 'c',
    mods = controlKey,
    action = wezterm.action_callback(function(window, pane)
        selection_text = window:get_selection_text_for_pane(pane)
        is_selection_active = string.len(selection_text) ~= 0
        wezterm.log_info("is_selection_active: " .. tostring(is_selection_active))
        if is_selection_active then
            window:perform_action(wezterm.action.CopyTo('ClipboardAndPrimarySelection'), pane)
            window:perform_action(act.ClearSelection, pane)
        else
            window:perform_action(wezterm.action.SendKey {
                key = 'c',
                mods = 'CTRL'
            }, pane)
        end
    end)
}, {
    key = "LeftArrow",
    mods = controlKey,
    action = act.SendKey {
        key = "b",
        mods = "META"
    }
}, {
    key = "RightArrow",
    mods = controlKey,
    action = act.SendKey {
        key = "f",
        mods = "META"
    }
}, {
    key = '|',
    mods = controlKey .. '|SHIFT',
    action = wezterm.action.SplitHorizontal {
        domain = 'CurrentPaneDomain'
    }
}}

config.enable_scroll_bar = true
config.min_scroll_bar_height = '2cell'

config.colors = {
    cursor_fg = "#ffffff",
    cursor_bg = "#ffffff",
    cursor_border = "#ffffff"
}

config.window_frame = {
    font_size = 12.0
}

wezterm.log_error('Home ' .. wezterm.home_dir)

config.background = {{
    source = {
        File = wezterm.home_dir .. '/.wezterm-background.png'
    },
    height = "Cover",
    repeat_x = 'NoRepeat',
    horizontal_align = 'Right',
    hsb = {
        brightness = 0.05
    }
}}

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.tab_and_split_indices_are_zero_based = true

return config
