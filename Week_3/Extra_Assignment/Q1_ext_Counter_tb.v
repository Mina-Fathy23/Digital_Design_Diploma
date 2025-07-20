module Sync_Counter_4bit_tb();

reg clk_tb, set_tb;
wire [3:0] out_dut, out_expected;

Sync_Counter_4bit DUT(clk_tb, set_tb, out_dut);
Ripple_counter_4bit Golden(clk_tb, set_tb, out_expected);

initial begin
    clk_tb = 0;
    forever
        #1 clk_tb = ~clk_tb;
end

initial begin
    set_tb = 0;
    @(negedge clk_tb);
    if(out_dut != out_expected) begin

        $display("Error! Expected output:%d and Dut output: %d", out_expected, out_dut);
        $stop;
    end

    set_tb = 1;

    repeat(100)begin
    @(negedge clk_tb);
    if(out_dut != out_expected) begin

        $display("Error! Expected output:%d and Dut output: %d", out_expected, out_dut);
        $stop;
        end
    end
    $display("Success, All outputs are Correct!");
    $stop;
end
endmodule