if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name default_emulate_libset_max\
   -timing\
    [list ${::IMEX::libVar}/lib/typ/slow.lib]
create_library_set -name default_emulate_libset_min\
   -timing\
    [list ${::IMEX::libVar}/lib/typ/slow.lib]
create_rc_corner -name default_emulate_early_rc_corner\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 125
create_rc_corner -name default_emulate_late_rc_corner\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 125
create_rc_corner -name default_emulate_rc_corner\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 125
create_delay_corner -name default_emulate_delay_corner\
   -rc_corner default_emulate_rc_corner\
   -early_library_set default_emulate_libset_min\
   -late_library_set default_emulate_libset_max
create_delay_corner -name default_emulate_delay_corner_max\
   -library_set default_emulate_libset_max\
   -rc_corner default_emulate_rc_corner
create_delay_corner -name default_emulate_delay_corner_min\
   -library_set default_emulate_libset_min\
   -rc_corner default_emulate_rc_corner
create_constraint_mode -name default_emulate_constraint_mode\
   -sdc_files\
    [list /dev/null]
create_analysis_view -name default_emulate_view -constraint_mode default_emulate_constraint_mode -delay_corner default_emulate_delay_corner
set_analysis_view -setup [list default_emulate_view] -hold [list default_emulate_view]
catch {set_interactive_constraint_mode [list default_emulate_constraint_mode] } 
