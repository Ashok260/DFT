#######################################################
#                                                     
#  Tempus Timing Signoff Solution Command Logging File                     
#  Created on Fri May  2 10:04:01 2025                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Signoff Solution v20.20-p001_1 (64bit) 12/02/2020 16:07 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.20-p001_1 NR200917-0125/MT (database version 18.20.530) {superthreading v2.11}
#@(#)CDS: AAE 20.20-p005 (64bit) 12/02/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.20-p010_1 () Dec  2 2020 14:35:30 ( )
#@(#)CDS: SYNTECH 20.20-p001_1 () Nov 24 2020 02:28:20 ( )
#@(#)CDS: CPE v20.20-p009

read_verilog ../../RTL/RTL/cpu_sys.v
read_lib {../../TECHFILES/slow.lib ../../TECHFILES/memories/spram_8192_7_min.lib ../../TECHFILES/memories/spram_8192_5_min.lib ../../TECHFILES/memories/SPRAM_8192x36_min_SP.lib ../../TECHFILES/memories/SPRAM_64x32_min.lib ../../TECHFILES/memories/DPRAM_512x24_min.lib ../../TECHFILES/memories/rd3_512x16_ss_1p62v_125c.lib ../../TECHFILES/memories/rd3_256x8_ss_1p62v_125c.lib}
set_top_module
read_sdc cpu_sys.sdc
report_fanin -to U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/txfifo/U_mem
report_fanin U_mem
report_fanin -to U_mem
report_fanin -to U_mem/GWEN
deselectObject Module U_cpu_sys_top
deselectObject Module U_cpu_sys_top
deselectObject Module U_cpu_sys_top
deselectObject Module U_cpu_sys_top
deselectObject Module U_cpu_sys_top
selectObject Module U_cpu_sys_top
load_timing_debug_report -name default_report top.mtarpt
report_timing -early -max_paths 10
report_fanin -to U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/txfifo/U_mem
report_path_groups 
report_cell_instance_timing 
report_cell_instance_timing U_mem
report_cell_instance_timing U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/txfifo/U_mem
report_cell_instance_timing U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/txfifo/U_mem
report_fanout  -from U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/txfifo/U_mem
report_timing -from U_cpu_sys_top -to U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/txfifo/U_mem -max_paths 10
report_timing -from U_cpu_sys_top -to U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/txfifo/U_mem -max_paths 10 -unconstrained 
report_clock_timing 
report_clock_timing -type summary 
report_cell_instance_timing U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/txfifo/U_mem/GWEN
report_cell_instance_timing U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/txfifo/U_mem/WEB
report_cell_instance_timing U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/txfifo/U_mem/CK
report_cell_instance_timing U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/txfifo/U_mem/CLK
report_clock_timing -type summary > clock_summary.rpt
report_clocks -hierarchy 
report_fanout -from SWCLK
report_clocks 
report_fanin -to  U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_CLK_BUF_00/Y   
report_fanout -from   U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_CLK_BUF_00/Y   
report_instance_library
report_instance_library > instance_lib_rep.rpt
report_fanin -to  U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/rxfifo/U_mem/mem_banks[0].u_sram_my_sram
report_fanin -to  U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/rxfifo/U_mem/mem_banks[0].u_sram_my_sram/WEB
report_timing -to U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/rxfifo/U_mem/mem_banks[0].u_sram_my_sram/WEB -from  U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/rxdma/rxpkt2fifo/wr_rxpkt/syn2_d_reg/CK
report_timing -to U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/rxfifo/U_mem/mem_banks[0].u_sram_my_sram/WEB -from  U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/rxdma/rxpkt2fifo/wr_rxpkt/syn2_d_reg/CK -max_paths 10
report_timing -to U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/rxfifo/U_mem/mem_banks[0].u_sram_my_sram/WEB -from  U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/rxdma/rxpkt2fifo/wr_rxpkt/syn2_d_reg/CK > SRAM_512x32_clk_WEB.txt
report_timing -to U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/rxfifo/U_mem/mem_banks[0].u_sram_my_sram/A -from  U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/rxdma/rxpkt2fifo/wr_rxpkt/syn2_d_reg/CK -max_paths 10
report_timing -to U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/rxfifo/U_mem/mem_banks[0].u_sram_my_sram/A -from  U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/rxdma/rxpkt2fifo/wr_rxpkt/syn2_d_reg/CK -max_paths 10 > timing_512x32_clk_A.rpt
