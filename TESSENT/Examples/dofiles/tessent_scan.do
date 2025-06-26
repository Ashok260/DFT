set_context dft -scan
read_cell_library ../TECHFILES/test_Nangate.mdt 
set_design_sources -format verilog -y ../NETLIST -extension v
read_verilog ../NETLIST/cntr_16net.v
set_current_design
set_design_level chip
set_scan_enable scan_en -single_global_scan_enable on
set_test_logic -clock on -set on -reset on
analyze_control_signals -auto
check_design_rules
set_scan_insertion_options -si_port_format scan_in_%d -so_port_format scan_out_%d -enable_scan_cell_mapping on -chain_count 1 
analyze_scan_chains
insert_test_logic -write_in_tsdb on
report_scan_chains > cntr_scan_chain.rpt
report_scan_elements > cntr_scan_elements.rpt
report_scan_cells > cntr_scan_cells.rpt
report_scan_enable > cntr_scan_enable.rpt
write_atpg_setup atpg_setup
write_core_description cntr_core_description
write_design -output_file cntr_16bit_scan.v
set_system_mode setup
open_visualizer

