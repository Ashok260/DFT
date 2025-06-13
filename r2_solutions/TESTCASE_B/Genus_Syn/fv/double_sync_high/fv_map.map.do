
//input ports
add mapped point in_data[0] in_data[0] -type PI PI
add mapped point out_clk out_clk -type PI PI
add mapped point out_rst_n out_rst_n -type PI PI

//output ports
add mapped point out_data[0] out_data[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point in_data_3s[0]/q in_data_3s_reg[0]/Q -type DFF DFF
add mapped point in_data_2s[0]/q in_data_2s_reg[0]/Q -type DFF DFF
add mapped point in_data_s[0]/q in_data_s_reg[0]/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
