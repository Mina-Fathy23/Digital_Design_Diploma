module NBit_ALU(in0, in1, out);

parameter N = 4;
parameter OPCODE = 0;
input [N-1:0] in0, in1;
output [N-1:0] out;

assign out = (OPCODE == 2'b01)? in0 | in1 :
             (OPCODE == 2'b10)? in0 - in1 :
             (OPCODE == 2'b11)? in0 ^ in1 : in0 + in1 ; //As OP code defaults to zero

endmodule