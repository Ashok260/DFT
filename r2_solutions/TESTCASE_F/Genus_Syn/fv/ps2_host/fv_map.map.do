
//input ports
add mapped point sys_clk sys_clk -type PI PI
add mapped point sys_rst sys_rst -type PI PI
add mapped point scan_in scan_in -type PI PI
add mapped point scan_enable scan_enable -type PI PI
add mapped point tx_data[7] tx_data[7] -type PI PI
add mapped point tx_data[6] tx_data[6] -type PI PI
add mapped point tx_data[5] tx_data[5] -type PI PI
add mapped point tx_data[4] tx_data[4] -type PI PI
add mapped point tx_data[3] tx_data[3] -type PI PI
add mapped point tx_data[2] tx_data[2] -type PI PI
add mapped point tx_data[1] tx_data[1] -type PI PI
add mapped point tx_data[0] tx_data[0] -type PI PI
add mapped point send_req send_req -type PI PI

//output ports
add mapped point scan_out scan_out -type PO PO
add mapped point busy busy -type PO PO
add mapped point rx_data[7] rx_data[7] -type PO PO
add mapped point rx_data[6] rx_data[6] -type PO PO
add mapped point rx_data[5] rx_data[5] -type PO PO
add mapped point rx_data[4] rx_data[4] -type PO PO
add mapped point rx_data[3] rx_data[3] -type PO PO
add mapped point rx_data[2] rx_data[2] -type PO PO
add mapped point rx_data[1] rx_data[1] -type PO PO
add mapped point rx_data[0] rx_data[0] -type PO PO
add mapped point ready ready -type PO PO
add mapped point error error -type PO PO

//inout ports
add mapped point ps2_clk ps2_clk
add mapped point ps2_data ps2_data




//Sequential Pins
add mapped point ps2_host_tx/frame[2]/q ps2_host_tx_frame_reg[2]/Q -type DFF DFF
add mapped point ps2_host_tx/frame[1]/q ps2_host_tx_frame_reg[1]/Q -type DFF DFF
add mapped point ps2_host_tx/frame[9]/q ps2_host_tx_frame_reg[9]/Q -type DFF DFF
add mapped point ps2_host_tx/frame[8]/q ps2_host_tx_frame_reg[8]/Q -type DFF DFF
add mapped point ps2_host_tx/frame[5]/q ps2_host_tx_frame_reg[5]/Q -type DFF DFF
add mapped point ps2_host_tx/frame[6]/q ps2_host_tx_frame_reg[6]/Q -type DFF DFF
add mapped point ps2_host_tx/frame[7]/q ps2_host_tx_frame_reg[7]/Q -type DFF DFF
add mapped point ps2_host_tx/frame[3]/q ps2_host_tx_frame_reg[3]/Q -type DFF DFF
add mapped point ps2_host_tx/frame[4]/q ps2_host_tx_frame_reg[4]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[5]/q ps2_host_watchdog_watchdog_timer_reg[5]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[9]/q ps2_host_watchdog_watchdog_timer_reg[9]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[14]/q ps2_host_watchdog_watchdog_timer_reg[14]/Q -type DFF DFF
add mapped point ps2_host_rx/frame[1]/q ps2_host_rx_frame_reg[1]/Q -type DFF DFF
add mapped point ps2_host_tx/frame[11]/q ps2_host_tx_frame_reg[11]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[10]/q ps2_host_watchdog_watchdog_timer_reg[10]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[11]/q ps2_host_watchdog_watchdog_timer_reg[11]/Q -type DFF DFF
add mapped point ps2_host_tx/frame[10]/q ps2_host_tx_frame_reg[10]/Q -type DFF DFF
add mapped point ps2_host_rx/frame[9]/q ps2_host_rx_frame_reg[9]/Q -type DFF DFF
add mapped point ps2_host_rx/frame[10]/q ps2_host_rx_frame_reg[10]/Q -type DFF DFF
add mapped point ps2_host_rx/frame[6]/q ps2_host_rx_frame_reg[6]/Q -type DFF DFF
add mapped point ps2_host_rx/frame[7]/q ps2_host_rx_frame_reg[7]/Q -type DFF DFF
add mapped point ps2_host_rx/frame[4]/q ps2_host_rx_frame_reg[4]/Q -type DFF DFF
add mapped point ps2_host_rx/frame[2]/q ps2_host_rx_frame_reg[2]/Q -type DFF DFF
add mapped point ps2_host_rx/frame[8]/q ps2_host_rx_frame_reg[8]/Q -type DFF DFF
add mapped point ps2_host_rx/frame[5]/q ps2_host_rx_frame_reg[5]/Q -type DFF DFF
add mapped point ps2_host_rx/frame[3]/q ps2_host_rx_frame_reg[3]/Q -type DFF DFF
add mapped point ps2_host_rx/frame[11]/q ps2_host_rx_frame_reg[11]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[13]/q ps2_host_watchdog_watchdog_timer_reg[13]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[1]/q ps2_host_watchdog_watchdog_timer_reg[1]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[6]/q ps2_host_watchdog_watchdog_timer_reg[6]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[8]/q ps2_host_watchdog_watchdog_timer_reg[8]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[0]/q ps2_host_watchdog_watchdog_timer_reg[0]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[2]/q ps2_host_watchdog_watchdog_timer_reg[2]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[12]/q ps2_host_watchdog_watchdog_timer_reg[12]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[3]/q ps2_host_watchdog_watchdog_timer_reg[3]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[7]/q ps2_host_watchdog_watchdog_timer_reg[7]/Q -type DFF DFF
add mapped point ps2_host_rx/frame[0]/q ps2_host_rx_frame_reg[0]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_timer[4]/q ps2_host_watchdog_watchdog_timer_reg[4]/Q -type DFF DFF
add mapped point ps2_host_watchdog/watchdog_active/q ps2_host_watchdog_watchdog_active_reg/Q -type DFF DFF
add mapped point ps2_host_tx/frame[0]/q ps2_host_tx_frame_reg[0]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[13]/q ps2_host_clk_ctrl_inhibit_timer_reg[13]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/ps2_clk_samples[1]/q ps2_host_clk_ctrl_ps2_clk_samples_reg[1]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[9]/q ps2_host_clk_ctrl_inhibit_timer_reg[9]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[10]/q ps2_host_clk_ctrl_inhibit_timer_reg[10]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[4]/q ps2_host_clk_ctrl_inhibit_timer_reg[4]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[8]/q ps2_host_clk_ctrl_inhibit_timer_reg[8]/Q -type DFF DFF
add mapped point ps2_host_rx/error/q ps2_host_rx_error_reg/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[11]/q ps2_host_clk_ctrl_inhibit_timer_reg[11]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[1]/q ps2_host_clk_ctrl_inhibit_timer_reg[1]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[5]/q ps2_host_clk_ctrl_inhibit_timer_reg[5]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[12]/q ps2_host_clk_ctrl_inhibit_timer_reg[12]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[0]/q ps2_host_clk_ctrl_inhibit_timer_reg[0]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[2]/q ps2_host_clk_ctrl_inhibit_timer_reg[2]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[6]/q ps2_host_clk_ctrl_inhibit_timer_reg[6]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[7]/q ps2_host_clk_ctrl_inhibit_timer_reg[7]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/inhibit_timer[3]/q ps2_host_clk_ctrl_inhibit_timer_reg[3]/Q -type DFF DFF
add mapped point ps2_host_clk_ctrl/ps2_clk_samples[0]/q ps2_host_clk_ctrl_ps2_clk_samples_reg[0]/Q -type DFF DFF
add mapped point ps2_host_rx/rx_data[0]/q ps2_host_rx_rx_data_reg[0]/Q -type DFF DFF
add mapped point ps2_host_rx/rx_data[3]/q ps2_host_rx_rx_data_reg[3]/Q -type DFF DFF
add mapped point ps2_host_rx/rx_data[1]/q ps2_host_rx_rx_data_reg[1]/Q -type DFF DFF
add mapped point ps2_host_rx/rx_data[2]/q ps2_host_rx_rx_data_reg[2]/Q -type DFF DFF
add mapped point ps2_host_rx/rx_data[4]/q ps2_host_rx_rx_data_reg[4]/Q -type DFF DFF
add mapped point ps2_host_rx/rx_data[5]/q ps2_host_rx_rx_data_reg[5]/Q -type DFF DFF
add mapped point ps2_host_rx/rx_data[7]/q ps2_host_rx_rx_data_reg[7]/Q -type DFF DFF
add mapped point ps2_host_rx/rx_data[6]/q ps2_host_rx_rx_data_reg[6]/Q -type DFF DFF
add mapped point ps2_host_rx/ready/q ps2_host_rx_ready_reg/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
