set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# TD0-, TD0+
set_property IOSTANDARD TMDS_33 [get_ports {HDMI_TX[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {HDMI_TX_N[0]}]
set_property PACKAGE_PIN F1 [get_ports {HDMI_TX_N[0]}]
set_property PACKAGE_PIN G1 [get_ports {HDMI_TX[0]}]

# TD1-, TD1+
set_property IOSTANDARD TMDS_33 [get_ports {HDMI_TX[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {HDMI_TX_N[1]}]
set_property PACKAGE_PIN D2 [get_ports {HDMI_TX_N[1]}]
set_property PACKAGE_PIN E2 [get_ports {HDMI_TX[1]}]

# TD2-, TD2+
set_property IOSTANDARD TMDS_33 [get_ports {HDMI_TX[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {HDMI_TX_N[2]}]
set_property PACKAGE_PIN C1 [get_ports {HDMI_TX_N[2]}]
set_property PACKAGE_PIN D1 [get_ports {HDMI_TX[2]}]

# TCK-, TCK+
set_property IOSTANDARD TMDS_33 [get_ports HDMI_CLK_N]
set_property IOSTANDARD TMDS_33 [get_ports HDMI_CLK]
set_property PACKAGE_PIN F4 [get_ports HDMI_CLK_N]
set_property PACKAGE_PIN G4 [get_ports HDMI_CLK]

# CEC, SDA, SCL, DPD_DET
set_property IOSTANDARD LVCMOS33 [get_ports HDMI_CEC]
set_property IOSTANDARD LVCMOS33 [get_ports HDMI_SDA]
set_property IOSTANDARD LVCMOS33 [get_ports HDMI_SCL]
set_property IOSTANDARD LVCMOS33 [get_ports HDMI_HPD]

set_property PULLTYPE PULLUP [get_ports HDMI_CEC]
set_property PULLTYPE PULLUP [get_ports HDMI_SDA]
set_property PULLTYPE PULLUP [get_ports HDMI_SCL]
set_property PULLTYPE PULLUP [get_ports HDMI_HPD]

set_property PACKAGE_PIN E4 [get_ports HDMI_CEC]
set_property PACKAGE_PIN F2 [get_ports HDMI_SDA]
set_property PACKAGE_PIN F3 [get_ports HDMI_SCL]
set_property PACKAGE_PIN D4 [get_ports HDMI_HPD]


set_property IOSTANDARD LVCMOS33 [get_ports RESET]
set_property PACKAGE_PIN D14 [get_ports RESET]

set_property IOSTANDARD LVCMOS33 [get_ports CLK_100MHZ]
set_property PACKAGE_PIN H4 [get_ports CLK_100MHZ]
create_clock -add -name CLK_100MHZ -period 10.00 -waveform {0 5} [get_ports CLK_100MHZ]

set_property IOSTANDARD LVCMOS33 [get_ports LED[0]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[1]]
set_property PACKAGE_PIN J1 [get_ports LED[0]]
set_property PACKAGE_PIN A13 [get_ports LED[1]]
