module shift_register_right_amount2_tb();
    reg load_tb;
    reg clk_tb;
    reg rst_tb;
    reg [7:0] load_value_tb;
    reg [7:0] PO_expected;    
    wire[7:0] PO_dut;    

    shift_register #(.SHIFT_DIRECTION("RIGHT"), .SHIFT_AMOUNT(2)) DUT (load_tb, load_value_tb, clk_tb, rst_tb, PO_dut);

    initial begin
        clk_tb = 0;
        forever
            #1 clk_tb = ~clk_tb;
    end

    initial begin
        rst_tb = 1;
        load_tb = 0;
        load_value_tb = 8'b00000000;
        PO_expected = 8'b00000000;
        @(negedge clk_tb);

        if(PO_dut != PO_expected) begin
            $display("RESET failed Expected %b, got %b", PO_expected, PO_dut);
            $stop;
        end
        rst_tb = 0;
        repeat(3)begin
            load_tb = 1;
            load_value_tb = $urandom_range(0,255);
            PO_expected = load_value_tb;
            @(negedge clk_tb);

            if(PO_dut != PO_expected) begin
                $display("LOAD failed Expected %b, got %b", PO_expected, PO_dut);
                $stop;
            end

            load_tb = 0;
            PO_expected = PO_expected >> 2; // Shift right by 2
            @(negedge clk_tb);

            if(PO_dut != PO_expected) begin
                $display("LOAD failed Expected %b, got %b", PO_expected, PO_dut);
                $stop;
            end
        end
        $display("All tests passed successfully!");
        $stop;
    end
endmodule