module FSM_Gray_Counter_2B#(
    parameter A = 2'b00,
    parameter B = 2'b01,
    parameter C = 2'b10,
    parameter D = 2'b11
)  (
    input        CLK,
    input        rst,
    output [1:0] y
    );

reg [1:0] state, next_state;

//Current state register
always @(posedge CLK or posedge rst) begin
    if (rst) begin
        state <= A; // Reset to initial state A
    end else begin
        state <= next_state; // Transition to next state
    end
end

// Next state logic
always @(*) begin

    case (state)
        A: next_state = B;
        B: next_state = C;
        C: next_state = D;
        D: next_state = A; 
        default: next_state = A;
    endcase
end

// Output logic
assign y = (state == A) ? 2'b00 :
           (state == B) ? 2'b01 :
           (state == C) ? 2'b11 :
           (state == D) ? 2'b10 : 2'b00;

endmodule