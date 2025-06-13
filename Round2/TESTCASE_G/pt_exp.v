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
module pt_exp(
//Inputs
din,start_enc,in_buf_empty,enc_done,clk,rst,
//outputs 
dout,rd_en,enc_start
    );
	 
input clk;
input rst;
input [7:0] din;
input start_enc;
input enc_done;
input in_buf_empty;

output [127:0] dout;
output rd_en;
output enc_start;

wire enc_done;
wire pt_sel_cntr_inc;
wire pt_sel_cntr_n0;
wire pt_sel_cntr_f;
wire dout_latch;
wire pause_cntr;
wire [7:0]pt_data_in;
wire pt_ce;
wire pt_0_ce;
wire pt_1_ce;
wire pt_2_ce;
wire pt_3_ce;
wire pt_4_ce;
wire pt_5_ce;
wire pt_6_ce;
wire pt_7_ce;
wire pt_8_ce;
wire pt_9_ce;
wire pt_A_ce;
wire pt_B_ce;
wire pt_C_ce;
wire pt_D_ce;
wire pt_E_ce;
wire pt_F_ce;

reg enc_in_progress;
reg enc_in_progress_1;
reg enc_start;
reg start_enc_1;
reg enc_start_0;
reg enc_start_1;
reg pt_sel_cntr_f_1;
reg in_buf_empty_1;
reg dout_latch_0;
reg dout_latch_1;
reg dout_latch_2;

reg [3:0] pt_sel_cntr;
reg [15:0] pt_sel_dcdr;
reg [7:0] pt_byte_0;
reg [7:0] pt_byte_1;
reg [7:0] pt_byte_2;
reg [7:0] pt_byte_3;
reg [7:0] pt_byte_4;
reg [7:0] pt_byte_5;
reg [7:0] pt_byte_6;
reg [7:0] pt_byte_7;
reg [7:0] pt_byte_8;
reg [7:0] pt_byte_9;
reg [7:0] pt_byte_A;
reg [7:0] pt_byte_B;
reg [7:0] pt_byte_C;
reg [7:0] pt_byte_D;
reg [7:0] pt_byte_E;
reg [7:0] pt_byte_F;
reg [127:0] dout;


assign pt_data_in[7:0] = ~in_buf_empty_1 ? din[7:0] : 8'h04;

//assign dout={pt_byte_F,pt_byte_E,pt_byte_D,pt_byte_C,pt_byte_B,pt_byte_A,pt_byte_9,pt_byte_8,
//             pt_byte_7,pt_byte_6,pt_byte_5,pt_byte_4,pt_byte_3,pt_byte_2,pt_byte_1,pt_byte_0};

assign pt_ce = pt_sel_cntr_inc;
assign pt_0_ce = pt_ce & pt_sel_dcdr[0];
assign pt_1_ce = pt_ce & pt_sel_dcdr[1];
assign pt_2_ce = pt_ce & pt_sel_dcdr[2];
assign pt_3_ce = pt_ce & pt_sel_dcdr[3];
assign pt_4_ce = pt_ce & pt_sel_dcdr[4];
assign pt_5_ce = pt_ce & pt_sel_dcdr[5];
assign pt_6_ce = pt_ce & pt_sel_dcdr[6];
assign pt_7_ce = pt_ce & pt_sel_dcdr[7];
assign pt_8_ce = pt_ce & pt_sel_dcdr[8];
assign pt_9_ce = pt_ce & pt_sel_dcdr[9];
assign pt_A_ce = pt_ce & pt_sel_dcdr[10];
assign pt_B_ce = pt_ce & pt_sel_dcdr[11];
assign pt_C_ce = pt_ce & pt_sel_dcdr[12];
assign pt_D_ce = pt_ce & pt_sel_dcdr[13];
assign pt_E_ce = pt_ce & pt_sel_dcdr[14];
assign pt_F_ce = pt_ce & pt_sel_dcdr[15];
assign pt_sel_cntr_n0 = pt_sel_cntr[3] | pt_sel_cntr[2] | pt_sel_cntr[1] | pt_sel_cntr[0];
assign pt_sel_cntr_f =  pt_sel_cntr[3] &  pt_sel_cntr[2] &  pt_sel_cntr[1] &  pt_sel_cntr[0];

assign pause_cntr = pt_sel_cntr_f & enc_in_progress;

assign rd_en = start_enc & ~pause_cntr;

assign pt_sel_cntr_inc = pt_sel_cntr_n0 ? ~pause_cntr : start_enc_1;

assign dout_latch = dout_latch_0 & ~pt_sel_cntr_f;

always@(posedge clk or posedge rst)
if(rst)
	dout_latch_0<=1'b0;
else
	dout_latch_0<=pt_sel_cntr_f;
	
always@(posedge clk or posedge rst)
if(rst)
	dout<=128'h00000000000000000000000000000000;
else
	if(dout_latch)
		dout<={pt_byte_0,pt_byte_1,pt_byte_2,pt_byte_3,pt_byte_4,pt_byte_5,pt_byte_6,pt_byte_7,
             pt_byte_8,pt_byte_9,pt_byte_A,pt_byte_B,pt_byte_C,pt_byte_D,pt_byte_E,pt_byte_F};

//always@(posedge clk or posedge rst)
//if(rst)
//	dout_latch_1<=1'b0;
//else
//	dout_latch_1<=dout_latch;
//	
//always@(posedge clk or posedge rst)
//if(rst)
//	dout_latch_2<=1'b0;
//else
//	dout_latch_2<=dout_latch_1;
//
//
always@(posedge clk or posedge rst)
if(rst)
	enc_start_0<=1'b0;
else
	enc_start_0<=dout_latch;

always@(posedge clk or posedge rst)
if(rst)
	enc_start<=1'b0;
else
	if(enc_start_0)
		enc_start<=1'b1;
	else
		enc_start<=1'b0;
	
always@(posedge clk)
	pt_sel_cntr_f_1<= pt_sel_cntr_f;

always@(posedge clk or posedge rst)
if(rst)
	enc_in_progress <= 1'b0;
else
	if(enc_start == 1'b1)
		enc_in_progress<=1'b1;
	else if(enc_done == 1'b1)
		enc_in_progress<=1'b0;
		
//always@(posedge clk)
//	enc_start_1<=enc_start;


always@(posedge clk or posedge rst)
if(rst)
	start_enc_1<= 1'b0;
else
	if(start_enc == 1'b1 && in_buf_empty != 1'b1)
		start_enc_1<= 1'b1;
	else
		start_enc_1<=1'b0;

always@(posedge clk or posedge rst)
if(rst)
	in_buf_empty_1<=1'b1;
else
	in_buf_empty_1<=in_buf_empty;
	
always@(posedge clk or posedge rst)
if(rst)
	pt_sel_cntr<=4'b0000;
else
	if(pt_sel_cntr_inc == 1'b1)
		pt_sel_cntr<=pt_sel_cntr + 1;

always@(pt_sel_cntr)
	case(pt_sel_cntr)
		4'h0:pt_sel_dcdr<=16'b0000000000000001;
		4'h1:pt_sel_dcdr<=16'b0000000000000010;
		4'h2:pt_sel_dcdr<=16'b0000000000000100;
		4'h3:pt_sel_dcdr<=16'b0000000000001000;
		4'h4:pt_sel_dcdr<=16'b0000000000010000;
		4'h5:pt_sel_dcdr<=16'b0000000000100000;
		4'h6:pt_sel_dcdr<=16'b0000000001000000;
		4'h7:pt_sel_dcdr<=16'b0000000010000000;
		4'h8:pt_sel_dcdr<=16'b0000000100000000;
		4'h9:pt_sel_dcdr<=16'b0000001000000000;
		4'hA:pt_sel_dcdr<=16'b0000010000000000;
		4'hB:pt_sel_dcdr<=16'b0000100000000000;
		4'hC:pt_sel_dcdr<=16'b0001000000000000;
		4'hD:pt_sel_dcdr<=16'b0010000000000000;
		4'hE:pt_sel_dcdr<=16'b0100000000000000;
		4'hF:pt_sel_dcdr<=16'b1000000000000000;
	endcase



always@(posedge clk or posedge rst)
if(rst)
	pt_byte_0<=8'h00;
else
	if(pt_0_ce == 1'b1)
		pt_byte_0<=pt_data_in;

always@(posedge clk or posedge rst)
if(rst)
	pt_byte_1<=8'h00;
else
	if(pt_1_ce == 1'b1)
		pt_byte_1<=pt_data_in;

always@(posedge clk or posedge rst)
if(rst)
	pt_byte_2<=8'h00;
else
	if(pt_2_ce == 1'b1)
		pt_byte_2<=pt_data_in;

always@(posedge clk or posedge rst)
if(rst)
	pt_byte_3<=8'h00;
else
	if(pt_3_ce == 1'b1)
		pt_byte_3<=pt_data_in;

always@(posedge clk or posedge rst)
if(rst)
	pt_byte_4<=8'h00;
else
	if(pt_4_ce == 1'b1)
		pt_byte_4<=pt_data_in;

always@(posedge clk or posedge rst)
if(rst)
	pt_byte_5<=8'h00;
else
	if(pt_5_ce == 1'b1)
		pt_byte_5<=pt_data_in;

always@(posedge clk or posedge rst)
if(rst)
	pt_byte_6<=8'h00;
else
	if(pt_6_ce == 1'b1)
		pt_byte_6<=pt_data_in;

always@(posedge clk or posedge rst)
if(rst)
	pt_byte_7<=8'h00;
else
	if(pt_7_ce == 1'b1)
		pt_byte_7<=pt_data_in;
		
always@(posedge clk or posedge rst)
if(rst)
	pt_byte_8<=8'h00;
else
	if(pt_8_ce == 1'b1)
		pt_byte_8<=pt_data_in;

always@(posedge clk or posedge rst)
if(rst)
	pt_byte_9<=8'h00;
else
	if(pt_9_ce == 1'b1)
		pt_byte_9<=pt_data_in;

always@(posedge clk or posedge rst)
if(rst)
	pt_byte_A<=8'h00;
else
	if(pt_A_ce == 1'b1)
		pt_byte_A<=pt_data_in;

always@(posedge clk or posedge rst)
if(rst)
	pt_byte_B<=8'h00;
else
	if(pt_B_ce == 1'b1)
		pt_byte_B<=pt_data_in;

always@(posedge clk or posedge rst)
if(rst)
	pt_byte_C<=8'h00;
else
	if(pt_C_ce == 1'b1)
		pt_byte_C<=pt_data_in;
		
always@(posedge clk or posedge rst)
if(rst)
	pt_byte_D<=8'h00;
else
	if(pt_D_ce == 1'b1)
		pt_byte_D<=pt_data_in;

always@(posedge clk or posedge rst)
if(rst)
	pt_byte_E<=8'h00;
else
	if(pt_E_ce == 1'b1)
		pt_byte_E<=pt_data_in;

always@(posedge clk or posedge rst)
if(rst)
	pt_byte_F<=8'h00;
else
	if(pt_F_ce == 1'b1)
		pt_byte_F<=pt_data_in;


//wire [35:0] control;
//wire [35:0] control1;
//
//icon ic(
//	.CONTROL0(control),
//	.CONTROL1(control1)
//	);
////
//iomod im(
//	.CLK(clk),
//	.CONTROL(control),
//	.SYNC_OUT(enc_done)
//	);
////
//ila ana(
//	.CONTROL(control1),
//	.CLK(clk),
//	.DATA({dout,pt_data_in,in_buf_rd_en,start_enc,in_buf_empty,enc_start}),
//	.TRIG0(pt_sel_cntr_inc)
//);

endmodule
