module NBit_ALU_FF(in0, in1, out_r, Clk, Rst);

parameter N = 4;
parameter OPCODE = 3;
input [N-1:0] in0, in1;
input Clk, Rst;
output reg [N-1:0] out_r;

always @(posedge Clk) begin
    if(Rst)begin
        out_r <= 1'b0;
    end
    else begin
    
        case(OPCODE)
        2'b01   : out_r <= in0 | in1;
        2'b10   : out_r <= in0 - in1;
        2'b11   : out_r <= in0 ^ in1;
        default : out_r <= in0 + in1;  //As OP code defaults to zero
        endcase
    end
end
endmodule