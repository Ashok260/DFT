################################################################
# Purpose:  Show a Tempus STA script with Concurrent Views
# Purpose:  Hightlight the order of operations and simple commands
# Author:   John Schritz   Nov 2015
################################################################

################################
# Setup threading and client counts
################################
#set_distribute_host -local
set_multi_cpu_usage -localCpu 16
set timing_disable_invalid_clock_check true

################################
# Setup some global variables or report settings
################################
set_table_style -no_frame_fix_width -nosplit
################################
# Load multiple scenario definitions
# Define the libraries to use for each view
# Define the constraints to use for each view
################################
read_view_definition ../scripts/viewDefinition_8.tcl

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
# Load netlist parasitics for each corner
################################
read_spef -rc_corner corner_worst_RCMAX "../../design/SPEF/corner_worst_RCMAX.spef.gz"
read_spef -rc_corner corner_worst_RCMIN "../../design/SPEF/corner_worst_RCMIN.spef.gz"

################################
# Optionally add the timing derates here if you have them
################################
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -data  -early 0.82
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -data  -late  1.01
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -clock -early 0.9
set_timing_derate -delay_corner delay_corner_slow_RCMAX -cell_delay -clock -late  1.1
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -data  -early 0.82
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -data  -late  1.01
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -clock -early 0.9
set_timing_derate -delay_corner delay_corner_slow_RCMAX -net_delay  -clock -late  1.1

################################
# Adjust timer settings
################################
set_delay_cal_mode -SIAware true   ;# Turn on SI when true

##########################################
#enable the glitch reports to be generated
##########################################
set_si_mode -enable_glitch_report true

##########################
#Enable glitch propagation
##########################
set_si_mode -enable_glitch_propagation true

################################
# Calculate the timing results
################################
update_timing -full
###################################
# Run a whole list of reports
###################################
set reportDir reports
file mkdir $reportDir
source ../scripts/reports.tcl

###################################
# Save the design and timing information
###################################
save_design 8view_sta.session -overwrite

###################################
# Print final runtime and memory messages
###################################
report_resource

Puts "All done"
###################################
# If this is an interactive session, return to the Tempus prompt
# If this is a batch session, exit Tempus
###################################
exit

