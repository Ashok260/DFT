# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Wed Mar 12 15:21:44 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design s298

create_clock -name "sclk" -period 5.0 -waveform {0.0 2.5} [get_ports CK]
group_path -weight 1.000000 -name C2C -from [list \
  [get_cells DFF_2/q_reg]  \
  [get_cells DFF_4/q_reg]  \
  [get_cells DFF_5/q_reg]  \
  [get_cells DFF_6/q_reg]  \
  [get_cells DFF_8/q_reg]  \
  [get_cells DFF_7/q_reg]  \
  [get_cells DFF_9/q_reg]  \
  [get_cells DFF_3/q_reg]  \
  [get_cells DFF_10/q_reg]  \
  [get_cells DFF_11/q_reg]  \
  [get_cells DFF_12/q_reg]  \
  [get_cells DFF_13/q_reg]  \
  [get_cells DFF_1/q_reg]  \
  [get_cells DFF_0/q_reg]  \
  [get_cells DFF_9/ts_lockup_latchp_clkc1_intno9_i/Q_reg] ] -to [list \
  [get_cells DFF_2/q_reg]  \
  [get_cells DFF_4/q_reg]  \
  [get_cells DFF_5/q_reg]  \
  [get_cells DFF_6/q_reg]  \
  [get_cells DFF_8/q_reg]  \
  [get_cells DFF_7/q_reg]  \
  [get_cells DFF_9/q_reg]  \
  [get_cells DFF_3/q_reg]  \
  [get_cells DFF_10/q_reg]  \
  [get_cells DFF_11/q_reg]  \
  [get_cells DFF_12/q_reg]  \
  [get_cells DFF_13/q_reg]  \
  [get_cells DFF_1/q_reg]  \
  [get_cells DFF_0/q_reg]  \
  [get_cells DFF_9/ts_lockup_latchp_clkc1_intno9_i/Q_reg] ]
group_path -weight 1.000000 -name C2O -from [list \
  [get_cells DFF_2/q_reg]  \
  [get_cells DFF_4/q_reg]  \
  [get_cells DFF_5/q_reg]  \
  [get_cells DFF_6/q_reg]  \
  [get_cells DFF_8/q_reg]  \
  [get_cells DFF_7/q_reg]  \
  [get_cells DFF_9/q_reg]  \
  [get_cells DFF_3/q_reg]  \
  [get_cells DFF_10/q_reg]  \
  [get_cells DFF_11/q_reg]  \
  [get_cells DFF_12/q_reg]  \
  [get_cells DFF_13/q_reg]  \
  [get_cells DFF_1/q_reg]  \
  [get_cells DFF_0/q_reg]  \
  [get_cells DFF_9/ts_lockup_latchp_clkc1_intno9_i/Q_reg] ] -to [list \
  [get_ports G117]  \
  [get_ports G118]  \
  [get_ports G132]  \
  [get_ports G133]  \
  [get_ports G66]  \
  [get_ports G67]  \
  [get_ports {ts_so[0]}] ]
group_path -weight 1.000000 -name I2C -from [list \
  [get_ports GND]  \
  [get_ports VDD]  \
  [get_ports CK]  \
  [get_ports G0]  \
  [get_ports G1]  \
  [get_ports G2]  \
  [get_ports {ts_si[0]}]  \
  [get_ports scan_en] ] -to [list \
  [get_cells DFF_2/q_reg]  \
  [get_cells DFF_4/q_reg]  \
  [get_cells DFF_5/q_reg]  \
  [get_cells DFF_6/q_reg]  \
  [get_cells DFF_8/q_reg]  \
  [get_cells DFF_7/q_reg]  \
  [get_cells DFF_9/q_reg]  \
  [get_cells DFF_3/q_reg]  \
  [get_cells DFF_10/q_reg]  \
  [get_cells DFF_11/q_reg]  \
  [get_cells DFF_12/q_reg]  \
  [get_cells DFF_13/q_reg]  \
  [get_cells DFF_1/q_reg]  \
  [get_cells DFF_0/q_reg]  \
  [get_cells DFF_9/ts_lockup_latchp_clkc1_intno9_i/Q_reg] ]
group_path -weight 1.000000 -name I2O -from [list \
  [get_ports GND]  \
  [get_ports VDD]  \
  [get_ports CK]  \
  [get_ports G0]  \
  [get_ports G1]  \
  [get_ports G2]  \
  [get_ports {ts_si[0]}]  \
  [get_ports scan_en] ] -to [list \
  [get_ports G117]  \
  [get_ports G118]  \
  [get_ports G132]  \
  [get_ports G133]  \
  [get_ports G66]  \
  [get_ports G67]  \
  [get_ports {ts_so[0]}] ]
set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
