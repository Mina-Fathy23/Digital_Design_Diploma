module Sync_Counter_4bit_clk_div_tb();

reg clk_tb, set_tb, div_2_expected, div_4_expected;
wire [3:0] out_dut;
wire div_2_dut, div_4_dut;

Sync_Counter_4bit DUT(clk_tb, set_tb, out_dut, div_2_dut, div_4_dut);

initial begin
    clk_tb = 0;
    forever
        #1 clk_tb = ~clk_tb;
end

   integer i;
initial begin
    set_tb = 0;
    @(negedge clk_tb);

    set_tb = 1;
    for(i = 0; i < 100; i = i + 1)begin

        if(i == 0)begin
            div_2_expected = 0;
            div_4_expected = 0;
        end
        else begin

            div_2_expected = ~div_2_expected;
            if(i%2 == 0)
                div_4_expected = ~div_4_expected;

         end 
        @(negedge clk_tb);

        if(div_2_dut != div_2_expected)begin
            $display("Error in Div_2 funtionality Expected: %d | Dut out: %d", div_2_expected, div_2_dut);
            $stop;
        end
        if(div_4_dut != div_4_expected)begin
            $display("Error in Div_4 funtionality Expected: %d | Dut out: %d", div_4_expected, div_4_dut);
            $stop;
        end
    end
    $display("Success, All outputs are Correct!");
    $stop;
end
endmodule