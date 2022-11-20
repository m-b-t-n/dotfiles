local wezterm = require 'wezterm'
local keybinds = require 'keys'

wezterm.on(
'format-tab-title',
-- function (tab, tabs, panes, config, hover, max_width)
function (tab)
	if tab.is_active then
		local tab_text =
			' '
			.. tostring(tab.tab_id + 1)
			.. ': '
			.. tab.active_pane.title
			.. ' '
		return {
			{ Background = { Color = 'green' } },
			{ Text = tab_text },
		}
	end
end
)

return {
	font = wezterm.font("Ricty Diminished Discord", {weight="Regular", stretch="Normal", style="Normal"}),
	font_size = 20.0,
	color_scheme = "Pastel White (terminal.sexy)",
	window_background_opacity = 0.7,
	text_background_opacity = 0.7,
	tab_max_width = 64,
	use_fancy_tab_bar = false,
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = 0.3,
	},
	-- Default is;
	-- window_decorations = "TITLE | RESIZE",
	window_decorations = "RESIZE",
	default_cursor_style = "BlinkingBlock",
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 600,
	initial_cols = 160,
	initial_rows = 48,
	leader = keybinds.leader,
	keys = keybinds.binds,
}

