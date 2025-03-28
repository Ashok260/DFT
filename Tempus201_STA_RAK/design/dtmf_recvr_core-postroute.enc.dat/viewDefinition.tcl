global dataDir
global libDir
set dataDir [file dirname [file normalize [info script]]]
set libDir ${dataDir}/libs
create_library_set -name default_library_set\
   -timing\
    [list ${libDir}/mmmc/FreePDK45_lib_v1.0_worst.lib\
    ${libDir}/mmmc/pllclk.lib\
    ${libDir}/mmmc/ram_256x16A.lib\
    ${libDir}/mmmc/rom_512x16A.lib]
create_rc_corner -name _default_rc_corner_\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 25
create_delay_corner -name _default_delay_corner_\
   -library_set default_library_set\
   -opcond_library FreePDK45_lib_v1.0\
   -opcond TypTyp_0.8V_25C\
   -rc_corner _default_rc_corner_
create_constraint_mode -name _default_constraint_mode_\
   -sdc_files\
    [list ${dataDir}/mmmc/modes/_default_constraint_mode_/_default_constraint_mode_.sdc]
create_analysis_view -name _default_view_ -constraint_mode _default_constraint_mode_ -delay_corner _default_delay_corner_
set_analysis_view -setup [list _default_view_] -hold [list _default_view_]
