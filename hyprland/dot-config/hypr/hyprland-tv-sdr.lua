-- Config file to configure the TV without HDR.
require("hyprland-base")

hl.monitor({
    output = "HDMI-A-1",
    mode = "3840x2160@120",
    position = "2560x0",
    scale = 1,
    bitdepth = 10,
    cm = "srgb",
})

hl.on("hyprland.start", function()
    -- Keep TV color accurate
    hl.exec_cmd("sleep 1 && hyprctl hyprsunset identity")
end)
