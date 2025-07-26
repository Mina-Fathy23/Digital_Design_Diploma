module LFSR_tb();

reg clk_tb, rst_tb, set_tb;
wire [3:0] out_dut;

LFSR DUT(clk_tb, rst_tb, set_tb, out_dut);

initial begin
    clk_tb = 0;
    forever
        #1 clk_tb = ~clk_tb;
end

initial begin
    
    rst_tb = 1;
    set_tb = 1;
    @(negedge clk_tb);
    if(out_dut != 4'b0001)begin

        $display("Error in rst signal Expected out: 0001 | Dut: %b", out_dut);
        $stop;
    end

    rst_tb = 0;
    set_tb = 0;

    repeat(30) begin
        @(negedge clk_tb);
    end

    $stop;

end

endmodule