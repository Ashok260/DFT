
// Generated by ac_shell v4.0-s005 on Sat Apr 28 22:36:38 CST 2001.  
// Restrictions concerning the use of Ambit BuildGates are covered in the
// license agreement.  Distribution to third party EDA vendors is
// strictly prohibited.

module dtmf_chip(tdigit, tdigit_flag, reset, int, port_pad_data_out, 
		port_pad_data_in, scan_en, scan_clk, test_mode, spi_data, spi_fs
		, refclk, vcop, vcom, pllrst, ibias);

	output [7:0] tdigit;
	output tdigit_flag;
	input reset;
	input int;
	output [15:0] port_pad_data_out;
	input [15:0] port_pad_data_in;
	input scan_en;
	input scan_clk;
	input test_mode;
	input spi_data;
	input spi_fs;
	input refclk;
	output vcop;
	output vcom;
	input pllrst;
	input ibias;

	wire [15:0] tdsp_portI;
	wire [15:0] tdsp_portO;
	wire [7:0] tdigitO;



	iopads IOPADS_INST(
            .tdigit(tdigit), 
            .tdigit_flag(tdigit_flag), 
            .reset(reset), 
            .int(int), 
            .tdsp_port_out(port_pad_data_out), 
            .tdsp_port_in(port_pad_data_in), 
            .test_mode(test_mode), 
            .scan_clk(scan_clk),
            .scan_en(scan_en),
            .spi_fs(spi_fs),
            .spi_data(spi_data),
            .refclk(refclk), 
            .vcop(vcop), 
            .vcom(vcom), 
            .pllrst(pllrst), 
            .ibias(ibias), 

            .tdigitO(tdigitO), 
            .tdigit_flagO(tdigit_flagO), 
            .resetI(resetI), 
            .tdsp_portO(tdsp_portO), 
            .tdsp_portI(tdsp_portI), 
            .test_modeI(test_modeI), 
            .scan_clkI(scan_clkI), 
            .scan_enI(scan_enI), 
            .spi_fsI(spi_fsI), 
            .spi_dataI(spi_dataI), 
            .refclkI(refclkI), 
            .vcopO(vcopO), 
            .vcomO(vcomO), 
            .pllrstI(pllrstI), 
            .ibiasI(ibiasI)
        );
	dtmf_recvr_core DTMF_INST(
            .tdigit(tdigitO), 
            .tdigit_flag(tdigit_flagO), 
            .reset(resetI), 
            .port_pad_data_out(tdsp_portO), 
            .port_pad_data_in(tdsp_portI), 
            .scan_clk(scan_clkI), 
            .scan_en(scan_enI), 
            .test_mode(test_modeI), 
            .spi_fs(spi_fsI), 
            .spi_data(spi_dataI), 
            .refclk(refclkI), 
            .vcop(vcopO), 
            .vcom(vcomO), 
            .pllrst(pllrstI), 
            .ibias(ibiasI)
        );
endmodule
