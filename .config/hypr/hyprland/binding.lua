---------------------
---- KEYBINDINGS ----
---------------------

-- Set programs that you use
local terminal    = "ghostty"
local fileManager = "ghostty -e yazi"
local menu        = "hyprlauncher"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
-- local closeWindowBind = hl.bind(mainMod .. " + TAB + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + ALT + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("1password --lock ; hyprlock"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))

-- Move focus with mainMod + hjklui
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + U", hl.dsp.focus({ monitor = "+1" }))
hl.bind(mainMod .. " + I", hl.dsp.focus({ monitor = "-1" }))
-- Move focus window with mainMod + HJKLUI
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + U", hl.dsp.window.move({ monitor = "+1" }))
hl.bind(mainMod .. " + CTRL + I", hl.dsp.window.move({ monitor = "-1" }))

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle"}))
hl.bind("Print", hl.dsp.exec_cmd('grim - | satty -f - --copy-command wl-copy -o "~/Pictures/Screenshots/%Y%m%d_%H%M%S.png"'))
hl.bind("ALT + Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | satty -f - --copy-command wl-copy -o "~/Pictures/Screenshots/%Y%m%d_%H%M%S.png"'))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("ghostty --class=clipse -e clipse", { float = true, size = {622, 652}, stay_focused = true }))

-- submap dispatch helper
local sdh = function (dispatch)
	return function ()
		hl.dispatch(dispatch)
		hl.dispatch(hl.dsp.submap("reset"))
	end
end

-- Edit Window Status
hl.bind(mainMod .. " + W", hl.dsp.submap("window"))
hl.define_submap("window", function()
	hl.bind("F", sdh(hl.dsp.window.float({ action = "toggle" })))
	hl.bind("P", sdh(hl.dsp.window.pseudo()))
	hl.bind("A", sdh(hl.dsp.layout("togglesplit"))) -- dwindle only
	hl.bind("C", sdh(hl.dsp.window.close()))

	hl.bind("catchall", hl.dsp.submap("reset"))
end)

-- Run Application
hl.bind(mainMod .. " + A", hl.dsp.submap("application"))
local apps = {
	{ bind = "F", app = "firefox" },
	{ bind = "V", app = "code" },
	{ bind = "T", app = terminal },
	{ bind = "1", app = "1password --quick-access" },
}
hl.define_submap("application", function()
	for _, a in ipairs(apps) do
		hl.bind(a["bind"], sdh(hl.dsp.exec_cmd(a["app"])))
	end
	hl.bind("catchall", hl.dsp.submap("reset"))
end)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i}))
	hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

