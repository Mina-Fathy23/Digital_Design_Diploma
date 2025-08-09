module ALSU #(
    parameter INPUT_PRIORITY = "A",
    parameter FULL_ADDER     = "ON"
)(
    input clk, rst, cin, serial_in, red_op_A, red_op_B, bypass_A, bypass_B, direction,
    input [2:0] A, B, opcode,
    output reg [15:0] leds,
    output reg [3:0] anode,
    output reg [6:0] cathode
);
    //Output is now internal Register
    reg [5:0] out_DFF;

    wire cin_DFF, serial_in_DFF, red_op_A_DFF, red_op_B_DFF;
    wire bypass_A_DFF, bypass_B_DFF, direction_DFF;
    wire [2:0] A_DFF, B_DFF, opcode_DFF;
    reg [5:0] out;

    //7-Segmnet Internal signals
    reg [3:0] LED_BCD;
    reg [19:0] refresh_counter; // 20-bit for creating 10.5ms refresh period or 380Hz refresh rate
             // the first 2 MSB bits for creating 4 LED-activating signals with 2.6ms digit period
    wire [1:0] LED_activating_counter; 
                 // count     0    ->  1  ->  2  ->  3
              // activates    LED1    LED2   LED3   LED4
             // and repeat

    //IP output signals
    wire [5 : 0] mul_out;
    wire [3 : 0] adder_out;


    D_FF #(.WIDTH(1)) dff_cin       (.D(cin),        .rst(rst), .CLK(clk), .Q(cin_DFF));
    D_FF #(.WIDTH(1)) dff_serial    (.D(serial_in),  .rst(rst), .CLK(clk), .Q(serial_in_DFF));
    D_FF #(.WIDTH(1)) dff_redA      (.D(red_op_A),   .rst(rst), .CLK(clk), .Q(red_op_A_DFF));
    D_FF #(.WIDTH(1)) dff_redB      (.D(red_op_B),   .rst(rst), .CLK(clk), .Q(red_op_B_DFF));
    D_FF #(.WIDTH(1)) dff_bypassA   (.D(bypass_A),   .rst(rst), .CLK(clk), .Q(bypass_A_DFF));
    D_FF #(.WIDTH(1)) dff_bypassB   (.D(bypass_B),   .rst(rst), .CLK(clk), .Q(bypass_B_DFF));
    D_FF #(.WIDTH(1)) dff_dir       (.D(direction),  .rst(rst), .CLK(clk), .Q(direction_DFF));
    D_FF #(.WIDTH(3)) dff_A         (.D(A),          .rst(rst), .CLK(clk), .Q(A_DFF));
    D_FF #(.WIDTH(3)) dff_B         (.D(B),          .rst(rst), .CLK(clk), .Q(B_DFF));
    D_FF #(.WIDTH(3)) dff_op        (.D(opcode),     .rst(rst), .CLK(clk), .Q(opcode_DFF));

    //IP instances
    mult_gen_0 mul (
    .A(A_DFF),  // input wire [2 : 0] A
    .B(B_DFF),  // input wire [2 : 0] B
    .P(mul_out)  // output wire [5 : 0] P
    );

    generate
        if(FULL_ADDER == "ON") begin
            c_addsub_1 full_adder (
            .A(A_DFF),        // input wire [2 : 0] A
            .B(B_DFF),        // input wire [2 : 0] B
            .C_IN(cin_DFF),  // input wire C_IN
            .S(adder_out)        // output wire [3 : 0] S
            );
        end
        else begin
            c_addsub_0 adder (
            .A(A_DFF),  // input wire [2 : 0] A
            .B(B_DFF),  // input wire [2 : 0] B
            .S(adder_out)  // output wire [3 : 0] S
            );
        end
    endgenerate

    assign invalid_red_op = (red_op_A_DFF || red_op_B_DFF) && !(opcode_DFF == 3'b000 || opcode_DFF == 3'b001);
    assign invalid_opcode = opcode_DFF == 3'b110 || opcode_DFF == 3'b111;
    assign invalid = invalid_red_op | invalid_opcode;

    //ALSU logic Always block
    always @(*) begin
        out = 0;

        if (rst)
            out = 0;
        else if (bypass_A_DFF && bypass_B_DFF) begin
            if (INPUT_PRIORITY == "A")
                out = A_DFF;
            else
                out = B_DFF;
        end else if (bypass_A_DFF)
            out = A_DFF;
        else if (bypass_B_DFF)
            out = B_DFF;
        else begin
            case (opcode_DFF)
                3'b000: begin
                    if (red_op_A_DFF && red_op_B_DFF)
                        out = (INPUT_PRIORITY == "A") ? &A_DFF : &B_DFF;
                    else if (red_op_A_DFF)
                        out = &A_DFF;
                    else if (red_op_B_DFF)
                        out = &B_DFF;
                    else
                        out = A_DFF & B_DFF;
                end

                3'b001: begin
                    if (red_op_A_DFF && red_op_B_DFF)
                        out = (INPUT_PRIORITY == "A") ? ^A_DFF : ^B_DFF;
                    else if (red_op_A_DFF)
                        out = ^A_DFF;
                    else if (red_op_B_DFF)
                        out = ^B_DFF;
                    else
                        out = A_DFF ^ B_DFF;
                end

                3'b010: begin
                    out = adder_out;
                end

                3'b011:
                    out = mul_out;

                3'b100: begin  // Logical shift
                    if (direction_DFF)
                        out = {out_DFF[4:0], serial_in_DFF};  // Left
                    else
                        out = {serial_in_DFF, out_DFF[5:1]};  // Right
                end

                3'b101: begin  // Rotate
                    if (direction_DFF)
                        out = {out_DFF[4:0], out_DFF[5]};  // Left
                    else
                        out = {out_DFF[0], out_DFF[5:1]};  // Right
                end

                default:
                    out = 0;
            endcase
        end
    end
    //LEDs output always block
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out_DFF <= 0;
            leds <= 0;
        end else if (opcode_DFF == 3'b110 || opcode_DFF == 3'b111) begin
            out_DFF <= 0;
            leds <= 16'hFFFF;
        end else if ((red_op_A_DFF || red_op_B_DFF) && !(opcode_DFF == 3'b000 || opcode_DFF == 3'b001)) begin
            out_DFF <= 0;
            leds <= 16'hFFFF;
        end else begin
            out_DFF <= out;
            leds <= 0;
        end
    end

//===================================================================================================================
//=============================================Bonus Section======================================================
//===================================================================================================================

    //7_segment refersh logic
    always @(posedge clk or posedge rst)
    begin 
        if(rst==1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end 
    assign LED_activating_counter = refresh_counter[19:18];

    //Each 7_segment output logic before decoding
    always @(*)
    begin
        case(LED_activating_counter)
        2'b00: begin
            anode = 4'b0111; 
            // activate LED1 and Deactivate LED2, LED3, LED4
            LED_BCD = (invalid) ? 4'b0100 : out_DFF[3:0];
            // the first digit of the 6-bit output
              end
        2'b01: begin
            anode = 4'b1011; 
            // activate LED2 and Deactivate LED1, LED3, LED4
            LED_BCD = (invalid) ? 4'b0000 : out_DFF[5:4];
            // the second digit of the 6-bit output
              end
        2'b10: begin
            anode = 4'b1101; 
            // activate LED3 and Deactivate LED2, LED1, LED4
            LED_BCD = (invalid) ? 4'b0100 : 4'b1111; //note: Internal encoding 1111 -> dash
            // the third digit of the 16-bit number
                end
        2'b11: begin
            anode = 4'b1110; 
            // activate LED4 and Deactivate LED2, LED3, LED1
            LED_BCD = (invalid) ? 4'b1110 : 4'b1111;
            // the fourth digit of the 16-bit number    
               end
        endcase
    end

    // Cathode patterns of the 7-segment LED display 
    always @(*)
    begin
        case(LED_BCD)
        4'b0000: cathode = 7'b0000001; // "0"     
        4'b0001: cathode = 7'b1001111; // "1" 
        4'b0010: cathode = 7'b0010010; // "2" 
        4'b0011: cathode = 7'b0000110; // "3" 
        4'b0100: cathode = 7'b1001100; // "4" 
        4'b0101: cathode = 7'b0100100; // "5" 
        4'b0110: cathode = 7'b0100000; // "6" 
        4'b0111: cathode = 7'b0001111; // "7" 
        4'b1000: cathode = 7'b0000000; // "8"     
        4'b1001: cathode = 7'b0000100; // "9" 
        4'b1110: cathode = 7'b0110000; // "E"
        4'b1111: cathode = 7'b1111110; // "-"
        default: cathode = 7'b0000001; // "0"
        endcase
    end

endmodule
