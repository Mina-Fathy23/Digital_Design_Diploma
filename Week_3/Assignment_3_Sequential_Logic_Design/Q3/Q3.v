module MOD10_Counter(Clk, Rst, Clk_div10_out);

input  Clk, Rst;
output reg Clk_div10_out;
reg [3:0] count_up;

always @(posedge Clk, posedge Rst) begin

    if(Rst) begin
        Clk_div10_out <= 1'b0;
        count_up <= 4'b0000;
    end
    else begin

        if(count_up == 4'd9) begin
            count_up <= 4'b0000;
            Clk_div10_out <= ~Clk_div10_out;
        end
        else begin
            count_up <= count_up + 1'b1;            
        end
    end
end
endmodule