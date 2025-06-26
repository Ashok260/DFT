# Cadence Genus(TM) Synthesis Solution, Version 20.11-s111_1, built Apr 26 2021 14:57:38

# Date: Wed Apr 30 16:07:00 2025
# Host: APL10.kletech.ac.in (x86_64 w/Linux 4.18.0-553.47.1.el8_10.x86_64) (6cores*12cpus*1physical cpu*12th Gen Intel(R) Core(TM) i5-12500 18432KB)
# OS:   Red Hat Enterprise Linux release 8.10 (Ootpa)

read_hdl ../../RTL/RTL/mem_block_16384_36.v
read_lib {../../TECHFILES/slow.lib ../../TECHFILES/memories/SPRAM_8192x36_min_SP.lib}
elaborate
set_top_module
syn_gen
syn_map
syn_opt
report_gates
write_hdl > sram_sp_16384d_36w_16m_8b.v
write_hdl


