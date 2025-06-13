
//input ports
add mapped point data_in[7] data_in[7] -type PI PI
add mapped point data_in[6] data_in[6] -type PI PI
add mapped point data_in[5] data_in[5] -type PI PI
add mapped point data_in[4] data_in[4] -type PI PI
add mapped point data_in[3] data_in[3] -type PI PI
add mapped point data_in[2] data_in[2] -type PI PI
add mapped point data_in[1] data_in[1] -type PI PI
add mapped point data_in[0] data_in[0] -type PI PI
add mapped point we we -type PI PI
add mapped point clk clk -type PI PI
add mapped point rst_sync rst_sync -type PI PI

//output ports
add mapped point data_out[7] data_out[7] -type PO PO
add mapped point data_out[6] data_out[6] -type PO PO
add mapped point data_out[5] data_out[5] -type PO PO
add mapped point data_out[4] data_out[4] -type PO PO
add mapped point data_out[3] data_out[3] -type PO PO
add mapped point data_out[2] data_out[2] -type PO PO
add mapped point data_out[1] data_out[1] -type PO PO
add mapped point data_out[0] data_out[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point data_out[0]/q data_out_reg[0]/Q -type DFF DFF
add mapped point data_out[2]/q data_out_reg[2]/Q -type DFF DFF
add mapped point data_out[3]/q data_out_reg[3]/Q -type DFF DFF
add mapped point data_out[4]/q data_out_reg[4]/Q -type DFF DFF
add mapped point data_out[1]/q data_out_reg[1]/Q -type DFF DFF
add mapped point data_out[5]/q data_out_reg[5]/Q -type DFF DFF
add mapped point data_out[6]/q data_out_reg[6]/Q -type DFF DFF
add mapped point data_out[7]/q data_out_reg[7]/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
