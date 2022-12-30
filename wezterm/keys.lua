local KEYS = {}
local wezterm = require 'wezterm'

KEYS.leader = {
	key = 'a',
	mods = 'CTRL',
	timeout_milliseconds = 1000,
}

KEYS.binds = {
	{
		key = '|',
		mods = 'LEADER|SHIFT',
		action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
	},
	{
		key = '-',
		mods = 'LEADER',
		action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
	},
	{
		key = 'c',
		mods = 'LEADER|SHIFT',
		action = wezterm.action.SpawnTab 'CurrentPaneDomain',
	},
	{
		key = 'h',
		mods = 'LEADER|SHIFT',
		action = wezterm.action.AdjustPaneSize { 'Left', 5 },
	},
	{
		key = 'l',
		mods = 'LEADER|SHIFT',
		action = wezterm.action.AdjustPaneSize { 'Right', 5 },
	},
	{
		key = 'j',
		mods = 'LEADER|SHIFT',
		action = wezterm.action.AdjustPaneSize { 'Down', 5 },
	},
	{
		key = 'k',
		mods = 'LEADER|SHIFT',
		action = wezterm.action.AdjustPaneSize { 'Up', 5 },
	},
	{
		key = 'h',
		mods = 'LEADER',
		action = wezterm.action.ActivatePaneDirection 'Left',
	},
	{
		key = 'l',
		mods = 'LEADER',
		action = wezterm.action.ActivatePaneDirection 'Right',
	},
	{
		key = 'j',
		mods = 'LEADER',
		action = wezterm.action.ActivatePaneDirection 'Down',
	},
	{
		key = 'k',
		mods = 'LEADER',
		action = wezterm.action.ActivatePaneDirection 'Up',
	},
	{
		key = 'n',
		mods = 'LEADER',
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = 'p',
		mods = 'LEADER',
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = '[',
		mods = 'LEADER',
		action = wezterm.action.ActivateCopyMode,
	},
	{
		key = 'a',
		mods = 'LEADER|CTRL',
		action = wezterm.action.SendString '\x01',
	},
}

return KEYS

