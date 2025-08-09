module SPI_tb();

//Input/Output Declarations
reg  MOSI;          
wire MISO;

//Verification Buffer
reg [10:0] MOSI_buffer;     //MOSI[10] first command bit, MOSI[9:0] data bits
reg [7:0]  Address;         //Address to write/read from
reg [7:0]  MISO_data;        //Data read from MISO

//Conrol Signals
reg SS_n;
reg CLK;
reg rst_n;

// Instantiate the SPI module
slave_ram_top_module dut(
    .clk(CLK),
    .rst_n(rst_n),
    .ss_n(SS_n),
    .mosi(MOSI),
    .miso(MISO)
);

initial begin
    CLK = 0;
    forever
        #1 CLK = ~CLK;
end

integer i;

initial begin
    
    //1.Reset the SPI module
    MISO_data = 0;
    Address = 0;
    MOSI_buffer = 0;
    rst_n = 0;
    SS_n = 1; 
    $readmemb("mem.dat", dut.ram_inst.mem);
    @(negedge CLK);

    if(MISO != 1'b0) begin
        $display("Reset failed, MISO should be low.");
        $stop;
    end

    rst_n = 1;
    repeat(7)begin

    
        //2.RAM Write command 
       
        Address = $random;
        //2.1 Write address

            //Start communication
            SS_n = 0;

            //Set MOSI to 0 to indicate a write operation
            //Set MOSI to 10 serial bits with first 2 bits are '00' then address to write to
            MOSI_buffer = {3'b0_00,Address}; //Write Command with address random
            for(i = 0; i <= 10; i = i + 1) begin
                MOSI = MOSI_buffer[10 - i]; //Send bits in reverse order
                @(negedge CLK);
            end

            //End communication
            SS_n = 1;
            @(negedge CLK);

        //2.2 Write data

            //Start communication
            SS_n = 0;

            //Set MOSI to 0 to indicate a write operation
            //Set MOSI to 10 serial bits with first 2 bits are '01' then data to be written
            MOSI_buffer = 11'b0_01_10101010; //Write Command with address 0 data 0xAA
            for(i = 0; i <= 10; i = i + 1) begin
                MOSI = MOSI_buffer[10 - i]; //Send bits in reverse orderس
                @(negedge CLK);
            end

            //End communication
            SS_n = 1;
            @(negedge CLK);


        //3. RAM Read command
        //3.1 Read address

            //Start communication
            SS_n = 0;
            //Set MOSI to 1 to indicate a read operation
            //Set MOSI to 10 serial bits with first 2 bits are '10' then address to read from
            MOSI_buffer = {3'b1_10,Address}; //Read Command with address 0
            for(i = 0; i <= 10; i = i + 1) begin
                MOSI = MOSI_buffer[10 - i]; //Send bits in reverse order
                @(negedge CLK);
            end

            //End communication
            SS_n = 1;
            @(negedge CLK);

        //3.2 Read data

            //Start communication
            SS_n = 0;

            //Set MOSI to 1 to indicate a read operation
            //Set MOSI to 10 serial bits with first 2 bits are '11' then dummy data
            MOSI_buffer = 11'b1_11_11111111; //Read Command with dummy data
            for(i = 0; i <= 10; i = i + 1) begin
                MOSI = MOSI_buffer[10 - i]; //Send bits in reverse order
                @(negedge CLK);
            end
            repeat(2)@(negedge CLK);
            //Check MISO for the data read from the RAM in 8 clk cycles
            for(i = 0; i < 8; i = i + 1) begin
                MISO_data[7 - i] = MISO; //Read MISO data
                @(negedge CLK);
            end

            //End communication
            SS_n = 1;
            @(negedge CLK);

            if(MISO_data != 8'hAA) begin
                $display("Test failed: Read data mismatch, expected 0xAA | Dut: %h", MISO_data);
                $stop;
            end else begin
                $display("Test passed: Read data matches expected");
                $stop;
            end
        end

end

endmodule