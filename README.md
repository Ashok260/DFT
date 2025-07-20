# 🔧 DFT (Design For Test) Project

This repository contains Verilog and related scripts for implementing and testing DFT techniques such as scan chains, BIST, and fault injection.  
The goal is to enhance testability of digital designs in ASIC and FPGA workflows.

---

## 📁 Project Structure

<!-- START OF TREE -->
## 📁 Project Structure (Auto-generated)
```
.
├── GENUS
│   ├── Examples
│   │   ├── RTL
│   │   │   ├── counter.v
│   │   │   ├── counter_16bit.v
│   │   │   ├── mcrb.v
│   │   │   ├── mem_block.v
│   │   │   ├── mem_block_1.v
│   │   │   ├── mem_block_16384_36.v
│   │   │   ├── mem_block_512_32.v
│   │   │   ├── s298_Mod.v
│   │   │   ├── sram.v
│   │   │   └── timer.v
│   │   ├── SDC
│   │   │   ├── mcrb.sdc
│   │   │   └── s298.sdc
│   │   ├── Scripts
│   │   │   ├── run.tcl
│   │   │   └── run_synthesis.tcl
│   │   ├── work
│   │   │   ├── OUTPUTS_Mar11-15:10:25
│   │   │   │   ├── REPORTS_Mar11-15:10:25
│   │   │   │   │   ├── final.rpt
│   │   │   │   │   ├── final_area.rpt
│   │   │   │   │   ├── final_gates.rpt
│   │   │   │   │   ├── final_qor.rpt
│   │   │   │   │   ├── final_s298.db
│   │   │   │   │   ├── final_time.rpt
│   │   │   │   │   ├── generic
│   │   │   │   │   │   └── s298_datapath.rpt
│   │   │   │   │   ├── generic_area.rpt
│   │   │   │   │   ├── generic_gates.rpt
│   │   │   │   │   ├── generic_qor.rpt
│   │   │   │   │   ├── generic_s298.db
│   │   │   │   │   ├── generic_time.rpt
│   │   │   │   │   ├── map
│   │   │   │   │   │   └── s298_datapath.rpt
│   │   │   │   │   ├── map_area.rpt
│   │   │   │   │   ├── map_gates.rpt
│   │   │   │   │   ├── map_qor.rpt
│   │   │   │   │   ├── map_s298.db
│   │   │   │   │   ├── map_time.rpt
│   │   │   │   │   ├── opt
│   │   │   │   │   │   └── s298_datapath.rpt
│   │   │   │   │   ├── opt_area.rpt
│   │   │   │   │   ├── opt_gates.rpt
│   │   │   │   │   ├── opt_qor.rpt
│   │   │   │   │   ├── opt_s298.db
│   │   │   │   │   ├── opt_time.rpt
│   │   │   │   │   ├── s298_datapath_incr.rpt
│   │   │   │   │   ├── s298_messages.rpt
│   │   │   │   │   ├── s298_post_opt_time.rpt
│   │   │   │   │   └── s298_pretim.rpt
│   │   │   │   ├── intermediate2final.lec.do
│   │   │   │   ├── s298_m.sdc
│   │   │   │   └── s298_opt.v
│   │   │   ├── genus.cmd
│   │   │   ├── genus.log
│   │   │   ├── run_synthesis.tcl
│   │   │   └── top.mtarpt
│   │   ├── work_
│   │   │   ├── genus.cmd
│   │   │   ├── genus.log
│   │   │   └── reports_Apr03-16:48:20
│   │   │       ├── final.rpt
│   │   │       ├── generic
│   │   │       │   └── mcrb_datapath.rpt
│   │   │       ├── generic_area.rpt
│   │   │       ├── generic_gates.rpt
│   │   │       ├── generic_mcrb.db
│   │   │       ├── generic_qor.rpt
│   │   │       ├── generic_time.rpt
│   │   │       ├── map
│   │   │       │   └── mcrb_datapath.rpt
│   │   │       ├── map_area.rpt
│   │   │       ├── map_gates.rpt
│   │   │       ├── map_mcrb.db
│   │   │       ├── map_qor.rpt
│   │   │       ├── map_time.rpt
│   │   │       ├── mcrb-DFTregs
│   │   │       ├── mcrb-DFTsetup_tdrc
│   │   │       ├── mcrb-tdrcs
│   │   │       ├── mcrb_C2C_post_map.rpt
│   │   │       ├── mcrb_C2C_post_opt.rpt
│   │   │       ├── mcrb_C2O_post_map.rpt
│   │   │       ├── mcrb_C2O_post_opt.rpt
│   │   │       ├── mcrb_I2C_post_map.rpt
│   │   │       ├── mcrb_I2C_post_opt.rpt
│   │   │       ├── mcrb_I2O_post_map.rpt
│   │   │       ├── mcrb_I2O_post_opt.rpt
│   │   │       ├── mcrb_default_post_map.rpt
│   │   │       ├── mcrb_default_post_opt.rpt
│   │   │       ├── mcrb_pretim.rpt
│   │   │       ├── mcrb_sclk_post_map.rpt
│   │   │       ├── mcrb_sclk_post_opt.rpt
│   │   │       ├── syn_opt_area.rpt
│   │   │       ├── syn_opt_gates.rpt
│   │   │       ├── syn_opt_mcrb.db
│   │   │       ├── syn_opt_qor.rpt
│   │   │       └── syn_opt_time.rpt
│   │   ├── work_cntr
│   │   │   ├── OUTPUTS_Apr14-12:55:00
│   │   │   │   ├── REPORTS_Apr14-12:55:00
│   │   │   │   │   ├── counter_datapath_incr.rpt
│   │   │   │   │   ├── counter_messages.rpt
│   │   │   │   │   ├── counter_post_opt_time.rpt
│   │   │   │   │   ├── counter_pretim.rpt
│   │   │   │   │   ├── final.rpt
│   │   │   │   │   ├── final_area.rpt
│   │   │   │   │   ├── final_counter.db
│   │   │   │   │   ├── final_gates.rpt
│   │   │   │   │   ├── final_qor.rpt
│   │   │   │   │   ├── final_time.rpt
│   │   │   │   │   ├── generic
│   │   │   │   │   │   └── counter_datapath.rpt
│   │   │   │   │   ├── generic_area.rpt
│   │   │   │   │   ├── generic_counter.db
│   │   │   │   │   ├── generic_gates.rpt
│   │   │   │   │   ├── generic_qor.rpt
│   │   │   │   │   ├── generic_time.rpt
│   │   │   │   │   ├── map
│   │   │   │   │   │   └── counter_datapath.rpt
│   │   │   │   │   ├── map_area.rpt
│   │   │   │   │   ├── map_counter.db
│   │   │   │   │   ├── map_gates.rpt
│   │   │   │   │   ├── map_qor.rpt
│   │   │   │   │   ├── map_time.rpt
│   │   │   │   │   ├── opt
│   │   │   │   │   │   └── counter_datapath.rpt
│   │   │   │   │   ├── opt_area.rpt
│   │   │   │   │   ├── opt_counter.db
│   │   │   │   │   ├── opt_gates.rpt
│   │   │   │   │   ├── opt_qor.rpt
│   │   │   │   │   └── opt_time.rpt
│   │   │   │   ├── counter_m.sdc
│   │   │   │   ├── counter_opt.v
│   │   │   │   └── intermediate2final.lec.do
│   │   │   ├── OUTPUTS_Apr14-15:21:54
│   │   │   │   ├── REPORTS_Apr14-15:21:54
│   │   │   │   │   ├── final.rpt
│   │   │   │   │   ├── final_area.rpt
│   │   │   │   │   ├── final_gates.rpt
│   │   │   │   │   ├── final_qor.rpt
│   │   │   │   │   ├── final_random_counter_lfsr.db
│   │   │   │   │   ├── final_time.rpt
│   │   │   │   │   ├── generic
│   │   │   │   │   │   └── random_counter_lfsr_datapath.rpt
│   │   │   │   │   ├── generic_area.rpt
│   │   │   │   │   ├── generic_gates.rpt
│   │   │   │   │   ├── generic_qor.rpt
│   │   │   │   │   ├── generic_random_counter_lfsr.db
│   │   │   │   │   ├── generic_time.rpt
│   │   │   │   │   ├── map
│   │   │   │   │   │   └── random_counter_lfsr_datapath.rpt
│   │   │   │   │   ├── map_area.rpt
│   │   │   │   │   ├── map_gates.rpt
│   │   │   │   │   ├── map_qor.rpt
│   │   │   │   │   ├── map_random_counter_lfsr.db
│   │   │   │   │   ├── map_time.rpt
│   │   │   │   │   ├── opt
│   │   │   │   │   │   └── random_counter_lfsr_datapath.rpt
│   │   │   │   │   ├── opt_area.rpt
│   │   │   │   │   ├── opt_gates.rpt
│   │   │   │   │   ├── opt_qor.rpt
│   │   │   │   │   ├── opt_random_counter_lfsr.db
│   │   │   │   │   ├── opt_time.rpt
│   │   │   │   │   ├── random_counter_lfsr_datapath_incr.rpt
│   │   │   │   │   ├── random_counter_lfsr_messages.rpt
│   │   │   │   │   ├── random_counter_lfsr_post_opt_time.rpt
│   │   │   │   │   └── random_counter_lfsr_pretim.rpt
│   │   │   │   ├── intermediate2final.lec.do
│   │   │   │   ├── random_counter_lfsr_m.sdc
│   │   │   │   └── random_counter_lfsr_opt.v
│   │   │   ├── OUTPUTS_Apr22-15:59:51
│   │   │   │   ├── CLOCK_m.sdc
│   │   │   │   ├── CLOCK_opt.v
│   │   │   │   ├── REPORTS_Apr22-15:59:51
│   │   │   │   │   ├── CLOCK_datapath_incr.rpt
│   │   │   │   │   ├── CLOCK_messages.rpt
│   │   │   │   │   ├── CLOCK_post_opt_time.rpt
│   │   │   │   │   ├── CLOCK_pretim.rpt
│   │   │   │   │   ├── final.rpt
│   │   │   │   │   ├── final_CLOCK.db
│   │   │   │   │   ├── final_area.rpt
│   │   │   │   │   ├── final_gates.rpt
│   │   │   │   │   ├── final_qor.rpt
│   │   │   │   │   ├── final_time.rpt
│   │   │   │   │   ├── generic
│   │   │   │   │   │   └── CLOCK_datapath.rpt
│   │   │   │   │   ├── generic_CLOCK.db
│   │   │   │   │   ├── generic_area.rpt
│   │   │   │   │   ├── generic_gates.rpt
│   │   │   │   │   ├── generic_qor.rpt
│   │   │   │   │   ├── generic_time.rpt
│   │   │   │   │   ├── map
│   │   │   │   │   │   └── CLOCK_datapath.rpt
│   │   │   │   │   ├── map_CLOCK.db
│   │   │   │   │   ├── map_area.rpt
│   │   │   │   │   ├── map_gates.rpt
│   │   │   │   │   ├── map_qor.rpt
│   │   │   │   │   ├── map_time.rpt
│   │   │   │   │   ├── opt
│   │   │   │   │   │   └── CLOCK_datapath.rpt
│   │   │   │   │   ├── opt_CLOCK.db
│   │   │   │   │   ├── opt_area.rpt
│   │   │   │   │   ├── opt_gates.rpt
│   │   │   │   │   ├── opt_qor.rpt
│   │   │   │   │   └── opt_time.rpt
│   │   │   │   └── intermediate2final.lec.do
│   │   │   ├── cntr.sdc
│   │   │   ├── cntr_16net.v
│   │   │   ├── genus.cmd
│   │   │   ├── genus.cmd1
│   │   │   ├── genus.cmd2
│   │   │   ├── genus.cmd3
│   │   │   ├── genus.cmd4
│   │   │   ├── genus.log
│   │   │   ├── genus.log1
│   │   │   ├── genus.log2
│   │   │   ├── genus.log3
│   │   │   ├── genus.log4
│   │   │   ├── gui_schematic.gif
│   │   │   ├── gui_schematic.png
│   │   │   ├── outputs_Apr14-16:46:50
│   │   │   │   └── random_counter_lfsr-scanDEF
│   │   │   ├── reports_Apr14-16:46:50
│   │   │   │   ├── final.rpt
│   │   │   │   ├── map_area.rpt
│   │   │   │   ├── map_gates.rpt
│   │   │   │   ├── map_qor.rpt
│   │   │   │   ├── map_random_counter_lfsr.db
│   │   │   │   ├── map_time.rpt
│   │   │   │   ├── random_counter_lfsr-DFTchains
│   │   │   │   ├── random_counter_lfsr-DFTregs
│   │   │   │   ├── random_counter_lfsr-DFTsetup_final
│   │   │   │   ├── random_counter_lfsr-DFTsetup_tdrc
│   │   │   │   ├── random_counter_lfsr-tdrcs
│   │   │   │   ├── random_counter_lfsr_clk_post_map.rpt
│   │   │   │   ├── random_counter_lfsr_clk_post_opt.rpt
│   │   │   │   ├── random_counter_lfsr_default_post_map.rpt
│   │   │   │   ├── random_counter_lfsr_default_post_opt.rpt
│   │   │   │   ├── syn_opt_area.rpt
│   │   │   │   ├── syn_opt_gates.rpt
│   │   │   │   ├── syn_opt_low_incr_area.rpt
│   │   │   │   ├── syn_opt_low_incr_gates.rpt
│   │   │   │   ├── syn_opt_low_incr_qor.rpt
│   │   │   │   ├── syn_opt_low_incr_random_counter_lfsr.db
│   │   │   │   ├── syn_opt_low_incr_time.rpt
│   │   │   │   ├── syn_opt_qor.rpt
│   │   │   │   ├── syn_opt_random_counter_lfsr.db
│   │   │   │   └── syn_opt_time.rpt
│   │   │   ├── run.tcl
│   │   │   └── run_synthesis.tcl
│   │   └── work_mem
│   │       ├── OUTPUTS_Apr16-15:54:03
│   │       │   ├── REPORTS_Apr16-15:54:03
│   │       │   │   ├── final.rpt
│   │       │   │   ├── final_area.rpt
│   │       │   │   ├── final_gates.rpt
│   │       │   │   ├── final_memory_system_with_lib.db
│   │       │   │   ├── final_qor.rpt
│   │       │   │   ├── final_time.rpt
│   │       │   │   ├── generic
│   │       │   │   │   └── memory_system_with_lib_datapath.rpt
│   │       │   │   ├── generic_area.rpt
│   │       │   │   ├── generic_gates.rpt
│   │       │   │   ├── generic_memory_system_with_lib.db
│   │       │   │   ├── generic_qor.rpt
│   │       │   │   ├── generic_time.rpt
│   │       │   │   ├── map
│   │       │   │   │   └── memory_system_with_lib_datapath.rpt
│   │       │   │   ├── map_area.rpt
│   │       │   │   ├── map_gates.rpt
│   │       │   │   ├── map_memory_system_with_lib.db
│   │       │   │   ├── map_qor.rpt
│   │       │   │   ├── map_time.rpt
│   │       │   │   ├── memory_system_with_lib_datapath_incr.rpt
│   │       │   │   ├── memory_system_with_lib_messages.rpt
│   │       │   │   ├── memory_system_with_lib_post_opt_time.rpt
│   │       │   │   ├── memory_system_with_lib_pretim.rpt
│   │       │   │   ├── opt
│   │       │   │   │   └── memory_system_with_lib_datapath.rpt
│   │       │   │   ├── opt_area.rpt
│   │       │   │   ├── opt_gates.rpt
│   │       │   │   ├── opt_memory_system_with_lib.db
│   │       │   │   ├── opt_qor.rpt
│   │       │   │   └── opt_time.rpt
│   │       │   ├── intermediate2final.lec.do
│   │       │   ├── memory_system_with_lib_m.sdc
│   │       │   └── memory_system_with_lib_opt.v
│   │       ├── OUTPUTS_Apr30-13:44:18
│   │       │   ├── REPORTS_Apr30-13:44:18
│   │       │   │   ├── final.rpt
│   │       │   │   ├── final_area.rpt
│   │       │   │   ├── final_gates.rpt
│   │       │   │   ├── final_memory_system_with_lib.db
│   │       │   │   ├── final_qor.rpt
│   │       │   │   ├── final_time.rpt
│   │       │   │   ├── generic
│   │       │   │   │   └── memory_system_with_lib_datapath.rpt
│   │       │   │   ├── generic_area.rpt
│   │       │   │   ├── generic_gates.rpt
│   │       │   │   ├── generic_memory_system_with_lib.db
│   │       │   │   ├── generic_qor.rpt
│   │       │   │   ├── generic_time.rpt
│   │       │   │   ├── map
│   │       │   │   │   └── memory_system_with_lib_datapath.rpt
│   │       │   │   ├── map_area.rpt
│   │       │   │   ├── map_gates.rpt
│   │       │   │   ├── map_memory_system_with_lib.db
│   │       │   │   ├── map_qor.rpt
│   │       │   │   ├── map_time.rpt
│   │       │   │   ├── memory_system_with_lib_datapath_incr.rpt
│   │       │   │   ├── memory_system_with_lib_messages.rpt
│   │       │   │   ├── memory_system_with_lib_post_opt_time.rpt
│   │       │   │   ├── memory_system_with_lib_pretim.rpt
│   │       │   │   ├── opt
│   │       │   │   │   └── memory_system_with_lib_datapath.rpt
│   │       │   │   ├── opt_area.rpt
│   │       │   │   ├── opt_gates.rpt
│   │       │   │   ├── opt_memory_system_with_lib.db
│   │       │   │   ├── opt_qor.rpt
│   │       │   │   └── opt_time.rpt
│   │       │   ├── intermediate2final.lec.do
│   │       │   ├── memory_system_with_lib_m.sdc
│   │       │   └── memory_system_with_lib_opt.v
│   │       ├── genus.cmd
│   │       ├── genus.cmd1
│   │       ├── genus.cmd2
│   │       ├── genus.cmd3
│   │       ├── genus.cmd4
│   │       ├── genus.cmd5
│   │       ├── genus.cmd6
│   │       ├── genus.cmd7
│   │       ├── genus.log
│   │       ├── genus.log1
│   │       ├── genus.log2
│   │       ├── genus.log3
│   │       ├── genus.log4
│   │       ├── genus.log5
│   │       ├── genus.log6
│   │       ├── genus.log7
│   │       ├── memory_system_opt.v
│   │       ├── run_synthesis.tcl
│   │       ├── sram.log2
│   │       ├── sram_sp_16384d_36w_16m_8b.v
│   │       ├── sram_sp_32768d_33w_16m_8b.v
│   │       └── sram_sp_512d_32w_4m_2b.v
│   ├── ICG
│   │   └── work
│   │       └── Cadence_RAK_ICGs.txt
│   ├── MCRB
│   │   ├── RTL
│   │   │   └── mcrb.v
│   │   ├── SDC
│   │   │   └── mcrb.sdc
│   │   └── work
│   │       ├── OUTPUTS_Mar11-17:39:35
│   │       │   ├── REPORTS_Mar11-17:39:35
│   │       │   │   ├── final.rpt
│   │       │   │   ├── final_area.rpt
│   │       │   │   ├── final_gates.rpt
│   │       │   │   ├── final_mcrb.db
│   │       │   │   ├── final_qor.rpt
│   │       │   │   ├── final_time.rpt
│   │       │   │   ├── generic
│   │       │   │   │   └── mcrb_datapath.rpt
│   │       │   │   ├── generic_area.rpt
│   │       │   │   ├── generic_gates.rpt
│   │       │   │   ├── generic_mcrb.db
│   │       │   │   ├── generic_qor.rpt
│   │       │   │   ├── generic_time.rpt
│   │       │   │   ├── map
│   │       │   │   │   └── mcrb_datapath.rpt
│   │       │   │   ├── map_area.rpt
│   │       │   │   ├── map_gates.rpt
│   │       │   │   ├── map_mcrb.db
│   │       │   │   ├── map_qor.rpt
│   │       │   │   ├── map_time.rpt
│   │       │   │   ├── mcrb_datapath_incr.rpt
│   │       │   │   ├── mcrb_messages.rpt
│   │       │   │   ├── mcrb_post_opt_time.rpt
│   │       │   │   ├── mcrb_pretim.rpt
│   │       │   │   ├── opt
│   │       │   │   │   └── mcrb_datapath.rpt
│   │       │   │   ├── opt_area.rpt
│   │       │   │   ├── opt_gates.rpt
│   │       │   │   ├── opt_mcrb.db
│   │       │   │   ├── opt_qor.rpt
│   │       │   │   └── opt_time.rpt
│   │       │   ├── intermediate2final.lec.do
│   │       │   ├── mcrb_m.sdc
│   │       │   └── mcrb_opt.v
│   │       ├── flex50.log
│   │       ├── fv
│   │       │   └── mcrb
│   │       │       ├── fv_map.fv.json
│   │       │       ├── fv_map.map.do
│   │       │       ├── fv_map.singlebit.original_name.alias.json.gz
│   │       │       ├── fv_map.v.gz
│   │       │       ├── mcrb_mv.fv.json
│   │       │       ├── mcrb_mv.map.do
│   │       │       ├── mcrb_mv.singlebit.original_name.alias.json.gz
│   │       │       ├── read_libs.tcl
│   │       │       └── rtl_to_fv_map.do
│   │       ├── genus.cmd
│   │       ├── genus.log
│   │       ├── gui_schematic.gif
│   │       ├── gui_schematic.png
│   │       ├── run_synthesis.tcl
│   │       └── top.mtarpt
│   ├── Templates
│   │   ├── genus_root.tcl
│   │   └── legacy_genus.tcl
│   └── cpu_sys_to_SCL_memories
│       ├── RTL
│       │   ├── cpu_sys.v
│       │   ├── mem_block_1.v
│       │   ├── mem_block_16384_36.v
│       │   ├── mem_block_512_32.v
│       │   ├── rf_2p_136d_74w_1m_4b.v
│       │   ├── rf_2p_256d_76w_1m_4b.v
│       │   └── rf_2p_512d_76w_2m_4b.v
│       ├── cpu_sys_flops_info.txt
│       ├── scripts
│       │   ├── cpu_sys.tcl
│       │   └── run.tcl
│       ├── sdff.txt
│       ├── work_cpusys
│       │   ├── cpu_sys_syn
│       │   │   ├── RCDB_221650_i8dA5p
│       │   │   ├── RCDB_275638_IMrvL5
│       │   │   ├── SRAM_512x32_clk_WEB.txt
│       │   │   ├── clock_summary.rpt
│       │   │   ├── cpu_sys.sdc
│       │   │   ├── cpu_sys.tcl
│       │   │   ├── cpu_sys_scl.v
│       │   │   ├── flex356.log
│       │   │   ├── flex576.log
│       │   │   ├── flex63.log
│       │   │   ├── flex638.log
│       │   │   ├── flex650.log
│       │   │   ├── fv
│       │   │   │   └── cpu_sys_emep_top
│       │   │   │       ├── fv_map.fv.json
│       │   │   │       ├── fv_map.map.do
│       │   │   │       ├── fv_map.singlebit.original_name.alias.json.gz
│       │   │   │       ├── fv_map.v.gz
│       │   │   │       ├── read_libs.tcl
│       │   │   │       └── rtl_to_fv_map.do
│       │   │   ├── genus.cmd
│       │   │   ├── genus.cmd1
│       │   │   ├── genus.log
│       │   │   ├── genus.log1
│       │   │   ├── tempus.cmd
│       │   │   ├── timing_512x32_clk_A.rpt
│       │   │   └── top.mtarpt
│       │   ├── dram_136d
│       │   │   ├── dram_136d.tcl
│       │   │   ├── flex239.log
│       │   │   ├── genus.cmd
│       │   │   ├── genus.log
│       │   │   └── rf_2p_136d_74w_1m_4b.v
│       │   ├── dram_256d
│       │   │   ├── dram_256d.tcl
│       │   │   ├── flex672.log
│       │   │   ├── genus.cmd
│       │   │   ├── genus.log
│       │   │   └── rf_2p_256d_76w_1m_4b.v
│       │   ├── dram_512d
│       │   │   ├── dram_512d.tcl
│       │   │   ├── flex622.log
│       │   │   ├── genus.cmd
│       │   │   ├── genus.log
│       │   │   └── rf_2p_512d_76w_2m_4b.v
│       │   ├── sram_16384d
│       │   │   ├── flex370.log
│       │   │   ├── fv
│       │   │   │   └── sram_sp_16384d_36w_16m_8b
│       │   │   │       ├── fv_map.fv.json
│       │   │   │       ├── fv_map.map.do
│       │   │   │       ├── fv_map.v.gz
│       │   │   │       ├── read_libs.tcl
│       │   │   │       └── rtl_to_fv_map.do
│       │   │   ├── genus.cmd
│       │   │   ├── genus.log
│       │   │   ├── sram_16384.tcl
│       │   │   └── sram_sp_16384d_36w_16m_8b.v
│       │   ├── sram_32768d
│       │   │   ├── flex704.log
│       │   │   ├── fv
│       │   │   │   └── sram_sp_32768d_33w_16m_8b
│       │   │   │       ├── fv_map.fv.json
│       │   │   │       ├── fv_map.map.do
│       │   │   │       ├── fv_map.v.gz
│       │   │   │       ├── read_libs.tcl
│       │   │   │       └── rtl_to_fv_map.do
│       │   │   ├── genus.cmd
│       │   │   ├── genus.log
│       │   │   ├── sram_32768.tcl
│       │   │   └── sram_sp_32768d_33w_16m_8b.v
│       │   └── sram_512d
│       │       ├── flex9.log
│       │       ├── fv
│       │       │   └── sram_sp_512d_32w_4m_2b
│       │       │       ├── fv_map.fv.json
│       │       │       ├── fv_map.map.do
│       │       │       ├── fv_map.v.gz
│       │       │       ├── read_libs.tcl
│       │       │       └── rtl_to_fv_map.do
│       │       ├── genus.cmd
│       │       ├── genus.log
│       │       ├── sram_513.tcl
│       │       └── sram_sp_512d_32w_4m_2b.v
│       └── work_tglib
│           ├── cpu_sys_tglib.v
│           ├── cpu_sys_tglib_gates.rpt
│           ├── flex108.log
│           ├── flex471.log
│           ├── fv
│           │   └── cpu_sys_emep_top
│           │       ├── fv_map.fv.json
│           │       ├── fv_map.map.do
│           │       ├── fv_map.singlebit.original_name.alias.json.gz
│           │       ├── fv_map.v.gz
│           │       ├── read_libs.tcl
│           │       └── rtl_to_fv_map.do
│           ├── genus.cmd
│           ├── genus.log
│           └── run.tcl
├── README.md
├── RISC_V_CORE
│   ├── GENUS
│   │   ├── OUTPUTS
│   │   │   ├── gates.rep
│   │   │   └── riscv_core_net.v
│   │   ├── RTL
│   │   │   ├── riscv_alu.v
│   │   │   ├── riscv_core.v
│   │   │   ├── riscv_csr.v
│   │   │   ├── riscv_csr_regfile.v
│   │   │   ├── riscv_decode.v
│   │   │   ├── riscv_decoder.v
│   │   │   ├── riscv_defs.v
│   │   │   ├── riscv_divider.v
│   │   │   ├── riscv_exec.v
│   │   │   ├── riscv_fetch.v
│   │   │   ├── riscv_issue.v
│   │   │   ├── riscv_lsu.v
│   │   │   ├── riscv_mmu.v
│   │   │   ├── riscv_multiplier.v
│   │   │   ├── riscv_pipe_ctrl.v
│   │   │   ├── riscv_regfile.v
│   │   │   ├── riscv_trace_sim.v
│   │   │   └── riscv_xilinx_2r1w.v
│   │   ├── SCRIPTS
│   │   │   └── run.tcl
│   │   └── WORK
│   │       ├── fv
│   │       │   └── riscv_core
│   │       │       ├── fv_map.fv.json
│   │       │       ├── fv_map.map.do
│   │       │       ├── fv_map.singlebit.original_name.alias.json.gz
│   │       │       ├── fv_map.v.gz
│   │       │       ├── read_libs.tcl
│   │       │       └── rtl_to_fv_map.do
│   │       ├── genus.cmd
│   │       ├── genus.log
│   │       └── rtl_path.f
│   └── TESSENT
│       ├── NETLIST
│       │   └── riscv_core_net.v
│       ├── SCRIPTS
│       │   └── scan_insertion.do
│       ├── Screenshot from 2025-06-28 13-11-12.png
│       └── WORK
│           ├── arpg.log
│           ├── coverage.rep
│           ├── riscv_core_OUTPUTS
│           │   ├── riscv_core_atpg_setup.dofile
│           │   ├── riscv_core_atpg_setup.testproc
│           │   ├── riscv_core_atpg_setup_verify_scan_modes.dofile
│           │   ├── riscv_core_core_description
│           │   └── riscv_core_scan.v
│           ├── riscv_core_REPORTS
│           │   ├── riscv_core_scan_cells.rpt
│           │   ├── riscv_core_scan_chain.rpt
│           │   ├── riscv_core_scan_elements.rpt
│           │   └── riscv_core_scan_enable.rpt
│           ├── scan.log
│           └── tsdb_outdir
│               └── dft_inserted_designs
│                   └── riscv_core_gate.dft_inserted_design
│                       ├── riscv_core.scandef
│                       ├── riscv_core.tcd
│                       ├── riscv_core.tsdb_info
│                       ├── riscv_core.v_interface
│                       └── riscv_core.vg
├── TEMPUS
│   ├── MCRB
│   │   ├── NETLIST
│   │   │   └── mcrb_opt.v
│   │   ├── SDC
│   │   │   └── mcrb.sdc
│   │   ├── scripts
│   │   │   ├── reports.tcl
│   │   │   └── run.tcl
│   │   ├── work
│   │   │   ├── MCRB
│   │   │   │   ├── GENUS
│   │   │   │   │   ├── RTL
│   │   │   │   │   │   └── mcrb.v
│   │   │   │   │   ├── SDC
│   │   │   │   │   │   └── mcrb.sdc
│   │   │   │   │   └── work
│   │   │   │   │       ├── OUTPUTS_Mar11-17:39:35
│   │   │   │   │       │   ├── REPORTS_Mar11-17:39:35
│   │   │   │   │       │   │   ├── final.rpt
│   │   │   │   │       │   │   ├── final_area.rpt
│   │   │   │   │       │   │   ├── final_gates.rpt
│   │   │   │   │       │   │   ├── final_mcrb.db
│   │   │   │   │       │   │   ├── final_qor.rpt
│   │   │   │   │       │   │   ├── final_time.rpt
│   │   │   │   │       │   │   ├── generic
│   │   │   │   │       │   │   │   └── mcrb_datapath.rpt
│   │   │   │   │       │   │   ├── generic_area.rpt
│   │   │   │   │       │   │   ├── generic_gates.rpt
│   │   │   │   │       │   │   ├── generic_mcrb.db
│   │   │   │   │       │   │   ├── generic_qor.rpt
│   │   │   │   │       │   │   ├── generic_time.rpt
│   │   │   │   │       │   │   ├── map
│   │   │   │   │       │   │   │   └── mcrb_datapath.rpt
│   │   │   │   │       │   │   ├── map_area.rpt
│   │   │   │   │       │   │   ├── map_gates.rpt
│   │   │   │   │       │   │   ├── map_mcrb.db
│   │   │   │   │       │   │   ├── map_qor.rpt
│   │   │   │   │       │   │   ├── map_time.rpt
│   │   │   │   │       │   │   ├── mcrb_datapath_incr.rpt
│   │   │   │   │       │   │   ├── mcrb_messages.rpt
│   │   │   │   │       │   │   ├── mcrb_post_opt_time.rpt
│   │   │   │   │       │   │   ├── mcrb_pretim.rpt
│   │   │   │   │       │   │   ├── opt
│   │   │   │   │       │   │   │   └── mcrb_datapath.rpt
│   │   │   │   │       │   │   ├── opt_area.rpt
│   │   │   │   │       │   │   ├── opt_gates.rpt
│   │   │   │   │       │   │   ├── opt_mcrb.db
│   │   │   │   │       │   │   ├── opt_qor.rpt
│   │   │   │   │       │   │   └── opt_time.rpt
│   │   │   │   │       │   ├── intermediate2final.lec.do
│   │   │   │   │       │   ├── mcrb_m.sdc
│   │   │   │   │       │   └── mcrb_opt.v
│   │   │   │   │       ├── flex50.log
│   │   │   │   │       ├── fv
│   │   │   │   │       │   └── mcrb
│   │   │   │   │       │       ├── fv_map.fv.json
│   │   │   │   │       │       ├── fv_map.map.do
│   │   │   │   │       │       ├── fv_map.singlebit.original_name.alias.json.gz
│   │   │   │   │       │       ├── fv_map.v.gz
│   │   │   │   │       │       ├── mcrb_mv.fv.json
│   │   │   │   │       │       ├── mcrb_mv.map.do
│   │   │   │   │       │       ├── mcrb_mv.singlebit.original_name.alias.json.gz
│   │   │   │   │       │       ├── read_libs.tcl
│   │   │   │   │       │       └── rtl_to_fv_map.do
│   │   │   │   │       ├── genus.cmd
│   │   │   │   │       ├── genus.log
│   │   │   │   │       ├── gui_schematic.gif
│   │   │   │   │       ├── gui_schematic.png
│   │   │   │   │       ├── run_synthesis.tcl
│   │   │   │   │       └── top.mtarpt
│   │   │   │   ├── TEMPUS
│   │   │   │   │   ├── NETLIST
│   │   │   │   │   │   └── mcrb_opt.v
│   │   │   │   │   ├── SDC
│   │   │   │   │   │   └── mcrb_m.sdc
│   │   │   │   │   └── work
│   │   │   │   │       ├── RCDB_84225_ddDbR8
│   │   │   │   │       ├── RCDB_86664_LKi1Rn
│   │   │   │   │       ├── REPORTS_Mar12-11:15:21
│   │   │   │   │       │   ├── check_timing_verbose.rpt
│   │   │   │   │       │   ├── clock_crossings.rpt
│   │   │   │   │       │   ├── clock_summary.rpt
│   │   │   │   │       │   ├── designtiming.txt
│   │   │   │   │       │   ├── mcrb_tempus_timing.rep
│   │   │   │   │       │   ├── report_allViolators.rpt
│   │   │   │   │       │   └── report_clock_groups.rpt
│   │   │   │   │       ├── REPORTS_Mar14-15:48:10
│   │   │   │   │       │   ├── category.cat
│   │   │   │   │       │   ├── check_timing_verbose.rpt
│   │   │   │   │       │   ├── clock_crossings.rpt
│   │   │   │   │       │   ├── clock_summary.rpt
│   │   │   │   │       │   ├── report_allViolators.rpt
│   │   │   │   │       │   ├── report_clock_groups.rpt
│   │   │   │   │       │   ├── tempus_mcrb_schematic
│   │   │   │   │       │   └── timing_report.rpt
│   │   │   │   │       ├── category.rpt
│   │   │   │   │       ├── checkdesign.txt
│   │   │   │   │       ├── designtiming.txt
│   │   │   │   │       ├── eco.mtarpt
│   │   │   │   │       ├── flex591.log
│   │   │   │   │       ├── flex664.log
│   │   │   │   │       ├── mcrb.mtarpt
│   │   │   │   │       ├── mcrb.slk
│   │   │   │   │       ├── reports
│   │   │   │   │       │   ├── check_timing_verbose.rpt
│   │   │   │   │       │   ├── clock_crossings.rpt
│   │   │   │   │       │   ├── clock_summary.rpt
│   │   │   │   │       │   ├── report_allViolators.rpt
│   │   │   │   │       │   └── report_clock_groups.rpt
│   │   │   │   │       ├── run.tcl
│   │   │   │   │       ├── tempus.cmd
│   │   │   │   │       ├── tempus.cmd1
│   │   │   │   │       ├── tempus.cmd3
│   │   │   │   │       ├── tempus.log
│   │   │   │   │       ├── tempus.log1
│   │   │   │   │       ├── tempus.log3
│   │   │   │   │       ├── tempus.logv1
│   │   │   │   │       ├── tempus.logv2
│   │   │   │   │       ├── tempus.logv3
│   │   │   │   │       └── top.mtarpt
│   │   │   │   ├── TEMPUS_1
│   │   │   │   │   ├── NETLIST
│   │   │   │   │   │   └── mcrb_opt.v
│   │   │   │   │   ├── SDC
│   │   │   │   │   │   └── mcrb.sdc
│   │   │   │   │   ├── scripts
│   │   │   │   │   │   ├── reports.tcl
│   │   │   │   │   │   └── run.tcl
│   │   │   │   │   └── work
│   │   │   │   │       ├── RCDB_342229_PTXqVv
│   │   │   │   │       ├── RCDB_36075_I12I5e
│   │   │   │   │       ├── eco.mtarpt
│   │   │   │   │       ├── epba_Mar22-12:35:35.rpt
│   │   │   │   │       ├── epba_Mar24-16:32:11.rpt
│   │   │   │   │       ├── errors.txt
│   │   │   │   │       ├── flex229.log
│   │   │   │   │       ├── flex75.log
│   │   │   │   │       ├── flex823.log
│   │   │   │   │       ├── hold_path1
│   │   │   │   │       ├── hold_path1_1
│   │   │   │   │       ├── holdslack.txt
│   │   │   │   │       ├── input_output.slk
│   │   │   │   │       ├── input_output.tarpt
│   │   │   │   │       ├── input_register.slk
│   │   │   │   │       ├── input_register.tarpt
│   │   │   │   │       ├── mcr_tempus_schematic
│   │   │   │   │       ├── mcrb.slk
│   │   │   │   │       ├── register_output.slk
│   │   │   │   │       ├── register_output.tarpt
│   │   │   │   │       ├── register_register.slk
│   │   │   │   │       ├── register_register.tarpt
│   │   │   │   │       ├── reports_Mar22-12:35:35
│   │   │   │   │       │   ├── allviol.rpt
│   │   │   │   │       │   ├── analysis_summary.rpt
│   │   │   │   │       │   ├── annotated.rpt
│   │   │   │   │       │   ├── case_analysis.rpt
│   │   │   │   │       │   ├── check_design.rpt
│   │   │   │   │       │   ├── check_timing.rpt
│   │   │   │   │       │   ├── clocks.rpt
│   │   │   │   │       │   ├── coverage.rpt
│   │   │   │   │       │   ├── hold_1.rpt
│   │   │   │   │       │   ├── hold_100.rpt
│   │   │   │   │       │   ├── hold_100.rpt.gz
│   │   │   │   │       │   ├── inactive_arcs.rpt
│   │   │   │   │       │   ├── pba_50_paths.rpt
│   │   │   │   │       │   ├── setup_1.rpt
│   │   │   │   │       │   ├── setup_100.rpt.gz
│   │   │   │   │       │   ├── start_end_slack.rpt
│   │   │   │   │       │   ├── worst_max_path.rpt
│   │   │   │   │       │   └── worst_min_path.rpt
│   │   │   │   │       ├── reports_Mar24-16:32:11
│   │   │   │   │       │   ├── allviol.rpt
│   │   │   │   │       │   ├── analysis_summary.rpt
│   │   │   │   │       │   ├── annotated.rpt
│   │   │   │   │       │   ├── case_analysis.rpt
│   │   │   │   │       │   ├── check_design.rpt
│   │   │   │   │       │   ├── check_timing.rpt
│   │   │   │   │       │   ├── clocks.rpt
│   │   │   │   │       │   ├── coverage.rpt
│   │   │   │   │       │   ├── hold_1.rpt
│   │   │   │   │       │   ├── hold_100.rpt.gz
│   │   │   │   │       │   ├── inactive_arcs.rpt
│   │   │   │   │       │   ├── pba_50_paths.rpt
│   │   │   │   │       │   ├── setup_1.rpt
│   │   │   │   │       │   ├── setup_100.rpt.gz
│   │   │   │   │       │   ├── start_end_slack.rpt
│   │   │   │   │       │   ├── worst_max_path.rpt
│   │   │   │   │       │   └── worst_min_path.rpt
│   │   │   │   │       ├── setupslack.txt
│   │   │   │   │       ├── slack_summary.rpt
│   │   │   │   │       ├── tempus.cmd
│   │   │   │   │       ├── tempus.cmd2
│   │   │   │   │       ├── tempus.log
│   │   │   │   │       ├── tempus.log1
│   │   │   │   │       ├── tempus.log2
│   │   │   │   │       ├── tempus.logv
│   │   │   │   │       ├── tempus.logv1
│   │   │   │   │       ├── tempus.logv2
│   │   │   │   │       └── top.mtarpt
│   │   │   │   └── Tessent
│   │   │   │       ├── NETLIST
│   │   │   │       │   └── mcrb_opt.v
│   │   │   │       ├── output
│   │   │   │       │   ├── mcrb_scan_cells.txt
│   │   │   │       │   ├── mcrb_scan_chains.txt
│   │   │   │       │   ├── mcrb_scan_elements.txt
│   │   │   │       │   ├── mcrb_scan_enable.txt
│   │   │   │       │   └── mcrb_tessent_scan_net.v
│   │   │   │       └── work
│   │   │   │           ├── mcrb_scan.v
│   │   │   │           ├── run.do
│   │   │   │           ├── schematic.pdf
│   │   │   │           └── tessent.log
│   │   │   ├── RCDB_84225_ddDbR8
│   │   │   ├── RCDB_86664_LKi1Rn
│   │   │   ├── REPORTS_Mar12-11:15:21
│   │   │   │   ├── check_timing_verbose.rpt
│   │   │   │   ├── clock_crossings.rpt
│   │   │   │   ├── clock_summary.rpt
│   │   │   │   ├── designtiming.txt
│   │   │   │   ├── mcrb_tempus_timing.rep
│   │   │   │   ├── report_allViolators.rpt
│   │   │   │   └── report_clock_groups.rpt
│   │   │   ├── REPORTS_Mar14-15:48:10
│   │   │   │   ├── category.cat
│   │   │   │   ├── check_timing_verbose.rpt
│   │   │   │   ├── clock_crossings.rpt
│   │   │   │   ├── clock_summary.rpt
│   │   │   │   ├── report_allViolators.rpt
│   │   │   │   ├── report_clock_groups.rpt
│   │   │   │   ├── tempus_mcrb_schematic
│   │   │   │   └── timing_report.rpt
│   │   │   ├── category.rpt
│   │   │   ├── checkdesign.txt
│   │   │   ├── designtiming.txt
│   │   │   ├── eco.mtarpt
│   │   │   ├── flex591.log
│   │   │   ├── flex664.log
│   │   │   ├── mcrb.mtarpt
│   │   │   ├── mcrb.slk
│   │   │   ├── reports
│   │   │   │   ├── check_timing_verbose.rpt
│   │   │   │   ├── clock_crossings.rpt
│   │   │   │   ├── clock_summary.rpt
│   │   │   │   ├── report_allViolators.rpt
│   │   │   │   └── report_clock_groups.rpt
│   │   │   ├── run.tcl
│   │   │   ├── tempus.cmd
│   │   │   ├── tempus.cmd1
│   │   │   ├── tempus.cmd3
│   │   │   ├── tempus.log
│   │   │   ├── tempus.log1
│   │   │   ├── tempus.log3
│   │   │   ├── tempus.logv1
│   │   │   ├── tempus.logv2
│   │   │   ├── tempus.logv3
│   │   │   └── top.mtarpt
│   │   └── work_1
│   │       ├── RCDB_342229_PTXqVv
│   │       ├── RCDB_36075_I12I5e
│   │       ├── eco.mtarpt
│   │       ├── epba_Mar22-12:35:35.rpt
│   │       ├── epba_Mar24-16:32:11.rpt
│   │       ├── errors.txt
│   │       ├── flex229.log
│   │       ├── flex75.log
│   │       ├── flex823.log
│   │       ├── hold_path1
│   │       ├── hold_path1_1
│   │       ├── holdslack.txt
│   │       ├── input_output.slk
│   │       ├── input_output.tarpt
│   │       ├── input_register.slk
│   │       ├── input_register.tarpt
│   │       ├── mcr_tempus_schematic
│   │       ├── mcrb.slk
│   │       ├── register_output.slk
│   │       ├── register_output.tarpt
│   │       ├── register_register.slk
│   │       ├── register_register.tarpt
│   │       ├── reports_Mar22-12:35:35
│   │       │   ├── allviol.rpt
│   │       │   ├── analysis_summary.rpt
│   │       │   ├── annotated.rpt
│   │       │   ├── case_analysis.rpt
│   │       │   ├── check_design.rpt
│   │       │   ├── check_timing.rpt
│   │       │   ├── clocks.rpt
│   │       │   ├── coverage.rpt
│   │       │   ├── hold_1.rpt
│   │       │   ├── hold_100.rpt
│   │       │   ├── hold_100.rpt.gz
│   │       │   ├── inactive_arcs.rpt
│   │       │   ├── pba_50_paths.rpt
│   │       │   ├── setup_1.rpt
│   │       │   ├── setup_100.rpt.gz
│   │       │   ├── start_end_slack.rpt
│   │       │   ├── worst_max_path.rpt
│   │       │   └── worst_min_path.rpt
│   │       ├── reports_Mar24-16:32:11
│   │       │   ├── allviol.rpt
│   │       │   ├── analysis_summary.rpt
│   │       │   ├── annotated.rpt
│   │       │   ├── case_analysis.rpt
│   │       │   ├── check_design.rpt
│   │       │   ├── check_timing.rpt
│   │       │   ├── clocks.rpt
│   │       │   ├── coverage.rpt
│   │       │   ├── hold_1.rpt
│   │       │   ├── hold_100.rpt.gz
│   │       │   ├── inactive_arcs.rpt
│   │       │   ├── pba_50_paths.rpt
│   │       │   ├── setup_1.rpt
│   │       │   ├── setup_100.rpt.gz
│   │       │   ├── start_end_slack.rpt
│   │       │   ├── worst_max_path.rpt
│   │       │   └── worst_min_path.rpt
│   │       ├── setupslack.txt
│   │       ├── slack_summary.rpt
│   │       ├── tempus.cmd
│   │       ├── tempus.cmd2
│   │       ├── tempus.log
│   │       ├── tempus.log1
│   │       ├── tempus.log2
│   │       ├── tempus.logv
│   │       ├── tempus.logv1
│   │       ├── tempus.logv2
│   │       └── top.mtarpt
│   ├── S298
│   │   ├── NETLIST
│   │   │   ├── s298_opt.v
│   │   │   └── s298_tessent_scan_net.v
│   │   ├── SDC
│   │   │   ├── s298.sdc
│   │   │   └── s298_m.sdc
│   │   └── work
│   │       ├── OUTPUTS_Mar12-15:21:41
│   │       │   ├── REPORTS_Mar12-15:21:41
│   │       │   │   ├── final.rpt
│   │       │   │   ├── final_area.rpt
│   │       │   │   ├── final_gates.rpt
│   │       │   │   ├── final_qor.rpt
│   │       │   │   ├── final_s298.db
│   │       │   │   ├── final_time.rpt
│   │       │   │   ├── generic
│   │       │   │   │   └── s298_datapath.rpt
│   │       │   │   ├── generic_area.rpt
│   │       │   │   ├── generic_gates.rpt
│   │       │   │   ├── generic_qor.rpt
│   │       │   │   ├── generic_s298.db
│   │       │   │   ├── generic_time.rpt
│   │       │   │   ├── map
│   │       │   │   │   └── s298_datapath.rpt
│   │       │   │   ├── map_area.rpt
│   │       │   │   ├── map_gates.rpt
│   │       │   │   ├── map_qor.rpt
│   │       │   │   ├── map_s298.db
│   │       │   │   ├── map_time.rpt
│   │       │   │   ├── opt
│   │       │   │   │   └── s298_datapath.rpt
│   │       │   │   ├── opt_area.rpt
│   │       │   │   ├── opt_gates.rpt
│   │       │   │   ├── opt_qor.rpt
│   │       │   │   ├── opt_s298.db
│   │       │   │   ├── opt_time.rpt
│   │       │   │   ├── s298_datapath_incr.rpt
│   │       │   │   ├── s298_messages.rpt
│   │       │   │   ├── s298_post_opt_time.rpt
│   │       │   │   └── s298_pretim.rpt
│   │       │   ├── intermediate2final.lec.do
│   │       │   ├── s298_m.sdc
│   │       │   └── s298_opt.v
│   │       ├── TEMPUS_REPORTS_Mar12-15:29:14
│   │       │   ├── check_timing_verbose.rpt
│   │       │   ├── clock_crossings.rpt
│   │       │   ├── clock_summary.rpt
│   │       │   ├── coverage.rep
│   │       │   ├── report_allViolators.rpt
│   │       │   ├── report_clock_groups.rpt
│   │       │   ├── s298_checkdesign.txt
│   │       │   ├── s298_tempus_netlist.v
│   │       │   ├── summary_analysis.rep
│   │       │   ├── tempus_s298.sdc
│   │       │   └── writedesigntiming.rep
│   │       ├── checkDesign
│   │       │   ├── checknetlist.rpt
│   │       │   ├── floatingIO.main.htm
│   │       │   ├── floatingPort.main.htm
│   │       │   ├── instTerm.main.htm
│   │       │   ├── noOutputNet.main.htm
│   │       │   ├── nonIoInst.main.htm
│   │       │   ├── pgTermConnectivity.main.htm
│   │       │   ├── port2Core.main.htm
│   │       │   ├── s298.main.htm
│   │       │   ├── s298.main.htm.ascii
│   │       │   ├── s298_cell.list
│   │       │   └── unplacedIO.main.htm
│   │       ├── constr.pt
│   │       ├── netlist_stats.txt
│   │       ├── s298.mtarpt
│   │       ├── s298.slk
│   │       ├── s298_scan_tempus_schematic
│   │       ├── tempus.cmd
│   │       ├── tempus.log
│   │       ├── tempus.logv
│   │       └── top.mtarpt
│   ├── cpu_sys
│   │   ├── RTL
│   │   │   ├── cpu_sys.v
│   │   │   └── cpu_sys_emep_top.vg
│   │   ├── SDC
│   │   │   └── cpu_sys.sdc
│   │   ├── scripts
│   │   │   ├── reports.tcl
│   │   │   └── run.tcl
│   │   ├── work
│   │   │   ├── RCDB_9490_RbJyPq
│   │   │   ├── Script.txt
│   │   │   ├── clock_details.txt
│   │   │   ├── clocks_details.txt
│   │   │   ├── cpu_sys_analysis_report.txt
│   │   │   ├── flex490.log
│   │   │   ├── flops.txt
│   │   │   ├── instancecount.txt
│   │   │   ├── q5.txt
│   │   │   ├── run.tcl
│   │   │   ├── tempus.cmd
│   │   │   ├── tempus.log
│   │   │   └── tempus.logv
│   │   ├── work_
│   │   │   ├── RCDB_13921_wihacz
│   │   │   ├── RCDB_22343_vxqfVF
│   │   │   ├── cell_type.txt
│   │   │   ├── clock_source.rpt
│   │   │   ├── commands.tcl
│   │   │   ├── cpu_sys_analysis_report.txt
│   │   │   ├── flex343.log
│   │   │   ├── flex921.log
│   │   │   ├── run.tcl
│   │   │   ├── tempus.cmd
│   │   │   ├── tempus.cmd1
│   │   │   ├── tempus.log1
│   │   │   └── tempus.logv1
│   │   └── work_cpusys
│   │       ├── clocks.rpt
│   │       ├── cpu_sys_emep_top.vg
│   │       ├── reports_tcl.txt
│   │       ├── tempus.cmd
│   │       ├── tempus.cmd7
│   │       ├── tempus.cmd8
│   │       ├── tempus.log1
│   │       ├── tempus.log7
│   │       ├── tempus.log8
│   │       ├── tempus.logv7
│   │       ├── tempus.logv8
│   │       └── timing_reports
│   │           ├── DPRAM_512x24
│   │           │   └── u_sram24_1_u_dpram_512x24
│   │           │       ├── A1
│   │           │       │   └── A1.txt
│   │           │       ├── A2
│   │           │       │   └── A2.txt
│   │           │       ├── CE1
│   │           │       │   └── CE1.txt
│   │           │       ├── CE2
│   │           │       │   └── CE2.txt
│   │           │       ├── CSB1
│   │           │       │   └── CSB1.txt
│   │           │       ├── CSB2
│   │           │       │   └── CSB2.txt
│   │           │       └── I2
│   │           │           └── I2.txt
│   │           ├── SPRAM_64x32
│   │           │   └── mem_banks[0].u_sram_my_sram
│   │           │       ├── A
│   │           │       │   └── A.txt
│   │           │       ├── CE
│   │           │       │   └── CE.txt
│   │           │       ├── CSB
│   │           │       │   └── CSB.txt
│   │           │       ├── I
│   │           │       │   └── I.txt
│   │           │       └── WEB
│   │           │           └── WEB.txt
│   │           ├── SPRAM_8192x36
│   │           │   └── u_bank0_my_sram
│   │           │       ├── A
│   │           │       │   └── A.txt
│   │           │       ├── CE
│   │           │       │   └── CE.txt
│   │           │       ├── CSB
│   │           │       │   └── CSB.txt
│   │           │       ├── I
│   │           │       │   └── I.txt
│   │           │       └── WEB
│   │           │           └── WEB.txt
│   │           ├── rd3_256x8
│   │           │   └── u_rd3_0_u_dpram_256x8
│   │           │       ├── A1
│   │           │       │   └── A1.txt
│   │           │       ├── A2
│   │           │       │   └── A2.txt
│   │           │       ├── CE1
│   │           │       │   └── CE1.txt
│   │           │       ├── CE2
│   │           │       │   └── CE2.txt
│   │           │       ├── CSB1
│   │           │       │   └── CSB1.txt
│   │           │       ├── CSB2
│   │           │       │   └── CSB2.txt
│   │           │       └── I2
│   │           │           └── I2.txt
│   │           ├── rd3_512x16
│   │           │   └── u_sram16_1_u_dpram_512x16
│   │           │       ├── A1
│   │           │       │   └── A1.txt
│   │           │       ├── A2
│   │           │       │   └── A2.txt
│   │           │       ├── CE1
│   │           │       │   └── CE1.txt
│   │           │       ├── CE2
│   │           │       │   └── CE2.txt
│   │           │       ├── CSB1
│   │           │       │   └── CSB1.txt
│   │           │       ├── CSB2
│   │           │       │   └── CSB2.txt
│   │           │       └── I2
│   │           │           └── I2.txt
│   │           ├── spram_8192_5
│   │           │   └── gen_banks[0].u_sram5_my_sram
│   │           │       ├── A
│   │           │       │   └── A.txt
│   │           │       ├── CEB
│   │           │       │   └── CEB.txt
│   │           │       ├── CSB
│   │           │       │   └── CSB.txt
│   │           │       ├── I
│   │           │       │   └── I.txt
│   │           │       └── WEB
│   │           │           └── WEB.txt
│   │           └── spram_8192_7
│   │               └── gen_banks[0].u_sram7_0_my_sram
│   │                   ├── A
│   │                   │   └── A.txt
│   │                   ├── CEB
│   │                   │   └── CEB.txt
│   │                   ├── CSB
│   │                   │   └── CSB.txt
│   │                   ├── I
│   │                   │   └── I.txt
│   │                   └── WEB
│   │                       └── WEB.txt
│   ├── momal
│   │   ├── _momal_final_scan_def.def
│   │   ├── momal.cfp
│   │   ├── momal.sdc
│   │   ├── momal_route.v
│   │   ├── momal_scan.v
│   │   ├── sdff.v
│   │   ├── work
│   │   │   ├── RCDB_16126_EloLhg
│   │   │   ├── commands.txt
│   │   │   ├── connectivity.txt
│   │   │   ├── endcell.txt
│   │   │   ├── flex126.log
│   │   │   ├── flex400.log
│   │   │   ├── partition.rep
│   │   │   ├── run.tcl
│   │   │   ├── scanChain.rpt
│   │   │   ├── scan_in_ports.txt
│   │   │   ├── scantrace.rep
│   │   │   ├── tempus.cmd
│   │   │   ├── tempus.cmd1
│   │   │   ├── tempus.log
│   │   │   ├── tempus.log1
│   │   │   ├── tempus.logv
│   │   │   └── tempus.logv1
│   │   └── work_
│   │       ├── connectivity.txt
│   │       ├── flex401.log
│   │       ├── flex868.log
│   │       ├── momal
│   │       ├── momal.cfp
│   │       ├── momal.conn.rpt
│   │       ├── momal.dat
│   │       │   ├── AAE
│   │       │   │   ├── AggDrvModel0thread
│   │       │   │   ├── AggDrvModel0thread_sanity
│   │       │   │   ├── datumArray0thView0thread
│   │       │   │   ├── datumArray0thView0thread_sanity
│   │       │   │   ├── default_emulate_view.clkinfo.dat
│   │       │   │   ├── default_emulate_view.deltaSlew.dat
│   │       │   │   ├── default_emulate_view.deltaSlew.dat_sanity
│   │       │   │   ├── default_emulate_view.glitchThresholds.dat
│   │       │   │   ├── default_emulate_view.glitchThresholds.dat_sanity
│   │       │   │   ├── eosdbAr.dat
│   │       │   │   ├── eosdbAr.dat_sanity
│   │       │   │   ├── eosdbNetPropAr.dat
│   │       │   │   ├── eosdbNetPropAr.dat_sanity
│   │       │   │   ├── eosdbPreProc1.dat
│   │       │   │   ├── eosdbPreProc1.dat_sanity
│   │       │   │   ├── eosdbPreProc2.dat
│   │       │   │   ├── eosdbPreProc2.dat_sanity
│   │       │   │   ├── eosdbTermPropAr.dat
│   │       │   │   ├── eosdbTermPropAr.dat_sanity
│   │       │   │   ├── esiEosdbAr.dat
│   │       │   │   ├── etsHashDataAr.dat
│   │       │   │   ├── netMapAr1.dat
│   │       │   │   ├── netMapAr2.dat
│   │       │   │   ├── netMiscProps0thread
│   │       │   │   ├── netMiscProps0thread_sanity
│   │       │   │   ├── netlistInfo.dat
│   │       │   │   ├── netlistInfo.dat_sanity
│   │       │   │   ├── preproc.dat
│   │       │   │   ├── preproc.dat_sanity
│   │       │   │   ├── termCurrentTd0thread
│   │       │   │   ├── termCurrentTd0thread_sanity
│   │       │   │   ├── termMapAr1.dat
│   │       │   │   ├── termMapAr2.dat
│   │       │   │   ├── termViewMiscProps0thread
│   │       │   │   ├── termViewMiscProps0thread_sanity
│   │       │   │   ├── termlistInfo.dat
│   │       │   │   ├── termlistInfo.dat_sanity
│   │       │   │   ├── vaMgrAr.dat
│   │       │   │   └── versionAr.dat
│   │       │   ├── def
│   │       │   │   └── momal.def -> ../momal.def
│   │       │   ├── gui.pref.tcl
│   │       │   ├── inn.cmd.gz
│   │       │   ├── libs
│   │       │   │   ├── lef
│   │       │   │   │   └── NangateOpenCellLibrary.lef -> /home/01fe21bec223/DFT/DFT/momal-20250404T051135Z-001/momal/NangateOpenCellLibrary.lef
│   │       │   │   ├── lib
│   │       │   │   │   └── typ
│   │       │   │   │       └── NangateOpenCellLibrary_slow_conditional_ccs.lib -> /home/01fe21bec223/DFT/DFT/momal-20250404T051135Z-001/momal/NangateOpenCellLibrary_slow_conditional_ccs.lib
│   │       │   │   └── misc
│   │       │   │       ├── momal.epsglobals
│   │       │   │       └── momal_scan_def.def -> /home/01fe21bec223/DFT/DFT/momal-20250404T051135Z-001/momal/momal_scan_def.def
│   │       │   ├── momal.aae.settings
│   │       │   ├── momal.dbinfo
│   │       │   ├── momal.def
│   │       │   ├── momal.globals
│   │       │   ├── momal.init
│   │       │   ├── momal.mode
│   │       │   ├── momal.opconds
│   │       │   ├── momal.prop
│   │       │   ├── momal.symtbl.gz
│   │       │   ├── momal.tgz
│   │       │   ├── momal.tpsglobals
│   │       │   ├── momal.tpsglobals.designload
│   │       │   ├── momal.v.bin
│   │       │   ├── momal.v.bin_lib
│   │       │   ├── momal_power_constraints.tcl
│   │       │   └── viewDefinition.tcl
│   │       ├── outputs
│   │       │   ├── allviol.rpt
│   │       │   ├── analysis_summary.rpt
│   │       │   ├── case_analysis.rpt
│   │       │   ├── check_design.rpt
│   │       │   ├── check_timing.rpt
│   │       │   ├── clocks.rpt
│   │       │   ├── coverage.rpt
│   │       │   ├── hold_1.rpt
│   │       │   ├── hold_100.rpt
│   │       │   ├── hold_100.rpt.gz
│   │       │   ├── inactive_arcs.rpt
│   │       │   ├── pba_50_paths.rpt
│   │       │   ├── setup_1.rpt
│   │       │   ├── setup_100.rpt
│   │       │   ├── setup_100.rpt.gz
│   │       │   ├── start_end_slack.rpt
│   │       │   ├── worst_max_path.rpt
│   │       │   └── worst_min_path.rpt
│   │       ├── partition.txt
│   │       ├── reports.tcl
│   │       ├── scanChain.rpt
│   │       ├── scantrace.txt
│   │       ├── tempus.cmd
│   │       ├── tempus.cmd1
│   │       ├── tempus.log
│   │       ├── tempus.log1
│   │       ├── tempus.logv
│   │       └── tempus.logv1
│   └── vorca
│       ├── Netlist
│       │   ├── scan_netlist.v
│       │   ├── vorca.cfp
│       │   ├── vorca.v
│       │   └── vorca_fixed.v
│       ├── scripts
│       │   ├── reports.tcl
│       │   └── run.tcl
│       ├── work
│       │   ├── RCDB_13769_xTSz8s
│       │   ├── all_inputs.txt
│       │   ├── all_outputs.txt
│       │   ├── all_registers.txt
│       │   ├── commands.tcl
│       │   ├── connection_class.rep
│       │   ├── fanin.dot
│       │   ├── fanin.png
│       │   ├── fanout.dot
│       │   ├── fanout.png
│       │   ├── fanouts.txt
│       │   ├── flex614.log
│       │   ├── flex769.log
│       │   ├── flex944.log
│       │   ├── i_hb_sup.dot
│       │   ├── i_hb_sup.txt
│       │   ├── i_hb_sup_fanout.png
│       │   ├── pathgroup.rpt
│       │   ├── reports.tcl
│       │   ├── reports_Apr04-10:17:39
│       │   │   ├── allviol.rpt
│       │   │   ├── analysis_summary.rpt
│       │   │   ├── case_analysis.rpt
│       │   │   ├── check_design.rpt
│       │   │   ├── check_timing.rpt
│       │   │   ├── clocks.rpt
│       │   │   ├── coverage.rpt
│       │   │   ├── hold_1.rpt
│       │   │   ├── hold_100.rpt.gz
│       │   │   ├── inactive_arcs.rpt
│       │   │   ├── pba_50_paths.rpt
│       │   │   ├── setup_1.rpt
│       │   │   ├── setup_100.rpt.gz
│       │   │   ├── start_end_slack.rpt
│       │   │   ├── worst_max_path.rpt
│       │   │   └── worst_min_path.rpt
│       │   ├── run.tcl
│       │   ├── scanChain.rpt
│       │   ├── scanchain.txt
│       │   ├── tempus.cmd
│       │   ├── tempus.cmd1
│       │   ├── tempus.cmd2
│       │   ├── tempus.log
│       │   ├── tempus.log2
│       │   ├── tempus.logv
│       │   ├── tempus.logv1
│       │   ├── tempus.logv2
│       │   ├── vorca
│       │   ├── vorca.dat
│       │   │   ├── AAE
│       │   │   │   ├── AggDrvModel0thread
│       │   │   │   ├── AggDrvModel0thread_sanity
│       │   │   │   ├── datumArray0thView0thread
│       │   │   │   ├── datumArray0thView0thread_sanity
│       │   │   │   ├── default_emulate_view.clkinfo.dat
│       │   │   │   ├── default_emulate_view.deltaSlew.dat
│       │   │   │   ├── default_emulate_view.deltaSlew.dat_sanity
│       │   │   │   ├── default_emulate_view.glitchThresholds.dat
│       │   │   │   ├── default_emulate_view.glitchThresholds.dat_sanity
│       │   │   │   ├── eosdbAr.dat
│       │   │   │   ├── eosdbAr.dat_sanity
│       │   │   │   ├── eosdbNetPropAr.dat
│       │   │   │   ├── eosdbNetPropAr.dat_sanity
│       │   │   │   ├── eosdbPreProc1.dat
│       │   │   │   ├── eosdbPreProc1.dat_sanity
│       │   │   │   ├── eosdbPreProc2.dat
│       │   │   │   ├── eosdbPreProc2.dat_sanity
│       │   │   │   ├── eosdbTermPropAr.dat
│       │   │   │   ├── eosdbTermPropAr.dat_sanity
│       │   │   │   ├── esiEosdbAr.dat
│       │   │   │   ├── etsHashDataAr.dat
│       │   │   │   ├── netMapAr1.dat
│       │   │   │   ├── netMapAr2.dat
│       │   │   │   ├── netMiscProps0thread
│       │   │   │   ├── netMiscProps0thread_sanity
│       │   │   │   ├── netlistInfo.dat
│       │   │   │   ├── netlistInfo.dat_sanity
│       │   │   │   ├── preproc.dat
│       │   │   │   ├── preproc.dat_sanity
│       │   │   │   ├── termCurrentTd0thread
│       │   │   │   ├── termCurrentTd0thread_sanity
│       │   │   │   ├── termMapAr1.dat
│       │   │   │   ├── termMapAr2.dat
│       │   │   │   ├── termViewMiscProps0thread
│       │   │   │   ├── termViewMiscProps0thread_sanity
│       │   │   │   ├── termlistInfo.dat
│       │   │   │   ├── termlistInfo.dat_sanity
│       │   │   │   ├── vaMgrAr.dat
│       │   │   │   └── versionAr.dat
│       │   │   ├── gui.pref.tcl
│       │   │   ├── inn.cmd
│       │   │   ├── inn.cmd.gz
│       │   │   ├── libs
│       │   │   │   ├── lib
│       │   │   │   │   └── typ
│       │   │   │   │       └── slow.lib -> /home/01fe21bec223/DFT/DFT/vorca/Tech_files/slow.lib
│       │   │   │   └── misc
│       │   │   │       └── vorca.epsglobals
│       │   │   ├── viewDefinition.tcl
│       │   │   ├── vorca.aae.settings
│       │   │   ├── vorca.db_preserve.gz
│       │   │   ├── vorca.dbinfo
│       │   │   ├── vorca.globals
│       │   │   ├── vorca.init
│       │   │   ├── vorca.mode
│       │   │   ├── vorca.opconds
│       │   │   ├── vorca.tgz
│       │   │   ├── vorca.tpsglobals
│       │   │   ├── vorca.tpsglobals.designload
│       │   │   ├── vorca.v.bin
│       │   │   ├── vorca.v.bin_lib
│       │   │   └── vorca_power_constraints.tcl
│       │   └── vorca.slk
│       ├── work2
│       │   ├── epba_Apr07-11:27:48.rpt
│       │   ├── epba_Apr07-15:30:19.rpt
│       │   ├── fouts
│       │   ├── reports.tcl
│       │   ├── reports_Apr07-11:27:48
│       │   │   ├── allviol.rpt
│       │   │   ├── analysis_summary.rpt
│       │   │   ├── case_analysis.rpt
│       │   │   ├── check_design.rpt
│       │   │   ├── check_timing.rpt
│       │   │   ├── clocks.rpt
│       │   │   ├── coverage.rpt
│       │   │   ├── hold_1.rpt
│       │   │   ├── hold_100.rpt.gz
│       │   │   ├── inactive_arcs.rpt
│       │   │   ├── pba_50_paths.rpt
│       │   │   ├── setup_1.rpt
│       │   │   ├── setup_100.rpt.gz
│       │   │   ├── start_end_slack.rpt
│       │   │   ├── worst_max_path.rpt
│       │   │   └── worst_min_path.rpt
│       │   ├── reports_Apr07-15:30:19
│       │   │   ├── allviol.rpt
│       │   │   ├── analysis_summary.rpt
│       │   │   ├── case_analysis.rpt
│       │   │   ├── check_design.rpt
│       │   │   ├── check_timing.rpt
│       │   │   ├── clocks.rpt
│       │   │   ├── coverage.rpt
│       │   │   ├── hold_1.rpt
│       │   │   ├── hold_100.rpt.gz
│       │   │   ├── inactive_arcs.rpt
│       │   │   ├── pba_50_paths.rpt
│       │   │   ├── setup_1.rpt
│       │   │   ├── setup_100.rpt.gz
│       │   │   ├── start_end_slack.rpt
│       │   │   ├── worst_max_path.rpt
│       │   │   └── worst_min_path.rpt
│       │   ├── run.tcl
│       │   ├── scan_chain_schematic
│       │   ├── sch
│       │   ├── schan_chain
│       │   ├── tempus.cmd
│       │   ├── tempus.cmd1
│       │   ├── tempus.log
│       │   ├── tempus.log1
│       │   ├── tempus.logv
│       │   └── tempus.logv1
│       ├── work3
│       │   ├── epba_Apr11-11:14:20.rpt
│       │   ├── epba_Apr11-14:08:46.rpt
│       │   ├── epba_Apr11-18:04:06.rpt
│       │   ├── reports.tcl
│       │   ├── reports_Apr11-11:14:20
│       │   │   ├── allviol.rpt
│       │   │   ├── analysis_summary.rpt
│       │   │   ├── case_analysis.rpt
│       │   │   ├── check_design.rpt
│       │   │   ├── check_timing.rpt
│       │   │   ├── clocks.rpt
│       │   │   ├── coverage.rpt
│       │   │   ├── hold_1.rpt
│       │   │   ├── hold_100.rpt.gz
│       │   │   ├── inactive_arcs.rpt
│       │   │   ├── pba_50_paths.rpt
│       │   │   ├── setup_1.rpt
│       │   │   ├── setup_100.rpt.gz
│       │   │   ├── start_end_slack.rpt
│       │   │   ├── worst_max_path.rpt
│       │   │   └── worst_min_path.rpt
│       │   ├── reports_Apr11-14:08:46
│       │   │   ├── allviol.rpt
│       │   │   ├── analysis_summary.rpt
│       │   │   ├── case_analysis.rpt
│       │   │   ├── check_design.rpt
│       │   │   ├── check_timing.rpt
│       │   │   ├── clocks.rpt
│       │   │   ├── coverage.rpt
│       │   │   ├── hold_1.rpt
│       │   │   ├── hold_100.rpt.gz
│       │   │   ├── inactive_arcs.rpt
│       │   │   ├── pba_50_paths.rpt
│       │   │   ├── setup_1.rpt
│       │   │   ├── setup_100.rpt.gz
│       │   │   ├── start_end_slack.rpt
│       │   │   ├── worst_max_path.rpt
│       │   │   └── worst_min_path.rpt
│       │   ├── reports_Apr11-18:04:06
│       │   │   ├── allviol.rpt
│       │   │   ├── analysis_summary.rpt
│       │   │   ├── case_analysis.rpt
│       │   │   ├── check_design.rpt
│       │   │   ├── check_timing.rpt
│       │   │   ├── clocks.rpt
│       │   │   ├── coverage.rpt
│       │   │   ├── hold_1.rpt
│       │   │   ├── hold_100.rpt.gz
│       │   │   ├── inactive_arcs.rpt
│       │   │   ├── pba_50_paths.rpt
│       │   │   ├── setup_1.rpt
│       │   │   ├── setup_100.rpt.gz
│       │   │   ├── start_end_slack.rpt
│       │   │   ├── worst_max_path.rpt
│       │   │   └── worst_min_path.rpt
│       │   ├── run.tcl
│       │   ├── tempus.cmd
│       │   ├── tempus.cmd1
│       │   ├── tempus.cmd2
│       │   ├── tempus.cmd3
│       │   ├── tempus.log
│       │   ├── tempus.log1
│       │   ├── tempus.log2
│       │   ├── tempus.log3
│       │   ├── tempus.logv
│       │   ├── tempus.logv1
│       │   ├── tempus.logv2
│       │   ├── tempus.logv3
│       │   ├── top.mtarpt
│       │   ├── vorca
│       │   ├── vorca.dat
│       │   │   ├── AAE
│       │   │   │   ├── AggDrvModel0thread
│       │   │   │   ├── AggDrvModel0thread_sanity
│       │   │   │   ├── datumArray0thView0thread
│       │   │   │   ├── datumArray0thView0thread_sanity
│       │   │   │   ├── default_emulate_view.clkinfo.dat
│       │   │   │   ├── default_emulate_view.deltaSlew.dat
│       │   │   │   ├── default_emulate_view.deltaSlew.dat_sanity
│       │   │   │   ├── default_emulate_view.glitchThresholds.dat
│       │   │   │   ├── default_emulate_view.glitchThresholds.dat_sanity
│       │   │   │   ├── eosdbAr.dat
│       │   │   │   ├── eosdbAr.dat_sanity
│       │   │   │   ├── eosdbNetPropAr.dat
│       │   │   │   ├── eosdbNetPropAr.dat_sanity
│       │   │   │   ├── eosdbPreProc1.dat
│       │   │   │   ├── eosdbPreProc1.dat_sanity
│       │   │   │   ├── eosdbPreProc2.dat
│       │   │   │   ├── eosdbPreProc2.dat_sanity
│       │   │   │   ├── eosdbTermPropAr.dat
│       │   │   │   ├── eosdbTermPropAr.dat_sanity
│       │   │   │   ├── esiEosdbAr.dat
│       │   │   │   ├── etsHashDataAr.dat
│       │   │   │   ├── netMapAr1.dat
│       │   │   │   ├── netMapAr2.dat
│       │   │   │   ├── netMiscProps0thread
│       │   │   │   ├── netMiscProps0thread_sanity
│       │   │   │   ├── netlistInfo.dat
│       │   │   │   ├── netlistInfo.dat_sanity
│       │   │   │   ├── preproc.dat
│       │   │   │   ├── preproc.dat_sanity
│       │   │   │   ├── termCurrentTd0thread
│       │   │   │   ├── termCurrentTd0thread_sanity
│       │   │   │   ├── termMapAr1.dat
│       │   │   │   ├── termMapAr2.dat
│       │   │   │   ├── termViewMiscProps0thread
│       │   │   │   ├── termViewMiscProps0thread_sanity
│       │   │   │   ├── termlistInfo.dat
│       │   │   │   ├── termlistInfo.dat_sanity
│       │   │   │   ├── vaMgrAr.dat
│       │   │   │   └── versionAr.dat
│       │   │   ├── gui.pref.tcl
│       │   │   ├── inn.cmd
│       │   │   ├── inn.cmd.gz
│       │   │   ├── libs
│       │   │   │   ├── lib
│       │   │   │   │   └── typ
│       │   │   │   │       └── slow.lib -> /home/01fe21bec223/DFT/DFT/vorca/Tech_files/slow.lib
│       │   │   │   └── misc
│       │   │   │       └── vorca.epsglobals
│       │   │   ├── viewDefinition.tcl
│       │   │   ├── vorca.aae.settings
│       │   │   ├── vorca.db_preserve.gz
│       │   │   ├── vorca.dbinfo
│       │   │   ├── vorca.globals
│       │   │   ├── vorca.init
│       │   │   ├── vorca.mode
│       │   │   ├── vorca.opconds
│       │   │   ├── vorca.tgz
│       │   │   ├── vorca.tpsglobals
│       │   │   ├── vorca.tpsglobals.designload
│       │   │   ├── vorca.v.bin
│       │   │   ├── vorca.v.bin_lib
│       │   │   └── vorca_power_constraints.tcl
│       │   ├── vorca_updated_icg_log.txt
│       │   └── vorva3(1).txt
│       └── work_1
│           ├── RCDB_91980_DesK1w
│           ├── epba_Apr05-13:01:57.rpt
│           ├── fouts
│           ├── reports.tcl
│           ├── reports_Apr05-13:01:57
│           │   ├── allviol.rpt
│           │   ├── analysis_summary.rpt
│           │   ├── case_analysis.rpt
│           │   ├── check_design.rpt
│           │   ├── check_timing.rpt
│           │   ├── clocks.rpt
│           │   ├── coverage.rpt
│           │   ├── hold_1.rpt
│           │   ├── hold_100.rpt.gz
│           │   ├── inactive_arcs.rpt
│           │   ├── pba_50_paths.rpt
│           │   ├── setup_1.rpt
│           │   ├── setup_100.rpt.gz
│           │   ├── start_end_slack.rpt
│           │   ├── worst_max_path.rpt
│           │   └── worst_min_path.rpt
│           ├── run.tcl
│           ├── scanChain.rpt
│           ├── tempus.cmd
│           ├── tempus.log
│           ├── tempus.logv
│           └── top.mtarpt
├── TESSENT
│   ├── Examples
│   │   ├── NETLIST
│   │   │   ├── CLOCK_opt.v
│   │   │   ├── cntr_16net.v
│   │   │   ├── counter_opt.v
│   │   │   ├── cpu_sys.v
│   │   │   ├── cpu_sys_tglib.v
│   │   │   ├── memory_system_with_lib_opt.v
│   │   │   ├── random_counter_lfsr_opt.v
│   │   │   ├── s298_opt.v
│   │   │   └── single_port_sync_ram_opt.v
│   │   ├── cpu_sys_tessent
│   │   │   ├── Scan_inserted_netlist
│   │   │   │   └── cpu_sys_emep_top.vg
│   │   │   ├── cpu_sys_atpg_setup.dofile
│   │   │   ├── cpu_sys_atpg_setup.testproc
│   │   │   ├── cpu_sys_atpg_setup_verify_scan_modes.dofile
│   │   │   ├── cpu_sys_drc.txt
│   │   │   ├── cpu_sys_pat.v
│   │   │   ├── cpu_sys_pat.v.cfg
│   │   │   ├── cpu_sys_pat.v.chain.name
│   │   │   ├── cpu_sys_pat.v.info.dict
│   │   │   ├── cpu_sys_pat.v.po.name
│   │   │   ├── scan_cells.rpt
│   │   │   ├── scan_chain.rpt
│   │   │   ├── scan_elements.rpt
│   │   │   ├── scan_path.txt
│   │   │   ├── scan_volume.rpt
│   │   │   ├── tlog.log
│   │   │   ├── tlog1.log
│   │   │   ├── tlog2.log
│   │   │   ├── tlog_atpg.log
│   │   │   └── tsdb_outdir
│   │   │       ├── dft_inserted_designs
│   │   │       │   └── cpu_sys_emep_top_gate.dft_inserted_design
│   │   │       │       ├── cpu_sys_emep_top.scandef
│   │   │       │       ├── cpu_sys_emep_top.tcd
│   │   │       │       ├── cpu_sys_emep_top.tsdb_info
│   │   │       │       ├── cpu_sys_emep_top.v_interface
│   │   │       │       └── cpu_sys_emep_top.vg
│   │   │       └── logic_test_cores
│   │   │           └── cpu_sys_emep_top.logic_test_core
│   │   │               └── cpu_sys_emep_top.atpg_mode_unwrapped
│   │   │                   ├── cpu_sys_emep_top_unwrapped.tcd
│   │   │                   ├── cpu_sys_emep_top_unwrapped.tcd.gz
│   │   │                   └── cpu_sys_emep_top_unwrapped_stuck.faults.gz
│   │   ├── dofiles
│   │   │   └── tessent_scan.do
│   │   ├── output
│   │   │   ├── clock_atpg_faults
│   │   │   ├── clock_atpg_statastics
│   │   │   ├── clock_scan.v
│   │   │   ├── clock_time.txt
│   │   │   ├── clock_time_scan_cells.txt
│   │   │   ├── clock_time_scan_chains.txt
│   │   │   ├── clock_time_scan_enable.txt
│   │   │   ├── cntr_16bit_scan.v
│   │   │   ├── counter_lfsr_scan_cells.txt
│   │   │   ├── counter_lfsr_scan_chains.txt
│   │   │   ├── counter_lfsr_scan_elements.txt
│   │   │   ├── counter_lfsr_scan_enable.txt
│   │   │   ├── counter_lfsr_tessent_scan_net.v
│   │   │   ├── counter_scan_cells.txt
│   │   │   ├── counter_scan_chains.txt
│   │   │   ├── counter_scan_elements.txt
│   │   │   ├── counter_scan_enable.txt
│   │   │   ├── counter_tessent_scan_net.v
│   │   │   ├── random_counter_lfsr_scan_cells.txt
│   │   │   ├── random_counter_lfsr_scan_chains.txt
│   │   │   ├── random_counter_lfsr_scan_elements.txt
│   │   │   ├── random_counter_lfsr_scan_enable.txt
│   │   │   ├── random_counter_lfsr_tessent_scan_net.v
│   │   │   ├── s298_scan_cells.txt
│   │   │   ├── s298_scan_chains.txt
│   │   │   ├── s298_scan_elements.txt
│   │   │   ├── s298_scan_enable.txt
│   │   │   ├── s298_tessent_scan_net.v
│   │   │   ├── scan_order.txt
│   │   │   └── writedesign.v
│   │   ├── outputs
│   │   │   └── counter_16bit_OUTPUTS
│   │   │       ├── counter_16bit_atpg_setup.dofile
│   │   │       ├── counter_16bit_atpg_setup.testproc
│   │   │       ├── counter_16bit_atpg_setup_verify_scan_modes.dofile
│   │   │       ├── counter_16bit_cntr_core_description
│   │   │       └── counter_16bit_scan.v
│   │   ├── reports
│   │   │   └── counter_16bit_REPORTS
│   │   │       └── counter_16bit_scan_chain.rpt
│   │   ├── work
│   │   │   ├── atpg_setup.dofile
│   │   │   ├── atpg_setup.testproc
│   │   │   ├── atpg_setup_verify_scan_modes.dofile
│   │   │   ├── clk.log
│   │   │   ├── clock.ascii
│   │   │   ├── clock.v
│   │   │   ├── clock.v.0.vec
│   │   │   ├── clock.v.cfg
│   │   │   ├── clock.v.info.dict
│   │   │   ├── clock.v.po.name
│   │   │   ├── clock_atpg.log
│   │   │   ├── clock_core_description
│   │   │   ├── clock_serial.v
│   │   │   ├── clock_serial.v.0.vec
│   │   │   ├── clock_serial.v.cfg
│   │   │   ├── clock_serial.v.info.dict
│   │   │   ├── clock_serial.v.po.name
│   │   │   ├── clock_tb.v
│   │   │   ├── counter_scan.v
│   │   │   ├── log
│   │   │   ├── log1
│   │   │   ├── log2
│   │   │   ├── run.do
│   │   │   ├── run1.do
│   │   │   ├── scan_commands.txt
│   │   │   ├── schematic.pdf
│   │   │   ├── schematic1.pdf
│   │   │   ├── sram.log
│   │   │   ├── tsdb_outdir
│   │   │   │   └── logic_test_cores
│   │   │   │       └── CLOCK.logic_test_core
│   │   │   │           └── CLOCK.atpg_mode_unwrapped
│   │   │   │               ├── CLOCK_unwrapped.flat
│   │   │   │               ├── CLOCK_unwrapped.flat.gz
│   │   │   │               ├── CLOCK_unwrapped_stuck.faults
│   │   │   │               ├── CLOCK_unwrapped_stuck.faults.gz
│   │   │   │               └── CLOCK_unwrapped_stuck.patdb
│   │   │   └── work_dft_debug
│   │   │       ├── tessent_default.v
│   │   │       ├── tessent_default.v.0.vec
│   │   │       ├── tessent_default.v.info.dict
│   │   │       └── tessent_default.v.po.name
│   │   └── work_atpg
│   │       ├── atpg_commands.txt
│   │       ├── atpg_setup.dofile
│   │       ├── atpg_setup.testproc
│   │       ├── atpg_setup_verify_scan_modes.dofile
│   │       ├── cntr_16bit_scan.v
│   │       ├── cntr_core_description
│   │       ├── cntr_scan_cells.rpt
│   │       ├── cntr_scan_chain.rpt
│   │       ├── cntr_scan_elements.rpt
│   │       ├── cntr_scan_enable.rpt
│   │       ├── counter_16bit.dc_shell_import_script
│   │       ├── pat.ascii
│   │       ├── schematic.pdf
│   │       ├── tessent.log
│   │       ├── tessent.log1
│   │       ├── tessent_atpg1.log
│   │       ├── tessent_scan.do
│   │       └── tsdb_outdir
│   │           └── dft_inserted_designs
│   │               └── counter_16bit_gate.dft_inserted_design
│   │                   ├── counter_16bit.scandef
│   │                   ├── counter_16bit.tcd
│   │                   ├── counter_16bit.tsdb_info
│   │                   ├── counter_16bit.v_interface
│   │                   └── counter_16bit.vg
│   ├── MBIST
│   │   ├── Do_Files
│   │   │   └── memory_test.do
│   │   ├── Netlist
│   │   │   ├── cpu_sys.v
│   │   │   ├── cpu_sys_emep_top.vg
│   │   │   └── sram_sp_16384d_36w_16m_8b.v
│   │   ├── memlibs
│   │   │   ├── DPRAM_512x24.memlib
│   │   │   ├── SPRAM_64x32.memlib
│   │   │   ├── SPRAM_8192x36.memlib
│   │   │   ├── rd3_256x8.memlib
│   │   │   ├── rd3_512x16.memlib
│   │   │   ├── spram_8192_5.memlib
│   │   │   └── spram_8192_7.memlib
│   │   ├── work
│   │   │   ├── cpu_sys_mbist.log
│   │   │   ├── cpu_sys_mbist.log1
│   │   │   └── cpu_sys_mbist.log2
│   │   └── work1
│   │       ├── pat.log
│   │       ├── simulation_outdir
│   │       │   └── sram_sp_16384d_36w_16m_8b_rtl.simulation_signoff
│   │       │       ├── ICLNetwork.simulation
│   │       │       │   ├── dut_work
│   │       │       │   │   ├── @_opt
│   │       │       │   │   │   ├── _data
│   │       │       │   │   │   │   ├── exemptKVQT5A
│   │       │       │   │   │   │   ├── exemptLi1xm0
│   │       │       │   │   │   │   └── exemptefCure
│   │       │       │   │   │   ├── _lib.qdb
│   │       │       │   │   │   ├── _lib1_0.qdb
│   │       │       │   │   │   ├── _lib1_0.qpg
│   │       │       │   │   │   ├── _lib1_0.qtl
│   │       │       │   │   │   ├── _lib2_0.qdb
│   │       │       │   │   │   ├── _lib2_0.qpg
│   │       │       │   │   │   ├── _lib2_0.qtl
│   │       │       │   │   │   ├── _lib3_0.qdb
│   │       │       │   │   │   ├── _lib3_0.qpg
│   │       │       │   │   │   ├── _lib3_0.qtl
│   │       │       │   │   │   ├── _lib4_0.qdb
│   │       │       │   │   │   ├── _lib4_0.qpg
│   │       │       │   │   │   └── _lib4_0.qtl
│   │       │       │   │   ├── _info
│   │       │       │   │   ├── _lib.qdb
│   │       │       │   │   ├── _lib1_0.qdb
│   │       │       │   │   ├── _lib1_0.qpg
│   │       │       │   │   ├── _lib1_0.qtl
│   │       │       │   │   └── _vmake
│   │       │       │   ├── modelsim.ini
│   │       │       │   ├── patterns.configuration
│   │       │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/sram_sp_16384d_36w_16m_8b_rtl.patterns_signoff
│   │       │       │   ├── questa.arguments_1
│   │       │       │   ├── questa.file_list
│   │       │       │   ├── questa.setup_script
│   │       │       │   ├── questa.simulation_log
│   │       │       │   ├── questa.simulation_script
│   │       │       │   ├── transcript
│   │       │       │   ├── tsdb_ijtag_graybox
│   │       │       │   │   ├── _info
│   │       │       │   │   ├── _lib.qdb
│   │       │       │   │   ├── _lib1_0.qdb
│   │       │       │   │   ├── _lib1_0.qpg
│   │       │       │   │   ├── _lib1_0.qtl
│   │       │       │   │   └── _vmake
│   │       │       │   └── vsim.wlf
│   │       │       ├── MemoryBist_P1.simulation
│   │       │       │   ├── dut_work
│   │       │       │   │   ├── @_opt
│   │       │       │   │   │   ├── _data
│   │       │       │   │   │   │   ├── exemptF6u2XN
│   │       │       │   │   │   │   ├── exemptb472Cc
│   │       │       │   │   │   │   └── exempte1zgio
│   │       │       │   │   │   ├── _lib.qdb
│   │       │       │   │   │   ├── _lib1_0.qdb
│   │       │       │   │   │   ├── _lib1_0.qpg
│   │       │       │   │   │   ├── _lib1_0.qtl
│   │       │       │   │   │   ├── _lib2_0.qdb
│   │       │       │   │   │   ├── _lib2_0.qpg
│   │       │       │   │   │   ├── _lib2_0.qtl
│   │       │       │   │   │   ├── _lib3_0.qdb
│   │       │       │   │   │   ├── _lib3_0.qpg
│   │       │       │   │   │   ├── _lib3_0.qtl
│   │       │       │   │   │   ├── _lib4_0.qdb
│   │       │       │   │   │   ├── _lib4_0.qpg
│   │       │       │   │   │   ├── _lib4_0.qtl
│   │       │       │   │   │   ├── _lib5_0.qdb
│   │       │       │   │   │   ├── _lib5_0.qpg
│   │       │       │   │   │   └── _lib5_0.qtl
│   │       │       │   │   ├── _info
│   │       │       │   │   ├── _lib.qdb
│   │       │       │   │   ├── _lib1_0.qdb
│   │       │       │   │   ├── _lib1_0.qpg
│   │       │       │   │   ├── _lib1_0.qtl
│   │       │       │   │   └── _vmake
│   │       │       │   ├── modelsim.ini
│   │       │       │   ├── patterns.configuration
│   │       │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/sram_sp_16384d_36w_16m_8b_rtl.patterns_signoff
│   │       │       │   ├── questa.arguments_1
│   │       │       │   ├── questa.file_list
│   │       │       │   ├── questa.setup_script
│   │       │       │   ├── questa.simulation_log
│   │       │       │   ├── questa.simulation_script
│   │       │       │   ├── transcript
│   │       │       │   └── vsim.wlf
│   │       │       ├── MemoryBist_ParallelRetentionTest_P1.simulation
│   │       │       │   ├── dut_work
│   │       │       │   │   ├── @_opt
│   │       │       │   │   │   ├── _data
│   │       │       │   │   │   │   ├── exemptSRQC3T
│   │       │       │   │   │   │   ├── exemptihL4PG
│   │       │       │   │   │   │   └── exempttgUuBb
│   │       │       │   │   │   ├── _lib.qdb
│   │       │       │   │   │   ├── _lib1_0.qdb
│   │       │       │   │   │   ├── _lib1_0.qpg
│   │       │       │   │   │   ├── _lib1_0.qtl
│   │       │       │   │   │   ├── _lib2_0.qdb
│   │       │       │   │   │   ├── _lib2_0.qpg
│   │       │       │   │   │   ├── _lib2_0.qtl
│   │       │       │   │   │   ├── _lib3_0.qdb
│   │       │       │   │   │   ├── _lib3_0.qpg
│   │       │       │   │   │   ├── _lib3_0.qtl
│   │       │       │   │   │   ├── _lib4_0.qdb
│   │       │       │   │   │   ├── _lib4_0.qpg
│   │       │       │   │   │   ├── _lib4_0.qtl
│   │       │       │   │   │   ├── _lib5_0.qdb
│   │       │       │   │   │   ├── _lib5_0.qpg
│   │       │       │   │   │   └── _lib5_0.qtl
│   │       │       │   │   ├── _info
│   │       │       │   │   ├── _lib.qdb
│   │       │       │   │   ├── _lib1_0.qdb
│   │       │       │   │   ├── _lib1_0.qpg
│   │       │       │   │   ├── _lib1_0.qtl
│   │       │       │   │   └── _vmake
│   │       │       │   ├── modelsim.ini
│   │       │       │   ├── patterns.configuration
│   │       │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/sram_sp_16384d_36w_16m_8b_rtl.patterns_signoff
│   │       │       │   ├── questa.arguments_1
│   │       │       │   ├── questa.file_list
│   │       │       │   ├── questa.setup_script
│   │       │       │   ├── questa.simulation_log
│   │       │       │   ├── questa.simulation_script
│   │       │       │   ├── transcript
│   │       │       │   └── vsim.wlf
│   │       │       └── patterns_directory -> ../../tsdb_outdir/patterns/sram_sp_16384d_36w_16m_8b_rtl.patterns_signoff
│   │       └── tsdb_outdir
│   │           ├── dft_inserted_designs
│   │           │   ├── sram_sp_16384d_36w_16m_8b_rtl.dft_inserted_design
│   │           │   │   ├── ijtag_graybox
│   │           │   │   │   └── sram_sp_16384d_36w_16m_8b.v_ijtag_graybox
│   │           │   │   ├── modified_rtl_files
│   │           │   │   │   └── sram_sp_16384d_36w_16m_8b.v
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b.design_source_dictionary
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b.dft_info_dictionary
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b.dft_summary_dictionary
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b.golden_design_source_dictionary
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b.icl
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b.ijtag_graybox_design_source_dictionary
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b.pdl
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b.sdc
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b.tcd
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b.tsdb_info
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b.v_full -> ./modified_rtl_files/sram_sp_16384d_36w_16m_8b.v
│   │           │   │   └── sram_sp_16384d_36w_16m_8b.v_interface
│   │           │   └── sram_sp_16384d_36w_16m_8b_rtl.dft_spec
│   │           ├── instruments
│   │           │   ├── sram_sp_16384d_36w_16m_8b_rtl_cells.instrument
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b_rtl_cells.synthesis_dictionary
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_clk_buf.v
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_clk_inv.v
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_clk_mux2.v
│   │           │   │   └── sram_sp_16384d_36w_16m_8b_rtl_tessent_posedge_synchronizer_reset.v
│   │           │   ├── sram_sp_16384d_36w_16m_8b_rtl_ijtag.instrument
│   │           │   │   ├── ijtag.sdc_dictionary
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b_rtl_ijtag.sdc
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b_rtl_ijtag.synthesis_dictionary
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_sib_1.ctl
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_sib_1.icl
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_sib_1.pdl
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_sib_1.tcd
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_sib_1.tcd_scan
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_sib_1.v
│   │           │   │   ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_sib_2.icl
│   │           │   │   └── sram_sp_16384d_36w_16m_8b_rtl_tessent_sib_2.v
│   │           │   └── sram_sp_16384d_36w_16m_8b_rtl_mbist.instrument
│   │           │       ├── SPRAM_8192x36.icl
│   │           │       ├── SPRAM_8192x36.scan
│   │           │       ├── SPRAM_8192x36.syn
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_mbist.sdc_dictionary
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_mbist.synthesis_dictionary
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_bap.icl
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_bap.tcd
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_bap.v
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1.generation_log
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1_controller.icl
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1_controller.pdl
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1_controller.tcd
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1_controller.tessent_connection_info
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1_controller.v
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1_controller_assembly.design_source_dictionary
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1_controller_assembly.icl
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1_controller_assembly.sdc
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1_controller_assembly.v
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1_interface_m1.icl
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1_interface_m1.v
│   │           │       ├── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1_interface_m2.icl
│   │           │       └── sram_sp_16384d_36w_16m_8b_rtl_tessent_mbist_c1_interface_m2.v
│   │           └── patterns
│   │               ├── sram_sp_16384d_36w_16m_8b_rtl.patterns_signoff
│   │               │   ├── ICLNetwork.pdl
│   │               │   ├── ICLNetwork.v
│   │               │   ├── ICLNetwork.v.0.vec
│   │               │   ├── ICLNetwork.v.cfg
│   │               │   ├── ICLNetwork.v.po.name
│   │               │   ├── MemoryBist_P1.pdl
│   │               │   ├── MemoryBist_P1.v
│   │               │   ├── MemoryBist_P1.v.0.vec
│   │               │   ├── MemoryBist_P1.v.cfg
│   │               │   ├── MemoryBist_P1.v.po.name
│   │               │   ├── MemoryBist_ParallelRetentionTest_P1.pdl
│   │               │   ├── MemoryBist_ParallelRetentionTest_P1.v
│   │               │   ├── MemoryBist_ParallelRetentionTest_P1.v.0.vec
│   │               │   ├── MemoryBist_ParallelRetentionTest_P1.v.cfg
│   │               │   ├── MemoryBist_ParallelRetentionTest_P1.v.po.name
│   │               │   └── simulation.data_dictionary
│   │               └── sram_sp_16384d_36w_16m_8b_rtl.patterns_spec_signoff
│   ├── MCRB
│   │   ├── NETLIST
│   │   │   └── mcrb_opt.v
│   │   ├── output
│   │   │   ├── mcrb_scan_cells.txt
│   │   │   ├── mcrb_scan_chains.txt
│   │   │   ├── mcrb_scan_elements.txt
│   │   │   ├── mcrb_scan_enable.txt
│   │   │   └── mcrb_tessent_scan_net.v
│   │   └── work
│   │       ├── mcrb_scan.v
│   │       ├── run.do
│   │       ├── schematic.pdf
│   │       └── tessent.log
│   ├── Memory_Templates
│   │   ├── DPRAM_512x24
│   │   │   ├── DPRAM_512x24.memlib
│   │   │   ├── Makefile
│   │   │   ├── dft_spec.do
│   │   │   ├── memlibc.log
│   │   │   ├── patterns_spec.do
│   │   │   ├── run.txt
│   │   │   ├── simulation_outdir
│   │   │   │   └── memlibc_memory_bist_assembly_rtl.simulation_signoff
│   │   │   │       ├── ICLNetwork.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exemptXN4Yfn
│   │   │   │       │   │   │   │   ├── exemptitiMht
│   │   │   │       │   │   │   │   └── exemptzzRIjw
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   ├── transcript
│   │   │   │       │   └── tsdb_ijtag_graybox
│   │   │   │       │       ├── _info
│   │   │   │       │       ├── _lib.qdb
│   │   │   │       │       ├── _lib1_0.qdb
│   │   │   │       │       ├── _lib1_0.qpg
│   │   │   │       │       ├── _lib1_0.qtl
│   │   │   │       │       └── _vmake
│   │   │   │       ├── MemoryBist_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exemptWGLDam
│   │   │   │       │   │   │   │   ├── exemptfIKgvu
│   │   │   │       │   │   │   │   └── exempti2GhwO
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   └── transcript
│   │   │   │       ├── MemoryBist_ParallelRetentionTest_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exemptOUp3mN
│   │   │   │       │   │   │   │   ├── exemptRUn1dG
│   │   │   │       │   │   │   │   └── exemptgqBQVJ
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   └── transcript
│   │   │   │       └── patterns_directory -> ../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   ├── simulations.do
│   │   │   ├── tsdb_outdir
│   │   │   │   ├── dft_inserted_designs
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl.dft_inserted_design
│   │   │   │   │   │   ├── ijtag_graybox
│   │   │   │   │   │   │   └── memlibc_memory_bist_assembly.v_ijtag_graybox
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_info_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_summary_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.golden_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.ijtag_graybox_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tsdb_info
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_full -> ./modified_rtl_files/memlibc_memory_bist_assembly.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_interface
│   │   │   │   │   │   └── modified_rtl_files
│   │   │   │   │   │       └── memlibc_memory_bist_assembly.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl.dft_spec
│   │   │   │   ├── instruments
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.instrument
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_and2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_gate_and.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_or2.v
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_posedge_synchronizer_reset.v
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.instrument
│   │   │   │   │   │   ├── ijtag.sdc_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.ctl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd_scan
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_2.icl
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_sib_2.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_mbist.instrument
│   │   │   │   │       ├── DPRAM_512x24.icl
│   │   │   │   │       ├── DPRAM_512x24.scan
│   │   │   │   │       ├── DPRAM_512x24.syn
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.sdc_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.synthesis_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1.generation_log
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.pdl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tessent_connection_info
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.design_source_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.sdc
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.icl
│   │   │   │   │       └── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.v
│   │   │   │   ├── memory_bist_assemblies
│   │   │   │   │   └── memlibc_memory_bist_assembly.v
│   │   │   │   └── patterns
│   │   │   │       ├── memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── ICLNetwork.pdl
│   │   │   │       │   ├── ICLNetwork.v
│   │   │   │       │   ├── ICLNetwork.v.0.vec
│   │   │   │       │   ├── ICLNetwork.v.cfg
│   │   │   │       │   ├── ICLNetwork.v.po.name
│   │   │   │       │   ├── MemoryBist_P1.pdl
│   │   │   │       │   ├── MemoryBist_P1.v
│   │   │   │       │   ├── MemoryBist_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_P1.v.po.name
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.pdl
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.po.name
│   │   │   │       │   └── simulation.data_dictionary
│   │   │   │       └── memlibc_memory_bist_assembly_rtl.patterns_spec_signoff
│   │   │   ├── tshell.log_dft_spec
│   │   │   ├── tshell.log_patterns_spec
│   │   │   └── tshell.log_simulations
│   │   ├── DP_SRAM_rd3_256x8
│   │   │   ├── Makefile
│   │   │   ├── dft_spec.do
│   │   │   ├── memlibc.log
│   │   │   ├── patterns_spec.do
│   │   │   ├── rd3_256x8.memlib
│   │   │   ├── run.txt
│   │   │   ├── simulation_outdir
│   │   │   │   └── memlibc_memory_bist_assembly_rtl.simulation_signoff
│   │   │   │       ├── ICLNetwork.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exempt7z7gFe
│   │   │   │       │   │   │   │   ├── exemptRNjTgU
│   │   │   │       │   │   │   │   └── exemptoxskvv
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   ├── transcript
│   │   │   │       │   └── tsdb_ijtag_graybox
│   │   │   │       │       ├── _info
│   │   │   │       │       ├── _lib.qdb
│   │   │   │       │       ├── _lib1_0.qdb
│   │   │   │       │       ├── _lib1_0.qpg
│   │   │   │       │       ├── _lib1_0.qtl
│   │   │   │       │       └── _vmake
│   │   │   │       ├── MemoryBist_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exempt0D8qMh
│   │   │   │       │   │   │   │   ├── exempt2BlMfM
│   │   │   │       │   │   │   │   └── exemptEsZ6aa
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   └── transcript
│   │   │   │       ├── MemoryBist_ParallelRetentionTest_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exempt5g88fu
│   │   │   │       │   │   │   │   ├── exemptUQON4n
│   │   │   │       │   │   │   │   └── exempthxbt9s
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   └── transcript
│   │   │   │       └── patterns_directory -> ../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   ├── simulations.do
│   │   │   ├── tsdb_outdir
│   │   │   │   ├── dft_inserted_designs
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl.dft_inserted_design
│   │   │   │   │   │   ├── ijtag_graybox
│   │   │   │   │   │   │   └── memlibc_memory_bist_assembly.v_ijtag_graybox
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_info_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_summary_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.golden_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.ijtag_graybox_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tsdb_info
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_full -> ./modified_rtl_files/memlibc_memory_bist_assembly.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_interface
│   │   │   │   │   │   └── modified_rtl_files
│   │   │   │   │   │       └── memlibc_memory_bist_assembly.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl.dft_spec
│   │   │   │   ├── instruments
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.instrument
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_and2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_gate_and.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_or2.v
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_posedge_synchronizer_reset.v
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.instrument
│   │   │   │   │   │   ├── ijtag.sdc_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.ctl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd_scan
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_2.icl
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_sib_2.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_mbist.instrument
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.sdc_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.synthesis_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1.generation_log
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.pdl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tessent_connection_info
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.design_source_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.sdc
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.v
│   │   │   │   │       ├── rd3_256x8.icl
│   │   │   │   │       ├── rd3_256x8.scan
│   │   │   │   │       └── rd3_256x8.syn
│   │   │   │   ├── memory_bist_assemblies
│   │   │   │   │   └── memlibc_memory_bist_assembly.v
│   │   │   │   └── patterns
│   │   │   │       ├── memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── ICLNetwork.pdl
│   │   │   │       │   ├── ICLNetwork.v
│   │   │   │       │   ├── ICLNetwork.v.0.vec
│   │   │   │       │   ├── ICLNetwork.v.cfg
│   │   │   │       │   ├── ICLNetwork.v.po.name
│   │   │   │       │   ├── MemoryBist_P1.pdl
│   │   │   │       │   ├── MemoryBist_P1.v
│   │   │   │       │   ├── MemoryBist_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_P1.v.po.name
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.pdl
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.po.name
│   │   │   │       │   └── simulation.data_dictionary
│   │   │   │       └── memlibc_memory_bist_assembly_rtl.patterns_spec_signoff
│   │   │   ├── tshell.log_dft_spec
│   │   │   ├── tshell.log_patterns_spec
│   │   │   └── tshell.log_simulations
│   │   ├── DP_SRAM_rd3_512x16
│   │   │   ├── Makefile
│   │   │   ├── dft_spec.do
│   │   │   ├── memlibc.log
│   │   │   ├── patterns_spec.do
│   │   │   ├── rd3_512x16.memlib
│   │   │   ├── run.txt
│   │   │   ├── simulation_outdir
│   │   │   │   └── memlibc_memory_bist_assembly_rtl.simulation_signoff
│   │   │   │       ├── ICLNetwork.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exemptRsXDPL
│   │   │   │       │   │   │   │   ├── exemptUSgucE
│   │   │   │       │   │   │   │   └── exemptlnbZwv
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   ├── transcript
│   │   │   │       │   └── tsdb_ijtag_graybox
│   │   │   │       │       ├── _info
│   │   │   │       │       ├── _lib.qdb
│   │   │   │       │       ├── _lib1_0.qdb
│   │   │   │       │       ├── _lib1_0.qpg
│   │   │   │       │       ├── _lib1_0.qtl
│   │   │   │       │       └── _vmake
│   │   │   │       ├── MemoryBist_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exempt6R6p4G
│   │   │   │       │   │   │   │   ├── exemptuKNTev
│   │   │   │       │   │   │   │   └── exemptvor8za
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   └── transcript
│   │   │   │       ├── MemoryBist_ParallelRetentionTest_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exempt7Ep8nT
│   │   │   │       │   │   │   │   ├── exempti9VMhY
│   │   │   │       │   │   │   │   └── exemptuuxcJk
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   └── transcript
│   │   │   │       └── patterns_directory -> ../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   ├── simulations.do
│   │   │   ├── tsdb_outdir
│   │   │   │   ├── dft_inserted_designs
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl.dft_inserted_design
│   │   │   │   │   │   ├── ijtag_graybox
│   │   │   │   │   │   │   └── memlibc_memory_bist_assembly.v_ijtag_graybox
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_info_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_summary_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.golden_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.ijtag_graybox_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tsdb_info
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_full -> ./modified_rtl_files/memlibc_memory_bist_assembly.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_interface
│   │   │   │   │   │   └── modified_rtl_files
│   │   │   │   │   │       └── memlibc_memory_bist_assembly.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl.dft_spec
│   │   │   │   ├── instruments
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.instrument
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_and2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_gate_and.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_or2.v
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_posedge_synchronizer_reset.v
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.instrument
│   │   │   │   │   │   ├── ijtag.sdc_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.ctl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd_scan
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_2.icl
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_sib_2.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_mbist.instrument
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.sdc_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.synthesis_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1.generation_log
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.pdl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tessent_connection_info
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.design_source_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.sdc
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.v
│   │   │   │   │       ├── rd3_512x16.icl
│   │   │   │   │       ├── rd3_512x16.scan
│   │   │   │   │       └── rd3_512x16.syn
│   │   │   │   ├── memory_bist_assemblies
│   │   │   │   │   └── memlibc_memory_bist_assembly.v
│   │   │   │   └── patterns
│   │   │   │       ├── memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── ICLNetwork.pdl
│   │   │   │       │   ├── ICLNetwork.v
│   │   │   │       │   ├── ICLNetwork.v.0.vec
│   │   │   │       │   ├── ICLNetwork.v.cfg
│   │   │   │       │   ├── ICLNetwork.v.po.name
│   │   │   │       │   ├── MemoryBist_P1.pdl
│   │   │   │       │   ├── MemoryBist_P1.v
│   │   │   │       │   ├── MemoryBist_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_P1.v.po.name
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.pdl
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.po.name
│   │   │   │       │   └── simulation.data_dictionary
│   │   │   │       └── memlibc_memory_bist_assembly_rtl.patterns_spec_signoff
│   │   │   ├── tshell.log_dft_spec
│   │   │   ├── tshell.log_patterns_spec
│   │   │   └── tshell.log_simulations
│   │   ├── SPRAM_64x32
│   │   │   ├── Makefile
│   │   │   ├── SPRAM_64x32.memlib
│   │   │   ├── dft_spec.do
│   │   │   ├── memlibc.log
│   │   │   ├── patterns_spec.do
│   │   │   ├── run.txt
│   │   │   ├── simulation_outdir
│   │   │   │   └── memlibc_memory_bist_assembly_rtl.simulation_signoff
│   │   │   │       ├── ICLNetwork.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exempt1Wus7e
│   │   │   │       │   │   │   │   ├── exemptIFea4R
│   │   │   │       │   │   │   │   └── exemptNSYy6n
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   ├── transcript
│   │   │   │       │   └── tsdb_ijtag_graybox
│   │   │   │       │       ├── _info
│   │   │   │       │       ├── _lib.qdb
│   │   │   │       │       ├── _lib1_0.qdb
│   │   │   │       │       ├── _lib1_0.qpg
│   │   │   │       │       ├── _lib1_0.qtl
│   │   │   │       │       └── _vmake
│   │   │   │       ├── MemoryBist_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exemptMn09Gn
│   │   │   │       │   │   │   │   ├── exemptjAhVDS
│   │   │   │       │   │   │   │   └── exemptop73Ul
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   └── transcript
│   │   │   │       ├── MemoryBist_ParallelRetentionTest_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exempt5Ll1Ft
│   │   │   │       │   │   │   │   ├── exemptQjpC9J
│   │   │   │       │   │   │   │   └── exemptXqI3c3
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   └── transcript
│   │   │   │       └── patterns_directory -> ../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   ├── simulations.do
│   │   │   ├── tsdb_outdir
│   │   │   │   ├── dft_inserted_designs
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl.dft_inserted_design
│   │   │   │   │   │   ├── ijtag_graybox
│   │   │   │   │   │   │   └── memlibc_memory_bist_assembly.v_ijtag_graybox
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_info_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_summary_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.golden_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.ijtag_graybox_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tsdb_info
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_full -> ./modified_rtl_files/memlibc_memory_bist_assembly.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_interface
│   │   │   │   │   │   └── modified_rtl_files
│   │   │   │   │   │       └── memlibc_memory_bist_assembly.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl.dft_spec
│   │   │   │   ├── instruments
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.instrument
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_and2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_gate_and.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_or2.v
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_posedge_synchronizer_reset.v
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.instrument
│   │   │   │   │   │   ├── ijtag.sdc_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.ctl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd_scan
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_2.icl
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_sib_2.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_mbist.instrument
│   │   │   │   │       ├── SPRAM_64x32.icl
│   │   │   │   │       ├── SPRAM_64x32.scan
│   │   │   │   │       ├── SPRAM_64x32.syn
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.sdc_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.synthesis_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1.generation_log
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.pdl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tessent_connection_info
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.design_source_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.sdc
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.icl
│   │   │   │   │       └── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.v
│   │   │   │   ├── memory_bist_assemblies
│   │   │   │   │   └── memlibc_memory_bist_assembly.v
│   │   │   │   └── patterns
│   │   │   │       ├── memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── ICLNetwork.pdl
│   │   │   │       │   ├── ICLNetwork.v
│   │   │   │       │   ├── ICLNetwork.v.0.vec
│   │   │   │       │   ├── ICLNetwork.v.cfg
│   │   │   │       │   ├── ICLNetwork.v.po.name
│   │   │   │       │   ├── MemoryBist_P1.pdl
│   │   │   │       │   ├── MemoryBist_P1.v
│   │   │   │       │   ├── MemoryBist_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_P1.v.po.name
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.pdl
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.po.name
│   │   │   │       │   └── simulation.data_dictionary
│   │   │   │       └── memlibc_memory_bist_assembly_rtl.patterns_spec_signoff
│   │   │   ├── tshell.log_dft_spec
│   │   │   ├── tshell.log_patterns_spec
│   │   │   └── tshell.log_simulations
│   │   ├── SPRAM_8192x36
│   │   │   ├── Makefile
│   │   │   ├── SPRAM_8192x36.memlib
│   │   │   ├── dft_spec.do
│   │   │   ├── memlibc.log
│   │   │   ├── patterns_spec.do
│   │   │   ├── run.txt
│   │   │   ├── simulation_outdir
│   │   │   │   └── memlibc_memory_bist_assembly_rtl.simulation_signoff
│   │   │   │       ├── ICLNetwork.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exemptIPa98N
│   │   │   │       │   │   │   │   ├── exemptIg0KRF
│   │   │   │       │   │   │   │   └── exemptW3Vl7y
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   ├── transcript
│   │   │   │       │   └── tsdb_ijtag_graybox
│   │   │   │       │       ├── _info
│   │   │   │       │       ├── _lib.qdb
│   │   │   │       │       ├── _lib1_0.qdb
│   │   │   │       │       ├── _lib1_0.qpg
│   │   │   │       │       ├── _lib1_0.qtl
│   │   │   │       │       └── _vmake
│   │   │   │       ├── MemoryBist_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exemptObtsCu
│   │   │   │       │   │   │   │   ├── exemptZ4dq5F
│   │   │   │       │   │   │   │   └── exemptwekk3t
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   └── questa.simulation_script
│   │   │   │       ├── MemoryBist_ParallelRetentionTest_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exemptKLorps
│   │   │   │       │   │   │   │   ├── exemptYzFbhm
│   │   │   │       │   │   │   │   └── exemptszw13r
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   └── transcript
│   │   │   │       └── patterns_directory -> ../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   ├── simulations.do
│   │   │   ├── tsdb_outdir
│   │   │   │   ├── dft_inserted_designs
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl.dft_inserted_design
│   │   │   │   │   │   ├── ijtag_graybox
│   │   │   │   │   │   │   └── memlibc_memory_bist_assembly.v_ijtag_graybox
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_info_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_summary_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.golden_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.ijtag_graybox_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tsdb_info
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_full -> ./modified_rtl_files/memlibc_memory_bist_assembly.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_interface
│   │   │   │   │   │   └── modified_rtl_files
│   │   │   │   │   │       └── memlibc_memory_bist_assembly.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl.dft_spec
│   │   │   │   ├── instruments
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.instrument
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_and2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_gate_and.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_or2.v
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_posedge_synchronizer_reset.v
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.instrument
│   │   │   │   │   │   ├── ijtag.sdc_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.ctl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd_scan
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_2.icl
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_sib_2.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_mbist.instrument
│   │   │   │   │       ├── SPRAM_8192x36.icl
│   │   │   │   │       ├── SPRAM_8192x36.scan
│   │   │   │   │       ├── SPRAM_8192x36.syn
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.sdc_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.synthesis_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1.generation_log
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.pdl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tessent_connection_info
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.design_source_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.sdc
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.icl
│   │   │   │   │       └── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.v
│   │   │   │   ├── memory_bist_assemblies
│   │   │   │   │   └── memlibc_memory_bist_assembly.v
│   │   │   │   └── patterns
│   │   │   │       ├── memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── ICLNetwork.pdl
│   │   │   │       │   ├── ICLNetwork.v
│   │   │   │       │   ├── ICLNetwork.v.0.vec
│   │   │   │       │   ├── ICLNetwork.v.cfg
│   │   │   │       │   ├── ICLNetwork.v.po.name
│   │   │   │       │   ├── MemoryBist_P1.pdl
│   │   │   │       │   ├── MemoryBist_P1.v
│   │   │   │       │   ├── MemoryBist_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_P1.v.po.name
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.pdl
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.po.name
│   │   │   │       │   └── simulation.data_dictionary
│   │   │   │       └── memlibc_memory_bist_assembly_rtl.patterns_spec_signoff
│   │   │   ├── tshell.log_dft_spec
│   │   │   ├── tshell.log_patterns_spec
│   │   │   └── tshell.log_simulations
│   │   ├── SP_SRAM_spram_8192_5
│   │   │   ├── Makefile
│   │   │   ├── dft_spec.do
│   │   │   ├── memlibc.log
│   │   │   ├── patterns_spec.do
│   │   │   ├── run.txt
│   │   │   ├── simulation_outdir
│   │   │   │   └── memlibc_memory_bist_assembly_rtl.simulation_signoff
│   │   │   │       ├── ICLNetwork.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exemptKVPePo
│   │   │   │       │   │   │   │   ├── exemptgbJvWj
│   │   │   │       │   │   │   │   └── exemptn76St1
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   ├── transcript
│   │   │   │       │   └── tsdb_ijtag_graybox
│   │   │   │       │       ├── _info
│   │   │   │       │       ├── _lib.qdb
│   │   │   │       │       ├── _lib1_0.qdb
│   │   │   │       │       ├── _lib1_0.qpg
│   │   │   │       │       ├── _lib1_0.qtl
│   │   │   │       │       └── _vmake
│   │   │   │       ├── MemoryBist_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exempt9dFGxV
│   │   │   │       │   │   │   │   ├── exemptH54S81
│   │   │   │       │   │   │   │   └── exemptw97lNY
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   └── transcript
│   │   │   │       ├── MemoryBist_ParallelRetentionTest_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exemptJALehz
│   │   │   │       │   │   │   │   ├── exemptUJvdOM
│   │   │   │       │   │   │   │   └── exempttyAk9x
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   └── transcript
│   │   │   │       └── patterns_directory -> ../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   ├── simulations.do
│   │   │   ├── spram_8192_5.memlib
│   │   │   ├── tsdb_outdir
│   │   │   │   ├── dft_inserted_designs
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl.dft_inserted_design
│   │   │   │   │   │   ├── ijtag_graybox
│   │   │   │   │   │   │   └── memlibc_memory_bist_assembly.v_ijtag_graybox
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_info_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_summary_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.golden_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.ijtag_graybox_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tsdb_info
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_full -> ./modified_rtl_files/memlibc_memory_bist_assembly.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_interface
│   │   │   │   │   │   └── modified_rtl_files
│   │   │   │   │   │       └── memlibc_memory_bist_assembly.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl.dft_spec
│   │   │   │   ├── instruments
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.instrument
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_and2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_gate_and.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_or2.v
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_posedge_synchronizer_reset.v
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.instrument
│   │   │   │   │   │   ├── ijtag.sdc_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.ctl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd_scan
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_2.icl
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_sib_2.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_mbist.instrument
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.sdc_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.synthesis_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1.generation_log
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.pdl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tessent_connection_info
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.design_source_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.sdc
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.v
│   │   │   │   │       ├── spram_8192_5.icl
│   │   │   │   │       ├── spram_8192_5.scan
│   │   │   │   │       └── spram_8192_5.syn
│   │   │   │   ├── memory_bist_assemblies
│   │   │   │   │   └── memlibc_memory_bist_assembly.v
│   │   │   │   └── patterns
│   │   │   │       ├── memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── ICLNetwork.pdl
│   │   │   │       │   ├── ICLNetwork.v
│   │   │   │       │   ├── ICLNetwork.v.0.vec
│   │   │   │       │   ├── ICLNetwork.v.cfg
│   │   │   │       │   ├── ICLNetwork.v.po.name
│   │   │   │       │   ├── MemoryBist_P1.pdl
│   │   │   │       │   ├── MemoryBist_P1.v
│   │   │   │       │   ├── MemoryBist_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_P1.v.po.name
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.pdl
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.po.name
│   │   │   │       │   └── simulation.data_dictionary
│   │   │   │       └── memlibc_memory_bist_assembly_rtl.patterns_spec_signoff
│   │   │   ├── tshell.log_dft_spec
│   │   │   ├── tshell.log_patterns_spec
│   │   │   └── tshell.log_simulations
│   │   ├── SP_SRAM_spram_8192_7
│   │   │   ├── Makefile
│   │   │   ├── dft_spec.do
│   │   │   ├── memlibc.log
│   │   │   ├── patterns_spec.do
│   │   │   ├── run.txt
│   │   │   ├── simulation_outdir
│   │   │   │   └── memlibc_memory_bist_assembly_rtl.simulation_signoff
│   │   │   │       ├── ICLNetwork.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exemptHAAKRX
│   │   │   │       │   │   │   │   ├── exemptQEL7cr
│   │   │   │       │   │   │   │   └── exemptgJDHao
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   ├── transcript
│   │   │   │       │   └── tsdb_ijtag_graybox
│   │   │   │       │       ├── _info
│   │   │   │       │       ├── _lib.qdb
│   │   │   │       │       ├── _lib1_0.qdb
│   │   │   │       │       ├── _lib1_0.qpg
│   │   │   │       │       ├── _lib1_0.qtl
│   │   │   │       │       └── _vmake
│   │   │   │       ├── MemoryBist_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exemptRtoFbl
│   │   │   │       │   │   │   │   ├── exemptlaBeH4
│   │   │   │       │   │   │   │   └── exemptlkxBOZ
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   └── transcript
│   │   │   │       ├── MemoryBist_ParallelRetentionTest_P1.simulation
│   │   │   │       │   ├── dut_work
│   │   │   │       │   │   ├── @_opt
│   │   │   │       │   │   │   ├── _data
│   │   │   │       │   │   │   │   ├── exempt7YjpCd
│   │   │   │       │   │   │   │   ├── exemptWh1Kl8
│   │   │   │       │   │   │   │   └── exempta1rsOE
│   │   │   │       │   │   │   ├── _lib.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   │   ├── _lib2_0.qdb
│   │   │   │       │   │   │   ├── _lib2_0.qpg
│   │   │   │       │   │   │   ├── _lib2_0.qtl
│   │   │   │       │   │   │   ├── _lib3_0.qdb
│   │   │   │       │   │   │   ├── _lib3_0.qpg
│   │   │   │       │   │   │   ├── _lib3_0.qtl
│   │   │   │       │   │   │   ├── _lib4_0.qdb
│   │   │   │       │   │   │   ├── _lib4_0.qpg
│   │   │   │       │   │   │   └── _lib4_0.qtl
│   │   │   │       │   │   ├── _info
│   │   │   │       │   │   ├── _lib.qdb
│   │   │   │       │   │   ├── _lib1_0.qdb
│   │   │   │       │   │   ├── _lib1_0.qpg
│   │   │   │       │   │   ├── _lib1_0.qtl
│   │   │   │       │   │   └── _vmake
│   │   │   │       │   ├── modelsim.ini
│   │   │   │       │   ├── patterns.configuration
│   │   │   │       │   ├── patterns_directory -> ../../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── questa.arguments_1
│   │   │   │       │   ├── questa.file_list
│   │   │   │       │   ├── questa.setup_script
│   │   │   │       │   ├── questa.simulation_log
│   │   │   │       │   ├── questa.simulation_script
│   │   │   │       │   └── transcript
│   │   │   │       └── patterns_directory -> ../../tsdb_outdir/patterns/memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   ├── simulations.do
│   │   │   ├── spram_8192_7.memlib
│   │   │   ├── tsdb_outdir
│   │   │   │   ├── dft_inserted_designs
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl.dft_inserted_design
│   │   │   │   │   │   ├── ijtag_graybox
│   │   │   │   │   │   │   └── memlibc_memory_bist_assembly.v_ijtag_graybox
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_info_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.dft_summary_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.golden_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.ijtag_graybox_design_source_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.tsdb_info
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_full -> ./modified_rtl_files/memlibc_memory_bist_assembly.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly.v_interface
│   │   │   │   │   │   └── modified_rtl_files
│   │   │   │   │   │       └── memlibc_memory_bist_assembly.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl.dft_spec
│   │   │   │   ├── instruments
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.instrument
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_cells.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_and2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_buf.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_gate_and.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_clk_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_inv.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_mux2.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_or2.v
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_posedge_synchronizer_reset.v
│   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.instrument
│   │   │   │   │   │   ├── ijtag.sdc_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.sdc
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_ijtag.synthesis_dictionary
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.ctl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.icl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.pdl
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.tcd_scan
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_1.v
│   │   │   │   │   │   ├── memlibc_memory_bist_assembly_rtl_tessent_sib_2.icl
│   │   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_tessent_sib_2.v
│   │   │   │   │   └── memlibc_memory_bist_assembly_rtl_mbist.instrument
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.sdc_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_mbist.synthesis_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_bap.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1.generation_log
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.pdl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tcd
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.tessent_connection_info
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.design_source_dictionary
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.sdc
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly.v
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.icl
│   │   │   │   │       ├── memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1.v
│   │   │   │   │       ├── spram_8192_7.icl
│   │   │   │   │       ├── spram_8192_7.scan
│   │   │   │   │       └── spram_8192_7.syn
│   │   │   │   ├── memory_bist_assemblies
│   │   │   │   │   └── memlibc_memory_bist_assembly.v
│   │   │   │   └── patterns
│   │   │   │       ├── memlibc_memory_bist_assembly_rtl.patterns_signoff
│   │   │   │       │   ├── ICLNetwork.pdl
│   │   │   │       │   ├── ICLNetwork.v
│   │   │   │       │   ├── ICLNetwork.v.0.vec
│   │   │   │       │   ├── ICLNetwork.v.cfg
│   │   │   │       │   ├── ICLNetwork.v.po.name
│   │   │   │       │   ├── MemoryBist_P1.pdl
│   │   │   │       │   ├── MemoryBist_P1.v
│   │   │   │       │   ├── MemoryBist_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_P1.v.po.name
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.pdl
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.0.vec
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.cfg
│   │   │   │       │   ├── MemoryBist_ParallelRetentionTest_P1.v.po.name
│   │   │   │       │   └── simulation.data_dictionary
│   │   │   │       └── memlibc_memory_bist_assembly_rtl.patterns_spec_signoff
│   │   │   ├── tshell.log_dft_spec
│   │   │   ├── tshell.log_patterns_spec
│   │   │   └── tshell.log_simulations
│   │   └── VerilogOptions
│   └── dofiles
│       ├── memory_test.do
│       ├── run_atpg.do
│       └── scan_insertion.do
├── TREE.md
├── generate_tree.sh
└── update_readme.sh

545 directories, 2972 files
```
<!-- END OF TREE -->

---

## 🚀 Getting Started

To get started:

1. Clone this repository:
   ```bash
   git clone https://github.com/Ashok260/DFT.git
   cd DFT
