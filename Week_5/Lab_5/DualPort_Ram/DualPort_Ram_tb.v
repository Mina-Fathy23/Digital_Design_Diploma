module dualport_ram_tb();

parameter MEM_WIDTH = 16;
parameter MEM_DEPTH = 1024;
parameter ADDER_SIZE = 10;

reg [MEM_WIDTH-1:0]   din;
reg [ADDER_SIZE-1:0]  addr_wr;
reg [ADDER_SIZE-1:0]  addr_rd;
reg                   wr_en;
reg                   rd_en;
reg                   blk_select;
reg                   clk;
reg                   rst;
reg [MEM_WIDTH-1:0]   dout_expected;
wire [MEM_WIDTH-1:0]  dout_dut;

dualport_ram #(MEM_WIDTH, MEM_DEPTH, ADDER_SIZE) DUT (din, addr_wr, addr_rd, wr_en, rd_en, blk_select, clk, rst, dout_dut);

initial begin
    clk = 0;
    forever
        #1 clk = ~clk;
end

initial begin

    $readmemb("mem.dat", DUT.mem);
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    addr_rd = 0;
    addr_wr = 0;
    dout_expected = 0;
    @(negedge clk);
    if(dout_dut != dout_expected)begin

        $display("Error in RST Functionality Expected dout:%d | DUT dout:%d ", dout_expected, dout_dut);
        $stop;
    end

    rst = 0;
    repeat(20)begin

        blk_select = $random;
        addr_wr = $random;
        din = $random;
        wr_en = $radnom;
        @(negedge clk);

    end

    wr_en = 0;
    repeat(20)begin

        blk_select = $random;
        addr_rd = $random;
        din = $random;
        rd_en = $radnom;
        @(negedge clk);
    end

    repeat(20)begin

        blk_select = $random;
        addr_rd = $random;
        addr_wr = ~(addr_rd);
        din = $random;
        rd_en = $radnom;
        wr_en = $random;
        @(negedge clk);

    end
    $stop;
end

endmodule