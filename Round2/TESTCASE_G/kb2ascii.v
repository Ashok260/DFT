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
module kb2ascii(
    scan_code,
    ascii,
	 ascii_valid,
	 clk,
	 kb_read,
	 rst
    );

input [7:0] scan_code;
output [7:0] ascii;
output ascii_valid;
input clk,rst;
input kb_read;
	 
reg [7:0] ascii;
reg ascii_valid;
reg ascii_ready;
reg shift_key;

always@(posedge clk or posedge rst)
	if(rst) ascii<=8'h00;
	else
		if(kb_read==1'b1)
			case ({shift_key,scan_code})
				{1'b1,8'h1C}:ascii<=8'h41;
				{1'b1,8'h32}:ascii<=8'h42;
				{1'b1,8'h21}:ascii<=8'h43;
				{1'b1,8'h23}:ascii<=8'h44;
				{1'b1,8'h24}:ascii<=8'h45;
				{1'b1,8'h2B}:ascii<=8'h46;
				{1'b1,8'h34}:ascii<=8'h47;
				{1'b1,8'h33}:ascii<=8'h48;
				{1'b1,8'h43}:ascii<=8'h49;
				{1'b1,8'h3B}:ascii<=8'h4A;
				{1'b1,8'h42}:ascii<=8'h4B;
				{1'b1,8'h4B}:ascii<=8'h4C;
				{1'b1,8'h3A}:ascii<=8'h4D;
				{1'b1,8'h31}:ascii<=8'h4E;
				{1'b1,8'h44}:ascii<=8'h4F;
				{1'b1,8'h4D}:ascii<=8'h50;
				{1'b1,8'h15}:ascii<=8'h51;
				{1'b1,8'h2D}:ascii<=8'h52;
				{1'b1,8'h1B}:ascii<=8'h53;
				{1'b1,8'h2C}:ascii<=8'h54;
				{1'b1,8'h3C}:ascii<=8'h55;
				{1'b1,8'h2A}:ascii<=8'h56;
				{1'b1,8'h1D}:ascii<=8'h57;
				{1'b1,8'h22}:ascii<=8'h58;
				{1'b1,8'h35}:ascii<=8'h59;
				{1'b1,8'h1A}:ascii<=8'h5A;
				{1'b0,8'h1C}:ascii<=8'h61;
				{1'b0,8'h32}:ascii<=8'h62;
				{1'b0,8'h21}:ascii<=8'h63;
				{1'b0,8'h23}:ascii<=8'h64;
				{1'b0,8'h24}:ascii<=8'h65;
				{1'b0,8'h2B}:ascii<=8'h66;
				{1'b0,8'h34}:ascii<=8'h67;
				{1'b0,8'h33}:ascii<=8'h68;
				{1'b0,8'h43}:ascii<=8'h69;
				{1'b0,8'h3B}:ascii<=8'h6A;
				{1'b0,8'h42}:ascii<=8'h6B;
				{1'b0,8'h4B}:ascii<=8'h6C;
				{1'b0,8'h3A}:ascii<=8'h6D;
				{1'b0,8'h31}:ascii<=8'h6E;
				{1'b0,8'h44}:ascii<=8'h6F;
				{1'b0,8'h4D}:ascii<=8'h70;
				{1'b0,8'h15}:ascii<=8'h71;
				{1'b0,8'h2D}:ascii<=8'h72;
				{1'b0,8'h1B}:ascii<=8'h73;
				{1'b0,8'h2C}:ascii<=8'h74;
				{1'b0,8'h3C}:ascii<=8'h75;
				{1'b0,8'h2A}:ascii<=8'h76;
				{1'b0,8'h1D}:ascii<=8'h77;
				{1'b0,8'h22}:ascii<=8'h78;
				{1'b0,8'h35}:ascii<=8'h79;
				{1'b0,8'h1A}:ascii<=8'h7A;
				
				{1'b0,8'h45}:ascii<=8'h30;
				{1'b0,8'h16}:ascii<=8'h31;
				{1'b0,8'h1E}:ascii<=8'h32;
				{1'b0,8'h26}:ascii<=8'h33;
				{1'b0,8'h25}:ascii<=8'h34;
				{1'b0,8'h2E}:ascii<=8'h35;
				{1'b0,8'h36}:ascii<=8'h36;
				{1'b0,8'h3D}:ascii<=8'h37;
				{1'b0,8'h3E}:ascii<=8'h38;
				{1'b0,8'h46}:ascii<=8'h39;
				{1'b0,8'h4E}:ascii<=8'h2D;
				
				{1'b1,8'h45}:ascii<=8'h29;
				{1'b1,8'h16}:ascii<=8'h21;
				{1'b1,8'h1E}:ascii<=8'h40;
				{1'b1,8'h26}:ascii<=8'h23;
				{1'b1,8'h25}:ascii<=8'h24;
				{1'b1,8'h2E}:ascii<=8'h25;
				{1'b1,8'h36}:ascii<=8'h5E;
				{1'b1,8'h3D}:ascii<=8'h26;
				{1'b1,8'h3E}:ascii<=8'h2A;
				{1'b1,8'h46}:ascii<=8'h28;
				{1'b1,8'h4E}:ascii<=8'h5F;				


				{1'b0,8'h70}:ascii<=8'h30;
				{1'b0,8'h69}:ascii<=8'h31;
				{1'b0,8'h72}:ascii<=8'h32;
				{1'b0,8'h7A}:ascii<=8'h33;
				{1'b0,8'h6B}:ascii<=8'h34;
				{1'b0,8'h73}:ascii<=8'h35;
				{1'b0,8'h74}:ascii<=8'h36;
				{1'b0,8'h6C}:ascii<=8'h37;
				{1'b0,8'h75}:ascii<=8'h38;
				{1'b0,8'h7D}:ascii<=8'h39;
				{1'b0,8'h29}:ascii<=8'h20;
				{1'b0,8'h0E}:ascii<=8'h1F;
				
				{1'b0,8'h5A}:ascii<=8'h07;
				default: ascii<=8'hFF;
			endcase
		

reg key_up;
always@(posedge clk or posedge rst)
	if(rst) 
		key_up <= 1'b0;
	else
		if(kb_read==1'b1 )
			if(scan_code==8'hF0)
				key_up<=1'b1;
			else
				key_up<=1'b0;

always@(posedge clk or posedge rst)
if(rst) 
	shift_key <= 1'b0;
else
	if(kb_read==1'b1)
	begin
			if(~key_up && (scan_code==8'h12 || scan_code==8'h59))
					shift_key <= 1'b1;
			else if(key_up && (scan_code==8'h12 || scan_code==8'h59))
					shift_key <= 1'b0;
	end
		
			
always@(posedge clk or posedge rst)
if(rst) 
		ascii_ready <= 1'b0;
else
		if(kb_read==1'b1 && key_up==1'b1)
				ascii_ready <= 1'b1;
			else
				ascii_ready <= 1'b0;


always@(posedge clk or posedge rst)
	if(rst)
		ascii_valid <= 1'b0;
	else
		if(ascii_ready && ascii!=8'hFF)
			ascii_valid <= 1'b1;
		else
			ascii_valid <= 1'b0;
	
	

endmodule
