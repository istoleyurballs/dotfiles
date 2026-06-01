-- Config file to configure the TV in HDR mode.
require("hyprland-base")

-- Setup TV with HDR
hl.monitor({
    output = "HDMI-A-1",
    mode = "3840x2160@120",
    position = "2560x0",
    scale = 1,
    bitdepth = 10,
    cm = "hdredid",
    sdr_min_luminance = 0.005,
    -- sdr_max_luminance = 250,
})

hl.on("hyprland.start", function()
    -- It look like shit in HDR
    hl.exec_cmd("sleep 1 && hyprctl hyprsunset identity")
end)
