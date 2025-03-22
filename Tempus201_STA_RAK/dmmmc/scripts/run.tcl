################################################################
# Purpose:  Show a simple 8 view DMMMC Tempus STA script
# Purpose:  Hightlight the order of operations and syntax
# Author:   John Schritz   March 2015
################################################################
set runLocal  0       ;# Use a single machine if set to 1
#set_distribute_mmmc_mode -interactive true -views all
################################
# Define how to get clients on one local machine
################################
if {$runLocal} {
  Puts "Running DMMMC using local clients"
  set_distribute_host -local   
#use a single machine.  likley only used for this small RAK.
  
  # Setup threading
  set_multi_cpu_usage -localCpu 8 -remoteHost 8
}

################################
# Define how to get clients using LSF
################################
if {$runLocal == 0 } {
  Puts "Running DMMMC using LSF clients"
  set threadCnt 2 
  set clientCnt 8 
  #To see the distributed clients, you can set "set runLocal 0 " and edit the "set_distribute_command" based on your configuration
  #set_distribute_host -timeout 300 -lsf -queue lnx64 -args "-P TEMPUS:15.1:PE:build -n ${threadCnt}" -resource "span\[hosts=1\] select\[OSNAME==Linux \]"
  set_distribute_host -timeout 3000 -lsf -queue lnx64

  # Setup threading
  set_multi_cpu_usage -localCpu $threadCnt -cpuPerRemoteHost $threadCnt -remoteHost $clientCnt
  get_distribute_host -queue
}

################################
# Views will be distributed over multiple Tempus sessions
# Define the script that will load the netlist, libs, and views for each distributed session
################################
set cwd [exec pwd]
set outDir "$cwd/dmmmc_logs"
distribute_read_design -design_script ../scripts/loadDesign_dmmmc.tcl -outdir $outDir

################################
# Views will be distributed over multiple Tempus sessions
# Define the script that will read_spef, and create reports for each distributed session
################################
set setupViews [list \
  func_fast_RCMAX \
  func_slow_RCMAX \
  func_fast_RCMIN \
  func_slow_RCMIN \
  scan_fast_RCMAX \
  scan_slow_RCMAX \
  scan_fast_RCMIN \
  scan_slow_RCMIN \
  ]
distribute_views -views $setupViews -script ../scripts/sta_dmmmc.tcl
exit_servers
###################################
# Take reports from each view and merge them into one large report
###################################
merge_timing_reports -view_dirs $setupViews -base_report setup_maxpath_machine.rpt -base_dir $outDir > merged_setup_maxpath.rpt
merge_timing_reports -view_dirs $setupViews -base_report setup_nworst_machine.rpt  -base_dir $outDir > merged_setup_worst.rpt
merge_timing_reports -view_dirs $setupViews -base_report hold_maxpath_machine.rpt  -base_dir $outDir > merged_hold_maxpath.rpt
merge_timing_reports -view_dirs $setupViews -base_report hold_nworst_machine.rpt   -base_dir $outDir > merged_hold_worst.rpt
###################################
# Print final runtime and memory messages
###################################
report_resource



Puts "All done"
return    ;# If in interactive session, return to the Tempus prompt, else exit
exit
