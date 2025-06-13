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

module video_ctrl(
//Inputs
clk50mhz,clk25mhz,rst,ascii_input, ascii_read_in,clear_text_ram,cursor_on
,show_logo,vsync,hsync,red_bit,green_bit,blue_bit
);

input clk50mhz,clk25mhz,rst;
input [7:0] ascii_input;
input ascii_read_in,clear_text_ram,cursor_on;
input show_logo;//show_msg1,show_msg2,show_msg3,clear_msg1,clear_msg2,clear_msg3;

inout vsync,hsync,red_bit,green_bit,blue_bit;

reg [7:0] ascii_input_reg;

//clkDllCtrl0 u1(
//		 .ckIn(clk),
//       .ckOut(clk50mhz),
//       .ckDivOut(clk25mhz),
//		 .rst(rst)
//);

always@(posedge clk50mhz or posedge rst)
	if(rst) ascii_input_reg<=8'b00000000;
	else
		if(ascii_read_in)
			ascii_input_reg<=ascii_input;
			
reg ascii_read_in_reg;
always@(posedge clk50mhz or posedge rst)
	if(rst) ascii_read_in_reg<=1'b0;
	else
		if(ascii_read_in)
			ascii_read_in_reg<=1'b1;
		else
			ascii_read_in_reg<=1'b0;

//QA: Are you sure that the input fifo and textram are in-sync?
//EngTeam: Maybe not if the user types too fast and press the "Clear" key
//at the same time. Anyway, we really do not have time to deal that it now!
reg clear_text_ram_reg;
reg [11:0] text_ram_counter;
always@(posedge clk50mhz or posedge rst)
	if(rst) clear_text_ram_reg<=1'b1;
	else
		if(clear_text_ram)
			clear_text_ram_reg<=1'b1;
		else if(text_ram_counter == 12'hFFF)
			clear_text_ram_reg<=1'b0;


always@(posedge clk50mhz or posedge rst)
	if(rst) text_ram_counter<=12'b000000000000;
	else
		if(ascii_read_in_reg || clear_text_ram_reg)
			text_ram_counter <=text_ram_counter+1;

wire [11:0] vga_font_addr;
wire [7:0] vga_font_data;
wire [11:0] vga_ram_addr;

fontrom u2(
	.addra(vga_font_addr),
	.douta(vga_font_data),
	.clka(clk25mhz)
);

wire [7:0] logo_ram_data;
logorom u3(
	.addra(vga_ram_addr),
	.douta(logo_ram_data),
	.ena(show_logo),
	.clka(clk25mhz)
);

wire [7:0] text_ram_vga_data;
wire [7:0] text_ram_input_data = clear_text_ram_reg ? 8'h20 : ascii_input_reg;

textram u4(
	.clka(clk50mhz),
	.dina(text_ram_input_data),
	.addra(text_ram_counter),
	.ena(~show_logo | clear_text_ram_reg),
	.wea(ascii_read_in_reg | clear_text_ram_reg),
	.clkb(clk25mhz),
	.addrb(vga_ram_addr),
	.doutb(text_ram_vga_data)
);

//QA: X and Y seems to be interchanged!
reg [7:0] cur_y;
reg [7:0] cur_x;
always@(posedge clk50mhz or posedge rst)
if(rst) 
	begin
		cur_y<=8'b00000000;
		cur_x<=8'b00000000;
	end
else
	begin
		cur_y<=cur_y + ascii_read_in_reg;
		if(cur_y == 8'h50) 
		begin
			cur_x <= cur_x+1;
			if (cur_x == 8'h28) cur_x <= 8'b00000000;
			cur_y <= 8'b00000000;
		end
	end


wire [7:0] vga_ram_data = show_logo ? logo_ram_data : text_ram_vga_data;

vga80x40 u5(
		.reset(rst),
		.clk25MHz(clk25mhz),
		.R(red_bit),
		.G(green_bit),
		.B(blue_bit),
		.hsync(hsync),
		.vsync(vsync),
		.TEXT_A(vga_ram_addr),
		.TEXT_D(vga_ram_data),
		.FONT_A(vga_font_addr),
		.FONT_D(vga_font_data),
		.ocrx(cur_y),
		.ocry(cur_x),
		.octl({1'b1,cursor_on,6'b110010})
);


endmodule
