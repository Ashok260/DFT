#######################################################
#                                                     
#  Tempus Timing Signoff Solution Command Logging File                     
#  Created on Fri Apr  4 15:38:24 2025                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Signoff Solution v20.20-p001_1 (64bit) 12/02/2020 16:07 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.20-p001_1 NR200917-0125/MT (database version 18.20.530) {superthreading v2.11}
#@(#)CDS: AAE 20.20-p005 (64bit) 12/02/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.20-p010_1 () Dec  2 2020 14:35:30 ( )
#@(#)CDS: SYNTECH 20.20-p001_1 () Nov 24 2020 02:28:20 ( )
#@(#)CDS: CPE v20.20-p009

read_lib ../NangateOpenCellLibrary_slow_conditional_ccs.lib
read_lib -lef ../NangateOpenCellLibrary.lef
read_verilog ../momal_route.v
set_top_module
read_sdc ../momal.sdc
read_def ../momal_scan_def.def
read_def ../momal_scan_def.def
read_def ../momal_scan_def.def
read_def ../momal_scan_def.def
read_def ../momal_scan_def.def
report_timing
verify_connectivity -type all -error 1000 -warning 50
ctd_win -id ctdMain
zoomBox 0.07950 0.34200 0.71050 0.89300 .uiCellView.win
zoomBox 0.22000 0.44250 0.54950 0.73000 .uiCellView.win
zoomBox -0.03450 0.26100 0.84000 1.02450 .uiCellView.win
zoomBox -0.29100 0.07800 1.13350 1.32150 .uiCellView.win
stop_gui
save_design momal
exit
