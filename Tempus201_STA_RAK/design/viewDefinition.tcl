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
create_constraint_mode -name functional_mode -sdc_files [list ../../design/dtmf_recvr_core.pr.sdc]
create_constraint_mode -name scan_mode -sdc_files [list ../../design/dtmf_recvr_core.scan.sdc]
create_constraint_mode -name test_mode -sdc_files [list ../../design/dtmf_recvr_core.test.sdc]

create_analysis_view -name func_slow_RCMAX -constraint_mode functional_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name func_fast_RCMAX -constraint_mode functional_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name func_slow_RCMIN -constraint_mode functional_mode -delay_corner delay_corner_slow_RCMIN
create_analysis_view -name func_fast_RCMIN -constraint_mode functional_mode -delay_corner delay_corner_fast_RCMIN

create_analysis_view -name scan_slow_RCMAX -constraint_mode scan_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name scan_fast_RCMAX -constraint_mode scan_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name scan_slow_RCMIN -constraint_mode scan_mode -delay_corner delay_corner_slow_RCMIN
create_analysis_view -name scan_fast_RCMIN -constraint_mode scan_mode -delay_corner delay_corner_fast_RCMIN

create_analysis_view -name test_slow_RCMAX -constraint_mode test_mode -delay_corner delay_corner_slow_RCMAX
create_analysis_view -name test_fast_RCMAX -constraint_mode test_mode -delay_corner delay_corner_fast_RCMAX
create_analysis_view -name test_slow_RCMIN -constraint_mode test_mode -delay_corner delay_corner_slow_RCMIN
create_analysis_view -name test_fast_RCMIN -constraint_mode test_mode -delay_corner delay_corner_fast_RCMIN

set_analysis_view -setup [list func_slow_RCMAX func_fast_RCMAX func_slow_RCMIN func_fast_RCMIN scan_slow_RCMAX scan_fast_RCMAX scan_slow_RCMIN scan_fast_RCMIN test_slow_RCMAX test_fast_RCMAX test_slow_RCMIN test_fast_RCMIN] -hold [list func_slow_RCMAX func_fast_RCMAX func_slow_RCMIN func_fast_RCMIN scan_slow_RCMAX scan_fast_RCMAX scan_slow_RCMIN scan_fast_RCMIN test_slow_RCMAX test_fast_RCMAX test_slow_RCMIN test_fast_RCMIN]
