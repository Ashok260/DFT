# Cadence Genus(TM) Synthesis Solution, Version 20.11-s111_1, built Apr 26 2021 14:57:38

# Date: Mon Apr 14 12:54:54 2025
# Host: APL10.kletech.ac.in (x86_64 w/Linux 4.18.0-553.47.1.el8_10.x86_64) (6cores*12cpus*1physical cpu*12th Gen Intel(R) Core(TM) i5-12500 18432KB)
# OS:   Red Hat Enterprise Linux release 8.10 (Ootpa)

source run_synthesis.tcl
gui_show
grep -c "DFF" ./OUTPUTS_Apr14-12:55:00/counter_opt.v
report_timing -max_paths 10000 -early
report_timing -max_paths 10000 -min_slack
report_timing -max_paths 10000
report_timing -unconstrained
