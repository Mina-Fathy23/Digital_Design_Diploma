module Gray_Code_Counter(clk, rst, gray_out);

input clk, rst;
output [1:0] gray_out;
reg [1:0] bin_counter;

assign gray_out = {bin_counter[1], ^(bin_counter)};

always @(posedge clk, posedge rst) begin

    if(rst)begin
        bin_counter <= 2'b00;
    end
    else begin

        bin_counter <= bin_counter + 1;
    end
end
endmodule