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
module led_graph(
	in_data,
	led_out,
	full,
	empty
    );

input [9:0] in_data;
input full,empty;
output [7:0] led_out;
assign led_out[0] = (~empty && (full || in_data[9])) ? 1'b1:1'b0;
assign led_out[1] = (~empty && (full || in_data[8] || led_out[0])) ? 1'b1:1'b0;
assign led_out[2] = (~empty && (full || in_data[7] || led_out[1])) ? 1'b1:1'b0;
assign led_out[3] = (~empty && (full || in_data[6] || led_out[2])) ? 1'b1:1'b0;
assign led_out[4] = (~empty && (full || in_data[5] || led_out[3])) ? 1'b1:1'b0;
assign led_out[5] = (~empty && (full || in_data[4] || led_out[4])) ? 1'b1:1'b0;
assign led_out[6] = (~empty && (full || in_data[3] || led_out[5])) ? 1'b1:1'b0;
assign led_out[7] = (~empty && (full || in_data[2] || in_data[1] || in_data[0] || led_out[6])) ? 1'b1:1'b0;
endmodule
