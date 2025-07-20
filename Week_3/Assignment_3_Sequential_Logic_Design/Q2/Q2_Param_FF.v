module Param_FF(d, rstn, clk, q_r, qbar_r);

parameter FF_TYPE = "DFF";
input d, rstn, clk;
output reg q_r, qbar_r;

always @(posedge clk, negedge rstn) begin

    if(~rstn)begin
        q_r <= 1'b0;
        qbar_r <= 1'b1;
    end
    else if(FF_TYPE == "TFF") begin
        if(d)begin
        q_r <= qbar_r;
        qbar_r <= q_r;
        end
    end
    else begin
        q_r <= d;
        qbar_r <= ~(d);
    end
    
end

endmodule