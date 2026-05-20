require("hyprland-base")

hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-2", default = true })
hl.workspace_rule({ workspace = "3", monitor = "DP-3", default = true })

hl.window_rule({
    name = "gaming-discord-ws3",
    match = { class = "discord" },
    workspace = "3",
    no_initial_focus = true,
})

hl.window_rule({
    name = "gaming-steam-ws1",
    match = { class = "steam" },
    workspace = "1",
})

hl.on("hyprland.start", function()
    hl.exec_cmd("uwsm app -- flatpak run com.discordapp.Discord")
    hl.exec_cmd("uwsm app -- steam -tenfoot")
    hl.exec_cmd("uwsm app -- " .. TERMINAL .. " -e gotop", { workspace = "2", silent = true })
    hl.exec_cmd("uwsm app -- " .. TERMINAL .. " -e nvtop", { workspace = "2", silent = true })
    -- Want color accurate gaming
    hl.exec_cmd("sleep 1 && hyprctl hyprsunset identity")
end)
