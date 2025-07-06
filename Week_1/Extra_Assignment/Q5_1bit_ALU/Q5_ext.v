module ALU_1bit(a, b, Ainvert, Binvert, CarryIn , op, out, CarryOut);

input a, b, Ainvert, Binvert, CarryIn;
input [1:0] op; // 3-bit operation code
output out, CarryOut;

wire in1, in2;

assign in1 = Ainvert ? ~a : a; // Invert a if Ainvert is high
assign in2 = Binvert ? ~b : b; // Invert b if Binvert

assign {CarryOut, out} = 
    (op == 2'b00) ? in1 & in2 : // AND operation
    (op == 2'b01) ? in1 | in2 : // OR operation
    (op == 2'b10) ? in1 + in2 + CarryIn: 2'b00; // ADD operation
  

endmodule