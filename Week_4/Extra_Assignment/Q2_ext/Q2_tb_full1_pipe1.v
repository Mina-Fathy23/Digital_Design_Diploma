module param_adder_full1_pipe1();
    reg [3:0]        a_tb;
    reg [3:0]        b_tb;
    reg              cin_tb; 
    reg              clk_tb; 
    reg              rst_tb;
    reg [3:0]        sum_expected;
    reg              cout_expected;
    wire [3:0]       sum_dut;
    wire             cout_dut;

    param_adder #(.WIDTH(4), .PIPELINE_ENABLE(1), .USE_FULL_ADDER(1)) DUT (a_tb, b_tb, cin_tb, clk_tb, rst_tb, sum_dut, cout_dut);
    initial begin
        clk_tb = 0;
        forever
            #1 clk_tb = ~clk_tb;
    end

    initial begin
        // Initialize inputs
        rst_tb = 1;
        sum_expected = 0;
        cout_expected = 0;
        @(negedge clk_tb);

        if(sum_dut !== sum_expected || cout_dut !== cout_expected) begin
                $display("Mismatch in Reset Expected sum = %b, cout = %b; DUT sum = %b, cout = %b", sum_expected, cout_expected, sum_dut, cout_dut);
                $stop;
            end
        // Reset the DUT
        rst_tb = 0;
        repeat(20)begin
            a_tb = $urandom_range(1,15);
            b_tb = $random;
            cin_tb = $random;
            {cout_expected, sum_expected} = a_tb + b_tb + cin_tb;
            @(negedge clk_tb);
            if(sum_dut !== sum_expected || cout_dut !== cout_expected) begin
                $display("Mismatch Expected sum = %b, cout = %b; DUT sum = %b, cout = %b", sum_expected, cout_expected, sum_dut, cout_dut);
                $stop;
            end
        end       
        $display("All tests passed!");
        $stop; 
    end
endmodule