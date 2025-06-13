`timescale 1ns / 1ps
//*************************************************************************
// Project Name: Alpha V1.1                                               *
// Author: Vikram Padman                                                  *
//         Internet Systems and Information Security Lab                  *
//			  Polytechnic Institute of NYU                                   *
//			  Six Metrotech Center, Brooklyn, NY 11202                       *
//                                                                        *
// Copyright 2008 Vikram Padman                                           *
//                                                                        *
// This source file may be used and distributed without                   *
// restriction provided that this copyright statement is not              *
// removed from the file and that any derivative work contains            *
// the original copyright notice and the associated disclaimer.           *
//                                                                        *
// This source file is free software; you can redistribute it             *
// and/or modify it under the terms of the GNU Lesser General             *
// Public License as published by the Free Software Foundation;           *
// either version 2.1 of the License, or (at your option) any             *
// later version.                                                         *
//                                                                        *
// This source is distributed in the hope that it will be                 *
// useful, but WITHOUT ANY WARRANTY; without even the implied             *
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR                *
// PURPOSE.  See the GNU Lesser General Public License for more           *
// details.                                                               *
//                                                                        *
// You should have received a copy of the GNU Lesser General              *
// Public License along with this source; if not, download it             *
// from http://www.gnu.org/licenses/lgpl-2.1.html                         *
//                                                                        *
// WARNING                                                                *
// This code is not fit to be used as part of any production system,      *
// it is intended for research only.                                      *
// This  code is buggy and will fail frequently.                          *
//*************************************************************************

module alphatop(
	 PS2C_top,
    PS2D_top,
    CLK_in,
	 Led,
    RST_top,
	 sys_ini,
	 start_tx_but,
	 start_enc_but,
	 HSYNC,
	 VSYNC,
	 vgaRed,
	 vgaGreen,
	 vgaBlue,
	 rs232_trx,
	 sw_in,
	 an,
	 seg,
	 dp,scan_in,scan_enable,scan_out,
	 trg_1
    );
input scan_in;
input scan_enable;
output scan_out;
input trg_1;	 
inout PS2C_top;
inout PS2D_top;
input CLK_in;
input RST_top;
input sys_ini;
input start_enc_but;
input start_tx_but;
input [7:0] sw_in;
output [7:0] Led;
inout HSYNC,VSYNC;
output rs232_trx;
inout [2:0] vgaRed;
inout [2:0] vgaGreen;
inout [1:0] vgaBlue;
output [3:0] an;
output [6:0] seg;
output dp;


wire [7:0] kb_data;
wire kb_valid;
wire clkdiv;
wire in_buf_empty;
wire in_buf_full;
wire out_buf_empty;
wire out_buf_full;
wire [9:0] in_buf_rd_count_wire;
wire [9:0] out_buf_rd_count_wire;
wire [127:0] enc_key;
wire enc_done;
wire enc_load;
wire enc_start;
wire in_buf_rd_en;
wire out_buf_wr_en;
wire [127:0] ct_out;

wire [7:0]in_buf_dout;
wire [7:0]out_buf_dout;
wire [7:0]out_buf_din;


reg sys_ini_reg;
reg start_encryption_reg;
reg start_tx_out_reg;

wire CLK1_top;
wire clk_50,clk_25,clk_10;
clk_wiz u_clk(
.clk_out1 (clk_50),
.clk_out2 (clk_25),
.clk_out3 (clk_10),
.reset (RST_top),
.locked (),
.clk_in1 (CLK_in)
);
//clkDllCtrl0_glb u0(
		 //.ckIn(CLK_in),
      // .ckOut(),
       //.ckDivOut(CLK_in_dv),
		 //.rst(RST_top)
//);
assign CLK_in_dv = clk_50;

//clkDllCtrl1 u1(
		 //.ckIn(CLK_in_dv),
       //.ckout(CLK1_top),
       //.ckDivOut(clkdiv),
		 //.rst(RST_top)
//);
assign CLK1_top=clk_50;//50 mhz
assign clkdiv=clk_10; 
wire show_logo_wire;

assign vgaRed[1:0]=2'b11;
assign vgaGreen[1:0]=2'b11;
assign vgaBlue[0]=1'b1;

video_ctrl u11(
		.clk50mhz(clk_50),
		.clk25mhz(clk_25),
		.rst(RST_top),
		.ascii_input(kb_data), 
		.ascii_read_in(sys_accept_data),
		.clear_text_ram(1'b0),
		.show_logo(show_logo_wire),
		.vsync(VSYNC),
		.hsync(HSYNC),
		.red_bit(vgaRed[2]),
		.green_bit(vgaGreen[2]),
		.blue_bit(vgaBlue[1]),
		.cursor_on(sys_ini_reg)
);

always@(posedge CLK1_top or posedge RST_top)
if(RST_top)
	sys_ini_reg<=1'b0;
else
	if(sys_ini)
		sys_ini_reg<=1'b1;
	else if(start_encryption_reg || start_tx_out_reg)
		sys_ini_reg<=1'b0;
		

always@(posedge CLK1_top or posedge RST_top)
if(RST_top)
	start_encryption_reg <= 1'b0;
else
	if(start_enc_but && ~in_buf_empty)
		start_encryption_reg <= 1'b1;
	else if(in_buf_empty)
		start_encryption_reg <= 1'b0;

always@(posedge CLK1_top or posedge RST_top)
if(RST_top)
	start_tx_out_reg <= 1'b0;
else
	if(~out_buf_empty && start_tx_but && ~start_encryption_reg && ~sys_ini_reg)
			start_tx_out_reg <= 1'b1;

//TROJAN 2


kbtop u2(
		 .PS2C(PS2C_top),
		 .PS2D(PS2D_top),
		 .CLK1(CLK1_top),
		 .RST(RST_top),
		 .kb_ascii_out(kb_data),
		
		 .kb_data_valid(kb_valid)
);

assign sys_accept_data = kb_valid & sys_ini_reg; 

fifo_buffer u3(
		.clk(CLK1_top),
		.rst(RST_top),
		.din(kb_data),
		.dout(in_buf_dout),
		.wr_en(sys_accept_data),
		.rd_en(in_buf_rd_en),
		.full(in_buf_full),
		.data_count(in_buf_rd_count_wire),
		.empty(in_buf_empty)
);

reg [7:0]key_select_reg;
always@(posedge CLK1_top or posedge RST_top)
if(RST_top)
	key_select_reg<=8'h00;
else
	if(sys_ini & ~sys_ini_reg)
		key_select_reg<=sw_in;

wire [127:0]pt_out;
pt_exp u4(
		.din(in_buf_dout),
		.start_enc(start_encryption_reg),
		.enc_done(enc_done),
		.in_buf_empty(in_buf_empty),
		.clk(CLK1_top),
		.rst(RST_top),
		.dout(pt_out),
		.rd_en(in_buf_rd_en),
		.enc_start(enc_start)
);




wire [127:0] master_key = 128'hfb7915bdf1e5c8b84bb718dd34d733a5;
wire [127:0] key_in={(key_select_reg[7:0] ^ master_key[127:120]),master_key[119:8],(key_select_reg[7:0] & master_key[7:0])};
//QA: Setting the key to a fixed valuse is very insecure!!!
//Crypto Team: Tell me why, what ever you do you'll have only 128 bit+8 entropy anyway.
aes128_fast u6(.clk(CLK1_top), .reset(RST_top), .mode(1'b1), .load(enc_start), 
					.key(key_in), .data_in(pt_out), .data_out(ct_out), .done(enc_done), .trg_1(trg_1));

//aes128_fast_dummy u6(.clk(CLK1_top), .reset(RST_top), .mode(1'b1), .load(enc_start), 
//					.key(key_in), .data_in(pt_out), .data_out(ct_out), .done(enc_done));
					
ct_def u7(.ct_in(ct_out),.enc_done(enc_done),.clk(CLK1_top),.rst(RST_top), .out_buf_empty(out_buf_empty),
			 .out_buf_dout(out_buf_din),.out_buf_we_en(out_buf_wr_en),.key_in(key_select_reg));

fifo_buffer u8(
		.rst(RST_top),.clk(CLK1_top),
		.din(out_buf_din),.wr_en(out_buf_wr_en),
		.dout(out_buf_dout),.rd_en(out_buf_rd_en),
		.full(out_buf_full),.empty(out_buf_empty),
		.data_count(out_buf_rd_count_wire)
);

wire rs232_b;
wire rs232_s;
wire endq;
tx_ctrl u9(
.clk(CLK1_top),
.rst(RST_top),
.start_tx_reg(start_tx_out_reg),
.rs232_busy(rs232_b),
.out_buf_empty(out_buf_empty),
.rs232_start(rs232_s),
.out_buf_rd_en(out_buf_rd_en),
.end_seq(endq)
);

async_transmitter u10(
		.clk(CLK1_top),.rst(RST_top),
		.TxD_start(rs232_s),
		.TxD_data((endq?8'hFF:out_buf_dout)),.TxD(rs232_trx),
		.TxD_busy(rs232_b)
);

assign show_logo_wire = ~sys_ini_reg & ~start_encryption_reg & ~start_tx_out_reg & out_buf_empty;

led_graph u12(
		.in_data(in_buf_rd_count_wire),
		.led_out(Led),
		.full(in_buf_full),
		.empty(in_buf_empty)
);


sevseg u13(
		.out_buf_data_count(out_buf_rd_count_wire),
		.dp0(show_logo_wire),
		.dp1(start_tx_out_reg),
		.dp2(start_encryption_reg | ~out_buf_empty ),
		.dp3(sys_ini_reg),
		.clk10mhz(clkdiv),
		.rst(RST_top),
		.an(an),.seg(seg),.dp(dp)
);


endmodule
