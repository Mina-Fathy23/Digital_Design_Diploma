module D_FF_2(d, rstn, clk, q_r, qbar_r);

input d, rstn, clk;
output reg q_r, qbar_r;

always @(posedge clk, negedge rstn) begin

    if(~rstn)begin
        q_r <= 1'b0;
        qbar_r <= 1'b1;
    end
    else begin
        q_r <= d;
        qbar_r <= ~(d);
    end
    
    
end

endmodule