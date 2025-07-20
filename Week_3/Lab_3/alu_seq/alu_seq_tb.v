module alu_tb();

reg rst, clk; 
reg [1:0] opcode_tb;
reg [3:0] A_tb, B_tb;
reg [7:0] out_expected;
wire [7:0] out_dut;

alu DUT(A_tb, B_tb, opcode_tb, rst, clk, out_dut);

initial begin
    clk = 0;
    forever begin
        
        #1 clk = ~(clk);
    end
    
end

initial begin
    rst = 1;
    @(negedge clk);
    rst = 0;

    repeat(100)begin

        A_tb = $random;
        B_tb = $random; 
        opcode_tb = $random;

        case (opcode_tb)
            2'b00: out_expected = A_tb + B_tb;
            2'b01: out_expected = A_tb * B_tb;
            2'b10: out_expected = A_tb | B_tb;
            2'b11: out_expected = A_tb & B_tb;
            default: out_expected = 8'b0000_0000;
        endcase

        repeat(2)@(negedge clk);

        if(out_dut != out_expected)begin
            $display("Error - Output is Incorrect!! A:%d B:%d OP:%d  Expected out:%d DUT Out:%d",A_tb, B_tb, opcode_tb ,out_expected, out_dut);
            $stop;
        end
    end

    $display("Success - All Outputs are correct!!");
    $stop;

end

endmodule