# Base directory for reports
set base_dir "timing_reports"
file mkdir $base_dir

# Define memory instances: {cell_name instance_path pin_list}
set memory_pins {
    {spram_8192_5 U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/eilm/lm_mem_1/gen_banks[0].u_sram5_my_sram {CEB A I CLK CSB WEB}}
    {spram_8192_7 U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/eilm/lm_mem_1/gen_banks[0].u_sram7_0_my_sram {CEB A I CLK CSB WEB}}
    {SPRAM_8192x36 U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/cpu_subsystem/edlm/U_edlm_mem_1/u_bank0_my_sram {CE A I CLK CSB WEB}}
    {SPRAM_64x32 U_cpu_sys_top/U_cpu_subsys_core/U_ag101_core/macahb/rxfifo/U_mem/mem_banks[0].u_sram_my_sram {CE A I CLK CSB WEB}}
    {rd3_256x8 U_emep_top/i_pcie4_txbuf/tx_buf_x16_x8_x4_U_pcie_ip_tx_buf_0_/u_rd3_0_u_dpram_256x8 {CE1 CE2 A1 A2 I2 CLKA CLKB CSB1 CSB2}}
    {rd3_512x16 U_emep_top/i_pcie4_rxbuf/rx_buf_x16_x16_U_pcie_ip_rx_buf_3_/u_sram16_1_u_dpram_512x16 {CE1 CE2 A1 A2 I2 CLKA CLKB CSB1 CSB2}}
    {DPRAM_512x24 U_emep_top/i_pcie4_rxbuf/rx_buf_x16_x16_U_pcie_ip_rx_buf_2_/u_sram24_1_u_dpram_512x24 {CE1 CE2 A1 A2 I2 CLKA CLKB CSB1 CSB2}}
}

# Loop through each memory cell
foreach mem_entry $memory_pins {
    set cell_name [lindex $mem_entry 0]
    set inst_path [lindex $mem_entry 1]
    set pins [lindex $mem_entry 2]

    # Extract instance name from full path
    regexp {([^/]+)$} $inst_path match inst_leaf

    # Construct memory directory: memory_name/instance_name/
    set mem_dir "${base_dir}/${cell_name}/${inst_leaf}"
    file mkdir $mem_dir

    # Loop over each pin
    foreach pin $pins {
        set full_pin "${inst_path}/${pin}"

        if {[llength [get_pins -quiet $full_pin]] == 0} {
            puts "Warning: Pin $full_pin not found"
            continue
        }

        puts "Reporting timing for $full_pin"

        # Create pin directory
        set pin_dir "${mem_dir}/${pin}"
        file mkdir $pin_dir
        set rpt_file "${pin_dir}/${pin}.txt"

        # Clock pins: use -unconstrained to avoid path violations
        if {[regexp {^(CE|CEB|CE1|CE2|CLKA|CLKB|CLK)$} $pin]} {
            redirect $rpt_file {
                report_timing -to [get_pins $full_pin] -max_paths 3 -unconstrained
            }
        } else {
            # Data/control pins: normal path timing
            redirect $rpt_file {
                report_timing -to [get_pins $full_pin] -max_paths 3 
            }
        }
    }
}

