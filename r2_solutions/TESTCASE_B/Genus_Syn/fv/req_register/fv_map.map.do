
//input ports
add mapped point clk clk -type PI PI
add mapped point reset_n reset_n -type PI PI
add mapped point cpu_we cpu_we -type PI PI
add mapped point cpu_req cpu_req -type PI PI
add mapped point hware_ack hware_ack -type PI PI

//output ports
add mapped point data_out data_out -type PO PO

//inout ports




//Sequential Pins
add mapped point data_out/q data_out_reg/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
