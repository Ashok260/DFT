# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Fri May 16 09:30:29 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design counter_16bit

create_clock -name "sclk" -period 5.0 -waveform {0.0 2.5} [get_ports clk]
set_clock_gating_check -setup 0.0 
