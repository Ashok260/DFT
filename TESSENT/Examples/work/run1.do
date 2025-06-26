set_context dft -scan
read_verilog ../NETLIST/counter_opt.v
read_cell_library ../TECHFILES/test_Nangate.mdt
set_current_design 
analyze_control_signals -auto
check_design_rules
analyze_scan_chains
insert_test_logic
report_scan_elements > ../output/counter_lfsr_scan_elements.txt
report_scan_chains > ../output/counter_lfsr_scan_chains.txt
report_scan_cells > ../output/counter_lfsr_scan_cells.txt
report_scan_enable > ../output/counter_lfsr_scan_enable.txt
write_design -output_file ../output/counter_lfsr_tessent_scan_net.v -replace
set_system_mode setup

