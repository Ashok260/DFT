# This dofile contains a sequence of Tessent Shell commands for Automatic Test Pattern Generation (ATPG).
# It covers setup, fault analysis, pattern generation, and simulation.

# --- File and Design Setup ---
# Set the name of this dofile for internal use.
set dofileName atpg_setup.dofile
# Specify the gate-level design file for ATPG.
set designFile /home/01fe21bec223/DFT_TESSENT/TESSENT/work_atpg/tsdb_outdir/dft_inserted_designs/counter_16bit_gate.dft_inserted_design/counter_16bit.vg
# Define the top-level module name of the design.
set topName {counter_16bit}
# Specify the path to the cell library (MDT file) used by the design.
set libName "../TECHFILES/test_Nangate.mdt"

# --- Procedure Definitions (as found in user input, content not provided) ---
# Define a procedure to verify all scan modes.
proc verify_all_scan_modes {} {
    # Set the context for pattern operations, specifically for scan patterns.
    set_context patterns -scan
    # Delete the current design in memory to start fresh.
    delete_design
    # Read the specified cell library into Tessent.
    read_cell_library $libName
    # Read the Verilog design file.
    read_verilog $designFile
    # Set the top-level design for operations.
    set_current_design $topName
    # Execute another dofile (this dofile itself, or a nested one).
    dofile $dofileName
}

# Tessent Scan Common procedure (declaration only, body not provided).
proc tessent_scan_common {} {
    # Placeholder for tessent_scan_common implementation
}

# Tessent Scan Unwrapped Mode procedure (declaration only, body not provided).
proc tessent_scan_unwrapped_mode {} {
    # Placeholder for tessent_scan_unwrapped_mode implementation
}

# Tessent Scan Setup procedure with an optional mode argument (declaration only, body not provided).
proc tessent_scan_setup { {mode unwrapped} } {
    # Placeholder for tessent_scan_setup implementation
}

# --- ATPG Setup and Analysis ---
# Call the verification procedure for scan modes.
verify_all_scan_modes
# Set the system mode to 'setup' for design configuration.
sub-command: set_system_mode setup
# Reset the current design state.
sub-command: reset_design
# Add a scan group named 'grp1' and associate it with the test procedure file.
sub-command: add_scan_groups grp1 atpg_setup.testproc
# Add a scan chain named 'chain' within 'grp1', specifying its scan-in and scan-out pins.
sub-command: add_scan_chains chain grp1 /scan_in_0 /scan_out_0
# Add a clock definition for 'rst' (reset) with a clock value of 1.
sub-command: add_clocks 1 rst
# Add a clock definition for 'clk' (clock) with a clock value of 0.
sub-command: add_clocks 0 clk
# Turn off Embedded Deterministic Test (EDT) options.
sub-command: set_edt_options off
# Automatically identify and add black boxes in the design.
sub-command: add_black_boxes -auto
# Set the system mode to 'analysis' for design analysis and verification.
sub-command: set_system_mode analysis
# Report details about the scan cells in the design.
sub-command: report_scan_cells

# --- Fault Management and Pattern Generation ---
# Add all detectable faults to the fault list.
command: add_faults -all
# Display help information for the 'create_patterns' command.
command: help create_patterns
# Display help information for 'create_patterns' with specific options.
command: help create_patterns -COMpaction_effort High -COVerage_effort High -NO_REDundancy_analysis
# Display help information for 'create_patterns' with a specific option state.
command: help create_patterns -COMpaction_effort High -COVerage_effort High -NO_REDundancy_analysis on
# Create ATPG patterns with high compaction and coverage effort, and disable redundancy analysis.
command: create_patterns -COMpaction_effort High -COVerage_effort High -NO_REDundancy_analysis
# Report current ATPG statistics (e.g., fault coverage).
command: report_statistics
# Reset all uncallable (AU) faults, marking them for potential re-testing.
command: reset_au_faults
# Report statistics again after resetting AU faults.
command: report_statistics
# Create ATPG patterns with default settings.
command: create_patterns
# Reset all uncallable (AU) faults again.
command: reset_au_faults
# Create ATPG patterns again.
command: create_patterns
# Add all detectable faults to the fault list (useful if some were dropped or new ones were identified).
command: add_faults -all
# Create ATPG patterns.
command: create_patterns
# Compress the generated ATPG patterns to reduce pattern count.
command: compress_patterns

# --- Simulation and Pattern Output ---
# Run testbench simulations to verify patterns against the design.
command: run_testbench_simulations
# Write the generated patterns to an ASCII file named 'pat.ascii' in parallel format, replacing if exists.
command: write_patterns pat.ascii -ascii -parallel -replace
# Read the patterns back from the 'pat.ascii' file.
command: read_patterns pat.ascii
# Run testbench simulations with the read patterns.
command: run_testbench_simulations
# Simulate the patterns against the fault list.
command: simulate_patterns
# Add all faults to the fault list (ensuring all faults are considered for simulation).
command: add_faults -all
# Simulate patterns again.
command: simulate_patterns
# Report statistics after simulation.
command: report_statistics
# Report information about the current simulation contexts.
command: report_simulation_contexts
# Report on design rule check (DRC) rules.
command: report_drc_rules

# --- Miscellaneous Commands (as found in user input) ---
# Attempt to run a command named TestKompress (likely a typo or custom command).
command: TestKompress
# Attempt to run a command named Testcompress (likely a typo or custom command).
command: Testcompress
# Get the handling policy for DRC rule D5.
command: get_drc_handling D5
# Get the handling policy for DRC rule D5 and enable auto-fix if applicable.
command: get_drc_handling D5 -auto_fix
# Command 'encoding' (context unclear without more info, possibly for pattern encoding settings).
command: encoding
# Write a script for importing the design.
command: write_design_import_script
# Command 'scan' (context unclear, possibly initiating a scan chain check or operation).
command: scan
# Launch the 'vim' text editor (likely an external command).
command: vim
# Help for a misspelled command 'helpcompress_patterns'.
command: helpcompress_patterns
# Get help for the 'compress_patterns' command.
command: help compress_patterns
# Compress patterns with specific options: reset uncallable faults and apply muxed Essential compression.
command: compress_patterns -Reset_au -muxed Essential
# Compress patterns with reset uncallable faults and default muxed compression.
command: compress_patterns -Reset_au -muxed
# Compress patterns with reset uncallable faults and default muxed compression (case variation).
command: compress_patterns -Reset_au -Muxed
# Compress patterns with reset uncallable faults.
command: compress_patterns -Reset_au
# Exit the Tessent Shell.
command: exit

