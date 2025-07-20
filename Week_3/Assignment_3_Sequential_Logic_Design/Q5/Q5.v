module Param_Shift_Reg(sclr, sset, shiftin, load, data, clock, enable, aclr, aset, shiftout, q);

parameter LOAD_AVLAUE = 5;          //Value loaded to q[] when aset is high
parameter SHIFT_DIRECTION = "LEFT";  //Direction of Shift Register
parameter LOAD_SVALUE = 9;          //Value loaded to q[] when sset is high
parameter SHIFT_WIDTH = 3;          //Width of data[] and q[]


input sclr, sset, shiftin, load, clock, enable, aclr, aset;
input [SHIFT_WIDTH - 1: 0] data;
output reg shiftout; 
output reg [SHIFT_WIDTH - 1: 0] q;

always @(posedge clock, posedge aclr, posedge aset) begin

    if(aclr)
        q <= 0;
    else if(aset)
        q <= LOAD_AVLAUE;
    else if(enable)begin
        
        if(sclr)
            q <= 0;
        else if(sset)
            q <= LOAD_SVALUE;
        else if(load)
            q <= data;
        else if(SHIFT_DIRECTION == "LEFT")
            {shiftout, q} = {q, shiftin};   
        else if(SHIFT_DIRECTION == "RIGHT")
             {q, shiftout} = {shiftin, q};
    end 
end
endmodule