################################################################
# Purpose:  Show a simple Tempus STA script
# Purpose:  Hightlight the order of operations and simple commands
# Author:   John Schritz   Nov 2015
################################################################

################################
# Setup threading and client counts
################################
set_multi_cpu_usage -localCpu 8

################################
# Setup some global variables or report settings
################################
set_table_style -no_frame_fix_width -nosplit

################################
# Read the libraries
################################
read_lib     ../../libs/liberty/FreePDK45_lib_v1.0_worst.lib
read_lib     ../../libs/MACRO/LIBERTY/pllclk.lib
read_lib     ../../libs/MACRO/LIBERTY/ram_256x16A.lib   ../../libs/MACRO/LIBERTY/rom_512x16A.lib

################################
# Read the netlist in a gzipped format
################################
read_verilog "../../design/ECO_INIT_11_optSetup.enc.dat/dtmf_recvr_core.v.gz" ; # 8269 instances

################################
# Link the design
################################
set_top_module dtmf_recvr_core -ignore_undefined_cell

################################
# Check the size of the testcase
################################
set cellCnt [sizeof_collection [get_cells -hier *]]
puts "Your design has: $cellCnt instances"

################################
# Load netlist parasitics
################################
read_spef  ../../design/SPEF/corner_worst_CMAX.spef.gz

################################
# Add constraints
################################
read_sdc ../../design/dtmf_recvr_core.pr.sdc

################################
# Adjust timer settings
################################
set_delay_cal_mode -siAware true    ;# Turn on SI when true

#########################################
#To dump aggressor info in RDC report
#########################################
set_si_mode -enable_delay_report true

##########################################
#enable the glitch reports to be generated
##########################################
set_si_mode -enable_glitch_report true

##########################
#Enable glitch propagation
##########################
set_si_mode -enable_glitch_propagation true

###################################
update_timing -full

###################################
# Run reports
###################################
report_timing 

###################################
# Run a whole list of common reports
###################################
set reportDir reports
file mkdir $reportDir
source ../scripts/reports.tcl


Puts "All done"
###################################
# If in interactive session, return to the Tempus prompt
# If in batch session, return to the Linux prompt
###################################
exit

