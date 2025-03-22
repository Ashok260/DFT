module test_control(
    m_rcc_clk,
    m_digit_clk,
    m_spi_clk,
    m_ram_clk,
    m_dsram_clk,
    m_clk,
    clk,
    rcc_clk,
    digit_clk,
    spi_clk,
    ram_clk,
    dsram_clk,
    scan_clk,
    test_mode
);

output m_rcc_clk;
output m_digit_clk;
output m_spi_clk;
output m_ram_clk;
output m_dsram_clk;
output m_clk;

input clk;
input rcc_clk;
input digit_clk;
input spi_clk;
input ram_clk;
input dsram_clk;
input scan_clk;
input test_mode; 
 
assign m_rcc_clk	= test_mode ? scan_clk : rcc_clk;
assign m_ram_clk	= test_mode ? scan_clk : ram_clk;
assign m_dsram_clk	= test_mode ? scan_clk : dsram_clk;
assign m_digit_clk	= test_mode ? scan_clk : digit_clk;
assign m_spi_clk	= test_mode ? scan_clk : spi_clk;
assign m_clk		= test_mode ? scan_clk : clk;

endmodule
