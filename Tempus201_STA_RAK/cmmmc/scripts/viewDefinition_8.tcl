##################################################
# Define the available libraries
##################################################
create_library_set -name libset_slow\
   -timing\
    [list ../../libs/liberty/FreePDK45_lib_v1.0_worst.lib\
          ../../libs/MACRO/LIBERTY/pllclk.lib\
          ../../libs/MACRO/LIBERTY/ram_256x16A.lib\
          ../../libs/MACRO/LIBERTY/rom_512x16A.lib]
create_library_set -name libset_fast\
   -timing\
    [list ../../libs/liberty/FreePDK45_lib_v1.0_typical.lib\
          ../../libs/MACRO/LIBERTY/pllclk.lib\
          ../../libs/MACRO/LIBERTY/ram_256x16A.lib\
          ../../libs/MACRO/LIBERTY/rom_512x16A.lib]

##################################################
# Define the available PVT corners
##################################################
create_rc_corner -name corner_worst_RCMAX\
   -preRoute_res 1.2\
   -postRoute_res {1.2 1.2 1.2}\
   -preRoute_cap 1.2\
   -postRoute_cap {1.2 1.2 1.2}\
   -postRoute_xcap {1.2 1.2 1.2}\
   -preRoute_clkres 0\
   -preRoute_clkcap 0
create_rc_corner -name corner_worst_RCMIN\
   -preRoute_res 0.8\
   -postRoute_res {0.8 0.8 0.8}\
   -preRoute_cap 0.8\
   -postRoute_cap {0.8 0.8 0.8}\
   -postRoute_xcap {0.8 0.8 0.8}\
   -preRoute_clkres 0\
   -preRoute_clkcap 0

##################################################
# Create the possible delay corners
# These are combinations of library and corners
##################################################
create_delay_corner -name delay_corner_slow_RCMAX\
   -rc_corner corner_worst_RCMAX\
   -early_library_set libset_slow\
   -late_library_set libset_slow
create_delay_corner -name delay_corner_fast_RCMAX\
   -rc_corner corner_worst_RCMAX\
   -early_library_set libset_fast\
   -late_library_set libset_fast
create_delay_corner -name delay_corner_slow_RCMIN\
   -rc_corner corner_worst_RCMIN\
   -early_library_set libset_slow\
   -late_library_set libset_slow
create_delay_corner -name delay_corner_fast_RCMIN\
   -rc_corner corner_worst_RCMIN\
   -early_library_set libset_fast\
   -late_library_set libset_fast

##################################################
# Define the available constraint types
##################################################
create_constraint_mode -name functional_mode -sdc_files [list ../../design/dtmf_recvr_core.pr.tcl   ../../design/dtmf_recvr_core.pr.sdc]
create_constraint_mode -name scan_mode       -sdc_files [list ../../design/dtmf_recvr_core.scan.tcl ../../design/dtmf_recvr_core.scan.sdc]

##################################################
# Create the possbile views
# These are combinations of constraints, and delay corners
##################################################
create_analysis_view -name func_slow_RCMAX -constraint_mode functional_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name func_fast_RCMAX -constraint_mode functional_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name func_slow_RCMIN -constraint_mode functional_mode -delay_corner delay_corner_slow_RCMIN
create_analysis_view -name func_fast_RCMIN -constraint_mode functional_mode -delay_corner delay_corner_fast_RCMIN

create_analysis_view -name scan_slow_RCMAX -constraint_mode scan_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name scan_fast_RCMAX -constraint_mode scan_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name scan_slow_RCMIN -constraint_mode scan_mode -delay_corner delay_corner_slow_RCMIN
create_analysis_view -name scan_fast_RCMIN -constraint_mode scan_mode -delay_corner delay_corner_fast_RCMIN

##################################################
# Turn on the views that you want to use.
# Not all created views need to be used every time.
##################################################
set_analysis_view -setup [list \
func_slow_RCMAX \
func_fast_RCMAX \
func_slow_RCMIN \
func_fast_RCMIN \
scan_slow_RCMAX \
scan_fast_RCMAX \
scan_slow_RCMIN \
scan_fast_RCMIN \
] -hold [list \
func_slow_RCMAX \
func_fast_RCMAX \
func_slow_RCMIN \
func_fast_RCMIN \
scan_slow_RCMAX \
scan_fast_RCMAX \
scan_slow_RCMIN \
scan_fast_RCMIN \
]
