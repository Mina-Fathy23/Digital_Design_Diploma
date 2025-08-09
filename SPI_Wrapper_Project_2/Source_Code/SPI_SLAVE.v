module spi_slave (clk, rst_n, mosi, ss_n, tx_data, tx_valid, miso, rx_data, rx_valid);
    parameter [2:0] IDLE = 3'b000;        //fsm states
    parameter [2:0] CHK_CMD = 3'b001;
    parameter [2:0] WRITE = 3'b011;
    parameter [2:0] READ_ADD = 3'b010;
    parameter [2:0] READ_DATA = 3'b110;
    

    input clk, rst_n, mosi, ss_n, tx_valid;     // i/o ports
    input [7:0] tx_data;
    output reg miso;
    output reg rx_valid;
    output reg [9:0] rx_data;

    reg [3:0] bit_counter;
    reg [7:0] tx_shift_reg;   //shift reg for parallel to serial
    reg [9:0] rx_shift_reg;   //shift reg for serial to parallel
    reg read_address_received;

    //(* fsm_encoding = "one_hot" *)
    //(* fsm_encoding = "gray" *)
    reg [2:0] state, next_state; //internals 


    always @(posedge clk) begin     //state memory logic
        if (!rst_n) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end


    always @(*) begin       //next state logic
        next_state = state;
        case (state)
            IDLE : begin
                if (!ss_n) begin
                    next_state = CHK_CMD;
                end
            end

            CHK_CMD : begin
                if (ss_n) begin
                    next_state = IDLE;
                end else if (bit_counter == 10) begin
                    case (rx_shift_reg[9:8])
                        2'b00 : next_state = WRITE; 
                        2'b01 : next_state = WRITE; 
                        2'b10 : next_state = READ_ADD; 
                        2'b11 : next_state = READ_DATA;  
                    endcase
                end
            end

            WRITE : begin
                if (ss_n) begin
                    next_state = IDLE;
                end else if (bit_counter == 10) begin
                    next_state = CHK_CMD;
                end
            end

            READ_ADD : begin
                if (ss_n) begin
                    next_state = IDLE;
                end else if (bit_counter == 10) begin
                    next_state = CHK_CMD;
                end
            end

            READ_DATA : begin
                if (ss_n || (bit_counter == 8 && tx_valid)) begin
                    next_state = IDLE;
                end
            end 
            default : next_state = IDLE;
        endcase
    end


    always @(posedge clk) begin     //output logic
        if (!rst_n) begin
            bit_counter <= 4'b0;
            rx_shift_reg <= 10'b0;
            tx_shift_reg <= 8'b0;
            rx_data <= 10'b0;
            rx_valid <= 1'b0;
            miso <= 1'b0;
        end else begin
            if (ss_n) begin
                bit_counter <= 4'b0;
                rx_valid <= 1'b0;
                miso <= 1'b0;
            end else begin
                case (state)
                    IDLE : begin
                        bit_counter <= 4'b0;
                        rx_valid <= 1'b0;
                        miso <= 1'b0;
                    end
                    CHK_CMD : begin
                        rx_shift_reg <= {rx_shift_reg[8:0], mosi};
                        bit_counter <= bit_counter + 1;
                        if (bit_counter == 9) begin
                            rx_data <= {rx_shift_reg[8:0], mosi};
                            rx_valid <= 1'b1;
                        end else begin
                            rx_valid <= 1'b0;
                        end
                        if (bit_counter == 10 && rx_shift_reg[9:8] == 2'b11) begin
                            bit_counter <= 4'b0;
                        end
                    end
                    WRITE : begin
                        rx_shift_reg <= {rx_shift_reg[8:0], mosi};
                        bit_counter <= bit_counter + 1;
                        if (bit_counter == 9) begin
                            rx_data <= {rx_shift_reg[8:0], mosi};
                            rx_valid <= 1'b1;
                        end else begin
                            rx_valid <= 1'b0;
                        end
                    end
                    READ_ADD : begin
                        rx_shift_reg <= {rx_shift_reg[8:0], mosi};
                        bit_counter <= bit_counter + 1;
                        if (bit_counter == 9) begin
                            rx_data <= {rx_shift_reg[8:0], mosi};
                            rx_valid <= 1'b1;
                        end else begin
                            rx_valid <= 1'b0;
                        end
                    end
                    READ_DATA : begin
                        if (bit_counter == 4'b0 && tx_valid) begin
                            miso <= tx_data[7];
                            tx_shift_reg <= {tx_data[6:0], 1'b0};
                            bit_counter <= bit_counter + 1; 
                        end else if (bit_counter < 8) begin
                            miso <= tx_shift_reg[7];
                            tx_shift_reg <= {tx_shift_reg[6:0], 1'b0};
                            bit_counter <= bit_counter + 1;
                        end else begin
                            miso <= 1'b0;
                        end
                    end  
                endcase
                if (state == CHK_CMD && bit_counter == 10 && next_state == READ_DATA) begin
                    bit_counter <= 4'b0;
                end
            end
        end
    end

endmodule