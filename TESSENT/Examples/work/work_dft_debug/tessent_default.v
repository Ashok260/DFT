//
// Verilog format test patterns produced by Tessent Shell 2022.4
// Filename       : work_dft_debug/tessent_default.v
// Idstamp        : 2022.4:b1ed:4603:4:91ca
// Fault          : STUCK
// Coverage       : 7.51(TC) 7.26(FC)
// Date           : Tue Apr 22 18:46:14 2025
//
// Begin_Verify_Section 
//   format            = Verilog 
//   top_module_name   = CLOCK_tessent_default_v_ctl 
//   serial_flag       = OFF 
//   test_set_type     = SCAN_TEST 
//   pad_value         = X 
//   pattern_begin     = 0 
//   pattern_end       = 3 
//   one_setup         = ON 
//   no_initialization = ON 
//   pattern_checksum  = 202 
// End_Verify_Section 

`define SIM_INSTANCE_NAME CLOCK_inst


`timescale 1ns / 1ns

module CLOCK_tessent_default_v_ctl;

integer     _write_DIAG_file;
integer     _DIAG_file_header;
integer     _diag_file;
integer     _diag_chain_header;
integer     _diag_scan_header;
integer     _last_fail_pattern;
integer     _fail_pattern_cnt;
integer     _write_MASK_file;
integer     _MASK_file_header;
integer     _mask_file;
integer     _par_shift_cnt;
integer     _chain_test_;
integer     _compare_fail;
integer     _bit_count;
integer     _report_bit_cnt;
integer     _miscompare_limit;
integer     _found_fail;
integer     _found_fail_per_cycle;
integer     _allow_bad_message_index;
reg[25:0]    _found_fail_obus;
integer     _end_vec_file_ok;
integer     _cycle_count, _save_cycle_count;
integer     _pattern_count, _repeat_count_nest[0:8], _repeat_count, _message_index;
integer     _index, _scan_index, _file_cnt, _max_index, _save_index[0:8];
integer     _repeat_depth;
integer     _file_check;
integer     _scan_shift_count;
reg[4:0]    _ibus;
reg[25:0]    _exp_obus, _msk_obus;
wire[25:0]   _sim_obus;
reg[2:0]    _pat_type;
reg         _tp_num;
reg         mgcdft_save_signal, mgcdft_restart_signal;
reg[65:0]   vect;

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

assign _sim_obus[25] = pm;
assign _sim_obus[24] = \hh[7] ;
assign _sim_obus[23] = \hh[6] ;
assign _sim_obus[22] = \hh[5] ;
assign _sim_obus[21] = \hh[4] ;
assign _sim_obus[20] = \hh[3] ;
assign _sim_obus[19] = \hh[2] ;
assign _sim_obus[18] = \hh[1] ;
assign _sim_obus[17] = \hh[0] ;
assign _sim_obus[16] = \mm[7] ;
assign _sim_obus[15] = \mm[6] ;
assign _sim_obus[14] = \mm[5] ;
assign _sim_obus[13] = \mm[4] ;
assign _sim_obus[12] = \mm[3] ;
assign _sim_obus[11] = \mm[2] ;
assign _sim_obus[10] = \mm[1] ;
assign _sim_obus[9] = \mm[0] ;
assign _sim_obus[8] = \ss[7] ;
assign _sim_obus[7] = \ss[6] ;
assign _sim_obus[6] = \ss[5] ;
assign _sim_obus[5] = \ss[4] ;
assign _sim_obus[4] = \ss[3] ;
assign _sim_obus[3] = \ss[2] ;
assign _sim_obus[2] = \ss[1] ;
assign _sim_obus[1] = \ss[0] ;
assign _sim_obus[0] = scan_out_0;

// Change Path Variables & Get Argument 
integer      _change_path; 
integer      _change_out_path; 
reg[512*8:1]  _new_path; 
reg[512*8:1]  _new_out_path; 
reg[512*8:1]  _new_filename; 
reg[512*8:1]  _vcd_dump_file_name; 
reg[512*8:1]  _utvcd_dump_file_name; 
reg[512*8:1]  _fsdb_dump_file_name; 
reg[512*8:1]  _qwave_dump_file_name; 
initial begin 
  _change_path = 0; 
  _change_out_path = 0; 
  if ($value$plusargs("NEWPATH=%s", _new_path)) begin 
    $display("Found New Path %0s\n", _new_path); 
    _change_path = 1; 
  end 
  if ($value$plusargs("NEWOUTPATH=%s", _new_out_path)) begin 
    $display("Found New Out Path %0s\n", _new_out_path); 
    _change_out_path = 1; 
  end 

`ifdef VCD
    $sformat(_vcd_dump_file_name, "work_dft_debug/tessent_default.v.dump");
    if(_change_out_path) begin 
      $sformat(_vcd_dump_file_name, "%0s/%0s", _new_out_path, _vcd_dump_file_name);
    end
    $dumpfile(_vcd_dump_file_name);
    $dumpvars;
`endif

`ifdef UTVCD
    $sformat(_utvcd_dump_file_name, "work_dft_debug/tessent_default.v.dump");
    if(_change_out_path) begin 
      $sformat(_utvcd_dump_file_name, "%0s/%0s", _new_out_path, _utvcd_dump_file_name);
    end
    $dumpfile(_utvcd_dump_file_name);
    $vtDump;
    $dumpvars;
`endif

`ifdef debussy
    $sformat(_fsdb_dump_file_name, "work_dft_debug/tessent_default.v.fsdb");
    if(_change_out_path) begin 
      $sformat(_fsdb_dump_file_name, "%0s/%0s", _new_out_path, _fsdb_dump_file_name);
    end
    $fsdbDumpfile(_fsdb_dump_file_name);
    $fsdbDumpvars;
`endif

`ifdef QWAVE
    $sformat(_qwave_dump_file_name, "work_dft_debug/tessent_default.v.qwave.db");
    if(_change_out_path) begin 
      $sformat(_qwave_dump_file_name, "%0s/%0s", _new_out_path, _qwave_dump_file_name);
    end
    $qwavedb_dumpvars_filename(_qwave_dump_file_name);
    $qwavedb_dumpvars;
`endif
end 

reg /* sparse */[79:0] _nam_obus[25:0];
initial begin 
   if(_change_path) begin 
     $sformat(_new_filename,"%0s/work_dft_debug/tessent_default.v.po.name",_new_path); 
     $display("Loading %0s\n", _new_filename ); 
     $readmemh(_new_filename,_nam_obus,25,0); 
   end 
   else begin
     $display("Loading work_dft_debug/tessent_default.v.po.name");
     $readmemh("work_dft_debug/tessent_default.v.po.name",_nam_obus,25,0);
   end 
end 


// Declare Wires for tracking Vector Type
reg[3:0] _MGCDFT_VECTYPE ;
reg mgcdft_test_setup, mgcdft_load_unload, mgcdft_shift,
     mgcdft_single_shift, mgcdft_shift_extra, 
     mgcdft_shadow_control, mgcdft_master_observe,
     mgcdft_shadow_observe, mgcdft_skew_load, 
     mgcdft_seq_transparent, mgcdft_launch_capture,
     mgcdft_clock_proc, mgcdft_test_end, mgcdft_unknown; 

event       set_vector_type;
always @(_MGCDFT_VECTYPE) begin
  assign mgcdft_test_setup      = 1'b0;
  assign mgcdft_load_unload     = 1'b0;
  assign mgcdft_shift           = 1'b0;
  assign mgcdft_single_shift    = 1'b0;
  assign mgcdft_shift_extra     = 1'b0;
  assign mgcdft_shadow_control  = 1'b0;
  assign mgcdft_master_observe  = 1'b0;
  assign mgcdft_shadow_observe  = 1'b0;
  assign mgcdft_skew_load       = 1'b0;
  assign mgcdft_seq_transparent = 1'b0;
  assign mgcdft_launch_capture  = 1'b0;
  assign mgcdft_clock_proc      = 1'b0;
  assign mgcdft_test_end        = 1'b0;
  assign mgcdft_unknown         = 1'b0;
  case (_MGCDFT_VECTYPE)
    4'b0001: begin
               assign mgcdft_test_setup      = 1'b1;
               _scan_shift_count = 0;
             end
    4'b0010: begin
               assign mgcdft_load_unload     = 1'b1;
               _scan_shift_count = 0;
             end
    4'b0011: begin
               assign mgcdft_shift           = 1'b1;
               if(!(_scan_shift_count)) begin
                 _scan_shift_count = 1;
               end
             end
    4'b0100: begin
               assign mgcdft_single_shift    = 1'b1;
               if(!(_scan_shift_count)) begin
                 _scan_shift_count = 1;
               end
             end
    4'b0101: begin
               assign mgcdft_shift_extra     = 1'b1;
               _scan_shift_count = 0;
             end
    4'b0110: begin
               assign mgcdft_shadow_control  = 1'b1;
               _scan_shift_count = 0;
             end
    4'b0111: begin
               assign mgcdft_master_observe  = 1'b1;
               _scan_shift_count = 0;
             end
    4'b1000: begin
               assign mgcdft_shadow_observe  = 1'b1;
               _scan_shift_count = 0;
             end
    4'b1001: begin
               assign mgcdft_skew_load       = 1'b1;
               _scan_shift_count = 0;
             end
    4'b1010: begin
               assign mgcdft_seq_transparent = 1'b1;
               _scan_shift_count = 0;
             end
    4'b1011: begin
               assign mgcdft_launch_capture  = 1'b1;
               _scan_shift_count = 0;
             end
    4'b1101: begin
               assign mgcdft_clock_proc      = 1'b1;
               _scan_shift_count = 0;
             end
    4'b1111: begin
               assign mgcdft_test_end        = 1'b1;
               _scan_shift_count = 0;
             end
    4'b0000: begin
               assign mgcdft_unknown         = 1'b1;
               _scan_shift_count = 0;
             end
    default: begin
               assign mgcdft_unknown         = 1'b1;
               _scan_shift_count = 0;
             end
  endcase
end

event       compare_exp_sim_obus;
always @(compare_exp_sim_obus) begin
 _found_fail = 0;
  if (_exp_obus !== _sim_obus) begin
     for(_bit_count = 0;
         ((_bit_count < 26)&&(_found_fail==0));
          _bit_count =_bit_count +1) begin
        if ((_msk_obus[_bit_count] === 1'b1) &&
            (_exp_obus[_bit_count] !== _sim_obus[_bit_count])) begin
           _found_fail = 1;
           _found_fail_per_cycle = 1;
           _found_fail_obus[_bit_count] = 1'b1;
        end
     end
  end
  if (_found_fail == 1) begin
    $write($realtime, "ns: Simulated response %b pattern %d cycle %d\n",_sim_obus,_pattern_count,_cycle_count);
    $write($realtime, "ns: Expected  response %b pattern %d cycle %d\n",_exp_obus,_pattern_count,_cycle_count);
     for(_bit_count = 0;
         ((_bit_count < 26)&&((_miscompare_limit==0)||(_compare_fail<=_miscompare_limit)));
          _bit_count =_bit_count +1) begin
      if ((_msk_obus[_bit_count] === 1'b1) &&
          (_exp_obus[_bit_count] !== _sim_obus[_bit_count])) begin
        _found_fail_obus[_bit_count] = 1'b1;
        $write($realtime, "ns: Mismatch at pin %d name %s, Simulated %b, Expected %b\n",_bit_count,_nam_obus[_bit_count],_sim_obus[_bit_count],_exp_obus[_bit_count]);
        if (_write_DIAG_file == 1) begin
          if (_DIAG_file_header == 0) begin
            if(_change_out_path) begin 
              _diag_file = $fopen("%0s/work_dft_debug/tessent_default.v.fail", _new_out_path);
              if (_diag_file == 0) begin
                $display("ERROR: Couldn't open .fail file %0s/work_dft_debug/tessent_default.v.fail, simulation aborted\n", _new_out_path);
                ->before_finish;
                #0;
                $finish;
              end
            end
            else begin
              _diag_file = $fopen("work_dft_debug/tessent_default.v.fail");
              if (_diag_file == 0) begin
                $display("ERROR: Couldn't open .fail file work_dft_debug/tessent_default.v.fail, simulation aborted\n");
                ->before_finish;
                #0;
                $finish;
              end
            end
            if(_change_out_path) begin 
              $fwrite(_diag_file, "// This File is simulation generated (%0s/work_dft_debug/tessent_default.v)\n", _new_out_path);
            end
            else begin
              $fwrite(_diag_file, "// This File is simulation generated (work_dft_debug/tessent_default.v)\n");
            end
            $fwrite(_diag_file, "//format pattern\n");
            $fwrite(_diag_file, "//failure_buffer_limit_reached none\n");
            $fwrite(_diag_file, "//data_reference cell\n");
            $fwrite(_diag_file, "//pattern_id      chain/PO_name   cell_number   expected_value   simulated_value\n\n");
            _DIAG_file_header = 1;
          end
          if ((_chain_test_)&&(_diag_chain_header!=1)) begin
            $fwrite(_diag_file, "chain_test\n");
            _diag_chain_header = 1;
          end
          if ((_chain_test_!=1)&&(_diag_scan_header!=1)) begin
            $fwrite(_diag_file, "scan_test\n");
            _diag_scan_header = 1;
          end
          if ((_pattern_count == _last_fail_pattern) && (_pattern_count == 0)) begin
             _fail_pattern_cnt = 1; 
          end
          if (_pattern_count > _last_fail_pattern) begin 
             _fail_pattern_cnt = _fail_pattern_cnt + 1;
             _last_fail_pattern = _pattern_count;
          end

          $fwrite(_diag_file, "%d  %s ", _pattern_count, _nam_obus[_bit_count]);
          case ( _exp_obus[_bit_count] )
            1'b1: begin
                    $fwrite(_diag_file, "            H"); 
                  end
            1'b0: begin
                    $fwrite(_diag_file, "            L"); 
                  end
            1'bZ: begin
                    $fwrite(_diag_file, "            Z"); 
                  end
          endcase
          case ( _sim_obus[_bit_count] )
            1'b1: begin
                    $fwrite(_diag_file, " H  // PO\n"); 
                  end
            1'b0: begin
                    $fwrite(_diag_file, " L  // PO\n"); 
                  end
            1'bZ: begin
                    $fwrite(_diag_file, " Z  // PO\n"); 
                  end
            1'bX: begin
                    $fwrite(_diag_file, " X  // PO\n"); 
                  end
          endcase
        end // EndIf _write_DIAG_file
        if (_write_MASK_file == 1) begin
          if (_MASK_file_header == 0) begin
            if(_change_out_path) begin 
              _mask_file = $fopen("%0s/work_dft_debug/tessent_default.v.mask", _new_out_path);
              if (_mask_file == 0) begin
                $display("ERROR: Couldn't open .mask file %0s/work_dft_debug/tessent_default.v.mask, simulation aborted\n", _new_out_path);
                ->before_finish;
                #0;
                $finish;
              end
            end
            else begin
              _mask_file = $fopen("work_dft_debug/tessent_default.v.mask");
              if (_mask_file == 0) begin
                $display("ERROR: Couldn't open .mask file work_dft_debug/tessent_default.v.mask, simulation aborted\n");
                ->before_finish;
                #0;
                $finish;
              end
            end
            $fwrite(_mask_file, "%s\n%s\n", "type mask", "");
            _MASK_file_header = 1;
          end
          if (_chain_test_ == 0) begin
            $fwrite(_mask_file, "%d %s\n", _pattern_count,_nam_obus[_bit_count]);
          end
          if (_chain_test_ == 1) begin
            $fwrite(_mask_file, "// %d %s\n", _pattern_count,_nam_obus[_bit_count]);
          end
        end
      end
    end
    _compare_fail = _compare_fail + 1;
  end
end

reg[65:0]     mem [0:7];
CLOCK CLOCK_inst (.clk(clk), .reset(reset), .ena(ena), 
     .scan_in_0(scan_in_0), .scan_en(scan_en), .pm(pm), 
     .hh({\hh[7] , \hh[6] , \hh[5] , \hh[4] , \hh[3] 
     , \hh[2] , \hh[1] , \hh[0] }), .mm({\mm[7] , \mm[6] 
     , \mm[5] , \mm[4] , \mm[3] , \mm[2] , \mm[1] , \mm[0] 
     }), .ss({\ss[7] , \ss[6] , \ss[5] , \ss[4] , \ss[3] 
     , \ss[2] , \ss[1] , \ss[0] }), .scan_out_0(scan_out_0));

initial begin
_compare_fail = 0;
_pattern_count = 0;
_cycle_count = 0;
_save_cycle_count = 0;
_write_DIAG_file = 1; // to generate file
_write_MASK_file = 0; // change to 1, to generate file
_DIAG_file_header = 0;
_diag_file = 0;
_diag_chain_header = 0;
_diag_scan_header = 0;
_fail_pattern_cnt = 0;
_last_fail_pattern = 0;
_MASK_file_header = 0;
_mask_file = 0;
_chain_test_ = 0;
_par_shift_cnt = 0;
_report_bit_cnt = 0;
// Limit # of miscompares before aborting simulation (non-zero)
_miscompare_limit = 0; 
_end_vec_file_ok = 0; 
_scan_shift_count = 0;
_allow_bad_message_index = 0;
if ($value$plusargs("ALLOW_BAD_MESSAGE_INDEX=%d", _allow_bad_message_index)) begin
  $display(" Found ALLOW_BAD_MESSAGE_INDEX %d", _allow_bad_message_index);
end

// begin pattern read loop
for (_file_cnt=0; _file_cnt < 1; _file_cnt = _file_cnt + 1)
begin
   case (_file_cnt)
     0: begin
          if(_change_path) begin 
            $sformat(_new_filename,"%0s/work_dft_debug/tessent_default.v.0.vec",_new_path); 
            $display("Loading %0s\n", _new_filename ); 
            $readmemb(_new_filename, mem, 0, 7);
          end
          else begin
            $display("Loading work_dft_debug/tessent_default.v.0.vec\n");
            $readmemb("work_dft_debug/tessent_default.v.0.vec", mem, 0, 7);
          end
         _max_index = 7;
         _end_vec_file_ok = 0;
     end
     default: begin
         $display("ERROR: exceeded file count limit\n");
         ->before_finish;
         #0;
         $finish;
     end
   endcase
   _scan_index = 0;
   _repeat_count_nest[0] = 0;
   _repeat_count = 0;
   _repeat_depth = 0;
   _message_index = 0;
   _save_index[0] = 0;
   _found_fail_obus =26'b00000000000000000000000000;
   for (_index=0; _index <= _max_index; _index = _index+1)
   begin
      vect = mem[_index];
      _exp_obus=26'bXXXXXXXXXXXXXXXXXXXXXXXXXX;
      _msk_obus=26'b00000000000000000000000000;
      _MGCDFT_VECTYPE = vect[3:0];
      _pat_type = vect[6:4];
      _tp_num = vect[7];
      case (_pat_type)
         3'b000:  begin // end vector
            _index = _max_index + 1;
         end // end vector
         3'b001: ;// skip scan vector, handled by shift vector
         3'b010:  begin // broadside vector
            _found_fail_per_cycle = 0;
            _found_fail_obus =26'b00000000000000000000000000;
            if (vect[8] == 1'b1) begin
               _pattern_count = _pattern_count + 1;
               _par_shift_cnt = 0;
            end
            if (vect[8] === 1'bz) begin
               _pattern_count = 0;
               _par_shift_cnt = 0;
            end
            if(_scan_shift_count) begin
               _scan_shift_count = _scan_shift_count + 1;
            end
            case (_tp_num)
               1'b1: begin // timeplate 1 - gen_tp1
                  _ibus[4:0] = vect[65:61];

                  #10; // 10 ns
                  _exp_obus[25:0] = vect[60:35];
                  _msk_obus[25:0] = vect[34:9];
                  #0;
                  ->compare_exp_sim_obus;
                  if ((_miscompare_limit)&&(_compare_fail>=_miscompare_limit)) begin
                    $display("ERROR: exceeded miscompare limit(%d), exiting simulation",_miscompare_limit);
                    _end_vec_file_ok = 1;
                    if (_DIAG_file_header == 1) begin
                       if (_diag_scan_header==1) begin
                         $fwrite(_diag_file, "last_pattern_applied %d\n", _pattern_count);
                       end
                       $fwrite(_diag_file, "// failing_patterns=%d simulated_patterns=%d", _fail_pattern_cnt, (_pattern_count+1));
                       $fwrite(_diag_file, " simulation_time=", $realtime, ";\n");
                       $fwrite(_diag_file, "failure_file_end\n");
                       $fclose(_diag_file);
                    end
                    ->before_finish;
                    #0;
                    $finish;
                  end

                  #30; // 40 ns
               end // timeplate 1 - gen_tp1
               default: begin
                  $display("ERROR: corrupt timeplate number\n");
                  ->before_finish;
                  #0;
                  $finish;
               end
            endcase // _tp_num
            _cycle_count = _cycle_count + 1;
            _par_shift_cnt = 0;
         end // broadside vector
         3'b011:  begin // status message vector
            _message_index = vect[38:7];
            case (_message_index)
               0: begin
                  $display("Begin chain test\n");
                 _chain_test_ = 1;
                  _diag_chain_header = 0;
               end
               1: begin
                 _chain_test_ = 0;
                  if (_diag_chain_header) begin
                    $fwrite(_diag_file, "last_pattern_applied %d\n", _pattern_count);
                  end
                  _diag_scan_header = 0;
                  $display("End chain test\n");
               end
               2: begin
                  $display("Status update: simulated through pattern %d\n",_pattern_count);
               end
               3: begin
                  _end_vec_file_ok = 1;
               end
               default: begin
                  $display("ERROR: corrupt message index\n");
                  if (_allow_bad_message_index != 1) begin
                     ->before_finish;
                     #0;
                     $finish;
                  end
               end
            endcase // _message_index
         end
         default: begin
            $display("ERROR: corrupt vector number\n");
            ->before_finish;
            #0;
            $finish;
         end
      endcase
   end // index loop
end // file_cnt loop
 if (_DIAG_file_header == 1) begin
    if (_diag_scan_header==1) begin
      $fwrite(_diag_file, "last_pattern_applied %d\n", _pattern_count);
    end
    $fwrite(_diag_file, "// failing_patterns=%d simulated_patterns=%d", _fail_pattern_cnt, (_pattern_count+1));
    $fwrite(_diag_file, " simulation_time=", $realtime, ";\n");
    $fwrite(_diag_file, "failure_file_end\n");
    $fclose(_diag_file);
 end


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
