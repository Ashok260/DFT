set VERILOG "tessent_mcrb_scan_inserted_netlist"
set TOP_MODULE "mcrb"
set CLK "mc_rb_ef1_sclk_i"

set PATH ..


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


set_context patterns -scan
read_verilog ${PATH}/inputs/netlist/${VERILOG}.v
read_cell_library ${PATH}/inputs/MDT/test_Nangate.mdt 
set_current_design ${TOP_MODULE}

// add clocks and scan groups 
add_clocks 0 ${CLK}
// add_scan_groups group1 scan1.spf.proc
// add_scan_chains 1 group1 ts_si ts_so



set_system_mode analysis
set_fault_type stuck
add_faults -all
create_patterns

write_patterns ${PATH}/outputs/${TOP_MODULE}_OUTPUTS/tessent_patterns_parallel.ascii -ascii -parallel -replace
write_patterns ${PATH}/outputs/${TOP_MODULE}_OUTPUTS/tessent_patterns_parallel.v -verilog -parallel -replace
write_patterns ${PATH}/outputs/${TOP_MODULE}_OUTPUTS/tessent_patterns_serial.v -verilog -serial -replace

report_patterns         > ${PATH}/reports/${TOP_MODULE}_REPORTS/tessent_patterns.rpt
report_faults           > ${PATH}/reports/${TOP_MODULE}_REPORTS/tessent_faults.rpt
report_faults -class DS > ${PATH}/reports/${TOP_MODULE}_REPORTS/tessent_faults_DS.rpt