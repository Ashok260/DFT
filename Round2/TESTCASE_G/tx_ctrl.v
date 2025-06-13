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
module tx_ctrl(
//inputs
clk,rst,start_tx_reg,rs232_busy,out_buf_empty,
//outputs
rs232_start,out_buf_rd_en,end_seq
    );

input clk;
input rst;
input start_tx_reg;
input rs232_busy;
input out_buf_empty;


output rs232_start;
output out_buf_rd_en;
output end_seq;


reg start_tx_1;
always@(posedge clk or posedge rst)
if(rst)
	start_tx_1<=1'b0;
else
	start_tx_1<= start_tx_reg;

reg start_tx_2;
always@(posedge clk or posedge rst)
if(rst)
	start_tx_2<=1'b0;
else
	start_tx_2<=start_tx_1;
	

reg rs232_busy_1;
always@(posedge clk or posedge rst)
if(rst)
	rs232_busy_1<=1'b0;
else
	rs232_busy_1<=rs232_busy;

reg out_buf_empty_1;
always@(posedge clk or posedge rst)
if(rst)
out_buf_empty_1<=1'b0;
else
out_buf_empty_1<=out_buf_empty;

reg cntr_stop;
reg cntr_stop_1;
reg [3:0]cntr;
wire inc_cntr = ~rs232_busy_1 & rs232_busy & out_buf_empty_1 & ~cntr_stop;


always@(posedge clk or posedge rst)
if(rst)
	cntr_stop<=1'b0;
else
	if(&cntr)
		cntr_stop<=1'b1;
		
		
always@(posedge clk or posedge rst)
if(rst)
	cntr_stop_1<=1'b0;
else
	cntr_stop_1<=cntr_stop;

always@(posedge clk or posedge rst)
if(rst)
	cntr<=4'b0000;
else
	if(inc_cntr)
		cntr<=cntr+1;
		
reg end_seq;
always@(posedge clk or posedge rst)
if(rst)
	end_seq<=1'b0;
else
	if(~rs232_busy_1 & rs232_busy & out_buf_empty)
		end_seq<=1'b1;


assign out_buf_rd_en = (~start_tx_1 & start_tx_reg) | (~rs232_busy_1 & rs232_busy);
assign rs232_start = end_seq ?~cntr_stop:start_tx_2;

wire [35:0] control;
wire [35:0] control1;

//icon ic(
//	.CONTROL0(control)
////	.CONTROL1(control1)
//	);
////
////iomod im(
////	.CLK(CLK1_top),
////	.CONTROL(control),
////	.SYNC_OUT(enc_done_vio)
////	);
////
//ila ana(
//	.CONTROL(control),
//	.CLK(clk),
//	.DATA({rs232_data, cntr_stop, rs232_start, out_buf_rd_en,rs232_busy}),
//	.TRIG0({start_tx_reg,out_buf_rd_en})
//);

endmodule
