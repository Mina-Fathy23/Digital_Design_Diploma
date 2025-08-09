module Error_Detector#(
    parameter START = 3'B000,
    parameter D0_is_1 = 3'B001, 
    parameter D1_is_1 = 3'B010,
    parameter D0_not_1 = 3'B011,
    parameter D1_not_1 = 3'B100
)  (
    input        CLK,
    input        rst,
    input        Din,
    output       ERR
);
 (* fsm_encoding = "gray" *)
reg [2:0] state, next_state;
// Current state register
always @(posedge CLK or posedge rst) begin
    if (rst) begin
        state <= START; // Reset to initial state START
    end else begin
        state <= next_state; // Transition to next state
    end
end
// Next state logic
always @(*)begin
    case(state)
        START:
            if(Din == 1)
                next_state = D0_is_1; // Transition to D0_is_1 if Din is 1
            else
                next_state = D0_not_1; // Transition to D0_not_1 if Din is 0
        D0_is_1:
            if(Din == 1)
                next_state = D1_is_1; // Transition to D1_is_1 if Din is 1
            else
                next_state = D1_not_1; // Transition to D0_not_1 if Din is 0
        D1_is_1:  next_state = START;
        D0_not_1: next_state = D1_not_1;
        D1_not_1: next_state = START;
        default:  next_state = START;
    endcase
end

assign ERR = (state == D1_is_1 && Din == 1'b1) ? 1'b1 : 1'b0;

endmodule