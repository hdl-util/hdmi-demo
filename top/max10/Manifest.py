files = [
    "max10_top.sv",
]

modules = {
    "git": [
        "git@github.com:hdl-util/hdmi.git::master",
        "git@github.com:hdl-util/sound.git::master",
        "git@github.com:hdl-util/vga-text-mode.git::master"
    ]
}

fetchto = "../../ip_cores"

