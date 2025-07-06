module ALU(in0, in1, op, out);

parameter S = 4;
input [S-1:0] in0, in1;
input [1:0] op;
output reg [S-1:0] out;

always @(*) begin
    case (op)
        2'b00: out = in0 + in1;
        2'b01: out = in0 | in1; 
        2'b10: out = in0 - in1;
        2'b11: out = in0 ^ in1;
        default: out = 0;
    endcase
end


endmodule