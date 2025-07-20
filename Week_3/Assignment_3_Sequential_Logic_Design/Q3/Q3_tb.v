module MOD10_Counter_tb();

reg Clk_tb, Rst_tb;
wire Clk_div10_out_dut;

MOD10_Counter DUT(Clk_tb, Rst_tb, Clk_div10_out_dut);

initial begin
    Clk_tb = 0;
    forever
    #1 Clk_tb = ~Clk_tb;    
end

initial begin
    Rst_tb = 1'b1;
    @(negedge Clk_tb);
    Rst_tb = 1'b0;

    repeat(100)@(negedge Clk_tb);

    $stop;  
end
endmodule