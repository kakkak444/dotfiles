-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function ()
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)
hl.on("hyprland.start", function()
        hl.dispatch(function()
                -- hl.exec_cmd("yaskkserv2 --google-suggest /var/tmp/dictionary.yaskkserv2")
                hl.exec_cmd("yaskkserv2 --google-suggest --google-cache-filename=~/.local/share/yaskkserv2/yaskkserv2.cache ~/.local/share/yaskkserv2/dictionary.yaskkserv2")
                hl.exec_cmd("fcitx5 -d -r")
        end)
        hl.exec_cmd("waybar")
        hl.exec_cmd("hypridle")
        hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
        hl.exec_cmd("hyprpaper")
        hl.exec_cmd("clipse -listen")
        hl.exec_cmd("wl-clip-persist --clipboard regular")
        hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
        hl.exec_cmd("kwalletd6")
        hl.exec_cmd("/usr/lib/pam_kwallet_init")
        hl.dispatch(hl.dsp.focus({ workspace = "1" }))
end)

