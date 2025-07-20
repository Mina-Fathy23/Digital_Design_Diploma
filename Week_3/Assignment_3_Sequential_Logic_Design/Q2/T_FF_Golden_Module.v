module T_FF(t, rstn, clk, q_r, qbar_r);

    input t, rstn, clk;
    output reg q_r, qbar_r;

    always @(posedge clk, negedge rstn) begin
        
        if(~rstn)begin
            q_r <= 1'b0;
            qbar_r <= 1'b1;
        end
        else if(t)begin
            q_r <= qbar_r;
            qbar_r <= q_r;
        end
    end

endmodule