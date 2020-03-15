set_time_format -unit ns -decimal_places 3
create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
create_clock -name mipi_clk -period 15.38 [get_ports {MIPI_CLK}]
create_clock -name CLK_48MHZ -period "48.0 MHz" [get_ports {CLK_48MHZ}]

derive_pll_clocks
derive_clock_uncertainty

set_output_delay -max 1.5 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_A*]
set_output_delay -max 1.5 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_D*]
set_output_delay -max 1.5 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_R*]
set_output_delay -max 1.5 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_CA*]
set_output_delay -max 1.5 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_CK*]
set_output_delay -max 1.5 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_CS*]
set_output_delay -max 1.5 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_W*]
set_output_delay -max 1.5 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_BA*]
set_output_delay -max 1.5 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_D*]

set_output_delay -min -0.8 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_A*]
set_output_delay -min -0.8 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_D*]
set_output_delay -min -0.8 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_R*]
set_output_delay -min -0.8 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_CA*]
set_output_delay -min -0.8 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_CK*]
set_output_delay -min -0.8 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_CS*]
set_output_delay -min -0.8 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_W*]
set_output_delay -min -0.8 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_BA*]
set_output_delay -min -0.8 -clock [get_clocks SDRAM_CLK]  [get_ports SDRAM_D*]

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 

set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -from [get_keepers {sld_hub:*|irf_reg*}] -to [get_keepers {*system_nios2_gen2_0_cpu:*|system_nios2_gen2_0_cpu_nios2_oci:the_system_nios2_gen2_0_cpu_nios2_oci|system_nios2_gen2_0_cpu_debug_slave_wrapper:the_system_nios2_gen2_0_cpu_debug_slave_wrapper|system_nios2_gen2_0_cpu_debug_slave_sysclk:the_system_nios2_gen2_0_cpu_debug_slave_sysclk|ir*}]
set_false_path -from [get_keepers {sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1]}] -to [get_keepers {*system_nios2_gen2_0_cpu:*|system_nios2_gen2_0_cpu_nios2_oci:the_system_nios2_gen2_0_cpu_nios2_oci|system_nios2_gen2_0_cpu_nios2_oci_debug:the_system_nios2_gen2_0_cpu_nios2_oci_debug|monitor_go}]
set_false_path -from [get_clocks {mipi_clk}] -to [get_clocks {PLL_inst|altpll_component|auto_generated|pll1|clk[2]}]
set_false_path -from [get_clocks {PLL_inst|altpll_component|auto_generated|pll1|clk[2]}] -to [get_clocks {mipi_clk}]

set_multicycle_path -from {memory:u0|AES_AVL:aes_0|*} -to {memory:u0|AES_AVL:aes_0|*} -setup -end 2
