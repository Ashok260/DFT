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
module kbtop(
    PS2C,
    PS2D,
    CLK1,
    RST,
	 kb_ascii_out,
	 kb_data_valid
    );

inout PS2C;
inout PS2D;
input CLK1;
input RST;
output [7:0] kb_ascii_out;
output kb_data_valid;


wire [7:0] rx_data;
wire [7:0] tx_data;
wire ps2_write = 1'b0;
wire ps2_read, ps2_busy, ps2_err;

ps2interface ps2inface(
	.ps2_clk(PS2C),
	.ps2_data(PS2D),
	.clk(CLK1),
	.rst(RST),
	.rx_data(rx_data),
	.tx_data(tx_data),
	.write(ps2_write),
	.read(ps2_read),
	.err(ps2_err),
	.busy(ps2_busy)
);

kb2ascii kbass(
	.clk(CLK1),
	.rst(RST),
	.scan_code(rx_data),
	.ascii(kb_ascii_out),
	.ascii_valid(kb_data_valid),
	.kb_read(ps2_read)
);

endmodule
