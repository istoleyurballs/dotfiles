-- Default config file, load only the base config.
require("hyprland-base")

-- Disable TV
hl.monitor({ output = "HDMI-A-1", disabled = true })
