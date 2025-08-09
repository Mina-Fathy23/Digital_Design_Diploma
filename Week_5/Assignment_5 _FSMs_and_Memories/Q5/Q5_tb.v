module FIFO_tb();

parameter FIFO_WIDTH = 16; parameter FIFO_DEPTH = 8;
reg [FIFO_WIDTH-1:0] din_a;
reg wen_a; reg ren_b;
reg CLK; reg rst;
wire [FIFO_WIDTH-1:0] dout_b_dut;
wire full_dut; wire empty_dut;

FIFO #(FIFO_WIDTH, FIFO_DEPTH) DUT (din_a, wen_a, ren_b, CLK, CLK, rst, dout_b_dut, full_dut, empty_dut);
initial begin
    CLK = 0;
    forever
        #1 CLK = ~CLK;
end
initial begin
    $readmemb("mem.dat", DUT.fifo);
    rst = 1;
    @(negedge CLK);
    if(dout_b_dut != 0)begin
        $display("Error in Reset Function");
        $stop;
    end

    rst = 0;
    @(negedge CLK);
    if(empty_dut != 1 && full_dut != 0)begin
        $display("Error in Flag Functions");
        $stop;
    end
    //testing write and full flag
    ren_b = 0;
    repeat(32)begin
        wen_a = $random;
        din_a = $random;
        @(negedge CLK);
    end
    if(full_dut != 1)begin
        $display("Error in Full Flag Functions");
        $stop;
    end
    //testing read
    wen_a = 0;
    repeat(32)begin
        ren_b = $random;
        @(negedge CLK);
    end

    //testing read & write
    repeat(32)begin
        wen_a = $random;
        ren_b = $random;
        din_a = $random;
        @(negedge CLK);
    end
    $display("All Tests Passed Successfully");
    $stop;

end


endmodule