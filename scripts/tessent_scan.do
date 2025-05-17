# Define the path to netlists
set PATH "../run/NETLIST"

# Define the top-level directory for outputs and reports
set BASE_OUT_DIR "../run/outputs"
set BASE_RPT_DIR "../run/reports"

# List of netlists and corresponding top modules
# Format: list of pairs {verilog_file top_module clk}
set designs {
    {"axi4lscope_opt" "axi4lscope" "S_AXI_ACLK"}
    {"wbscopc_opt" "wbscopc" "i_wb_clk"}
    {"wbscope_opt" "wbscope" "i_wb_clk"}
}

# Loop through each design
foreach design $designs {
    set VERILOG [lindex $design 0]
    set TOP_MODULE [lindex $design 1]
    set OUT_DIR "${BASE_OUT_DIR}/${TOP_MODULE}_OUTPUTS"
    set RPT_DIR "${BASE_RPT_DIR}/${TOP_MODULE}_REPORTS"
    set CLK [lindex $design 2]" ;# Change if necessary for each design

    if { ![file exists $OUT_DIR] } {
        file mkdir $OUT_DIR
        puts "Created output directory: $OUT_DIR"
    }
    if { ![file exists $RPT_DIR] } {
        file mkdir $RPT_DIR
        puts "Created report directory: $RPT_DIR"
    }

    # Design and scan setup
    set_context dft -scan
    read_cell_library ../TECHFILES/test_Nangate.mdt 
    set_design_sources -format verilog -y $PATH -extension v
    read_verilog $PATH/${VERILOG}.v
    set_current_design
    set_design_level chip
    set_scan_enable scan_en -single_global_scan_enable on
    set_scan_signals -tclk ${CLK} -ten scan_en
    analyze_control_signals -auto
    check_design_rules
    set_scan_insertion_options -si_port_format scan_in_%d -so_port_format scan_out_%d -enable_scan_cell_mapping on -chain_count 1 
    analyze_scan_chains
    insert_test_logic -write_in_tsdb on

    # Reporting
    report_scan_chains    > ${RPT_DIR}/${TOP_MODULE}_scan_chain.rpt
    report_scan_elements  > ${RPT_DIR}/${TOP_MODULE}_scan_elements.rpt
    report_scan_cells     > ${RPT_DIR}/${TOP_MODULE}_scan_cells.rpt
    report_scan_enable    > ${RPT_DIR}/${TOP_MODULE}_scan_enable.rpt

    # Output netlist and setup
    write_atpg_setup ${OUT_DIR}/${TOP_MODULE}_atpg_setup
    write_core_description ${OUT_DIR}/${TOP_MODULE}_cntr_core_description
    write_design -output_file ${OUT_DIR}/${TOP_MODULE}_scan.v

    # Optional visualization
    set_system_mode setup
    delete_design
    # open_visualizer ;# Comment out if running headless
}
