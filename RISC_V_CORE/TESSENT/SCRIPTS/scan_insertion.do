#----------------------------------------------------------
# Generic Scan Insertion Script for a Single Design
# Compatible with Tessent/DFT tools
# Author: [Your Name]
# Date: [Update Date]
#----------------------------------------------------------

#-------------------[ User Configuration ]------------------

# Path to the synthesized netlist (Verilog)
set NETLIST_PATH "../NETLIST"
set VERILOG_FILE "riscv_core_net.v"      ;# Update with your netlist file
set TOP_MODULE   "riscv_core"            ;# Update with your top module name
set CLK          "clk_i"               ;# Update with your clock signal name

# Output and report directories
set OUT_DIR "${TOP_MODULE}_OUTPUTS"
set RPT_DIR "${TOP_MODULE}_REPORTS"

# Cell library for scan insertion (update path as needed)
set CELL_LIB_PATH "../MDT/test_Nangate.mdt"

#-------------------[ Directory Setup ]---------------------

# Create output and report directories if they don't exist
if { ![file exists $OUT_DIR] } {
    file mkdir $OUT_DIR
    puts "Created output directory: $OUT_DIR"
}
if { ![file exists $RPT_DIR] } {
    file mkdir $RPT_DIR
    puts "Created report directory: $RPT_DIR"
}

#-------------------[ DFT/Scan Setup ]----------------------

# Set context to scan insertion mode
set_context dft -scan

# Read cell library for scan cell mapping
read_cell_library $CELL_LIB_PATH

# Read Verilog netlist for the design
set_design_sources -format verilog -y $NETLIST_PATH -extension v
read_verilog $NETLIST_PATH/$VERILOG_FILE

# Set the current design
set_current_design $TOP_MODULE

# Set design level (chip/block as appropriate)
set_design_level top

# Specify scan enable and clock signals
set_scan_enable scan_enable -single_global_scan_enable on
#set_scan_signals -tclk $CLK -ten scan_en


# Analyze and check for control signals and DFT rule violations
analyze_control_signals -auto
check_design_rules
add_scan_mode -si_connections scan_in -so_connections scan_out
# Set scan insertion options (customize as needed) (optional if already scan ports are in design)
#set_scan_insertion_options \
#   -si_port_format scan_in_%d \
#   -so_port_format scan_out_%d \
 #   -enable_scan_cell_mapping on \
  #  -chain_count 1

# Analyze scan chains and insert scan logic
analyze_scan_chains
insert_test_logic -write_in_tsdb on

#-------------------[ Reporting ]---------------------------

# Generate scan-related reports
report_scan_chains   > ${RPT_DIR}/${TOP_MODULE}_scan_chain.rpt
report_scan_elements > ${RPT_DIR}/${TOP_MODULE}_scan_elements.rpt
report_scan_cells    > ${RPT_DIR}/${TOP_MODULE}_scan_cells.rpt
report_scan_enable   > ${RPT_DIR}/${TOP_MODULE}_scan_enable.rpt

#-------------------[ Output Generation ]-------------------

# Write ATPG setup and core description files
write_atpg_setup         ${OUT_DIR}/${TOP_MODULE}_atpg_setup
write_core_description   ${OUT_DIR}/${TOP_MODULE}_core_description

# Write out the scan-inserted netlist
write_design -output_file ${OUT_DIR}/${TOP_MODULE}_scan.v

#-------------------[ Optional: Visualization ]-------------
# Uncomment the following lines if you want to view the design in the GUI
set_system_mode setup
open_visualizer

#-------------------[ Clean Up ]----------------------------
#delete_design

#-------------------[ END OF SCRIPT ]-----------------------

