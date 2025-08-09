module ram (clk, rst_n, din, rx_valid, dout, tx_valid);
    parameter MEM_DEPTH = 256;
    parameter ADDR_SIZE = 8;
    
    input clk, rst_n, rx_valid;
    input [ADDR_SIZE + 1:0] din;
    output reg tx_valid;
    output reg [ADDR_SIZE - 1:0] dout;

    reg [ADDR_SIZE - 1:0] mem [0:MEM_DEPTH-1];
    reg [ADDR_SIZE-1:0] wr_addr;   
    reg [ADDR_SIZE-1:0] rd_addr;

    always @(posedge clk) begin
        if (!rst_n) begin
            dout <= 8'b0;
            tx_valid <= 1'b0;
            wr_addr <= 8'b0;
            rd_addr <= 8'b0;
        end else if (rx_valid) begin
            case (din[ADDR_SIZE + 1:ADDR_SIZE])
                2'b00 : begin
                    wr_addr <= din[ADDR_SIZE - 1:0];
                    tx_valid <= 1'b0;
                end
                2'b01 : begin
                    mem[wr_addr] <= din[ADDR_SIZE - 1:0];
                    tx_valid <= 1'b0;
                end
                2'b10 : begin
                    rd_addr <= din[ADDR_SIZE - 1:0];
                    tx_valid <= 1'b0;
                end
                2'b11 : begin
                    dout <= mem[rd_addr];
                    tx_valid <= 1'b1;
                end 
                default: tx_valid <= 1'b0;
            endcase
        end else begin
            tx_valid <= 1'b0;
        end    
    end
endmodule