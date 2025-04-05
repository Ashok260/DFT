module f32_data_reg_chain (
  input wire [31:0] i_wr_data,
  input wire [31:0] i_agg_su_count_a,
  input wire scan_enable,
  input wire net121977,
  input wire test_si1,
  input wire raw_scan_en,
  output wire test_so1,
  output wire n_94_
);

  wire n_125_;
  wire n_124_;
  wire n_123_;
  wire n_122_;
  wire n_121_;
  wire n_120_;
  wire n_119_;
  wire n_118_;
  wire n_117_;
  wire n_116_;
  wire n_114_;
  wire n_113_;
  wire n_112_;
  wire n_111_;
  wire n_110_;
  wire n_109_;
  wire n_108_;
  wire n_107_;
  wire n_106_;
  wire n_105_;
  wire n_104_;
  wire n_103_;
  wire n_102_;
  wire n_101_;
  wire n_100_;
  wire n_99_;
  wire n_98_;
  wire n_97_;
  wire n_96_;
  wire n_95_;
  wire n1;

  SDFFX1 f32_data_reg_0_ (
    .D(i_wr_data[0]),
    .SI(i_agg_su_count_a[31]),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_125_)
  );

  SDFFX1 f32_data_reg_1_ (
    .D(i_wr_data[1]),
    .SI(n_125_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_124_)
  );

  SDFFX1 f32_data_reg_2_ (
    .D(i_wr_data[2]),
    .SI(n_124_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_123_)
  );

  SDFFX1 f32_data_reg_3_ (
    .D(i_wr_data[3]),
    .SI(n_123_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_122_)
  );

  SDFFX1 f32_data_reg_4_ (
    .D(i_wr_data[4]),
    .SI(n_122_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_121_)
  );

  SDFFX1 f32_data_reg_5_ (
    .D(i_wr_data[5]),
    .SI(n_121_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_120_)
  );

  SDFFX1 f32_data_reg_6_ (
    .D(i_wr_data[6]),
    .SI(n_120_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_119_)
  );

  SDFFX1 f32_data_reg_7_ (
    .D(i_wr_data[7]),
    .SI(n_119_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_118_)
  );

  SDFFX1 f32_data_reg_8_ (
    .D(i_wr_data[8]),
    .SI(n_118_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_117_)
  );

  SDFFX1 f32_data_reg_9_ (
    .D(i_wr_data[9]),
    .SI(n_117_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_116_)
  );

  SDFFX1 f32_data_reg_10_ (
    .D(i_wr_data[10]),
    .SI(n_116_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(test_so1)
  );

  MX2X2 f32_data_reg_11__ti_over_mux (
    .A(n_113_),
    .B(test_si1),
    .S0(raw_scan_en),
    .Y(n1)
  );

  SDFFX1 f32_data_reg_11_ (
    .D(i_wr_data[11]),
    .SI(n1),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_114_)
  );

  SDFFX1 f32_data_reg_12_ (
    .D(i_wr_data[12]),
    .SI(n_114_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_113_)
  );

  SDFFX1 f32_data_reg_13_ (
    .D(i_wr_data[13]),
    .SI(n_113_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_112_)
  );

  SDFFX1 f32_data_reg_14_ (
    .D(i_wr_data[14]),
    .SI(n_112_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_111_)
  );

  SDFFX1 f32_data_reg_15_ (
    .D(i_wr_data[15]),
    .SI(n_111_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_110_)
  );

  SDFFX1 f32_data_reg_16_ (
    .D(i_wr_data[16]),
    .SI(n_110_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_109_)
  );

  SDFFX1 f32_data_reg_17_ (
    .D(i_wr_data[17]),
    .SI(n_109_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_108_)
  );

  SDFFX1 f32_data_reg_18_ (
    .D(i_wr_data[18]),
    .SI(n_108_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_107_)
  );

  SDFFX1 f32_data_reg_19_ (
    .D(i_wr_data[19]),
    .SI(n_107_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_106_)
  );

  SDFFX1 f32_data_reg_20_ (
    .D(i_wr_data[20]),
    .SI(n_106_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_105_)
  );

  SDFFX1 f32_data_reg_21_ (
    .D(i_wr_data[21]),
    .SI(n_105_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_104_)
  );

  SDFFX1 f32_data_reg_22_ (
    .D(i_wr_data[22]),
    .SI(n_104_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_103_)
  );

  SDFFX1 f32_data_reg_23_ (
    .D(i_wr_data[23]),
    .SI(n_103_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_102_)
  );

  SDFFX1 f32_data_reg_24_ (
    .D(i_wr_data[24]),
    .SI(n_102_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_101_)
  );

  SDFFX1 f32_data_reg_25_ (
    .D(i_wr_data[25]),
    .SI(n_101_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_100_)
  );

  SDFFX1 f32_data_reg_26_ (
    .D(i_wr_data[26]),
    .SI(n_100_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_99_)
  );

  SDFFX1 f32_data_reg_27_ (
    .D(i_wr_data[27]),
    .SI(n_99_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_98_)
  );

  SDFFX1 f32_data_reg_28_ (
    .D(i_wr_data[28]),
    .SI(n_98_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_97_)
  );

  SDFFX1 f32_data_reg_29_ (
    .D(i_wr_data[29]),
    .SI(n_97_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_96_)
  );

  SDFFX1 f32_data_reg_30_ (
    .D(i_wr_data[30]),
    .SI(n_96_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_95_)
  );

  SDFFX1 f32_data_reg_31_ (
    .D(i_wr_data[31]),
    .SI(n_95_),
    .SE(scan_enable),
    .CK(net121977),
    .Q(n_94_)
  );
endmodule
