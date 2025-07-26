module TDM(in0, in1, in2, in3, clk, rst, out);

input clk, rst;
input [1:0] in0, in1, in2, in3;
output reg [1:0] out;

wire [1:0] cnt;


N_bit_up_Counter #(.WIDTH(2)) COUNTER (clk, rst, cnt);

always @(*) begin

    case (cnt)
        2'b00: out =  in0;
        2'b01: out =  in1;
        2'b10: out =  in2;
        2'b11: out =  in3;
    endcase
end

endmodule