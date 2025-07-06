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

module Seven_Segment_Decoder(A, B, op, en, a, b, c, d, e, f, g);

input [3:0] A, B;
input [1:0] op;
input en;
output reg a, b, c, d, e, f, g;
wire [3:0] result;

ALU alu_1(.in0(A), .in1(B), .op(op), .out(result));

always @(*) begin
    if (en) begin
        case (result)
            4'h0: {a, b, c, d, e, f, g} = 7'b111_1110; // 0
            4'h1: {a, b, c, d, e, f, g} = 7'b011_0000; // 1
            4'h2: {a, b, c, d, e, f, g} = 7'b110_1101; // 2
            4'h3: {a, b, c, d, e, f, g} = 7'b111_1001; // 3
            4'h4: {a, b, c, d, e, f, g} = 7'b011_0011; // 4
            4'h5: {a, b, c, d, e, f, g} = 7'b101_1011; // 5
            4'h6: {a, b, c, d, e, f, g} = 7'b101_1111; // 6
            4'h7: {a, b, c, d, e, f, g} = 7'b111_0000; // 7
            4'h8: {a, b, c, d, e, f, g} = 7'b111_1111; // 8
            4'h9: {a, b, c, d, e, f, g} = 7'b111_1011; // 9
            4'hA: {a, b, c, d, e, f, g} = 7'b111_0111; // A
            4'hB: {a, b, c, d, e, f, g} = 7'b001_1111; // B
            4'hC: {a, b, c, d, e, f, g} = 7'b100_1110; // C
            4'hD: {a, b, c, d, e, f, g} = 7'b011_1101; // D
            4'hE: {a, b, c, d, e, f, g} = 7'b100_1111; // E
            4'hF: {a, b, c, d, e, f, g} = 7'b100_0111; // F
            default: {a, b, c, d, e, f, g} = 7'b000_0000; // Error state
        endcase
    end 
    else begin
        {a, b, c, d, e, f, g} = 7'b000_0000; // All segments off when not enabled
    end
end
endmodule

