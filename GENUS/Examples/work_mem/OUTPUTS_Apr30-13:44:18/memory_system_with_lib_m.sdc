# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Wed Apr 30 13:44:22 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design memory_system_with_lib

create_clock -name "clk" -period 5.0 -waveform {0.0 2.5} [get_ports clk]
group_path -weight 1.000000 -name C2C -from [list \
  [get_cells mem0/my_sram]  \
  [get_cells mem1/my_sram]  \
  [get_cells mem2/my_sram]  \
  [get_cells mem3/my_sram]  \
  [get_cells mem4/my_sram]  \
  [get_cells mem5/my_sram]  \
  [get_cells mem6/my_sram]  \
  [get_cells mem7/my_sram] ] -to [list \
  [get_cells mem0/my_sram]  \
  [get_cells mem1/my_sram]  \
  [get_cells mem2/my_sram]  \
  [get_cells mem3/my_sram]  \
  [get_cells mem4/my_sram]  \
  [get_cells mem5/my_sram]  \
  [get_cells mem6/my_sram]  \
  [get_cells mem7/my_sram] ]
group_path -weight 1.000000 -name C2O -from [list \
  [get_cells mem0/my_sram]  \
  [get_cells mem1/my_sram]  \
  [get_cells mem2/my_sram]  \
  [get_cells mem3/my_sram]  \
  [get_cells mem4/my_sram]  \
  [get_cells mem5/my_sram]  \
  [get_cells mem6/my_sram]  \
  [get_cells mem7/my_sram] ] -to [list \
  [get_ports {dout[15]}]  \
  [get_ports {dout[14]}]  \
  [get_ports {dout[13]}]  \
  [get_ports {dout[12]}]  \
  [get_ports {dout[11]}]  \
  [get_ports {dout[10]}]  \
  [get_ports {dout[9]}]  \
  [get_ports {dout[8]}]  \
  [get_ports {dout[7]}]  \
  [get_ports {dout[6]}]  \
  [get_ports {dout[5]}]  \
  [get_ports {dout[4]}]  \
  [get_ports {dout[3]}]  \
  [get_ports {dout[2]}]  \
  [get_ports {dout[1]}]  \
  [get_ports {dout[0]}] ]
group_path -weight 1.000000 -name I2C -from [list \
  [get_ports clk]  \
  [get_ports rst]  \
  [get_ports {mem_select[2]}]  \
  [get_ports {mem_select[1]}]  \
  [get_ports {mem_select[0]}]  \
  [get_ports we]  \
  [get_ports {addr[3]}]  \
  [get_ports {addr[2]}]  \
  [get_ports {addr[1]}]  \
  [get_ports {addr[0]}]  \
  [get_ports {din[15]}]  \
  [get_ports {din[14]}]  \
  [get_ports {din[13]}]  \
  [get_ports {din[12]}]  \
  [get_ports {din[11]}]  \
  [get_ports {din[10]}]  \
  [get_ports {din[9]}]  \
  [get_ports {din[8]}]  \
  [get_ports {din[7]}]  \
  [get_ports {din[6]}]  \
  [get_ports {din[5]}]  \
  [get_ports {din[4]}]  \
  [get_ports {din[3]}]  \
  [get_ports {din[2]}]  \
  [get_ports {din[1]}]  \
  [get_ports {din[0]}] ] -to [list \
  [get_cells mem0/my_sram]  \
  [get_cells mem1/my_sram]  \
  [get_cells mem2/my_sram]  \
  [get_cells mem3/my_sram]  \
  [get_cells mem4/my_sram]  \
  [get_cells mem5/my_sram]  \
  [get_cells mem6/my_sram]  \
  [get_cells mem7/my_sram] ]
group_path -weight 1.000000 -name I2O -from [list \
  [get_ports clk]  \
  [get_ports rst]  \
  [get_ports {mem_select[2]}]  \
  [get_ports {mem_select[1]}]  \
  [get_ports {mem_select[0]}]  \
  [get_ports we]  \
  [get_ports {addr[3]}]  \
  [get_ports {addr[2]}]  \
  [get_ports {addr[1]}]  \
  [get_ports {addr[0]}]  \
  [get_ports {din[15]}]  \
  [get_ports {din[14]}]  \
  [get_ports {din[13]}]  \
  [get_ports {din[12]}]  \
  [get_ports {din[11]}]  \
  [get_ports {din[10]}]  \
  [get_ports {din[9]}]  \
  [get_ports {din[8]}]  \
  [get_ports {din[7]}]  \
  [get_ports {din[6]}]  \
  [get_ports {din[5]}]  \
  [get_ports {din[4]}]  \
  [get_ports {din[3]}]  \
  [get_ports {din[2]}]  \
  [get_ports {din[1]}]  \
  [get_ports {din[0]}] ] -to [list \
  [get_ports {dout[15]}]  \
  [get_ports {dout[14]}]  \
  [get_ports {dout[13]}]  \
  [get_ports {dout[12]}]  \
  [get_ports {dout[11]}]  \
  [get_ports {dout[10]}]  \
  [get_ports {dout[9]}]  \
  [get_ports {dout[8]}]  \
  [get_ports {dout[7]}]  \
  [get_ports {dout[6]}]  \
  [get_ports {dout[5]}]  \
  [get_ports {dout[4]}]  \
  [get_ports {dout[3]}]  \
  [get_ports {dout[2]}]  \
  [get_ports {dout[1]}]  \
  [get_ports {dout[0]}] ]
set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
