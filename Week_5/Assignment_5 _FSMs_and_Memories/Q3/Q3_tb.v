module Error_Detector_tb();

reg   CLK;
reg   rst;
reg   Din;
wire  ERR_dut;

Error_Detector DUT (CLK, rst, Din, ERR_dut);

initial begin
    CLK = 0;
    forever
        #1 CLK = ~CLK;
end

initial begin
    Din = 0;
    rst = 1;
    @(negedge CLK);
    if(ERR_dut != 0)begin
        $display("Reset Test Error Expected:0| DUT: %d", ERR_dut);
        $stop;
    end

    rst = 0;

    repeat(30)begin

        Din = $random;
        @(negedge CLK);
    end

    $stop;
end

endmodule