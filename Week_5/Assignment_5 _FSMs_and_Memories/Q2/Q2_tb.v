module FSM_Gray_Counter_2B_tb();

reg        CLK;
reg        rst;
wire [1:0] y_dut;
wire [1:0] y_expected;


FSM_Gray_Counter_2B dut      (.CLK(CLK), .rst(rst), .y(y_dut));
Gray_Code_Counter   Golden   (.clk(CLK), .rst(rst), .gray_out(y_expected));

initial begin
    CLK = 0;
    forever
        #1 CLK = ~CLK;
end

initial begin

    rst = 1; // Start with reset
    @(negedge CLK); 
    if(y_dut != y_expected) begin
        $display("RESET Test failed: y_dut = %b, y_expected = %b", y_dut, y_expected);
        $stop;
    end

    rst = 0;

    repeat(10)begin
        @(negedge CLK);
         if(y_dut != y_expected) begin
            $display("RESET Test failed: y_dut = %b, y_expected = %b", y_dut, y_expected);
            $stop;
        end

    end

    $display("All tests passed!");
    $stop;
end


endmodule