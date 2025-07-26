module N_bit_up_Counter(clk, reset, cnt);

parameter WIDTH = 3;
input clk, reset;
output reg [WIDTH-1: 0] cnt;

always @(posedge clk, posedge reset) begin

    if (reset)
        cnt <= 0;
    else
        cnt <= cnt + 1;
end

endmodule