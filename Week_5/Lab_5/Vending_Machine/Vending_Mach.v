module vending_machine #(
    parameter WAIT = 2'b00,
    parameter Q_25 = 2'b01,
    parameter Q_50 = 2'b10
) (
    input     D_in,
    input     Q_in, 
    input     clk, 
    input     rst, 
    output    dispense,
    output    change
    );

reg [1:0] cs, ns;

//Current State Memory
always @(posedge clk, posedge rst) begin

    if(rst)
        cs <= WAIT;
    else
        cs <= ns;
end

//Next State Comb
always @(D_in, Q_in, cs) begin

    case (cs)
        WAIT: 
            if(Q_in)
                ns = Q_25;
            else
                ns = WAIT;
        
        Q_25:
            if(Q_in)
                ns = Q_50;
            else
                ns = Q_25;

        Q_50:
            if(Q_in)
                ns = WAIT;
            else
                ns = Q_50;

    endcase
    
end
//Output Comb
assign dispense = ((Q_in == 1 && cs == Q_50) || (D_in == 1 && cs == WAIT))? 1'b1 : 1'b0;
assign change = (D_in == 1 && cs == WAIT)? 1'b1 : 1'b0;




endmodule