# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Tue Apr 22 15:59:55 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design CLOCK

create_clock -name "clk" -period 5.0 -waveform {0.0 2.5} [get_ports clk]
group_path -weight 1.000000 -name C2C -from [list \
  [get_cells {H_reg_reg[6]}]  \
  [get_cells {H_reg_reg[7]}]  \
  [get_cells {H_reg_reg[5]}]  \
  [get_cells {M_reg_reg[7]}]  \
  [get_cells {H_reg_reg[1]}]  \
  [get_cells pm_reg_reg]  \
  [get_cells {H_reg_reg[3]}]  \
  [get_cells {H_reg_reg[2]}]  \
  [get_cells {M_reg_reg[3]}]  \
  [get_cells {H_reg_reg[4]}]  \
  [get_cells {M_reg_reg[1]}]  \
  [get_cells {S_reg_reg[5]}]  \
  [get_cells {M_reg_reg[5]}]  \
  [get_cells {M_reg_reg[4]}]  \
  [get_cells {S_reg_reg[7]}]  \
  [get_cells {M_reg_reg[6]}]  \
  [get_cells {H_reg_reg[0]}]  \
  [get_cells {S_reg_reg[3]}]  \
  [get_cells {M_reg_reg[2]}]  \
  [get_cells {S_reg_reg[2]}]  \
  [get_cells {S_reg_reg[4]}]  \
  [get_cells {M_reg_reg[0]}]  \
  [get_cells {S_reg_reg[6]}]  \
  [get_cells {S_reg_reg[1]}]  \
  [get_cells {S_reg_reg[0]}] ] -to [list \
  [get_cells {H_reg_reg[6]}]  \
  [get_cells {H_reg_reg[7]}]  \
  [get_cells {H_reg_reg[5]}]  \
  [get_cells {M_reg_reg[7]}]  \
  [get_cells {H_reg_reg[1]}]  \
  [get_cells pm_reg_reg]  \
  [get_cells {H_reg_reg[3]}]  \
  [get_cells {H_reg_reg[2]}]  \
  [get_cells {M_reg_reg[3]}]  \
  [get_cells {H_reg_reg[4]}]  \
  [get_cells {M_reg_reg[1]}]  \
  [get_cells {S_reg_reg[5]}]  \
  [get_cells {M_reg_reg[5]}]  \
  [get_cells {M_reg_reg[4]}]  \
  [get_cells {S_reg_reg[7]}]  \
  [get_cells {M_reg_reg[6]}]  \
  [get_cells {H_reg_reg[0]}]  \
  [get_cells {S_reg_reg[3]}]  \
  [get_cells {M_reg_reg[2]}]  \
  [get_cells {S_reg_reg[2]}]  \
  [get_cells {S_reg_reg[4]}]  \
  [get_cells {M_reg_reg[0]}]  \
  [get_cells {S_reg_reg[6]}]  \
  [get_cells {S_reg_reg[1]}]  \
  [get_cells {S_reg_reg[0]}] ]
group_path -weight 1.000000 -name C2O -from [list \
  [get_cells {H_reg_reg[6]}]  \
  [get_cells {H_reg_reg[7]}]  \
  [get_cells {H_reg_reg[5]}]  \
  [get_cells {M_reg_reg[7]}]  \
  [get_cells {H_reg_reg[1]}]  \
  [get_cells pm_reg_reg]  \
  [get_cells {H_reg_reg[3]}]  \
  [get_cells {H_reg_reg[2]}]  \
  [get_cells {M_reg_reg[3]}]  \
  [get_cells {H_reg_reg[4]}]  \
  [get_cells {M_reg_reg[1]}]  \
  [get_cells {S_reg_reg[5]}]  \
  [get_cells {M_reg_reg[5]}]  \
  [get_cells {M_reg_reg[4]}]  \
  [get_cells {S_reg_reg[7]}]  \
  [get_cells {M_reg_reg[6]}]  \
  [get_cells {H_reg_reg[0]}]  \
  [get_cells {S_reg_reg[3]}]  \
  [get_cells {M_reg_reg[2]}]  \
  [get_cells {S_reg_reg[2]}]  \
  [get_cells {S_reg_reg[4]}]  \
  [get_cells {M_reg_reg[0]}]  \
  [get_cells {S_reg_reg[6]}]  \
  [get_cells {S_reg_reg[1]}]  \
  [get_cells {S_reg_reg[0]}] ] -to [list \
  [get_ports pm]  \
  [get_ports {hh[7]}]  \
  [get_ports {hh[6]}]  \
  [get_ports {hh[5]}]  \
  [get_ports {hh[4]}]  \
  [get_ports {hh[3]}]  \
  [get_ports {hh[2]}]  \
  [get_ports {hh[1]}]  \
  [get_ports {hh[0]}]  \
  [get_ports {mm[7]}]  \
  [get_ports {mm[6]}]  \
  [get_ports {mm[5]}]  \
  [get_ports {mm[4]}]  \
  [get_ports {mm[3]}]  \
  [get_ports {mm[2]}]  \
  [get_ports {mm[1]}]  \
  [get_ports {mm[0]}]  \
  [get_ports {ss[7]}]  \
  [get_ports {ss[6]}]  \
  [get_ports {ss[5]}]  \
  [get_ports {ss[4]}]  \
  [get_ports {ss[3]}]  \
  [get_ports {ss[2]}]  \
  [get_ports {ss[1]}]  \
  [get_ports {ss[0]}] ]
group_path -weight 1.000000 -name I2C -from [list \
  [get_ports clk]  \
  [get_ports reset]  \
  [get_ports ena] ] -to [list \
  [get_cells {H_reg_reg[6]}]  \
  [get_cells {H_reg_reg[7]}]  \
  [get_cells {H_reg_reg[5]}]  \
  [get_cells {M_reg_reg[7]}]  \
  [get_cells {H_reg_reg[1]}]  \
  [get_cells pm_reg_reg]  \
  [get_cells {H_reg_reg[3]}]  \
  [get_cells {H_reg_reg[2]}]  \
  [get_cells {M_reg_reg[3]}]  \
  [get_cells {H_reg_reg[4]}]  \
  [get_cells {M_reg_reg[1]}]  \
  [get_cells {S_reg_reg[5]}]  \
  [get_cells {M_reg_reg[5]}]  \
  [get_cells {M_reg_reg[4]}]  \
  [get_cells {S_reg_reg[7]}]  \
  [get_cells {M_reg_reg[6]}]  \
  [get_cells {H_reg_reg[0]}]  \
  [get_cells {S_reg_reg[3]}]  \
  [get_cells {M_reg_reg[2]}]  \
  [get_cells {S_reg_reg[2]}]  \
  [get_cells {S_reg_reg[4]}]  \
  [get_cells {M_reg_reg[0]}]  \
  [get_cells {S_reg_reg[6]}]  \
  [get_cells {S_reg_reg[1]}]  \
  [get_cells {S_reg_reg[0]}] ]
group_path -weight 1.000000 -name I2O -from [list \
  [get_ports clk]  \
  [get_ports reset]  \
  [get_ports ena] ] -to [list \
  [get_ports pm]  \
  [get_ports {hh[7]}]  \
  [get_ports {hh[6]}]  \
  [get_ports {hh[5]}]  \
  [get_ports {hh[4]}]  \
  [get_ports {hh[3]}]  \
  [get_ports {hh[2]}]  \
  [get_ports {hh[1]}]  \
  [get_ports {hh[0]}]  \
  [get_ports {mm[7]}]  \
  [get_ports {mm[6]}]  \
  [get_ports {mm[5]}]  \
  [get_ports {mm[4]}]  \
  [get_ports {mm[3]}]  \
  [get_ports {mm[2]}]  \
  [get_ports {mm[1]}]  \
  [get_ports {mm[0]}]  \
  [get_ports {ss[7]}]  \
  [get_ports {ss[6]}]  \
  [get_ports {ss[5]}]  \
  [get_ports {ss[4]}]  \
  [get_ports {ss[3]}]  \
  [get_ports {ss[2]}]  \
  [get_ports {ss[1]}]  \
  [get_ports {ss[0]}] ]
set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
