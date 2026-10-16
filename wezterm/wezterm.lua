local wezterm = require 'wezterm'
local keybinds = require 'keys'

-- SSH Domains
local ssh_domains = {}
for host, config in pairs(wezterm.enumerate_ssh_hosts()) do
	table.insert(ssh_domains, {
		name = host,
		remote_address = config["hostname"],
		username = config["user"],
		ssh_option = { identityfile = config["identityfile"] },
	})
end

wezterm.on(
'format-tab-title',
-- function (tab, tabs, panes, config, hover, max_width)
function (tab)
	if tab.is_active then
		local tab_text =
			' '
			.. tostring(tab.tab_index + 1)
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

local config = wezterm.config_builder()
config.ssh_domains = ssh_domains
config.color_scheme = "Pastel White (terminal.sexy)"
config.check_for_updates = false

if wezterm.target_triple == 'aarch64-apple-darwin' then
	config.font = wezterm.font("PlemolJP35", {weight="Medium", stretch="Normal", style="Normal"})
	config.font_size = 16.5
	config.window_background_opacity = 0.7
	config.text_background_opacity = 0.7
	-- Default is;
	-- window_decorations = "TITLE | RESIZE",
	config.window_decorations = "RESIZE"

elseif wezterm.target_triple == 'x86_64-pc-windows-msvc' then
	config.font = wezterm.font("PlemolJP35 Console NF", {weight="Medium", stretch="Normal", style="Normal"})
	config.font_size = 14
	config.window_background_opacity = 0.7
	config.text_background_opacity = 0.7
	config.default_prog = { 'wsl.exe' }

elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
	config.font = wezterm.font("PlemolJP35", {weight="Medium", stretch="Normal", style="Normal"})
	config.font_size = 16.5
	config.window_background_opacity = 0.7
	config.text_background_opacity = 0.7
end

config.tab_max_width = 64
config.use_fancy_tab_bar = false
config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 0.3,
}
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 600
config.initial_cols = 160
config.initial_rows = 48
config.leader = keybinds.leader
config.keys = keybinds.binds

return config

