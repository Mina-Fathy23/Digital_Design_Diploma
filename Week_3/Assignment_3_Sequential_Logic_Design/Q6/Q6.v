module SLE(D, Clk, En, ALn, ADn, SLn, SD, LAT, Q);

input D, Clk, En, ALn, ADn, SLn, SD, LAT;
output reg Q;

always @(posedge Clk, negedge ALn) begin

    if(~ALn) begin
        Q <= ~(ADn);
    end
    else if(En)begin
       
        if(~SLn)begin
            Q <= SD;
        end
        else if(~LAT)begin
            Q <= D;
        end
    end
end

always @(*) begin

    if(ALn && En && SLn && LAT && Clk)
        Q = D;
end
endmodule