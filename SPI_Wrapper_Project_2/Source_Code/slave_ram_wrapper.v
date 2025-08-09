module slave_ram_top_module (clk, rst_n, ss_n, mosi, miso);
    input clk;     
    input rst_n;   
    input ss_n;    
    input mosi;     
    output miso;

    wire [9:0] din;
    wire rx_valid;
    wire [7:0] dout;
    wire tx_valid;

    spi_slave spi_inst (.clk(clk), .rst_n(rst_n), .ss_n(ss_n), .mosi(mosi), .miso(miso), .rx_data(din), .rx_valid(rx_valid),
    .tx_data(dout), .tx_valid(tx_valid));

    ram ram_inst (.clk(clk), .rst_n(rst_n), .din(din), .rx_valid(rx_valid), .dout(dout), .tx_valid(tx_valid));
endmodule