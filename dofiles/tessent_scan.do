
set PATH ..
set VERILOG "cntr_16net"
set TOP_MODULE "counter_16bit"
set CLK "clk"
set OUT_DIR  "${PATH}/outputs/${TOP_MODULE}_OUTPUTS"
set RPT_DIR  "${PATH}/reports/${TOP_MODULE}_REPORTS"

if { ![file exists $OUT_DIR] } {
    file mkdir $OUT_DIR
    puts "Created output directory: $OUT_DIR"
}
if { ![file exists $RPT_DIR] } {
    file mkdir $RPT_DIR
    puts "Created report directory: $RPT_DIR"
}

set_context dft -scan
read_cell_library ../TECHFILES/test_Nangate.mdt 
set_design_sources -format verilog -y ../NETLIST -extension v
read_verilog ../NETLIST/${VERILOG}.v
set_current_design
set_design_level chip
set_scan_enable scan_en -single_global_scan_enable on
set_scan_signals -tclk ${CLK} -ten scan_en
analyze_control_signals -auto
check_design_rules
set_scan_insertion_options -si_port_format scan_in_%d -so_port_format scan_out_%d -enable_scan_cell_mapping on -chain_count 1 
analyze_scan_chains
insert_test_logic -write_in_tsdb on
report_scan_chains > ${RPT_DIR}/${TOP_MODULE}_scan_chain.rpt
report_scan_elements > ${RPT_DIR}/${TOP_MODULE}_scan_elements.rpt
report_scan_cells > ${RPT_DIR}/${TOP_MODULE}_scan_cells.rpt
report_scan_enable > ${RPT_DIR}/${TOP_MODULE}_scan_enable.rpt
write_atpg_setup ${OUT_DIR}/${TOP_MODULE}_atpg_setup
write_core_description ${OUT_DIR}/${TOP_MODULE}_cntr_core_description
write_design -output_file ${OUT_DIR}/${TOP_MODULE}_scan.v
set_system_mode setup
open_visualizer

