// Library - dtmf_recvr, Cell - dtmf_recvr_core, // View - schematic,
// Version - 0.16 

module dtmf_recvr_core ( 
    tdigit, 
    tdigit_flag, 
    reset, 
    int,
    port_pad_data_out,
    port_pad_data_in,
    scan_clk,
    test_mode,
    scan_en,
    spi_data,
    spi_fs, 
    refclk, 
    vcop, 
    vcom, 
    pllrst, 
    ibias
);

output [15:0] 
    port_pad_data_out ;

output  
        vcop		, 
        vcom		, 
	tdigit_flag ;

input [15:0] 
        port_pad_data_in ;

input  
        reset		, 
        int		,
        scan_clk	, 
        scan_en	, 
        test_mode	,
        spi_data	, 
        spi_fs		, 
        refclk		, 
        pllrst		, 
        ibias ;

output [7:0]  
	tdigit ;

// Buses in the design

wire  [7:0]  	upcm;
wire  [8:0]  	p_addrs;
wire  [7:0]  	t_addrs_ds;
wire  [7:0]  	ds_addrs;
wire  [7:0]  	digit;
wire  [2:0]  	port_address;
wire  [15:0]  	lpcm;
wire  [7:0]  	d_addrs;
wire  [15:0]  	ds_datain;
wire  [15:0]  	rom_data;
wire  [15:0]  	mem_data;
wire  [15:0]  	ds_data;
wire  [15:0]  	tdsp_data_in;
wire  [15:0]  	tdsp_data_out;
wire  [7:0]  	t_addrs;

wire clk, spi_clk, rcc_clk, digit_clk, m_rcc_clk, m_digit_clk, m_spi_clk;

s_reset S_RESET_INST(
        .reset_in(reset),
        .clock(refclk),
        .reset_out(s_reset),
        .test_mode(test_mode)
        );

pllclk PLLCLK_INST(
	.refclk(refclk),
	.vcop(vcop),
	.vcom(vcom),
	.clk1x(spi_clk),
	.clk2x(clk),
	.reset(pllrst),
	.ibias(ibias)
	);

test_control TEST_CONTROL_INST(
       .m_clk(m_clk),
       .clk(clk),
       .m_rcc_clk(m_rcc_clk),
       .m_digit_clk(m_digit_clk),
       .m_spi_clk(m_spi_clk),
       .m_ram_clk(m_ram_clk),
       .m_dsram_clk(m_dsram_clk),
       .rcc_clk(rcc_clk),
       .digit_clk(digit_clk),
       .spi_clk(spi_clk),
       .ram_clk(t_write_d),
       .dsram_clk(ds_write),
       .test_mode(test_mode),
       .scan_clk(scan_clk)
);


rom_512x16A ROM_512x16_0_INST(
       .A(p_addrs[8:0]),
       .Q(rom_data[15:0]),
       .CLK(m_clk),
       .CEN(1'b0)
);

ram_128x16_test RAM_128x16_TEST_INST(
       .a(t_addrs[6:0]),
       .din(tdsp_data_out[15:0]),
       .dout(mem_data[15:0]),
       .oe(t_read_d),
       .wr(m_ram_clk),
       .test_mode(test_mode)
);

ram_256x16_test RAM_256x16_TEST_INST(
       .a(ds_addrs[7:0]),
       .din(ds_datain[15:0]),
       .dout(ds_data[15:0]),
       .oe(t_read_ds),
       .wr(m_dsram_clk),
       .test_mode(test_mode)
);


tdsp_ds_cs TDSP_DS_CS_INST(
    .clk(m_clk),
    .test_mode(test_mode),
	.address(t_addrs[7:0]),
	.write(t_write),
	.read(t_read),
	.reset(s_reset),
	.as(t_as),
	.port_as(port_as),
	.port_address(port_address[2:0]),
	.port_write(port_write),
	.port_read(port_write),
	.top_buf_flag(top_buf_flag),
	.t_write_ds(t_write_ds),
	.t_read_ds(t_read_ds),
	.t_write_d(t_write_d),
	.t_read_d(t_read_d),
	.t_write_rcc(rcc_clk),
	.t_address_ds(t_addrs_ds[7:0]),
	.bus_request_in(t_breq),
	.bus_grant_in(t_grant),
	.bus_request_out(t_breq_st),
	.bus_grant_out(t_grant_st)
);

data_sample_mux DATA_SAMPLE_MUX_INST(
	.d_addrs(d_addrs[7:0]),
	.d_datain(lpcm[15:0]),
	.d_wr(d_write),
	.t_addrs(t_addrs_ds[7:0]),
	.t_datain(tdsp_data_out[15:0]),
	.t_wr(t_write_ds),
	.write(ds_write),
	.addrs(ds_addrs[7:0]),
	.datain(ds_datain[15:0]),
	.t_grant(t_grant)
);

digit_reg DIGIT_REG_INST(
       .reset(s_reset),
       .clk(m_digit_clk),
       .digit_in(digit[7:0]),
       .digit_out(tdigit[7:0]),
       .flag_in(flag_out),
       .flag_out(tdigit_flag)
);

results_conv RESULTS_CONV_INST(
       .clk(m_clk),
       .reset(s_reset),
       .rcc_clk(m_rcc_clk),
       .address(t_addrs[3:0]),
       .din(tdsp_data_out[15:0]),
       .digit_clk(digit_clk),
       .dout(digit[7:0]),
       .dout_flag(flag_out),
       .test_mode(test_mode)
);

tdsp_data_mux TDSP_MUX (
       .mem_data (mem_data),
       .ds_data (ds_data),
       .t_data (tdsp_data_in),
       .t_read (t_read_d),
       .ds_read (t_read_ds)
);

tdsp_core TDSP_CORE_INST(
       .clk(m_clk),
       .reset(s_reset),
       .as(t_as),
       .read(t_read),
       .write(t_write),
       .write_h(t_write_h),
       .address(t_addrs[7:0]),
       .t_data_out(tdsp_data_out[15:0]),
       .t_data_in(tdsp_data_in[15:0]),
       .rom_data_in(rom_data[15:0]),
       .p_as(p_as),
       .p_read(p_read),
       .p_write(p_write),
       .p_write_h(o_p_write_h),
       .p_address(p_addrs[8:0]),
       .port_pad_data_out(port_pad_data_out[15:0]),
       .port_pad_data_in(port_pad_data_in[15:0]),
       .port_address(port_address[2:0]),
       .port_as(port_as),
       .port_read(port_read),
       .port_write(port_write),
       .port_write_h(port_write_h),
       .bus_request(t_breq),
       .bus_grant(t_grant_st),
       .bio(top_buf_flag),
       .int(int)
    );

ulaw_lin_conv ULAW_LIN_CONV_INST(
	.upcm(upcm[7:0]),
	.lpcm(lpcm[15:0])
);

arb ARB_INST(
	.reset(s_reset),
	.clk(m_clk),
	.dma_breq(dma_breq),
	.dma_grant(dma_grant),
	.tdsp_breq(t_breq_st),
	.tdsp_grant(t_grant)
);

dma DMA_INST(
	.clk(m_clk),
	.reset(s_reset),
	.dflag(dflag),
	.bgrant(dma_grant),
	.read_spi(read_spi),
	.breq(dma_breq),
	.a(d_addrs[7:0]),
	.as(d_as),
	.write(d_write),
	.top_buf_flag(top_buf_flag)
);

spi SPI_INST(
	.spi_clk(spi_clk),
	.m_spi_clk(m_spi_clk),
	.spi_fs(spi_fs),
	.spi_data(spi_data),
	.clk(m_clk),
	.reset(s_reset),
	.read(read_spi),
	.dflag(dflag),
	.dout(upcm[7:0]),
	.test_mode(test_mode)
);

endmodule
