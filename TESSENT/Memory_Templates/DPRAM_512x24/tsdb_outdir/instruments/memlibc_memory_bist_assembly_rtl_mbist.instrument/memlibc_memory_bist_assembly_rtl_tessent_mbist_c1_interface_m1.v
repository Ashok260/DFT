/*
----------------------------------------------------------------------------------
-                                                                                -
-  Unpublished work. Copyright 2022 Siemens                                      -
-                                                                                -
-  This material contains trade secrets or otherwise confidential                -
-  information owned by Siemens Industry Software Inc. or its affiliates         -
-  (collectively, SISW), or its licensors. Access to and use of this             -
-  information is strictly limited as set forth in the Customer's                -
-  applicable agreements with SISW.                                              -
-                                                                                -
----------------------------------------------------------------------------------
-  File created by: Tessent Shell                                                -
-          Version: 2022.4                                                       -
-       Created on: Tue Jun  3 17:02:58 IST 2025                                 -
----------------------------------------------------------------------------------


*/

/*------------------------------------------------------------------------------
     Module      :  memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1
 
     Description :  This module contains the interface logic for the memory
                    module DPRAM_512x24
 
--------------------------------------------------------------------------------
     Interface Options in Effect
 
     BistDataPipelineStages        : 0;
     BitGrouping                   : 1;
     BitSliceWidth                 : 1;
     ConcurrentWrite               : OFF 
     ConcurrentRead                : OFF 
     ControllerType                : PROG;
     DataOutStage                  : NONE;
     DefaultAlgorithm              : SMARCH;
     DefaultOperationSet           : SYNC;
     InternalScanLogic             : OFF;
     LocalComparators              : ON;
     MemoryType                    : RAM;
     ObservationLogic              : ON;
     OutputEnableControl           : ALWAYSON;
     PipelineSerialDataOut         : OFF;
     ScanWriteThru                 : OFF;
     ShadowRead                    : OFF;
     ShadowWrite                   : OFF;
     Stop-On-Error Limit           : 4096;
     TransparentMode               : NONE;
 
---------------------------------------------------------------------------- */

module memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1 (
  input  wire        WEB1_IN,
  input  wire        WEB2_IN,
  input  wire        CSB1_IN,
  input  wire        CSB2_IN,
  input  wire [8:0]  A1_IN,
  input  wire [8:0]  A2_IN,
  input  wire [23:0] I1_IN,
  input  wire [23:0] I2_IN,
  input  wire [23:0] O1,
  input  wire [23:0] O2,
  input  wire        TCK,
  input  wire        BIST_CMP,
  input  wire        INCLUDE_MEM_RESULTS_REG,
  input  wire        BIST_WRITEENABLE,
  input  wire        BIST_OUTPUTENABLE,
  input  wire        BIST_SELECT,
  input  wire [1:0]  BIST_COL_ADD,
  input  wire [6:0]  BIST_ROW_ADD,
  input  wire [0:0]  BIST_TEST_PORT,
  input  wire [1:0]  BIST_WRITE_DATA,
  input  wire        BIST_TESTDATA_SELECT_TO_COLLAR,
  input  wire        MEM_BYPASS_EN,
  input  wire        SCAN_SHIFT_EN,
  input  wire        MCP_BOUNDING_EN,
  input  wire        BIST_ON,
  input  wire        BIST_RUN,
  input  wire        BIST_ASYNC_RESETN,
  input  wire        BIST_CLK,
  input  wire        BIST_SHIFT_COLLAR,
  input  wire [1:0]  BIST_EXPECT_DATA,
  input  wire        BIST_SI,
  input  wire        BIST_COLLAR_SETUP,
  input  wire        BIST_COLLAR_HOLD,
  input  wire        BIST_DIAG_EN,
  input  wire        BIST_CLEAR_DEFAULT,
  input  wire        BIST_CLEAR,
  input  wire        BIST_SETUP0,
  input  wire        LV_TM,
  input  wire        FREEZE_STOP_ERROR,
  input  wire        BIST_COLLAR_EN,
  input  wire        RESET_REG_SETUP2,
  input  wire        ERROR_CNT_ZERO,
  output wire        WEB1,
  output wire        WEB2,
  output wire        CSB1,
  output wire        CSB2,
  output reg  [8:0]  A1,
  output reg  [8:0]  A2,
  output reg  [23:0] I1,
  output reg  [23:0] I2,
  output reg  [7:0]  SCAN_OBS_FLOPS,
  output wire        BIST_SO,
  output wire        BIST_GO
);


wire        CMP_EN;
wire [23:0] BIST_WRITE_DATA_REP;
wire [23:0] BIST_WRITE_DATA_INT;
reg         BIST_INPUT_SELECT;
wire        BIST_EN_RST;
wire        BIST_CLK_INT;
wire        BIST_CLK_OR_TCK;
wire [23:0] BIST_EXPECT_DATA_REP;
wire [23:0] BIST_EXPECT_DATA_INT;
wire        BIST_CLK_EN;
wire        GO_EN;
wire        COLLAR_STATUS_SO;
wire        STATUS_SO;
wire        COLLAR_STATUS_SI;
wire        BIST_INPUT_SELECT_INT;
wire [0:0]  ERROR;
wire [0:0]  ERROR_R;
wire [23:0] RAW_CMP_STAT;
wire [23:0] DATA_TO_MEM;
reg  [23:0] DATA_FROM_MEM;
wire [23:0] DATA_FROM_MEM_EXP;
wire        WEB1_TEST_IN;
reg         WEB1_NOT_GATED;
wire        WEB1_TO_MUX;
wire        WEB2_TEST_IN;
reg         WEB2_NOT_GATED;
wire        WEB2_TO_MUX;
wire        CSB1_TEST_IN;
reg         CSB1_NOT_GATED;
wire        CSB1_TO_MUX;
wire        CSB2_TEST_IN;
reg         CSB2_NOT_GATED;
wire        CSB2_TO_MUX;
wire [8:0]  A1_TEST_IN;
wire [8:0]  A2_TEST_IN;
wire [23:0] I1_TEST_IN;
wire [23:0] I2_TEST_IN;
wire [23:0] TEST_PORT0_READ_DATA;
wire [23:0] TEST_PORT1_READ_DATA;
wire        USE_DEFAULTS;
wire        BIST_COLLAR_HOLD_INT;
wire        FREEZE_STOP_ERROR_RST;
wire        FREEZE_STOP_ERROR_SI;
wire        HOLD_EN;
wire        BIST_SETUP0_SYNC;
wire        LOGIC_HIGH;

//---------------------------
// Memory Interface Main Code
//---------------------------
   assign LOGIC_HIGH = 1'b1;
//----------------------
//-- BIST_ON Sync-ing --
//----------------------
    memlibc_memory_bist_assembly_rtl_tessent_and2 tessent_persistent_cell_AND_BIST_SETUP0_SYNC (
        .a          ( BIST_SETUP0                                ),
        .b          ( BIST_ON                                    ),
        .y          ( BIST_SETUP0_SYNC                           )
    );

//----------------------
//-- BIST_EN Retiming --
//----------------------
    assign BIST_EN_RST              = ~BIST_ASYNC_RESETN;
    always @ (posedge BIST_CLK_INT or negedge BIST_ASYNC_RESETN) begin
       if (~BIST_ASYNC_RESETN)
          BIST_INPUT_SELECT <= 1'b0;
       else
       if (~MCP_BOUNDING_EN) begin
          BIST_INPUT_SELECT <= BIST_RUN | BIST_TESTDATA_SELECT_TO_COLLAR;
       end
   end

    wire BIST_INPUT_SELECT_INT_BUF;
    memlibc_memory_bist_assembly_rtl_tessent_buf tessent_persistent_cell_BIST_INPUT_SELECT_INT (
        .a                          (BIST_INPUT_SELECT & ((~LV_TM)|MEM_BYPASS_EN)),
        .y                          (BIST_INPUT_SELECT_INT_BUF)
    );
    assign BIST_INPUT_SELECT_INT = BIST_INPUT_SELECT_INT_BUF;
    assign USE_DEFAULTS = ~BIST_SETUP0_SYNC;
    assign BIST_COLLAR_HOLD_INT = HOLD_EN;
//-----------------------
//-- Observation Logic --
//-----------------------
  // synopsys async_set_reset "BIST_ASYNC_RESETN"
  always @ (posedge BIST_CLK_INT or negedge BIST_ASYNC_RESETN) begin
    if (~BIST_ASYNC_RESETN)
      SCAN_OBS_FLOPS    <= 8'b00000000;
    else
      SCAN_OBS_FLOPS    <= {8{MEM_BYPASS_EN} } & {
                          WEB1_NOT_GATED       ^ WEB2_NOT_GATED       ^ CSB1_NOT_GATED       ,
                          CSB2_NOT_GATED       ^ A1[8]                ^ A1[7]                ,
                          A1[6]                ^ A1[5]                ^ A1[4]                ,
                          A1[3]                ^ A1[2]                ^ A1[1]                ,
                          A1[0]                ^ A2[8]                ^ A2[7]                ,
                          A2[6]                ^ A2[5]                ^ A2[4]                ,
                          A2[3]                ^ A2[2]                ^ A2[1]                ,
                          A2[0]                
                           };
  end
 
//--------------------------
//-- Replicate Write Data --
//--------------------------
   assign BIST_WRITE_DATA_REP      = {
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA
                                     };
 
//-----------------------
//-- Checkerboard Data --
//-----------------------
   assign BIST_WRITE_DATA_INT       = BIST_WRITE_DATA_REP;
   assign DATA_TO_MEM              = BIST_WRITE_DATA_INT;
 
 
 
 

//--------------------------
//-- Memory Control Ports --
//--------------------------

   // Port: WEB1 LogicalPort: Port1 Type: READWRITE {{{

   // Intercept functional signal with test mux
   always @( WEB1_IN or WEB1_TEST_IN or BIST_INPUT_SELECT_INT) begin
      case (BIST_INPUT_SELECT_INT) // synopsys infer_mux
      1'b0 : WEB1_NOT_GATED = WEB1_IN;
      1'b1 : WEB1_NOT_GATED = WEB1_TEST_IN;
      endcase
   end

   // Disable memory port during logic test
   assign WEB1                      = WEB1_NOT_GATED | (LV_TM & (MEM_BYPASS_EN | SCAN_SHIFT_EN));

   // Control logic during memory test
   assign WEB1_TEST_IN              = ~(BIST_COLLAR_EN & WEB1_TO_MUX);
   assign WEB1_TO_MUX               = (((BIST_TEST_PORT == 0) & BIST_WRITEENABLE));

   // Port: WEB1 }}}

   // Port: WEB2 LogicalPort: Port2 Type: READWRITE {{{

   // Intercept functional signal with test mux
   always @( WEB2_IN or WEB2_TEST_IN or BIST_INPUT_SELECT_INT) begin
      case (BIST_INPUT_SELECT_INT) // synopsys infer_mux
      1'b0 : WEB2_NOT_GATED = WEB2_IN;
      1'b1 : WEB2_NOT_GATED = WEB2_TEST_IN;
      endcase
   end

   // Disable memory port during logic test
   assign WEB2                      = WEB2_NOT_GATED | (LV_TM & (MEM_BYPASS_EN | SCAN_SHIFT_EN));

   // Control logic during memory test
   assign WEB2_TEST_IN              = ~(BIST_COLLAR_EN & WEB2_TO_MUX);
   assign WEB2_TO_MUX               = (((BIST_TEST_PORT == 1) & BIST_WRITEENABLE));

   // Port: WEB2 }}}

   // Port: CSB1 LogicalPort: Port1 Type: READWRITE {{{

   // Intercept functional signal with test mux
   always @( CSB1_IN or CSB1_TEST_IN or BIST_INPUT_SELECT_INT) begin
      case (BIST_INPUT_SELECT_INT) // synopsys infer_mux
      1'b0 : CSB1_NOT_GATED = CSB1_IN;
      1'b1 : CSB1_NOT_GATED = CSB1_TEST_IN;
      endcase
   end

   // Disable memory port during logic test
   assign CSB1                      = CSB1_NOT_GATED | (LV_TM & (MEM_BYPASS_EN | SCAN_SHIFT_EN));

   // Control logic during memory test
   assign CSB1_TEST_IN              = ~(BIST_COLLAR_EN & CSB1_TO_MUX);
   assign CSB1_TO_MUX               = (((BIST_TEST_PORT == 0) & BIST_SELECT));

   // Port: CSB1 }}}

   // Port: CSB2 LogicalPort: Port2 Type: READWRITE {{{

   // Intercept functional signal with test mux
   always @( CSB2_IN or CSB2_TEST_IN or BIST_INPUT_SELECT_INT) begin
      case (BIST_INPUT_SELECT_INT) // synopsys infer_mux
      1'b0 : CSB2_NOT_GATED = CSB2_IN;
      1'b1 : CSB2_NOT_GATED = CSB2_TEST_IN;
      endcase
   end

   // Disable memory port during logic test
   assign CSB2                      = CSB2_NOT_GATED | (LV_TM & (MEM_BYPASS_EN | SCAN_SHIFT_EN));

   // Control logic during memory test
   assign CSB2_TEST_IN              = ~(BIST_COLLAR_EN & CSB2_TO_MUX);
   assign CSB2_TO_MUX               = (((BIST_TEST_PORT == 1) & BIST_SELECT));

   // Port: CSB2 }}}

//--------------------------
//-- Memory Address Ports --
//--------------------------

   // Port: A1 LogicalPort: Port1 Type: READWRITE {{{

   // Intercept functional signal with test mux
   always @( A1_IN or A1_TEST_IN or BIST_INPUT_SELECT_INT) begin
      case (BIST_INPUT_SELECT_INT) // synopsys infer_mux
      1'b0 : A1 = A1_IN;
      1'b1 : A1 = A1_TEST_IN;
      endcase
   end
   // Address logic during memory test
   wire   [1:0]                     BIST_COL_ADD_SHADOW_PORT1;
   wire   [6:0]                     BIST_ROW_ADD_SHADOW_PORT1;
   assign BIST_ROW_ADD_SHADOW_PORT1[6] = BIST_ROW_ADD[6];
   assign BIST_ROW_ADD_SHADOW_PORT1[5] = BIST_ROW_ADD[5];
   assign BIST_ROW_ADD_SHADOW_PORT1[4] = BIST_ROW_ADD[4];
   assign BIST_ROW_ADD_SHADOW_PORT1[3] = BIST_ROW_ADD[3];
   assign BIST_ROW_ADD_SHADOW_PORT1[2] = BIST_ROW_ADD[2];
   assign BIST_ROW_ADD_SHADOW_PORT1[1] = BIST_ROW_ADD[1];
   assign BIST_ROW_ADD_SHADOW_PORT1[0] = BIST_ROW_ADD[0];
   assign BIST_COL_ADD_SHADOW_PORT1[1] = BIST_COL_ADD[1];
   assign BIST_COL_ADD_SHADOW_PORT1[0] = BIST_COL_ADD[0];
   assign A1_TEST_IN                = {
                                         BIST_ROW_ADD_SHADOW_PORT1[6],
                                         BIST_ROW_ADD_SHADOW_PORT1[5],
                                         BIST_ROW_ADD_SHADOW_PORT1[4],
                                         BIST_ROW_ADD_SHADOW_PORT1[3],
                                         BIST_ROW_ADD_SHADOW_PORT1[2],
                                         BIST_ROW_ADD_SHADOW_PORT1[1],
                                         BIST_ROW_ADD_SHADOW_PORT1[0],
                                         BIST_COL_ADD_SHADOW_PORT1[1],
                                         BIST_COL_ADD_SHADOW_PORT1[0] 
                                      };

   // Port: A1 }}}

   // Port: A2 LogicalPort: Port2 Type: READWRITE {{{

   // Intercept functional signal with test mux
   always @( A2_IN or A2_TEST_IN or BIST_INPUT_SELECT_INT) begin
      case (BIST_INPUT_SELECT_INT) // synopsys infer_mux
      1'b0 : A2 = A2_IN;
      1'b1 : A2 = A2_TEST_IN;
      endcase
   end
   // Address logic during memory test
   wire   [1:0]                     BIST_COL_ADD_SHADOW_PORT2;
   wire   [6:0]                     BIST_ROW_ADD_SHADOW_PORT2;
   assign BIST_ROW_ADD_SHADOW_PORT2[6] = BIST_ROW_ADD[6];
   assign BIST_ROW_ADD_SHADOW_PORT2[5] = BIST_ROW_ADD[5];
   assign BIST_ROW_ADD_SHADOW_PORT2[4] = BIST_ROW_ADD[4];
   assign BIST_ROW_ADD_SHADOW_PORT2[3] = BIST_ROW_ADD[3];
   assign BIST_ROW_ADD_SHADOW_PORT2[2] = BIST_ROW_ADD[2];
   assign BIST_ROW_ADD_SHADOW_PORT2[1] = BIST_ROW_ADD[1];
   assign BIST_ROW_ADD_SHADOW_PORT2[0] = BIST_ROW_ADD[0];
   assign BIST_COL_ADD_SHADOW_PORT2[1] = BIST_COL_ADD[1];
   assign BIST_COL_ADD_SHADOW_PORT2[0] = BIST_COL_ADD[0];
   assign A2_TEST_IN                = {
                                         BIST_ROW_ADD_SHADOW_PORT2[6],
                                         BIST_ROW_ADD_SHADOW_PORT2[5],
                                         BIST_ROW_ADD_SHADOW_PORT2[4],
                                         BIST_ROW_ADD_SHADOW_PORT2[3],
                                         BIST_ROW_ADD_SHADOW_PORT2[2],
                                         BIST_ROW_ADD_SHADOW_PORT2[1],
                                         BIST_ROW_ADD_SHADOW_PORT2[0],
                                         BIST_COL_ADD_SHADOW_PORT2[1],
                                         BIST_COL_ADD_SHADOW_PORT2[0] 
                                      };

   // Port: A2 }}}

//--------------------
//-- Data To Memory --
//--------------------


   // Intercept functional signal with test mux
   always @( I1_IN or I1_TEST_IN or BIST_INPUT_SELECT_INT ) begin
      case (BIST_INPUT_SELECT_INT) // synopsys infer_mux
      1'b0 : I1 = I1_IN;
      1'b1 : I1 = I1_TEST_IN;
      endcase
   end
   // Write data during memory test
   assign I1_TEST_IN                = {
                                        DATA_TO_MEM[23],
                                        DATA_TO_MEM[22],
                                        DATA_TO_MEM[21],
                                        DATA_TO_MEM[20],
                                        DATA_TO_MEM[19],
                                        DATA_TO_MEM[18],
                                        DATA_TO_MEM[17],
                                        DATA_TO_MEM[16],
                                        DATA_TO_MEM[15],
                                        DATA_TO_MEM[14],
                                        DATA_TO_MEM[13],
                                        DATA_TO_MEM[12],
                                        DATA_TO_MEM[11],
                                        DATA_TO_MEM[10],
                                        DATA_TO_MEM[9],
                                        DATA_TO_MEM[8],
                                        DATA_TO_MEM[7],
                                        DATA_TO_MEM[6],
                                        DATA_TO_MEM[5],
                                        DATA_TO_MEM[4],
                                        DATA_TO_MEM[3],
                                        DATA_TO_MEM[2],
                                        DATA_TO_MEM[1],
                                        DATA_TO_MEM[0] 
                                      };


   // Intercept functional signal with test mux
   always @( I2_IN or I2_TEST_IN or BIST_INPUT_SELECT_INT ) begin
      case (BIST_INPUT_SELECT_INT) // synopsys infer_mux
      1'b0 : I2 = I2_IN;
      1'b1 : I2 = I2_TEST_IN;
      endcase
   end
   // Write data during memory test
   assign I2_TEST_IN                = {
                                        DATA_TO_MEM[23],
                                        DATA_TO_MEM[22],
                                        DATA_TO_MEM[21],
                                        DATA_TO_MEM[20],
                                        DATA_TO_MEM[19],
                                        DATA_TO_MEM[18],
                                        DATA_TO_MEM[17],
                                        DATA_TO_MEM[16],
                                        DATA_TO_MEM[15],
                                        DATA_TO_MEM[14],
                                        DATA_TO_MEM[13],
                                        DATA_TO_MEM[12],
                                        DATA_TO_MEM[11],
                                        DATA_TO_MEM[10],
                                        DATA_TO_MEM[9],
                                        DATA_TO_MEM[8],
                                        DATA_TO_MEM[7],
                                        DATA_TO_MEM[6],
                                        DATA_TO_MEM[5],
                                        DATA_TO_MEM[4],
                                        DATA_TO_MEM[3],
                                        DATA_TO_MEM[2],
                                        DATA_TO_MEM[1],
                                        DATA_TO_MEM[0] 
                                      };

//----------------------
//-- Data From Memory --
//----------------------
 
   assign TEST_PORT0_READ_DATA      = {
                                       O1[23],
                                       O1[22],
                                       O1[21],
                                       O1[20],
                                       O1[19],
                                       O1[18],
                                       O1[17],
                                       O1[16],
                                       O1[15],
                                       O1[14],
                                       O1[13],
                                       O1[12],
                                       O1[11],
                                       O1[10],
                                       O1[9],
                                       O1[8],
                                       O1[7],
                                       O1[6],
                                       O1[5],
                                       O1[4],
                                       O1[3],
                                       O1[2],
                                       O1[1],
                                       O1[0] 
                                      };
 
 
   assign TEST_PORT1_READ_DATA      = {
                                       O2[23],
                                       O2[22],
                                       O2[21],
                                       O2[20],
                                       O2[19],
                                       O2[18],
                                       O2[17],
                                       O2[16],
                                       O2[15],
                                       O2[14],
                                       O2[13],
                                       O2[12],
                                       O2[11],
                                       O2[10],
                                       O2[9],
                                       O2[8],
                                       O2[7],
                                       O2[6],
                                       O2[5],
                                       O2[4],
                                       O2[3],
                                       O2[2],
                                       O2[1],
                                       O2[0] 
                                      };
 
 
 
   always @ (TEST_PORT0_READ_DATA or TEST_PORT1_READ_DATA or BIST_TEST_PORT) begin
      case (BIST_TEST_PORT)
      1'b0 : DATA_FROM_MEM = TEST_PORT0_READ_DATA;
      1'b1 : DATA_FROM_MEM = TEST_PORT1_READ_DATA;
      endcase
   end
 
 
//---------------------------
//-- Replicate Expect Data --
//---------------------------
 
   assign BIST_EXPECT_DATA_REP      = { // 
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA
                                     };
//-----------------
//-- Expect Data --
//-----------------
   assign BIST_EXPECT_DATA_INT      = BIST_EXPECT_DATA_REP;
   assign DATA_FROM_MEM_EXP         = BIST_EXPECT_DATA_INT;
assign CMP_EN = BIST_CMP;

//-----------------------
//-- Local Comparators --
//-----------------------
 
   assign RAW_CMP_STAT[23]          = ~(DATA_FROM_MEM[23] == DATA_FROM_MEM_EXP[23]);
   assign RAW_CMP_STAT[22]          = ~(DATA_FROM_MEM[22] == DATA_FROM_MEM_EXP[22]);
   assign RAW_CMP_STAT[21]          = ~(DATA_FROM_MEM[21] == DATA_FROM_MEM_EXP[21]);
   assign RAW_CMP_STAT[20]          = ~(DATA_FROM_MEM[20] == DATA_FROM_MEM_EXP[20]);
   assign RAW_CMP_STAT[19]          = ~(DATA_FROM_MEM[19] == DATA_FROM_MEM_EXP[19]);
   assign RAW_CMP_STAT[18]          = ~(DATA_FROM_MEM[18] == DATA_FROM_MEM_EXP[18]);
   assign RAW_CMP_STAT[17]          = ~(DATA_FROM_MEM[17] == DATA_FROM_MEM_EXP[17]);
   assign RAW_CMP_STAT[16]          = ~(DATA_FROM_MEM[16] == DATA_FROM_MEM_EXP[16]);
   assign RAW_CMP_STAT[15]          = ~(DATA_FROM_MEM[15] == DATA_FROM_MEM_EXP[15]);
   assign RAW_CMP_STAT[14]          = ~(DATA_FROM_MEM[14] == DATA_FROM_MEM_EXP[14]);
   assign RAW_CMP_STAT[13]          = ~(DATA_FROM_MEM[13] == DATA_FROM_MEM_EXP[13]);
   assign RAW_CMP_STAT[12]          = ~(DATA_FROM_MEM[12] == DATA_FROM_MEM_EXP[12]);
   assign RAW_CMP_STAT[11]          = ~(DATA_FROM_MEM[11] == DATA_FROM_MEM_EXP[11]);
   assign RAW_CMP_STAT[10]          = ~(DATA_FROM_MEM[10] == DATA_FROM_MEM_EXP[10]);
   assign RAW_CMP_STAT[9]           = ~(DATA_FROM_MEM[9] == DATA_FROM_MEM_EXP[9]);
   assign RAW_CMP_STAT[8]           = ~(DATA_FROM_MEM[8] == DATA_FROM_MEM_EXP[8]);
   assign RAW_CMP_STAT[7]           = ~(DATA_FROM_MEM[7] == DATA_FROM_MEM_EXP[7]);
   assign RAW_CMP_STAT[6]           = ~(DATA_FROM_MEM[6] == DATA_FROM_MEM_EXP[6]);
   assign RAW_CMP_STAT[5]           = ~(DATA_FROM_MEM[5] == DATA_FROM_MEM_EXP[5]);
   assign RAW_CMP_STAT[4]           = ~(DATA_FROM_MEM[4] == DATA_FROM_MEM_EXP[4]);
   assign RAW_CMP_STAT[3]           = ~(DATA_FROM_MEM[3] == DATA_FROM_MEM_EXP[3]);
   assign RAW_CMP_STAT[2]           = ~(DATA_FROM_MEM[2] == DATA_FROM_MEM_EXP[2]);
   assign RAW_CMP_STAT[1]           = ~(DATA_FROM_MEM[1] == DATA_FROM_MEM_EXP[1]);
   assign RAW_CMP_STAT[0]           = ~(DATA_FROM_MEM[0] == DATA_FROM_MEM_EXP[0]);
  
wire                                FREEZE_GO_ID;
reg                                 FREEZE_STOP_ERROR_EARLY_R; 
assign FREEZE_GO_ID = BIST_SHIFT_COLLAR | (~(BIST_CMP & BIST_COLLAR_EN)) | FREEZE_STOP_ERROR_EARLY_R;
   
//----------------
// STOP_ON_ERROR  
//----------------
wire                                SOE_ERROR;
wire                                FREEZE_STOP_ERROR_CLEAR;
wire                                FREEZE_STOP_ERROR_EARLY;
assign SOE_ERROR = (|ERROR) & BIST_ON;
assign FREEZE_STOP_ERROR_EARLY = ERROR_CNT_ZERO & SOE_ERROR;
  
// synopsys sync_set_reset "FREEZE_STOP_ERROR_CLEAR"
assign FREEZE_STOP_ERROR_CLEAR = (~GO_EN) & (~(BIST_COLLAR_HOLD|FREEZE_STOP_ERROR)) & (~BIST_SHIFT_COLLAR);
 
// synopsys async_set_reset "BIST_ASYNC_RESETN"
always @(posedge BIST_CLK_OR_TCK or negedge BIST_ASYNC_RESETN) begin
  if (~BIST_ASYNC_RESETN) begin
    FREEZE_STOP_ERROR_EARLY_R <= 1'b0;
  end else 
  if (FREEZE_STOP_ERROR_CLEAR) begin
    FREEZE_STOP_ERROR_EARLY_R <= 1'b0;
  end else begin
    if (BIST_SHIFT_COLLAR) begin
      FREEZE_STOP_ERROR_EARLY_R <= FREEZE_STOP_ERROR_SI;
    end else 
    if ((~(BIST_COLLAR_HOLD|FREEZE_STOP_ERROR)) & GO_EN) begin
        FREEZE_STOP_ERROR_EARLY_R <= FREEZE_STOP_ERROR_EARLY | FREEZE_STOP_ERROR_EARLY_R;
    end
  end
end

assign HOLD_EN = BIST_COLLAR_HOLD | FREEZE_STOP_ERROR_EARLY_R | FREEZE_STOP_ERROR;
 
assign COLLAR_STATUS_SI = BIST_SI;
memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1_STATUS MBISTPG_STATUS (
    .BIST_CLK                      ( BIST_CLK_OR_TCK              ),
    .BIST_ASYNC_RESETN             (BIST_ASYNC_RESETN           ),
    .MCP_BOUNDING_EN               (MCP_BOUNDING_EN      ), 
    .FREEZE_GO_ID                  (FREEZE_GO_ID                ),
    .CMP_EN                        (CMP_EN                      ),
    .FREEZE_STOP_ERROR_EARLY_R     (FREEZE_STOP_ERROR_EARLY_R   ),
   .GO_EN                          (GO_EN                      ),
   .BIST_COLLAR_SETUP              (BIST_COLLAR_SETUP          ),
   .BIST_COLLAR_HOLD               (BIST_COLLAR_HOLD_INT       ),
   .BIST_SHIFT_COLLAR              (BIST_SHIFT_COLLAR          ),
   .BIST_ON                        (BIST_ON                    ),
   .BIST_CLEAR                     (BIST_CLEAR                 ),
   .USE_DEFAULTS                   (USE_DEFAULTS               ),
   .SI                             (COLLAR_STATUS_SI           ),
   .ERROR                          ( ERROR               ),
   .ERROR_R                        ( ERROR_R             ),
   .BIST_DIAG_EN                   (BIST_DIAG_EN         ),
   .RAW_CMP_STAT                   (RAW_CMP_STAT               ),
   .BIST_GO                        (BIST_GO              ),
   .INCLUDE_MEM_RESULTS_REG        (INCLUDE_MEM_RESULTS_REG    ),
   .SO                             (COLLAR_STATUS_SO           )
);
assign FREEZE_STOP_ERROR_SI = COLLAR_STATUS_SO;
 
assign STATUS_SO = FREEZE_STOP_ERROR_EARLY_R;
    
assign BIST_SO                      = STATUS_SO;
 
 
    assign BIST_CLK_EN  = BIST_RUN | BIST_COLLAR_SETUP|BIST_CLEAR|BIST_CLEAR_DEFAULT|RESET_REG_SETUP2|(BIST_INPUT_SELECT ^ BIST_TESTDATA_SELECT_TO_COLLAR);
//---------------------
//-- BIST_CLK Gating --
//---------------------
wire   INJECT_TCK;      
    assign INJECT_TCK = BIST_SHIFT_COLLAR & ~LV_TM; 
    memlibc_memory_bist_assembly_rtl_tessent_clk_gate_and tessent_persistent_cell_GATING_BIST_CLK (
        .clk        ( BIST_CLK                    ),
        .te         ( 1'b0         ),
        .fe         ( BIST_CLK_EN  ),
        .clkg       ( BIST_CLK_INT                )
    );
        memlibc_memory_bist_assembly_rtl_tessent_clk_mux2 tessent_persistent_cell_BIST_CLK_OR_TCK (
        .s          ( INJECT_TCK                                 ),
        .a          ( BIST_CLK_INT                               ),
        .b          ( TCK                                        ),
        .y          ( BIST_CLK_OR_TCK                            )
    );

endmodule // memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1



    
module memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1_STATUS (
  input  wire        BIST_CLEAR,
  input  wire        FREEZE_STOP_ERROR_EARLY_R,
  input  wire        FREEZE_GO_ID,
  input  wire        CMP_EN,
  input  wire        BIST_ASYNC_RESETN,
  input  wire        BIST_CLK,
  input  wire        BIST_COLLAR_SETUP,
  input  wire        BIST_COLLAR_HOLD,
  input  wire        BIST_SHIFT_COLLAR,
  input  wire        BIST_ON,
  input  wire        USE_DEFAULTS,
  input  wire        SI,
  input  wire        BIST_DIAG_EN,
  input  wire [23:0] RAW_CMP_STAT,
  input  wire        MCP_BOUNDING_EN,
  input  wire        INCLUDE_MEM_RESULTS_REG,
  output reg         GO_EN,
  output wire [0:0]  ERROR,
  output wire [0:0]  ERROR_R,
  output wire        SO,
  output wire        BIST_GO
);
wire        GO_ID_REG_RST;
reg  [23:0] GO_ID_REG;
wire        BIST_GO_INT;
wire [23:0] ROW_DATA_MAP;
wire        GO_ID_FEEDBACK_EN;
wire [0:0]  IO_SEG_GLOBAL_GO_ID;
reg  [0:0]  ERROR_R1;

 
   //----------------
   // Row Data Map --
   //----------------
 assign ROW_DATA_MAP = RAW_CMP_STAT;
 
   //-----------
   //-- GO_EN --
   //-----------
   //synopsys sync_set_reset "BIST_ON"
   // synopsys async_set_reset "BIST_ASYNC_RESETN"
   always @ (posedge BIST_CLK or negedge BIST_ASYNC_RESETN) begin
      if (~BIST_ASYNC_RESETN)
         GO_EN       <= 1'b0;
      else
      if (~BIST_ON) begin
         GO_EN       <= 1'b0;
      end else begin
         if (BIST_COLLAR_SETUP) begin
            GO_EN    <= 1'b1; 
         end
      end
   end
   assign GO_ID_FEEDBACK_EN         = ~(BIST_DIAG_EN) ;
   assign BIST_GO_INT               = ~|ERROR_R;
   assign BIST_GO    = BIST_GO_INT;
 
 
 
   //---------------
   //-- GO_ID_REG --
   //---------------
reg  CMP_EN_R;
  // synopsys async_set_reset "BIST_ASYNC_RESETN"
   always @ (posedge BIST_CLK or negedge BIST_ASYNC_RESETN) begin
      if (~BIST_ASYNC_RESETN) begin
         CMP_EN_R    <= 1'b0;
      end else begin
         CMP_EN_R    <= (~FREEZE_GO_ID) & (~BIST_COLLAR_HOLD);
      end
   end

   assign GO_ID_REG_RST            = BIST_CLEAR | (~INCLUDE_MEM_RESULTS_REG & BIST_SHIFT_COLLAR);
   wire HOLD_OR_RESET;
    
wire [23:0] GO_ID_REG_MUX, BIST_SHIFT_COLLAR_MUX;
wire [23:0] GO_ID_REG_MUX_SEL ;
wire GO_ID_REG_CLR;
wire GO_ID_REG_BYPASS;
  // synopsys sync_set_reset "GO_ID_REG_RST"
   assign HOLD_OR_RESET = MCP_BOUNDING_EN | GO_ID_REG_RST | BIST_COLLAR_HOLD | ~GO_EN;
   assign GO_ID_REG_CLR = (~MCP_BOUNDING_EN) & (GO_ID_REG_RST | ((~BIST_COLLAR_HOLD) & (~GO_ID_FEEDBACK_EN) & CMP_EN) | (CMP_EN_R & BIST_COLLAR_HOLD & (~FREEZE_STOP_ERROR_EARLY_R)));
// Instantiate persistent GO_ID_REG_MUX cells {{{
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG0 (
            .s       ( GO_ID_REG_MUX_SEL[0]        ),
            .b       ( BIST_SHIFT_COLLAR_MUX[0] & ~GO_ID_REG_CLR  ),
            .a       ( ROW_DATA_MAP[0]             ),
            .y       ( GO_ID_REG_MUX[0]            )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG1 (
            .s       ( GO_ID_REG_MUX_SEL[1]        ),
            .b       ( BIST_SHIFT_COLLAR_MUX[1] & ~GO_ID_REG_CLR  ),
            .a       ( ROW_DATA_MAP[1]             ),
            .y       ( GO_ID_REG_MUX[1]            )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG2 (
            .s       ( GO_ID_REG_MUX_SEL[2]        ),
            .b       ( BIST_SHIFT_COLLAR_MUX[2] & ~GO_ID_REG_CLR  ),
            .a       ( ROW_DATA_MAP[2]             ),
            .y       ( GO_ID_REG_MUX[2]            )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG3 (
            .s       ( GO_ID_REG_MUX_SEL[3]        ),
            .b       ( BIST_SHIFT_COLLAR_MUX[3] & ~GO_ID_REG_CLR  ),
            .a       ( ROW_DATA_MAP[3]             ),
            .y       ( GO_ID_REG_MUX[3]            )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG4 (
            .s       ( GO_ID_REG_MUX_SEL[4]        ),
            .b       ( BIST_SHIFT_COLLAR_MUX[4] & ~GO_ID_REG_CLR  ),
            .a       ( ROW_DATA_MAP[4]             ),
            .y       ( GO_ID_REG_MUX[4]            )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG5 (
            .s       ( GO_ID_REG_MUX_SEL[5]        ),
            .b       ( BIST_SHIFT_COLLAR_MUX[5] & ~GO_ID_REG_CLR  ),
            .a       ( ROW_DATA_MAP[5]             ),
            .y       ( GO_ID_REG_MUX[5]            )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG6 (
            .s       ( GO_ID_REG_MUX_SEL[6]        ),
            .b       ( BIST_SHIFT_COLLAR_MUX[6] & ~GO_ID_REG_CLR  ),
            .a       ( ROW_DATA_MAP[6]             ),
            .y       ( GO_ID_REG_MUX[6]            )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG7 (
            .s       ( GO_ID_REG_MUX_SEL[7]        ),
            .b       ( BIST_SHIFT_COLLAR_MUX[7] & ~GO_ID_REG_CLR  ),
            .a       ( ROW_DATA_MAP[7]             ),
            .y       ( GO_ID_REG_MUX[7]            )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG8 (
            .s       ( GO_ID_REG_MUX_SEL[8]        ),
            .b       ( BIST_SHIFT_COLLAR_MUX[8] & ~GO_ID_REG_CLR  ),
            .a       ( ROW_DATA_MAP[8]             ),
            .y       ( GO_ID_REG_MUX[8]            )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG9 (
            .s       ( GO_ID_REG_MUX_SEL[9]        ),
            .b       ( BIST_SHIFT_COLLAR_MUX[9] & ~GO_ID_REG_CLR  ),
            .a       ( ROW_DATA_MAP[9]             ),
            .y       ( GO_ID_REG_MUX[9]            )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG10 (
            .s       ( GO_ID_REG_MUX_SEL[10]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[10] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[10]            ),
            .y       ( GO_ID_REG_MUX[10]           )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG11 (
            .s       ( GO_ID_REG_MUX_SEL[11]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[11] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[11]            ),
            .y       ( GO_ID_REG_MUX[11]           )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG12 (
            .s       ( GO_ID_REG_MUX_SEL[12]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[12] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[12]            ),
            .y       ( GO_ID_REG_MUX[12]           )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG13 (
            .s       ( GO_ID_REG_MUX_SEL[13]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[13] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[13]            ),
            .y       ( GO_ID_REG_MUX[13]           )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG14 (
            .s       ( GO_ID_REG_MUX_SEL[14]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[14] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[14]            ),
            .y       ( GO_ID_REG_MUX[14]           )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG15 (
            .s       ( GO_ID_REG_MUX_SEL[15]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[15] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[15]            ),
            .y       ( GO_ID_REG_MUX[15]           )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG16 (
            .s       ( GO_ID_REG_MUX_SEL[16]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[16] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[16]            ),
            .y       ( GO_ID_REG_MUX[16]           )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG17 (
            .s       ( GO_ID_REG_MUX_SEL[17]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[17] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[17]            ),
            .y       ( GO_ID_REG_MUX[17]           )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG18 (
            .s       ( GO_ID_REG_MUX_SEL[18]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[18] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[18]            ),
            .y       ( GO_ID_REG_MUX[18]           )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG19 (
            .s       ( GO_ID_REG_MUX_SEL[19]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[19] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[19]            ),
            .y       ( GO_ID_REG_MUX[19]           )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG20 (
            .s       ( GO_ID_REG_MUX_SEL[20]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[20] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[20]            ),
            .y       ( GO_ID_REG_MUX[20]           )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG21 (
            .s       ( GO_ID_REG_MUX_SEL[21]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[21] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[21]            ),
            .y       ( GO_ID_REG_MUX[21]           )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG22 (
            .s       ( GO_ID_REG_MUX_SEL[22]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[22] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[22]            ),
            .y       ( GO_ID_REG_MUX[22]           )
            );
    memlibc_memory_bist_assembly_rtl_tessent_mux2 tessent_persistent_cell_MUX_GO_ID_REG23 (
            .s       ( GO_ID_REG_MUX_SEL[23]       ),
            .b       ( BIST_SHIFT_COLLAR_MUX[23] & ~GO_ID_REG_CLR                ),
            .a       ( ROW_DATA_MAP[23]            ),
            .y       ( GO_ID_REG_MUX[23]           )
            );
// Instantiate persistent GO_ID_REG_MUX cells }}}
   assign GO_ID_REG_MUX_SEL = (GO_ID_REG & {24{GO_ID_FEEDBACK_EN}})  | {24 {HOLD_OR_RESET | FREEZE_GO_ID }};
   assign BIST_SHIFT_COLLAR_MUX = ((~MCP_BOUNDING_EN) & BIST_SHIFT_COLLAR) ? {SI,GO_ID_REG[23:1]} : GO_ID_REG;
 
   // synopsys async_set_reset "BIST_ASYNC_RESETN"
   always @ (posedge BIST_CLK or negedge BIST_ASYNC_RESETN) begin
      if (~BIST_ASYNC_RESETN)
         GO_ID_REG   <= {24{1'b0}};
      else
         GO_ID_REG   <= GO_ID_REG_MUX;
   end
   assign GO_ID_REG_BYPASS = (INCLUDE_MEM_RESULTS_REG) ? GO_ID_REG[0] : SI;

    
  assign IO_SEG_GLOBAL_GO_ID[0] = |GO_ID_REG;
  assign ERROR[0] = GO_EN & IO_SEG_GLOBAL_GO_ID[0] & (CMP_EN_R | GO_ID_FEEDBACK_EN | BIST_COLLAR_HOLD);
  // synopsys async_set_reset "BIST_ASYNC_RESETN"
   always @ (posedge BIST_CLK  or negedge BIST_ASYNC_RESETN) begin
        if (~BIST_ASYNC_RESETN) begin
         ERROR_R1    <= {1{1'b0}};
      end else 
      if ( BIST_CLEAR ) begin
         ERROR_R1    <= {1{1'b0}};
      end else begin
         ERROR_R1    <= ERROR;
      end
   end
  assign ERROR_R   = ERROR_R1;

                       
   //------
   // SO --
   //------
   assign SO         = GO_ID_REG_BYPASS;
endmodule // memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1_STATUS



