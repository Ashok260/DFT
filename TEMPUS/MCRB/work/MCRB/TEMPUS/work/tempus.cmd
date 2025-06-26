#######################################################
#                                                     
#  Tempus Timing Signoff Solution Command Logging File                     
#  Created on Tue Mar 11 18:17:51 2025                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Signoff Solution v20.20-p001_1 (64bit) 12/02/2020 16:07 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.20-p001_1 NR200917-0125/MT (database version 18.20.530) {superthreading v2.11}
#@(#)CDS: AAE 20.20-p005 (64bit) 12/02/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.20-p010_1 () Dec  2 2020 14:35:30 ( )
#@(#)CDS: SYNTECH 20.20-p001_1 () Nov 24 2020 02:28:20 ( )
#@(#)CDS: CPE v20.20-p009

read_lib /home/01fe21bec223/DFT/MCRB/TEMPUS/TECHFILES/NangateOpenCellLibrary_slow_conditional_ccs.lib
set_global timing_apply_default_primary_input_assertion false
read_verilog /home/01fe21bec223/DFT/MCRB/TEMPUS/NETLIST/mcrb_opt.v
set_top_module mcrb
read_sdc /home/01fe21bec223/DFT/MCRB/TEMPUS/SDC/mcrb_m.sdc
report_clock_timing -type summary > ./reports/clock_summary.rpt
set_global report_timing_format {hpin cell arc slew load delay arrival}
check_timing -verbose -type {loops inputs endpoints clocks constant_collision clock_gating_inferred clock_clipping} -include_warning clocks_masked_by_another_clock > ./reports/check_timing_verbose.rpt
check_timing -check_only {clock_crossing} -verbose > ./reports/clock_crossings.rpt
report_clocks -groups > ./reports/report_clock_groups.rpt
report_constraint -all_violators > ./reports/report_allViolators.rpt
report_timing
selectObject Net mc_rb_ef1_svld_i
get_analysis_mode
report_slack_histogram
