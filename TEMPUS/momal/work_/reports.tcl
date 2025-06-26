##########################
#Generate SI glitch report
##########################
#report_noise -txtfile outputs/glitch.rpt

#####################
# Reports that check design health
#####################
mkdir outputs
check_design -type timing -out_file    outputs/check_design.rpt
check_timing -verbose > outputs/check_timing.rpt
#report_annotated_parasitics         > outputs/annotated.rpt
report_analysis_coverage            > outputs/coverage.rpt

#####################
# Reports that describe constraints
#####################
report_clocks                       > outputs/clocks.rpt
report_case_analysis                > outputs/case_analysis.rpt
report_inactive_arcs                > outputs/inactive_arcs.rpt
 
#####################
# Reports that describe timing health
#####################
report_constraint -all_violators                                > outputs/allviol.rpt
report_analysis_summary                                         > outputs/analysis_summary.rpt
report_timing -path_type summary_slack_only -late -max_paths 5  > outputs/start_end_slack.rpt

#####################
# GBA Reports that show detailed timing
#####################
report_timing -late   -max_paths 50 -nworst 1 -path_type full_clock -net  > outputs/worst_max_path.rpt
report_timing -early  -max_paths 50 -nworst 1 -path_type full_clock -net  > outputs/worst_min_path.rpt
report_timing -path_type end_slack_only                       > outputs/setup_1.rpt
report_timing -path_type end_slack_only  -early               > outputs/hold_1.rpt
report_timing -late    -max_paths 100                         > outputs/setup_100.rpt.gz
report_timing -early   -max_paths 100                         > outputs/hold_100.rpt.gz

#####################
# PBA Reports that show detailed timing
#####################
report_timing -retime path_slew_propagation -max_paths 50 -nworst 1 -path_type full_clock    > outputs/pba_50_paths.rpt


