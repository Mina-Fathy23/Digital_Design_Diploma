module Gray_Code_Counter_tb();

reg clk_tb, rst_tb;
wire [1:0] gray_out_dut;

reg [1:0] bin_counter_tb, gray_out_expected;

Gray_Code_Counter DUT(clk_tb, rst_tb, gray_out_dut);

initial begin
    clk_tb = 0;
    forever
        #1 clk_tb = ~clk_tb;
end
initial begin
    rst_tb = 1;
    bin_counter_tb = 0;
    gray_out_expected = 0;
    @(negedge clk_tb);

    if(gray_out_dut != gray_out_expected)begin

        $display("Error In reset! Expected: %b | Dut out: %b", gray_out_expected, gray_out_dut);
        $stop;
    end
    rst_tb = 0;
    repeat(100)begin

        bin_counter_tb = bin_counter_tb + 1;
        gray_out_expected = {bin_counter_tb[1], ^(bin_counter_tb)};
        @(negedge clk_tb);
        if(gray_out_dut != gray_out_expected)begin

        $display("Error In Count Functionality! Expected: %b | Dut out: %b", gray_out_expected, gray_out_dut);
        $stop;
        end
    end
    $display("SUCCESS!! All test Passed!");
    $stop;
end

endmodule