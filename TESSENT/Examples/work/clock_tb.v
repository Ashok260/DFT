//
// Verilog format Verification testbench 
// Filename       : clock_tb.v
// Date           : Tue Apr 22 18:39:19 2025
//

`timescale 1ns / 1ns

module CLOCK_clock_tb_v_ctl;

reg[4:0]    _ibus;
integer _compare_fail;
integer _miscompare_limit;
// for Internal Event counters
integer _reset_eventcnt;
integer _curr_timeplate;
integer      _end_vec_file_ok;

wire clk, reset, ena, scan_in_0, scan_en, pm, \hh[7] , \hh[6] , \hh[5] , 
     \hh[4] , \hh[3] , \hh[2] , \hh[1] , \hh[0] , \mm[7] , \mm[6] , 
     \mm[5] , \mm[4] , \mm[3] , \mm[2] , \mm[1] , \mm[0] , \ss[7] , 
     \ss[6] , \ss[5] , \ss[4] , \ss[3] , \ss[2] , \ss[1] , \ss[0] , 
     scan_out_0;

event       before_finish;
assign clk = _ibus[4];
assign reset = _ibus[3];
assign ena = _ibus[2];
assign scan_in_0 = _ibus[1];
assign scan_en = _ibus[0];


// Reset Internal Pin Event Counters 
always @(posedge _reset_eventcnt) begin
  assign _reset_eventcnt = 1'b0;
end

CLOCK CLOCK_inst (clk , reset , ena , pm , {\hh[7] , \hh[6] , 
     \hh[5] , \hh[4] , \hh[3] , \hh[2] , \hh[1] , \hh[0] }, {\mm[7] , 
     \mm[6] , \mm[5] , \mm[4] , \mm[3] , \mm[2] , \mm[1] , \mm[0] }, 
     {\ss[7] , \ss[6] , \ss[5] , \ss[4] , \ss[3] , \ss[2] , \ss[1] , 
     \ss[0] }, scan_in_0 , scan_out_0 , scan_en );

initial begin
_compare_fail = 0;
// Limit # of miscompares before aborting simulation (non-zero)
_miscompare_limit = 0; 
_end_vec_file_ok = 0; 
_curr_timeplate = 0;
_end_vec_file_ok = 1;
assign _reset_eventcnt = 1'b0;


#1;
if (_end_vec_file_ok == 0) begin
  $display("ERROR: Pattern file corrupted, simulation aborted\n");
end
if ((_end_vec_file_ok) && (_compare_fail == 0)) begin
   $display("No error between simulated and expected patterns\n");
end

if (_compare_fail != 0) begin
   $display("Error between simulated and expected patterns\n");
end

#1;
->before_finish;
#0;
$finish;
end
endmodule
