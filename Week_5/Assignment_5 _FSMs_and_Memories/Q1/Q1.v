module Control_Unit #(
    parameter MIN_DISTANCE = 7'd40, //40 meters
    //FSM states: SEQ encoding
    parameter STOP = 2'b00,
    parameter ACCELERATE = 2'b01,
    parameter DECELERATE = 2'b10
) (
    input [7:0] speed_limit,
    input [7:0] car_speed,
    input [6:0] leading_distance,
    input       CLK,
    input       rst,
    output      unlock_doors,
    output      accelerate_car
);

 (* fsm_encoding = "one_hot" *)
reg [1:0] current_state, next_state;
//Current state memory
always @(posedge CLK, posedge rst) begin

    if(rst)begin
        current_state <= STOP;
    end else begin
        current_state <= next_state;
    end
    
end
//next state Combinational logic
always @(current_state, leading_distance, car_speed, speed_limit) begin

    case(current_state)
    STOP:begin
        if(leading_distance >= MIN_DISTANCE)
            next_state = ACCELERATE;
        else
            next_state = STOP;
    end
    ACCELERATE:begin
        if(leading_distance >= MIN_DISTANCE && car_speed < speed_limit)
            next_state = ACCELERATE;
        else if(leading_distance < MIN_DISTANCE || car_speed > speed_limit)
            next_state = DECELERATE;
        else  next_state = STOP;
    end
    DECELERATE:begin
        if(leading_distance < MIN_DISTANCE || car_speed > speed_limit)
            next_state = DECELERATE;
        else if(leading_distance >= MIN_DISTANCE && car_speed < speed_limit)
            next_state = ACCELERATE;
        else if(car_speed == 0)
            next_state = STOP;
        else  next_state = STOP;
    end
    default: next_state = STOP;
    endcase 
end
//Output logic
assign unlock_doors = (current_state == STOP)? 1 : 0;
assign accelerate_car = (current_state == ACCELERATE)? 1 : 0; 

endmodule