#-----------------------------------------------
# Tessent MBIST Do File for SRAM Design
# Date: June 26, 2025
#-----------------------------------------------

# Set the context to DFT (Design-for-Test) RTL mode
set_context dft -rtl

# Read the cell library (ATPG library for slow corner)
read_cell_library ../mdt/slow.atpglib

# Read the main SRAM Verilog netlist
read_verilog ../Netlist/sram_sp_16384d_36w_16m_8b.v

# Read the interface-only Verilog for the memory macro (external memory IP)
read_verilog /jk/SCLPDK_V3.0_KIT/scl180/memory/spram/6M1L/SPRAM_8192x36/SPRAM_8192x36.v -interface_only

# Read the memory core description file (for MBIST insertion)
read_core_descriptions ../memlibs/SPRAM_8192x36.memlib

# Set the simulation library sources (for gate-level simulation)
set_simulation_library_sources -v /home/01fe21bec223/DFT/DFT/slow.v

# Set the current design to the SRAM top module
set_current_design sram_sp_16384d_36w_16m_8b

# Set the design level to physical block (required for MBIST flow)
set_design_level physical_block
set_design_level physical_block  ;# (Repeated, but harmless)

# Enable memory test (MBIST) in the DFT specification requirements
set_dft_specification_requirements -memory_test on

# Define the clock(s) for the design (10ns period for CLK)
add_clocks CLK -period 10ns

# Check design rules for DFT and MBIST readiness
check_design_rules

# Create DFT specification object and store in variable 'spec'
set spec [create_dft_specification]

# Generate a report of the current configuration data
report_config_data

# Process the DFT specification (MBIST logic insertion, etc.)
process_dft_specification

# Extract ICL (Instance Connection List), needed for pattern generation
extract_icl

# Create pattern specification for MBIST
create_patterns_specification

# Process the patterns specification (generate test patterns)
process_patterns_specification

# Run testbench simulations with Questa, using all available CPUs, and store waveforms
run_testbench_simulations -simulator questa -parallel_simulations maxcpu -store_simulation_waveforms on

# Check the results of the testbench simulations
check_testbench_simulations

# Run synthesis (if required at this stage)
run_synthesis

# Report MBIST summary (memory DFT summary)
report_memory_dft_summary

# Final check of testbench simulations
check_testbench_simulations

#-----------------------------------------------
# End of Tessent MBIST Do File
#-----------------------------------------------

