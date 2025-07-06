module Priority_Encoder(in, out);

input [3:0] in;
output reg [1:0] out;

always @(*) begin
    
    casex(in)
    4'b1XXX: out = 2'b11;
    4'b01XX: out = 2'b10;
    4'b001X: out = 2'b01;
    4'b000X: out = 2'b00;
    default: out = 2'b00;
    endcase
end


endmodule