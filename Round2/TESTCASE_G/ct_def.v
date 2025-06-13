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
module ct_def(
//inputs
	ct_in,enc_done,clk,rst,key_in,out_buf_empty,
//output
	out_buf_dout,out_buf_we_en
    );

input [127:0] ct_in;
input [7:0] key_in;
input clk;
input rst;
input enc_done;
input out_buf_empty;

output [7:0] out_buf_dout;

output out_buf_we_en;


reg enc_done_1;
reg [3:0]ct_sel_cntr;
reg [7:0] ct_byte_0;
reg [7:0] ct_byte_1;
reg [7:0] ct_byte_2;
reg [7:0] ct_byte_3;
reg [7:0] ct_byte_4;
reg [7:0] ct_byte_5;
reg [7:0] ct_byte_6;
reg [7:0] ct_byte_7;
reg [7:0] ct_byte_8;
reg [7:0] ct_byte_9;
reg [7:0] ct_byte_A;
reg [7:0] ct_byte_B;
reg [7:0] ct_byte_C;
reg [7:0] ct_byte_D;
reg [7:0] ct_byte_E;
reg [7:0] ct_byte_F;

wire ct_sel_cntr_n0 = ct_sel_cntr[3] | ct_sel_cntr[2] | ct_sel_cntr[1] | ct_sel_cntr[0];

wire ct_sel_cntr_inc = (ct_sel_cntr_n0)? 1'b1 : enc_done_1;

assign out_buf_we_en = ct_sel_cntr_n0 | enc_done_1 | (enc_done & out_buf_empty);



always@(posedge clk or posedge rst)
if(rst)
	ct_sel_cntr<=4'b0000;
else
	if(ct_sel_cntr_inc)
		ct_sel_cntr<=ct_sel_cntr+1;
		

always@(posedge clk)
enc_done_1<=enc_done;

reg [7:0]out_buf_dout_1;
always@(ct_sel_cntr,ct_byte_F,ct_byte_E,ct_byte_D,ct_byte_C,ct_byte_B,ct_byte_A,ct_byte_9,ct_byte_8,
        ct_byte_7,ct_byte_6,ct_byte_5,ct_byte_4,ct_byte_3,ct_byte_2,ct_byte_1,ct_byte_0)
	case(ct_sel_cntr)
		4'h0:out_buf_dout_1<=ct_byte_F;
		4'h1:out_buf_dout_1<=ct_byte_E;
		4'h2:out_buf_dout_1<=ct_byte_D;
		4'h3:out_buf_dout_1<=ct_byte_C;
		4'h4:out_buf_dout_1<=ct_byte_B;
		4'h5:out_buf_dout_1<=ct_byte_A;
		4'h6:out_buf_dout_1<=ct_byte_9;
		4'h7:out_buf_dout_1<=ct_byte_8;
		4'h8:out_buf_dout_1<=ct_byte_7;
		4'h9:out_buf_dout_1<=ct_byte_6;
		4'hA:out_buf_dout_1<=ct_byte_5;
		4'hB:out_buf_dout_1<=ct_byte_4;
		4'hC:out_buf_dout_1<=ct_byte_3;
		4'hD:out_buf_dout_1<=ct_byte_2;
		4'hE:out_buf_dout_1<=ct_byte_1;
		4'hF:out_buf_dout_1<=ct_byte_0;
	endcase

assign out_buf_dout = (enc_done & out_buf_empty) ? key_in : out_buf_dout_1;

always@(posedge clk or posedge rst)
if(rst) begin
	ct_byte_0<=8'h00;
	ct_byte_1<=8'h00;
	ct_byte_2<=8'h00;
	ct_byte_3<=8'h00;
	ct_byte_4<=8'h00;
	ct_byte_5<=8'h00;
	ct_byte_6<=8'h00;
	ct_byte_7<=8'h00;
	ct_byte_8<=8'h00;
	ct_byte_9<=8'h00;
	ct_byte_A<=8'h00;
	ct_byte_B<=8'h00;
	ct_byte_C<=8'h00;
	ct_byte_D<=8'h00;
	ct_byte_E<=8'h00;
	ct_byte_F<=8'h00;
end
else
	if(enc_done) begin
		ct_byte_0<=ct_in[7:0];
		ct_byte_1<=ct_in[15:8];
		ct_byte_2<=ct_in[23:16];
		ct_byte_3<=ct_in[31:24];
		ct_byte_4<=ct_in[39:32];
		ct_byte_5<=ct_in[47:40];
		ct_byte_6<=ct_in[55:48];
		ct_byte_7<=ct_in[63:56];
		ct_byte_8<=ct_in[71:64];
		ct_byte_9<=ct_in[79:72];
		ct_byte_A<=ct_in[87:80];
		ct_byte_B<=ct_in[95:88];
		ct_byte_C<=ct_in[103:96];
		ct_byte_D<=ct_in[111:104];
		ct_byte_E<=ct_in[119:112];
		ct_byte_F<=ct_in[127:120];
	end
endmodule
