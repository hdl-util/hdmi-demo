files = [
    "zybo_top.sv",
    "pinout.xdc"
]

modules = {
    "git": [
        "https://github.com/hdl-util/hdmi.git::master",
        "https://github.com/hdl-util/sound.git::master",
        "https://github.com/hdl-util/vga-text-mode.git::master"
    ]
}

fetchto = "../../ip_cores"
