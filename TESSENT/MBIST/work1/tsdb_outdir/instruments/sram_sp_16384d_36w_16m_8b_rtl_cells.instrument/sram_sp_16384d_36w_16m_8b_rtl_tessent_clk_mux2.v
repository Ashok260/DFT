//--------------------------------------------------------------------------
//
//  Unpublished work. Copyright 2022 Siemens
//
//  This material contains trade secrets or otherwise confidential 
//  information owned by Siemens Industry Software Inc. or its affiliates 
//  (collectively, SISW), or its licensors. Access to and use of this 
//  information is strictly limited as set forth in the Customer's 
//  applicable agreements with SISW.
//
//--------------------------------------------------------------------------
//  File created by: Tessent Shell
//          Version: 2022.4
//       Created on: Sat Jun 21 12:23:08 IST 2025
//--------------------------------------------------------------------------

     
module sram_sp_16384d_36w_16m_8b_rtl_tessent_clk_mux2 (
  input wire a,
  input wire b,
  input wire s,
  output wire y
);
 
assign y = (s) ? b : a;
    
endmodule
  
