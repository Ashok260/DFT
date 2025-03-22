# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Tue Mar 11 17:39:38 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design mcrb

create_clock -name "sclk" -period 1 [get_ports mc_rb_ef1_sclk_i]
group_path -weight 1.000000 -name C2C -from [list \
  [get_cells {skew_addr_cntr_reg[4]}]  \
  [get_cells {skew_addr_cntr_reg[3]}]  \
  [get_cells {skew_addr_cntr_reg[1]}]  \
  [get_cells {skew_addr_cntr_reg[2]}]  \
  [get_cells {skew_addr_cntr_reg[0]}]  \
  [get_cells mc_rb_fuse_vld_q_reg] ] -to [list \
  [get_cells {skew_addr_cntr_reg[4]}]  \
  [get_cells {skew_addr_cntr_reg[3]}]  \
  [get_cells {skew_addr_cntr_reg[1]}]  \
  [get_cells {skew_addr_cntr_reg[2]}]  \
  [get_cells {skew_addr_cntr_reg[0]}]  \
  [get_cells mc_rb_fuse_vld_q_reg] ]
group_path -weight 1.000000 -name C2O -from [list \
  [get_cells {skew_addr_cntr_reg[4]}]  \
  [get_cells {skew_addr_cntr_reg[3]}]  \
  [get_cells {skew_addr_cntr_reg[1]}]  \
  [get_cells {skew_addr_cntr_reg[2]}]  \
  [get_cells {skew_addr_cntr_reg[0]}]  \
  [get_cells mc_rb_fuse_vld_q_reg] ] -to [list \
  [get_ports {skew_addr_cntr_o[4]}]  \
  [get_ports {skew_addr_cntr_o[3]}]  \
  [get_ports {skew_addr_cntr_o[2]}]  \
  [get_ports {skew_addr_cntr_o[1]}]  \
  [get_ports {skew_addr_cntr_o[0]}] ]
group_path -weight 1.000000 -name I2C -from [list \
  [get_ports mc_rb_ef1_svld_i]  \
  [get_ports gctl_rclk_orst_n_i]  \
  [get_ports mc_rb_fuse_vld_i]  \
  [get_ports mc_rb_ef1_sclk_i] ] -to [list \
  [get_cells {skew_addr_cntr_reg[4]}]  \
  [get_cells {skew_addr_cntr_reg[3]}]  \
  [get_cells {skew_addr_cntr_reg[1]}]  \
  [get_cells {skew_addr_cntr_reg[2]}]  \
  [get_cells {skew_addr_cntr_reg[0]}]  \
  [get_cells mc_rb_fuse_vld_q_reg] ]
group_path -weight 1.000000 -name I2O -from [list \
  [get_ports mc_rb_ef1_svld_i]  \
  [get_ports gctl_rclk_orst_n_i]  \
  [get_ports mc_rb_fuse_vld_i]  \
  [get_ports mc_rb_ef1_sclk_i] ] -to [list \
  [get_ports {skew_addr_cntr_o[4]}]  \
  [get_ports {skew_addr_cntr_o[3]}]  \
  [get_ports {skew_addr_cntr_o[2]}]  \
  [get_ports {skew_addr_cntr_o[1]}]  \
  [get_ports {skew_addr_cntr_o[0]}] ]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks sclk] -add_delay 0.5 [get_ports mc_rb_ef1_svld_i]
set_input_delay -clock [get_clocks sclk] -add_delay 0.5 [get_ports gctl_rclk_orst_n_i]
set_input_delay -clock [get_clocks sclk] -add_delay 0.5 [get_ports mc_rb_fuse_vld_i]
set_output_delay -clock [get_clocks sclk] -add_delay 0.5 [get_ports {skew_addr_cntr_o[4]}]
set_output_delay -clock [get_clocks sclk] -add_delay 0.5 [get_ports {skew_addr_cntr_o[3]}]
set_output_delay -clock [get_clocks sclk] -add_delay 0.5 [get_ports {skew_addr_cntr_o[2]}]
set_output_delay -clock [get_clocks sclk] -add_delay 0.5 [get_ports {skew_addr_cntr_o[1]}]
set_output_delay -clock [get_clocks sclk] -add_delay 0.5 [get_ports {skew_addr_cntr_o[0]}]
set_wire_load_mode "enclosed"
