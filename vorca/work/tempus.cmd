#######################################################
#                                                     
#  Tempus Timing Signoff Solution Command Logging File                     
#  Created on Tue Apr  1 15:07:01 2025                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Signoff Solution v20.20-p001_1 (64bit) 12/02/2020 16:07 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.20-p001_1 NR200917-0125/MT (database version 18.20.530) {superthreading v2.11}
#@(#)CDS: AAE 20.20-p005 (64bit) 12/02/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.20-p010_1 () Dec  2 2020 14:35:30 ( )
#@(#)CDS: SYNTECH 20.20-p001_1 () Nov 24 2020 02:28:20 ( )
#@(#)CDS: CPE v20.20-p009

read_verilog ../Tech_files/vorca_fixed.v
read_lib ../Tech_files/slow.lib
set_top_module
create_clock -name sclk -period 5 [get_ports clk]
set_delay_cal_mode -siAware true
set_si_mode -enable_delay_report true
set_si_mode -enable_glitch_report true
set_si_mode -enable_glitch_propagation true
set_global timing_pba_exhaustive_path_nworst_limit 2
set_global timing_path_based_exhaustive_max_paths_limit 1000
update_timing -full
report_timing
report_timing -max_paths 10000000 -retime path_slew_propagation -retime_mode exhaustive -max_slack 0.200 > epba_${DATE}.rpt
check_design -type timing -out_file reports_Apr01-15:08:36/check_design.rpt
check_timing -verbose > ${reportDir}/check_timing.rpt
report_analysis_coverage            > ${reportDir}/coverage.rpt
report_clocks                       > ${reportDir}/clocks.rpt
report_case_analysis                > ${reportDir}/case_analysis.rpt
report_inactive_arcs                > ${reportDir}/inactive_arcs.rpt
report_constraint -all_violators > reports_Apr01-15:08:36/allviol.rpt
report_analysis_summary                                         > ${reportDir}/analysis_summary.rpt
report_timing -path_type summary_slack_only -late -max_paths 5  > ${reportDir}/start_end_slack.rpt
report_timing -late   -max_paths 50 -nworst 1 -path_type full_clock -net  > ${reportDir}/worst_max_path.rpt
report_timing -early  -max_paths 50 -nworst 1 -path_type full_clock -net  > ${reportDir}/worst_min_path.rpt
report_timing -path_type end_slack_only                       > ${reportDir}/setup_1.rpt
report_timing -path_type end_slack_only  -early               > ${reportDir}/hold_1.rpt
report_timing -late    -max_paths 100                         > ${reportDir}/setup_100.rpt.gz
report_timing -early   -max_paths 100                         > ${reportDir}/hold_100.rpt.gz
report_timing -retime path_slew_propagation -max_paths 50 -nworst 1 -path_type full_clock    > ${reportDir}/pba_50_paths.rpt
get_time_unit
report_timing -machine_readable -max_paths 10000 -max_slack 0.75 -path_exceptions all -late > top.mtarpt
load_timing_debug_report -name default_report top.mtarpt
get_time_unit
report_timing -machine_readable -max_paths 10000 -max_slack 0.75 -path_exceptions all -early > top.mtarpt
load_timing_debug_report -name default_report top.mtarpt
report_path_groups 
report_path_groups ../Tech_files/vorca_fixed.v 
report_path_groups -h
all_setup_analysis_views
analyze_paths_by_basic_path_group -h
analyze_paths_by_basic_path_group
analyze_paths_by_basic_path_group > pathgroup.rpt
analyze_paths_by_view
analyze_paths_by_view -h
analyze_paths_by_view -prefix pathbyview
set_analysis_mode --h
report_timing -
