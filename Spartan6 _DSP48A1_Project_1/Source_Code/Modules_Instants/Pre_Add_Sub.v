module Pre_Add_Sub #(
    parameter WIDTH = 18 // Width of the input and output ports
) (
    input [WIDTH-1:0]   in1,
    input [WIDTH-1:0]   in2,
    input               sel, // Select signal for addition or subtraction
    output [WIDTH-1:0]  out
);

assign out = (sel) ? (in1 - in2) : (in1 + in2);
endmodule