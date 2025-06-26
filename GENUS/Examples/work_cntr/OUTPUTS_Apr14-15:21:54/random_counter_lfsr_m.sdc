# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Mon Apr 14 15:21:57 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design random_counter_lfsr

create_clock -name "clk" -period 5.0 -waveform {0.0 2.5} [get_ports clk]
group_path -weight 1.000000 -name C2C -from [list \
  [get_cells u3/q_reg]  \
  [get_cells u1/q_reg]  \
  [get_cells u4/q_reg]  \
  [get_cells u0/q_reg]  \
  [get_cells u2/q_reg] ] -to [list \
  [get_cells u3/q_reg]  \
  [get_cells u1/q_reg]  \
  [get_cells u4/q_reg]  \
  [get_cells u0/q_reg]  \
  [get_cells u2/q_reg] ]
group_path -weight 1.000000 -name C2O -from [list \
  [get_cells u3/q_reg]  \
  [get_cells u1/q_reg]  \
  [get_cells u4/q_reg]  \
  [get_cells u0/q_reg]  \
  [get_cells u2/q_reg] ] -to [list \
  [get_ports {counter_random[4]}]  \
  [get_ports {counter_random[3]}]  \
  [get_ports {counter_random[2]}]  \
  [get_ports {counter_random[1]}]  \
  [get_ports {counter_random[0]}] ]
group_path -weight 1.000000 -name I2C -from [list \
  [get_ports clk]  \
  [get_ports rst_n]  \
  [get_ports {initialized_value[4]}]  \
  [get_ports {initialized_value[3]}]  \
  [get_ports {initialized_value[2]}]  \
  [get_ports {initialized_value[1]}]  \
  [get_ports {initialized_value[0]}] ] -to [list \
  [get_cells u3/q_reg]  \
  [get_cells u1/q_reg]  \
  [get_cells u4/q_reg]  \
  [get_cells u0/q_reg]  \
  [get_cells u2/q_reg] ]
group_path -weight 1.000000 -name I2O -from [list \
  [get_ports clk]  \
  [get_ports rst_n]  \
  [get_ports {initialized_value[4]}]  \
  [get_ports {initialized_value[3]}]  \
  [get_ports {initialized_value[2]}]  \
  [get_ports {initialized_value[1]}]  \
  [get_ports {initialized_value[0]}] ] -to [list \
  [get_ports {counter_random[4]}]  \
  [get_ports {counter_random[3]}]  \
  [get_ports {counter_random[2]}]  \
  [get_ports {counter_random[1]}]  \
  [get_ports {counter_random[0]}] ]
set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
