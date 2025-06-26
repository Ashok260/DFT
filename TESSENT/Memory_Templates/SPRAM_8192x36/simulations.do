#-----------------------------------------------------------
# This file created by : memlibCertify
#     Software version : 2022.4
#           Created on : 06/03/25 16:55:40
#-----------------------------------------------------------

# --
# -- Simulation 
# --
set_context patterns -ijtag
set design_name memlibc_memory_bist_assembly
set_simulation_library_sources -v /jk/SCLPDK_V3.0_KIT/scl180/memory/spram/6M1L/SPRAM_8192x36/SPRAM_8192x36.v -f ../VerilogOptions 
# Add the following run_testbench_simulations option(s) to capture
# the simulation waveforms:
#  -store_simulation_waveforms on
# If using the Questa simulator, the debug database can be
# generated using the following option:
#  -simulator_options -debugDB


set sim_options ""
if { [file exists SimOptions] } {
  if { [file readable SimOptions] } {
    set f [open SimOptions r]
    set sim_options [read $f]
    close $f
  }
}
run_testbench_simulations -design_name ${design_name} -design_id rtl {*}$sim_options
check_testbench_simulations -report -design_name ${design_name} -design_id rtl 
exit
