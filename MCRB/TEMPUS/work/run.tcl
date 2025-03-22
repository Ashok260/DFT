set DATE [clock format [clock seconds] -format "%b%d-%T"]
#Setting Top module
set TOP_MODULE "mcrb"

#Creating report directory
mkdir REPORTS_${DATE}

#Reading of libraries
read_lib /home/01fe21bec223/DFT/MCRB/TEMPUS/TECHFILES/NangateOpenCellLibrary_slow_conditional_ccs.lib

#Don't put input delay for all the ports
set_global timing_apply_default_primary_input_assertion false

#Reading of netlist
read_verilog /home/01fe21bec223/DFT/MCRB/TEMPUS/NETLIST/mcrb_opt.v

set_top_module $TOP_MODULE

#Reading constraints
read_sdc /home/01fe21bec223/DFT/MCRB/TEMPUS/SDC/mcrb_m.sdc

#Reporting
report_clock_timing -type summary > ./REPORTS_${DATE}/clock_summary.rpt
set_global report_timing_format {hpin cell arc slew load delay arrival}
check_timing -verbose -type {loops inputs endpoints clocks constant_collision clock_gating_inferred clock_clipping} -include_warning clocks_masked_by_another_clock > ./REPORTS_${DATE}/check_timing_verbose.rpt
check_timing -check_only {clock_crossing} -verbose > ./REPORTS_${DATE}/clock_crossings.rpt
report_clocks -groups > ./REPORTS_${DATE}/report_clock_groups.rpt
report_constraint -all_violators > ./REPORTS_${DATE}/report_allViolators.rpt
