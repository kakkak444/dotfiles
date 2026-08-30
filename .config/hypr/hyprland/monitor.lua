------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
--[[
hl.monitor({
        output   = "",
        mode     = "preferred",
        position = "auto",
        scale    = "auto",
})
]]

hl.monitor({
        output   = "DP-3",
        mode     = "3840x2160@60",
        position = "0x0",
        scale    = 1.5,
})
hl.monitor({
        output   = "HDMI-A-3",
        mode     = "1920x1080@74.97",
        position = "-2560x0",
        scale    = 0.75,
})

-- main monitor
hl.workspace_rule({ workspace="1", monitor="DP-3",     default=true })
-- sub monitors
hl.workspace_rule({ workspace="2", monitor="HDMI-A-3", default=true })

