################################################################
# Purpose:  Show Tempus DSTA setup as simple as possible
# Purpose:  Hightlight the order of operations and simple commands
# Author:   John Schritz/Krishna Atreya   Sept 2015
################################################################

################################
# Setup threading and client counts
################################
set_multi_cpu_usage -localCpu 8 -cpuPerRemoteHost 1  -remoteHost 3

################################
# Setup and start clients
################################
set_distribute_host -timeout 300 -local
#set_distribute_host -timeout 300 -lsf -queue lnx64
distribute_start_clients

################################
# Setup some global variables or report settings
################################
set_table_style -no_frame_fix_width -nosplit

################################
# Load design, but no constraints yet
################################
# Read one library
read_lib     ../../libs/liberty/FreePDK45_lib_v1.0_worst.lib
# Read another library
read_lib     ../../libs/MACRO/LIBERTY/pllclk.lib
# Read two libraries at once
read_lib     ../../libs/MACRO/LIBERTY/ram_256x16A.lib   ../../libs/MACRO/LIBERTY/rom_512x16A.lib
# Read the netlist in a gzipped format
read_verilog ../../design/dtmf_recvr_core.v.gz

set_top_module dtmf_recvr_core

################################
# Load parasitics before distribute_partition
################################
read_spef  ../../design/SPEF/corner_worst_CMAX.spef.gz

################################
# Put the clients to work
################################
distribute_partition

################################
# Add constraints after distribute_partition
################################
read_sdc ../../design/dtmf_recvr_core.pr.sdc

################################
# Turn on SI
################################
set_delay_cal_mode -siAware true

#########################################
#enable the glitch reports to be generated
##########################################
set_si_mode -enable_glitch_report true

##########################
#Enable glitch propagation
##########################
set_si_mode -enable_glitch_propagation true

################################
# Check how big the tescase is
################################
set cellCnt [sizeof_collection [get_cells -hier *]]
puts "Your design has: $cellCnt instances"

###################################
# Run timing
###################################
update_timing -full

###################################
# Run reports
###################################
report_timing 
###################################
# Run a whole list of reports
###################################
source ../scripts_smsc/reports.tcl
################################
# Print stats for runtime, memory
################################
dist_print_client_usage   ; # Report runtime and memory for each client
dist_print_usage          ; # Report runtime and memory for the master
puts "All done"
exit
