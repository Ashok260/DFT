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
module sevseg(
//input
out_buf_data_count,dp0,dp1,dp2,dp3,clk10mhz,rst,

//output
an,seg,dp);

input [9:0] out_buf_data_count;
input clk10mhz;
input rst;
input dp0,dp1,dp2,dp3;

output [3:0]an;
output [6:0]seg;
output dp;

reg [3:0]an;
reg [6:0]seg;
reg [3:0]disp_data;
reg [11:0]cntr_1;
reg [3:0] state_decode;
reg dp;
wire clkout;
wire clkdiv;
//clkDllCtrl u1(
//		 .ckIn(clk),
//       .ckOut(clkout),//not connected
//       .ckDivOut(clkdiv),
//		 .rst(rst)
//);
assign clkdiv=clk10mhz;
reg [9:0] out_buf_count;
always@(posedge clkdiv)
	out_buf_count <= out_buf_data_count;

always@(posedge clkdiv)
	cntr_1<=cntr_1+1;

always@(posedge clkdiv)
	case({dp3,dp2,dp1,dp0})
		4'b0001:state_decode<=4'b0001;
		4'b0010:state_decode<=4'b0100;
		4'b0100:state_decode<=4'b0011;
		4'b1000:state_decode<=4'b0010;
		default:state_decode<=4'b1110;
	endcase

wire [1:0]cntr=cntr_1[11:10];
always@(cntr)
	case(cntr)
		2'b00:an<=4'b1110;
		2'b01:an<=4'b1101;
		2'b10:an<=4'b1011;
		2'b11:an<=4'b0111;
	endcase
	
	

always@(cntr,out_buf_count)
	case(cntr)
		2'b00:begin
					disp_data<=out_buf_count[3:0];
					dp<=~dp0;
				end
		2'b01:begin
					disp_data<=out_buf_count[7:4];
					dp<=~dp1;
				end
		2'b10:begin
					disp_data<={2'b00,out_buf_count[9:8]};
					dp<=~dp2;
				end
		2'b11:begin
					disp_data<=state_decode;
					dp<=~dp3;
				end
	endcase
		
always@(disp_data)
	case (disp_data)
			4'h0 : seg <= 7'b1000000;
			4'h1 : seg <= 7'b1111001;
			4'h2 : seg <= 7'b0100100;
			4'h3 : seg <= 7'b0110000;
			4'h4 : seg <= 7'b0011001;
			4'h5 : seg <= 7'b0010010;
			4'h6 : seg <= 7'b0000010;
			4'h7 : seg <= 7'b1111000;
			4'h8 : seg <= 7'b0000000;
			4'h9 : seg <= 7'b0010000;
			4'hA : seg <= 7'b0001000;
			4'hB : seg <= 7'b0000011;
			4'hC : seg <= 7'b1110000;
			4'hD : seg <= 7'b0100001;
			4'hE : seg <= 7'b0000110;
			4'hF : seg <= 7'b0001110;
	default : seg <= 7'b1111111;
	endcase
	
endmodule
