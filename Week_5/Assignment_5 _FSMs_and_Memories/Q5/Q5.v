module FIFO #(
    parameter FIFO_WIDTH = 16,
    parameter FIFO_DEPTH = 512,
    localparam COUNTER_SIZE = $clog2(FIFO_DEPTH)
) (
    input [FIFO_WIDTH-1:0] din_a,
    input wen_a,
    input ren_b,
    input clk_a,
    input clk_b,
    input rst,
    output reg [FIFO_WIDTH-1:0] dout_b,
    output full,
    output empty
);
//2 interal Counters
reg [COUNTER_SIZE-1:0] wr_ptr, rd_ptr;
reg [FIFO_WIDTH-1:0] fifo[FIFO_DEPTH-1:0];
//internal flags
reg wr_loop, rd_loop;

//Write Always block Logic
always @(posedge clk_a) begin
    if(rst)begin
        wr_ptr <= 0;
        wr_loop <= 0;
    end
    else if((~full) && (wen_a))begin
        fifo[wr_ptr] <= din_a;
        wr_ptr <= wr_ptr + 1;

        if(wr_ptr == 0) //wr_ptr overflew and became zero AKA completed a full loop
            wr_loop <= wr_loop + 1;
    end
end
//Read Always block Logic
always @(posedge clk_b) begin
    if(rst)begin
        rd_ptr <= 0;
        rd_loop <= 0;
        dout_b <= 0;
    end
    else if((~empty) && (ren_b))begin
        dout_b <= fifo[rd_ptr];
        rd_ptr <= rd_ptr + 1;
        if(rd_ptr == 0) //rd_ptr overflew and became zero AKA completed a full loop
            rd_loop <= rd_loop + 1;
    end
    
end

//Full & Empty flag logic
assign empty = ((wr_loop == rd_loop) && (wr_ptr == rd_ptr))? 1'b1: 1'b0;
assign full  = ((wr_loop > rd_loop) && (wr_ptr == rd_ptr))? 1'b1: 1'b0;
endmodule