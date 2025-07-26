module alu(A, B,  opcode, rst, clk, out);

input rst, clk;
input [1:0] opcode;
input [3:0] A, B;
output reg [7:0] out;

reg [1:0] opcode_reg;
reg [3:0] A_reg, B_reg;

always @(posedge clk, posedge rst) begin

    if(rst)begin    
        A_reg <= 4'b0000;
        B_reg <= 4'b0000;
        opcode_reg <= 2'b00;
    end
    else begin
        A_reg <= A;
        B_reg <= B;
        opcode_reg <= opcode;
    end
end

always @(posedge clk, posedge rst) begin

    if(rst)begin
      out <= 8'b00000000;
    end
    else begin
      case (opcode_reg)
        2'b00: out <= A_reg + B_reg;
        2'b01: out <= A_reg * B_reg;
        2'b10: out <= A_reg | B_reg;
        2'b11: out <= A_reg & B_reg;
      endcase
    end
end



endmodule