module SLE_tb();

reg D_tb, Clk_tb, En_tb, ALn_tb, ADn_tb, SLn_tb, SD_tb, LAT_tb, Q_expected;
wire Q_DUT;

SLE DUT(D_tb, Clk_tb, En_tb, ALn_tb, ADn_tb, SLn_tb, SD_tb, LAT_tb, Q_DUT);

initial begin
    Clk_tb = 0;
    forever
        #1 Clk_tb = ~Clk_tb;
end

initial begin
    ALn_tb = 0;
    ADn_tb = $random;
    Q_expected = ~(ADn_tb);
    @(negedge Clk_tb)
    if(Q_DUT != Q_expected)begin
        $display("Error in ALn Signal Expected ADn_tb: %d Out: %d |  DUT Out: %d", ADn_tb, Q_expected, Q_DUT);
        $stop;
    end
    //LAT = 0 testing
    ALn_tb = 1;
    LAT_tb = 0;
    repeat(100)begin

        D_tb = $random;
        En_tb = $random;
        SLn_tb = $random;
        SD_tb = $random;

        if(En_tb)begin            
            if(~SLn_tb)
                Q_expected = SD_tb;
            else
                Q_expected = D_tb;
        end

        @(negedge Clk_tb);
        if(Q_DUT != Q_expected)begin
        $display("Error in  LAT = 0 Functionality! Expected Out: %d |  DUT Out: %d", Q_expected, Q_DUT);
        $stop;
        end
    end
    //LAT = 1 TEST
    LAT_tb = 1;
    repeat(100)begin

        D_tb = $random;
        En_tb = $random;
        SLn_tb = $random;
        SD_tb = $random;

        if(En_tb)begin            
            if(~SLn_tb)
                Q_expected = SD_tb;
            else
                Q_expected = D_tb;
        end

        @(negedge Clk_tb);
        if(Q_DUT != Q_expected)begin
        $display("Error in  LAT = 1 Functionality! Expected Out: %d |  DUT Out: %d", Q_expected, Q_DUT);
        $stop;
        end
    end
    $display("SUCCESS!! All test Passed!");
    $stop;
end
endmodule