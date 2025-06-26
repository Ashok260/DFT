#######################################################
#                                                     
#  Tempus Timing Solution Command Logging File                     
#  Created on Thu May 29 16:51:43 2025                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Solution v22.11-s001_1 (64bit) 09/16/2022 15:45 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 22.11-s001_1 NR220910-1931/22_11-UB (database version 18.20.592) {superthreading v2.19}
#@(#)CDS: AAE 22.11-e006 (64bit) 09/16/2022 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 22.11-e010_1 () Sep  5 2022 07:16:46 ( )
#@(#)CDS: SYNTECH 22.11-e002_1 () Aug  2 2022 07:54:00 ( )
#@(#)CDS: CPE v22.11-e028

read_lib {../../TECHFILES/slow.lib ../../TECHFILES/memories/spram_8192_7_min.lib ../../TECHFILES/memories/spram_8192_5_min.lib ../../TECHFILES/memories/SPRAM_8192x36_min_SP.lib ../../TECHFILES/memories/SPRAM_64x32_min.lib ../../TECHFILES/memories/DPRAM_512x24_min.lib ../../TECHFILES/memories/rd3_512x16_ss_1p62v_125c.lib ../../TECHFILES/memories/rd3_256x8_ss_1p62v_125c.lib}
read_verilog cpu_sys_emep_top.vg
set_top_module
read_def ../cpu_sys_tessent/tsdb_outdir/dft_inserted_designs/cpu_sys_emep_top_gate.dft_inserted_design/cpu_sys_emep_top.scandef
read_sdc ../cpu_sys.sdc
report_timing
deselectObject Module U_cpu_sys_top
report_timing -from /U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/iiu_ieu_instr_status_ex_reg_0_
report_timing -from /U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/iiu_ieu_instr_status_ex_reg_0_/Q
report_timing -from /U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/iiu_ieu_instr_status_ex_reg_0_
report_timing -from /U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/
report_timing -from /U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/
report_timing -from /U_cpu_sys_top/U_cpu_subsys_core/
report_timing -from /U_cpu_sys_top/
report_fanout -from /U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/iiu_ieu_instr_status_ex_reg_0
report_fanout -from /U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/iiu_ieu_instr_status_ex_reg_0_
report_fanout -from /U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/iiu_ieu_instr_status_ex_reg_0_/Q
report_fanout -from /U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/iiu_ieu_instr_status_ex_reg_0_ 
report_fanout -from /U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/iiu_ieu_instr_status_ex_reg_0_ /SI
report_fanout -from /U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/iiu_ieu_instr_status_ex_reg_0_ /Q
report_fanout -from /U_emep_top/i_pcie_ctrl/core_inst/trans_inst/conf/conf0/bar45/Q
report_instance_library > instance_lib.txt
report_fanout -from /U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/ts_0_lockup_latchn_clkc1_intno2649_i 
report_fanout -from U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/ts_0_lockup_latchn_clkc1_intno2649_i
report_fanout -from U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/ts_0_lockup_latchn_clkc1_intno2649_i/SI
report_fanout -from U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/ts_0_lockup_latchn_clkc1_intno2649_i/si
report_fanout -from U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/ts_0_lockup_latchn_clkc1_intno2649_i/D
report_fanout -from U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/n8_core/ucore/iiu_ctl/ts_0_lockup_latchn_clkc1_intno2649_i/Q
report_fanout -from U_cpu_sys_top/ts_0_extsi65488
report_timing -from U_cpu_sys_top/ts_0_extsi65488
set_case_analysis -help 
set_case_analysis 1 scan_en
report_fanout -from U_cpu_sys_top/ts_0_extsi65488
report_fanout -from U_cpu_sys_top/ts_0_extsi65488 -to U_cpu_sys_top/ts_0_no2649
report_timing -to U_cpu_sys_top/ts_0_no2649
report_timing -to U_cpu_sys_top/ts_0_no2649 -unconstrained 
report_timing -to U_cpu_sys_top/ts_0_no2649 -from U_cpu_sys_top/ts_0_extsi65488 -unconstrained 
report_timing -to U_cpu_sys_top/ts_0_no2649 -from U_cpu_sys_top/ts_0_extsi65488 
report_fanin -to U_cpu_sys_top/ts_0_extsi65488
report_clocks 
report_fanout -from  U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_apb_clkdivby2_reg/U_clk_dff/Q    
report_clocks
report_fanout -from  U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_CLK_BUF_00/Y -pin_levels 1   
report_fanout -from  U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_CLK_BUF_00/Y -pin_levels 2
report_fanout -from  U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_CLK_BUF_00/Y -pin_levels 3
report_fanout -from  U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_CLK_BUF_00/Y -pin_levels 4
report_fanout -from  U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_CLK_BUF_00/Y -pin_levels 5
report_fanout -from  /U_cpu_sys_top/top_reg_sel_pen_r_reg/Q
report_fanout -from  /U_cpu_sys_top/top_reg_sel_pen_r_reg
report_fanout -from  /U_cpu_sys_top/top_reg_sel_pen_r_reg/D
report_fanout -from  /U_cpu_sys_top/top_reg_sel_pen_r_reg/SI
report_fanin -to  /U_cpu_sys_top/top_reg_sel_pen_r_reg/Q
report_fanin -to  /U_cpu_sys_top/top_reg_sel_pen_r_reg/Q
report_fanin -to  /U_cpu_sys_top/top_reg_sel_pen_r_reg/D
report_fanin -to  /U_cpu_sys_top/top_reg_sel_pen_r_reg/Q
report_fanin -to  /U_cpu_sys_top/top_reg_sel_pen_r_reg/SI
report_fanin -to  /U_cpu_sys_top/top_reg_sel_pen_r_reg/Y
report_fanin -to  /U_cpu_sys_top/top_reg_sel_pen_r_reg/X
report_fanout -from   /U_cpu_sys_top/top_reg_sel_pen_r_reg/X
report_fanout -from   /U_cpu_sys_top/top_reg_sel_pen_r_reg
report_fanout -from  /U_cpu_sys_top/top_reg_sel_pen_r_reg
report_fanout -from /U_cpu_sys_top/top_reg_sel_pen_r_reg/Q
report_fanout -from  /U_cpu_sys_top/top_reg_sel_pen_r_reg/Q
report_timing -to /U_cpu_sys_top/top_reg_sel_pen_r_reg/Q
report_timing -from /U_cpu_sys_top/top_reg_sel_pen_r_reg/Q
report_timing -from /U_cpu_sys_top/top_reg_sel_pen_r_reg/Q
report_timing
report_timing -from /U_cpu_sys_top/top_reg_sel_pen_r_reg/Q -unconstrained 
report_timing -from /U_cpu_sys_top/U_aer_sts_edge_det_0_/signal_i_d1_reg/Q
report_timing -from /U_cpu_sys_top/U_aer_sts_edge_det_0_/signal_i_d1_reg/
report_timing -from /U_cpu_sys_top/Q
report_timing -from /U_cpu_sys_top/ts_0_extsi65489
report_fanout -from U_cpu_sys_top/ts_0_extsi65489
