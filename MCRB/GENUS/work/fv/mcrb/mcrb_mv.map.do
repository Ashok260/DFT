
//input ports
add mapped point mc_rb_ef1_svld_i mc_rb_ef1_svld_i -type PI PI
add mapped point gctl_rclk_orst_n_i gctl_rclk_orst_n_i -type PI PI
add mapped point mc_rb_fuse_vld_i mc_rb_fuse_vld_i -type PI PI
add mapped point mc_rb_ef1_sclk_i mc_rb_ef1_sclk_i -type PI PI

//output ports
add mapped point skew_addr_cntr_o[4] skew_addr_cntr_o[4] -type PO PO
add mapped point skew_addr_cntr_o[3] skew_addr_cntr_o[3] -type PO PO
add mapped point skew_addr_cntr_o[2] skew_addr_cntr_o[2] -type PO PO
add mapped point skew_addr_cntr_o[1] skew_addr_cntr_o[1] -type PO PO
add mapped point skew_addr_cntr_o[0] skew_addr_cntr_o[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point skew_addr_cntr[4]/q skew_addr_cntr_reg[4]/Q  -type DFF DFF
add mapped point skew_addr_cntr[4]/q skew_addr_cntr_reg[4]/QN  -type DFF DFF
add mapped point skew_addr_cntr[3]/q skew_addr_cntr_reg[3]/Q  -type DFF DFF
add mapped point skew_addr_cntr[3]/q skew_addr_cntr_reg[3]/QN  -type DFF DFF
add mapped point skew_addr_cntr[1]/q skew_addr_cntr_reg[1]/Q  -type DFF DFF
add mapped point skew_addr_cntr[1]/q skew_addr_cntr_reg[1]/QN  -type DFF DFF
add mapped point skew_addr_cntr[2]/q skew_addr_cntr_reg[2]/Q  -type DFF DFF
add mapped point skew_addr_cntr[2]/q skew_addr_cntr_reg[2]/QN  -type DFF DFF
add mapped point skew_addr_cntr[0]/q skew_addr_cntr_reg[0]/Q  -type DFF DFF
add mapped point skew_addr_cntr[0]/q skew_addr_cntr_reg[0]/QN  -type DFF DFF
add mapped point mc_rb_fuse_vld_q/q mc_rb_fuse_vld_q_reg/Q  -type DFF DFF
add mapped point mc_rb_fuse_vld_q/q mc_rb_fuse_vld_q_reg/QN  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
