#######################################################
#                                                     
#  Tempus Timing Signoff Solution Command Logging File                     
#  Created on Wed Mar 12 15:28:58 2025                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Signoff Solution v20.20-p001_1 (64bit) 12/02/2020 16:07 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.20-p001_1 NR200917-0125/MT (database version 18.20.530) {superthreading v2.11}
#@(#)CDS: AAE 20.20-p005 (64bit) 12/02/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.20-p010_1 () Dec  2 2020 14:35:30 ( )
#@(#)CDS: SYNTECH 20.20-p001_1 () Nov 24 2020 02:28:20 ( )
#@(#)CDS: CPE v20.20-p009

read_lib /home/01fe21bec223/DFT_TESSENT/TEMPUS/TECHFILES/NangateOpenCellLibrary_slow_conditional_ccs.lib
set_global timing_apply_default_primary_input_assertion false
read_verilog /home/01fe21bec223/DFT_TESSENT/TEMPUS/NETLIST/s298_opt.v
set_top_module s298
read_sdc /home/01fe21bec223/DFT_TESSENT/TEMPUS/SDC/s298_m.sdc
report_clock_timing -type summary > ./TEMPUS_REPORTS_${DATE}/clock_summary.rpt
set_global report_timing_format {hpin cell arc slew load delay arrival}
check_timing -verbose -type {loops inputs endpoints clocks constant_collision clock_gating_inferred clock_clipping} -include_warning clocks_masked_by_another_clock > ./TEMPUS_REPORTS_${DATE}/check_timing_verbose.rpt
check_timing -check_only {clock_crossing} -verbose > ./TEMPUS_REPORTS_${DATE}/clock_crossings.rpt
report_clocks -groups > ./TEMPUS_REPORTS_${DATE}/report_clock_groups.rpt
report_constraint -all_violators > ./TEMPUS_REPORTS_Mar12-15:29:14/report_allViolators.rpt
get_time_unit
report_timing -machine_readable -max_paths 10000 -max_slack 0.75 -path_exceptions all -late > top.mtarpt
load_timing_debug_report -name default_report top.mtarpt
write_sdc > ./TEMPUS_REPORTS_${DATE}/tempus_s298.sdc
verify_connectivity -type all -error 1000 -warning 50
get_analysis_mode
report_slack_histogram
get_analysis_mode
report_slack_histogram
get_analysis_mode
report_timing -max_points 50 -machine_readable > s298.mtarpt
load_timing_debug_report -name default_report s298.mtarpt
get_analysis_mode
report_slack_histogram
get_analysis_mode
report_timing -max_points 50 -machine_readable > s298.mtarpt
load_timing_debug_report -name default_report s298.mtarpt
analyze_paths_by_basic_path_group
analyze_paths_by_basic_path_group -options
analyze_paths_by_basic_path_group -help
report_analysis_mode
report_analysis_coverage
report_analysis_coverage > ./TEMPUS_REPORTS_#{DATE}/coverage.rep
report_analysis_coverage > ./TEMPUS_REPORTS_${DATE}/coverage.rep
report_analysis_summary > ./TEMPUS_REPORTS_${DATE}/summary_analysis.rep
all_hold_analysis_views
ctd_win -id ctdMain
