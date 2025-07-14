module Testbench_OP_0();

reg [3:0] in0_tb, in1_tb, out_expected;
wire [3:0] out_dut;

NBit_ALU #(.N(4), .OPCODE(0)) DUT(in0_tb, in1_tb, out_dut);

initial begin
    repeat(100)begin
        in0_tb = $random;
        in1_tb = $random;
        out_expected = in0_tb + in1_tb;
        #10;

        if(out_dut != out_expected)begin
            $display("Error ! - Incorrect Output");
            $stop;
        end
    end

    $display("Sucessfull ! - ALL Correct Output");
    $stop;
end

endmodule