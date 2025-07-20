module Ripple_counter_4bit_tb();

reg Clk_tb, Rstn_tb;
reg[3:0] Out_expected;
wire[3:0] Out_dut;

Ripple_counter_4bit DUT (Clk_tb, Rstn_tb, Out_dut);

initial begin
    Clk_tb = 0;
    forever begin
    #1   Clk_tb = ~Clk_tb;
    end
end

initial begin
    Rstn_tb = 0;
    Out_expected = 4'd15;
    @(negedge Clk_tb);
    if(Out_dut != Out_expected) begin

            $display("Error! Expected output:%d and Dut output: %d", Out_expected, Out_dut);
            $stop;
        end

    Rstn_tb = 1;
    repeat(100)begin
    Out_expected = Out_expected + 1;
    @(negedge Clk_tb);
    if(Out_dut != Out_expected) begin

            $display("Error! Expected output:%d and Dut output: %d", Out_expected, Out_dut);
            $stop;
        end
    end
    
    $display("Success, All outputs are Correct!");
    $stop;
end
endmodule