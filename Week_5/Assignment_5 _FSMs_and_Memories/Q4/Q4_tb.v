module SinglePort_Ram_tb();

parameter  MEM_WIDTH = 16; parameter  MEM_DEPTH = 1024;
parameter  ADDR_SIZE = $clog2(MEM_DEPTH); parameter  ADDR_PIPELINE = "FALSE";
parameter  DOUT_PIPELINE = "TRUE"; parameter  PARITY_ENABLE = 1;

reg [MEM_WIDTH-1:0] din;
reg [ADDR_SIZE-1:0] addr;
reg wr_en; reg rd_en;
reg blk_select;
reg addr_en; reg dout_en;
reg rst; reg CLK;
wire [MEM_WIDTH-1:0] dout_dut;
wire parity_out_dut;

SinglePort_Ram #(MEM_WIDTH, MEM_DEPTH, ADDR_PIPELINE, DOUT_PIPELINE, PARITY_ENABLE) DUT (din, addr, wr_en, rd_en, blk_select, addr_en, dout_en, rst, CLK, dout_dut, parity_out_dut);
initial begin
    CLK = 0;
    forever
        #1 CLK = ~CLK;
end

initial begin
    $readmemb("mem.dat", DUT.memory);
    rst = 1;
    @(negedge CLK);
    if(dout_dut != 0 && parity_out_dut != 0)begin
        $display("Reset Function Error, Dout:%h | Parity Out:%b", dout_dut, parity_out_dut);
        $stop;
    end
    rst = 0;
    //Test Writing
    addr_en = 0;
    dout_en = 1;
    rd_en = 0;
    repeat(10)begin
        blk_select = $random;
        wr_en = $random;
        addr = $random;
        din = $random;
        repeat(2)@(negedge CLK);
    end
    //Test Reading
    wr_en = 0;
    repeat(10)begin
        blk_select = $random;
        rd_en = $random;
        din = $random;
        repeat(2)@(negedge CLK);
        addr = $random;
    end
    $display("All Tests Passed Successfully");
    $stop;
end
endmodule