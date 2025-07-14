module Gray_Hot_Encoder(A, B);

parameter USE_GRAY = 0;
input [2:0] A; // 3-bit input
output reg [6:0] B; // 7-bit output

always @(*) begin
    
    if(USE_GRAY) begin
        // Gray code encoding
        B[2] = A[2];
        B[1] = A[2] ^ A[1];
        B[0] = A[1] ^ A[0];
        B[6:3] = 3'b000; // Unused bits for Gray code
    end else begin
        // Hot encoding
        case (A)
            3'b000: B = 7'b0000000;
            3'b001: B = 7'b0000001;
            3'b010: B = 7'b0000010;
            3'b011: B = 7'b0000100;
            3'b100: B = 7'b0001000;
            3'b101: B = 7'b0010000;
            3'b110: B = 7'b0100000;
            3'b111: B = 7'b1000000;
            default: B = 7'b1111111; // Invalid input, all bits high
        endcase
    end

end

endmodule