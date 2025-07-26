module TDM_tb();

reg clk_tb, rst_tb;
reg [1:0] in0_tb, in1_tb, in2_tb, in3_tb;
reg [1:0] out_expected;
wire [1:0] out_dut;


TDM DUT (in0_tb, in1_tb, in2_tb, in3_tb, clk_tb, rst_tb, out_dut);
integer i;

initial begin
    clk_tb = 0;
    forever
        #1 clk_tb = ~clk_tb;
end

initial begin
    rst_tb = 1;
    in0_tb = 0;
    in1_tb = 0;
    in2_tb = 0;
    in3_tb = 0;

    out_expected = in0_tb;

    @(negedge clk_tb);
    if(out_dut != out_expected) begin

        $display("Error in Asynchronous rst Expected: out:%d | DUT: out:%d", out_expected, out_dut);
        $stop;
    end

    rst_tb = 0;
    for(i = 1; i < 50; i = i + 1) begin
        in0_tb = $random;
        in1_tb = $random;
        in2_tb = $random;
        in3_tb = $random;

        // Update expected output based on counter value
        out_expected = (i%4 == 0) ? in0_tb : (i%4 == 1) ? in1_tb : (i%4  == 2) ? in2_tb : in3_tb;

        @(negedge clk_tb);
        if(out_dut != out_expected) begin
            $display("Error in Functionality I:%d Expected: out:%d | DUT: out:%d", i ,out_expected, out_dut);
            $stop;
        end
        
    end
    $display("All Tests Passed");
    $stop;
end

endmodule