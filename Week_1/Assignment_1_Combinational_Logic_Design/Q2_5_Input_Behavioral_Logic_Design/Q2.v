module Question_2(A, B, C, D, sel, out, outbar);
input [2:0] D;
input A, B, C, sel;
output reg out, outbar;
reg t1, t2;

    always @(*)begin

        t1 = (D[2] | (D[0] & D[1]));
        t2 = ~(A ^ B ^ C);

        if (sel == 1) begin
            out = t2;
        end else begin
            out = t1;
        end
        outbar = ~out;
        
    end

endmodule