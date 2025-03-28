###############################################################
# Purpose:  Show a simple Tempus STA script
# Purpose:  Hightlight the order of operations and simple commands
# Author:   John Schritz   Nov 2015
################################################################

################################
# Setup threading and client counts
################################
set DATE [clock format [clock seconds] -format "%b%d-%T"]

################################
# Adjust timer settings
################################
set_delay_cal_mode -siAware true    ;# Turn on SI when true

################################################################
#To dump aggressor info in report_delay_calculation -si command
#################################################################

set_si_mode -enable_delay_report true

##########################################
#enable the glitch reports to be generated
##########################################
set_si_mode -enable_glitch_report true

##########################
#Enable glitch propagation
##########################
set_si_mode -enable_glitch_propagation true
set_global timing_pba_exhaustive_path_nworst_limit 2
set_global timing_path_based_exhaustive_max_paths_limit 1000
#set_global timing_path_based_enable_exhaustive_depth_bounded_by_gba false

###################################
# Run timing
###################################
update_timing -full

###################################
# Run reports
###################################
report_timing
#report_timing -max_paths 9 -retime path_slew_propagation -retime_mode exhaustive -max_slack 0.200 > epba.rpt
report_timing -max_paths 10000000 -retime path_slew_propagation -retime_mode exhaustive -max_slack 0.200 > epba_${DATE}.rpt


###################################
set reportDir reports_${DATE}
file mkdir $reportDir
source ../scripts/reports.tcl

Puts "All done"
###################################
# If in interactive session, return to the Tempus prompt
# If in batch session, return to the Linux prompt
###################################


