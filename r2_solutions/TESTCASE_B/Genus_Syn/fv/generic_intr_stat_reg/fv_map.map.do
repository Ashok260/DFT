
//input ports
add mapped point clk clk -type PI PI
add mapped point reset_n reset_n -type PI PI
add mapped point reg_we[0] reg_we[0] -type PI PI
add mapped point reg_din[0] reg_din[0] -type PI PI
add mapped point hware_req[0] hware_req[0] -type PI PI

//output ports
add mapped point data_out[0] data_out[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point gen_bit_reg[0].u_bit_reg/data_out/q gen_bit_reg[0].u_bit_reg_data_out_reg/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
