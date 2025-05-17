//////////////////////////////////////////////////////////////
// Tessent ATPG DO-File
// ------------------------------------------------------------
// This script:
//   • Sets up directory structure
//   • Reads in netlist & library
//   • Configures scan & clock
//   • Generates stuck‑at fault patterns
//   • Writes pattern files & reports
//////////////////////////////////////////////////////////////

// 1) User‑Configurable Parameters
set VERILOG     "tessent_mcrb_scan_inserted_netlist"   // netlist file name (no “.v”)
set TOP_MODULE  "mcrb"                                 // top‑level design block
set CLK         "mc_rb_ef1_sclk_i"                    // primary scan clock pin
set PATH        ..                                     // base project path


// 2) Output & Report Directories
// Define module‑specific output folders and create if missing
set OUT_DIR  "${PATH}/outputs/${TOP_MODULE}_OUTPUTS"
set RPT_DIR  "${PATH}/reports/${TOP_MODULE}_REPORTS"

if { ![file exists $OUT_DIR] } {
    file mkdir $OUT_DIR
    puts "// Created output directory: $OUT_DIR"
}
if { ![file exists $RPT_DIR] } {
    file mkdir $RPT_DIR
    puts "// Created report directory: $RPT_DIR"
}


// 3) Read Design & Library
set_context patterns -scan
read_verilog       ${PATH}/inputs/netlist/${VERILOG}.v
read_cell_library  ${PATH}/inputs/MDT/test_Nangate.mdt 
set_current_design ${TOP_MODULE}


// 4) Clock & Scan Configuration
// Add primary clock for scan capture/shift
add_clocks 0 ${CLK}

// (Uncomment/edit below for custom scan groups/chains)
// add_scan_groups  group1 scan1.spf.proc
// add_scan_chains  1 group1 ts_si ts_so


// 5) ATPG Mode & Fault List
set_system_mode analysis     // analysis = generate patterns only
set_fault_type  stuck        // stuck‑at faults
add_faults      -all         // insert every possible stuck‑at fault
create_patterns               // run ATPG


// 6) Write Out Patterns
// Parallel ASCII patterns (replace existing)
write_patterns ${OUT_DIR}/tessent_patterns_parallel.ascii -ascii -parallel -replace

// Parallel Verilog patterns
write_patterns ${OUT_DIR}/tessent_patterns_parallel.v -verilog -parallel -replace

// Serial Verilog patterns
write_patterns ${OUT_DIR}/tessent_patterns_serial.v -verilog -serial   -replace


// 7) Generate Reports
// Summary of pattern statistics
report_patterns         > ${RPT_DIR}/tessent_patterns.rpt

// Detailed fault listing
report_faults           > ${RPT_DIR}/tessent_faults.rpt

// Fault listing filtered by detection status “DS”
report_faults -class DS > ${RPT_DIR}/tessent_faults_DS.rpt

//////////////////////////////////////////////////////////////
// End of DO‑File
//////////////////////////////////////////////////////////////