module param_adder #(
    parameter WIDTH = 4,
    parameter PIPELINE_ENABLE = 1,
    parameter USE_FULL_ADDER = 1
) (
    input [WIDTH-1:0]       a,
    input [WIDTH-1:0]       b,
    input                   cin, 
    input                   clk, 
    input                   rst,
    output reg [WIDTH-1:0]  sum,
    output reg              cout 
);
    // Internal wires for combinational result
    wire [WIDTH-1:0] sum_comb;
    wire             cout_comb;
    generate
        //Full/Half Adder logic
        if(USE_FULL_ADDER == 1)
            assign {cout_comb, sum_comb} = a + b + cin;
        else
            assign {cout_comb, sum_comb} = a + b;
        //Pipeline Logic
        if(PIPELINE_ENABLE == 1)begin
            always @(posedge clk) begin

                if(rst)begin
                    
                    sum <= 0;
                    cout <= 0;
                end
                else begin

                    sum <= sum_comb;
                    cout<= cout_comb;
                end
            end
        end
        else begin
            always @(*) begin
                sum = sum_comb;
                cout = cout_comb;
            end
        end
    endgenerate
endmodule