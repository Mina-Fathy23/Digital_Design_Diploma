module SinglePort_Ram #(
    parameter  MEM_WIDTH = 16,
    parameter  MEM_DEPTH = 1024,
    localparam ADDR_SIZE = $clog2(MEM_DEPTH),
    parameter  ADDR_PIPELINE = "TRUE",
    parameter  DOUT_PIPELINE = "TRUE",
    parameter  PARITY_ENABLE = 1
) (
    input [MEM_WIDTH-1:0] din,
    input [ADDR_SIZE-1:0] addr,
    input wr_en,
    input rd_en,
    input blk_select,
    input addr_en,
    input dout_en,
    input rst,
    input CLK,
    output [MEM_WIDTH-1:0] dout,
    output parity_out
);
reg [MEM_WIDTH-1:0] memory [MEM_DEPTH-1:0];
wire [ADDR_SIZE-1:0] addr_reg;
reg [MEM_WIDTH-1:0] dout_reg;

generate
    //Pipelining
    if(ADDR_PIPELINE == "TRUE") begin
        D_FF #(.WIDTH(ADDR_SIZE)) addr_ff (addr, rst, addr_en, CLK, addr_reg);
    end
    else begin
            assign addr_reg = addr;
    end

    
    if(DOUT_PIPELINE == "TRUE") begin
        D_FF #(.WIDTH(MEM_WIDTH)) dout_ff (dout_reg, rst, dout_en, CLK, dout);
    end
    else begin
        assign dout = dout_reg;
    end 

    if(PARITY_ENABLE)
        assign parity_out = ^(dout);
    else
        assign parity_out = 0;
endgenerate

always @(posedge CLK) begin
   
    if(blk_select)begin
        if(wr_en)
            memory[addr_reg] <= din;
        else if(rd_en)
            dout_reg <= memory[addr_reg];
    end
end
endmodule
