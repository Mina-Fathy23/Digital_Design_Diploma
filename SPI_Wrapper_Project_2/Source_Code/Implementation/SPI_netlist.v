// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Mon Aug  4 16:37:10 2025
// Host        : DESKTOP-VFU7CPR running 64-bit major release  (build 9200)
// Command     : write_verilog D:/Mina/Digtal_Design_Diploma/Project_2/SPI_project_2.v
// Design      : slave_ram_top_module
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module dbg_hub_CV
   (clk,
    sl_iport0_o,
    sl_oport0_i);
  input clk;
  output [0:36]sl_iport0_o;
  input [0:16]sl_oport0_i;


endmodule

module u_ila_0_CV
   (clk,
    probe0,
    SL_IPORT_I,
    SL_OPORT_O,
    probe1,
    probe2,
    probe3,
    probe4);
  input clk;
  input [0:0]probe0;
  input [0:36]SL_IPORT_I;
  output [0:16]SL_OPORT_O;
  input [0:0]probe1;
  input [0:0]probe2;
  input [0:0]probe3;
  input [0:0]probe4;


endmodule

module ram
   (DOBDO,
    tx_valid,
    CLK,
    rst_n_IBUF,
    \rx_data_reg[8] ,
    SR,
    Q,
    WEA,
    \rx_data_reg[8]_0 ,
    E,
    rx_valid_reg);
  output [7:0]DOBDO;
  output tx_valid;
  input CLK;
  input rst_n_IBUF;
  input \rx_data_reg[8] ;
  input [0:0]SR;
  input [7:0]Q;
  input [0:0]WEA;
  input \rx_data_reg[8]_0 ;
  input [0:0]E;
  input [0:0]rx_valid_reg;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK;
  wire [7:0]DOBDO;
  wire [0:0]E;
  wire [7:0]Q;
  wire [0:0]SR;
  wire [0:0]WEA;
  wire [7:0]rd_addr;
  wire rst_n_IBUF;
  wire \rx_data_reg[8] ;
  wire \rx_data_reg[8]_0 ;
  wire [0:0]rx_valid_reg;
  wire tx_valid;
  wire [7:0]wr_addr;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    mem_reg
       (.ADDRARDADDR({\<const1> ,\<const1> ,wr_addr,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .ADDRBWRADDR({\<const1> ,\<const1> ,rd_addr,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CLKARDCLK(CLK),
        .CLKBWRCLK(CLK),
        .DIADI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,Q}),
        .DIBDI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const0> ,\<const0> }),
        .DIPBDIP({\<const0> ,\<const0> }),
        .DOBDO(DOBDO),
        .ENARDEN(rst_n_IBUF),
        .ENBWREN(\rx_data_reg[8] ),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(SR),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({WEA,WEA}),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[0] 
       (.C(CLK),
        .CE(rx_valid_reg),
        .D(Q[0]),
        .Q(rd_addr[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[1] 
       (.C(CLK),
        .CE(rx_valid_reg),
        .D(Q[1]),
        .Q(rd_addr[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[2] 
       (.C(CLK),
        .CE(rx_valid_reg),
        .D(Q[2]),
        .Q(rd_addr[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[3] 
       (.C(CLK),
        .CE(rx_valid_reg),
        .D(Q[3]),
        .Q(rd_addr[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[4] 
       (.C(CLK),
        .CE(rx_valid_reg),
        .D(Q[4]),
        .Q(rd_addr[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[5] 
       (.C(CLK),
        .CE(rx_valid_reg),
        .D(Q[5]),
        .Q(rd_addr[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[6] 
       (.C(CLK),
        .CE(rx_valid_reg),
        .D(Q[6]),
        .Q(rd_addr[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg[7] 
       (.C(CLK),
        .CE(rx_valid_reg),
        .D(Q[7]),
        .Q(rd_addr[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    tx_valid_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(\rx_data_reg[8]_0 ),
        .Q(tx_valid),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(Q[0]),
        .Q(wr_addr[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(Q[1]),
        .Q(wr_addr[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(Q[2]),
        .Q(wr_addr[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(Q[3]),
        .Q(wr_addr[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[4] 
       (.C(CLK),
        .CE(E),
        .D(Q[4]),
        .Q(wr_addr[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[5] 
       (.C(CLK),
        .CE(E),
        .D(Q[5]),
        .Q(wr_addr[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[6] 
       (.C(CLK),
        .CE(E),
        .D(Q[6]),
        .Q(wr_addr[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg[7] 
       (.C(CLK),
        .CE(E),
        .D(Q[7]),
        .Q(wr_addr[7]),
        .R(SR));
endmodule

(* STRUCTURAL_NETLIST = "yes" *)
module slave_ram_top_module
   (clk,
    rst_n,
    ss_n,
    mosi,
    miso);
  input clk;
  input rst_n;
  input ss_n;
  input mosi;
  output miso;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [7:0]din;
  wire [7:0]dout;
  wire mem;
  wire miso;
  wire miso_OBUF;
  wire mosi;
  wire mosi_IBUF;
  wire rst_n;
  wire rst_n_IBUF;
  wire [0:36]sl_iport0_o_0;
  wire [0:16]sl_oport0_i_0;
  wire spi_inst_n_1;
  wire spi_inst_n_10;
  wire spi_inst_n_11;
  wire spi_inst_n_13;
  wire spi_inst_n_14;
  wire ss_n;
  wire ss_n_IBUF;
  wire tx_valid;

  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* CORE_GENERATION_INFO = "dbg_hub,labtools_xsdbm_v3_00_a,{C_BSCAN_MODE=false,C_BSCAN_MODE_WITH_CORE=false,C_CLK_INPUT_FREQ_HZ=300000000,C_ENABLE_CLK_DIVIDER=false,C_EN_BSCANID_VEC=false,C_NUM_BSCAN_MASTER_PORTS=0,C_TWO_PRIM_MODE=false,C_USER_SCAN_CHAIN=1,C_USE_EXT_BSCAN=false,C_XSDB_NUM_SLAVES=1,component_name=dbg_hub_CV}" *) 
  (* DEBUG_PORT_clk = "" *) 
  (* IS_DEBUG_CORE *) 
  dbg_hub_CV dbg_hub
       (.clk(clk_IBUF_BUFG),
        .sl_iport0_o(sl_iport0_o_0),
        .sl_oport0_i(sl_oport0_i_0));
  OBUF miso_OBUF_inst
       (.I(miso_OBUF),
        .O(miso));
  IBUF mosi_IBUF_inst
       (.I(mosi),
        .O(mosi_IBUF));
  ram ram_inst
       (.CLK(clk_IBUF_BUFG),
        .DOBDO(dout),
        .E(spi_inst_n_11),
        .Q(din),
        .SR(spi_inst_n_10),
        .WEA(mem),
        .rst_n_IBUF(rst_n_IBUF),
        .\rx_data_reg[8] (spi_inst_n_1),
        .\rx_data_reg[8]_0 (spi_inst_n_14),
        .rx_valid_reg(spi_inst_n_13),
        .tx_valid(tx_valid));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  spi_slave spi_inst
       (.CLK(clk_IBUF_BUFG),
        .D(mosi_IBUF),
        .DOBDO(dout),
        .E(spi_inst_n_11),
        .Q(din),
        .SR(spi_inst_n_10),
        .WEA(mem),
        .mem_reg(spi_inst_n_1),
        .miso_OBUF(miso_OBUF),
        .\rd_addr_reg[7] (spi_inst_n_13),
        .rst_n_IBUF(rst_n_IBUF),
        .ss_n_IBUF(ss_n_IBUF),
        .tx_valid(tx_valid),
        .tx_valid_reg(spi_inst_n_14));
  IBUF ss_n_IBUF_inst
       (.I(ss_n),
        .O(ss_n_IBUF));
  (* CORE_GENERATION_INFO = "u_ila_0,labtools_ila_v6_00_a,{ALL_PROBE_SAME_MU=true,ALL_PROBE_SAME_MU_CNT=1,C_ADV_TRIGGER=false,C_DATA_DEPTH=1024,C_EN_STRG_QUAL=false,C_INPUT_PIPE_STAGES=0,C_NUM_OF_PROBES=5,C_PROBE0_TYPE=0,C_PROBE0_WIDTH=1,C_PROBE1_TYPE=0,C_PROBE1_WIDTH=1,C_PROBE2_TYPE=0,C_PROBE2_WIDTH=1,C_PROBE3_TYPE=0,C_PROBE3_WIDTH=1,C_PROBE4_TYPE=0,C_PROBE4_WIDTH=1,C_TRIGIN_EN=0,C_TRIGOUT_EN=0,component_name=u_ila_0_CV}" *) 
  (* DEBUG_PORT_clk = "n:clk_IBUF_BUFG" *) 
  (* DEBUG_PORT_probe0 = "n:clk_IBUF" *) 
  (* DEBUG_PORT_probe1 = "n:miso_OBUF" *) 
  (* DEBUG_PORT_probe2 = "n:mosi_IBUF" *) 
  (* DEBUG_PORT_probe3 = "n:rst_n_IBUF" *) 
  (* DEBUG_PORT_probe4 = "n:ss_n_IBUF" *) 
  (* IS_DEBUG_CORE *) 
  u_ila_0_CV u_ila_0
       (.SL_IPORT_I(sl_iport0_o_0),
        .SL_OPORT_O(sl_oport0_i_0),
        .clk(clk_IBUF_BUFG),
        .probe0(clk_IBUF),
        .probe1(miso_OBUF),
        .probe2(mosi_IBUF),
        .probe3(rst_n_IBUF),
        .probe4(ss_n_IBUF));
endmodule

module spi_slave
   (miso_OBUF,
    mem_reg,
    Q,
    SR,
    E,
    WEA,
    \rd_addr_reg[7] ,
    tx_valid_reg,
    CLK,
    rst_n_IBUF,
    ss_n_IBUF,
    D,
    DOBDO,
    tx_valid);
  output miso_OBUF;
  output mem_reg;
  output [7:0]Q;
  output [0:0]SR;
  output [0:0]E;
  output [0:0]WEA;
  output [0:0]\rd_addr_reg[7] ;
  output tx_valid_reg;
  input CLK;
  input rst_n_IBUF;
  input ss_n_IBUF;
  input [0:0]D;
  input [7:0]DOBDO;
  input tx_valid;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK;
  wire [0:0]D;
  wire [7:0]DOBDO;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[0]_i_3_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_3_n_0 ;
  wire \FSM_sequential_state[1]_i_4_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire [7:0]Q;
  wire [0:0]SR;
  wire [0:0]WEA;
  wire bit_counter;
  wire \bit_counter[0]_i_1_n_0 ;
  wire \bit_counter[0]_i_2_n_0 ;
  wire \bit_counter[1]_i_1_n_0 ;
  wire \bit_counter[2]_i_1_n_0 ;
  wire \bit_counter[3]_i_1_n_0 ;
  wire \bit_counter[3]_i_3_n_0 ;
  wire \bit_counter[3]_i_4_n_0 ;
  wire \bit_counter[3]_i_5_n_0 ;
  wire \bit_counter[3]_i_6_n_0 ;
  wire \bit_counter_reg_n_0_[0] ;
  wire \bit_counter_reg_n_0_[1] ;
  wire \bit_counter_reg_n_0_[2] ;
  wire \bit_counter_reg_n_0_[3] ;
  wire [9:8]din;
  wire mem_reg;
  wire miso_OBUF;
  wire miso_i_1_n_0;
  wire miso_i_2_n_0;
  wire miso_i_3_n_0;
  wire miso_i_4_n_0;
  wire [8:1]p_1_in;
  wire p_1_in_0;
  wire [7:1]p_1_in__0;
  wire [0:0]\rd_addr_reg[7] ;
  wire rst_n_IBUF;
  wire \rx_data[9]_i_1_n_0 ;
  wire \rx_data[9]_i_2_n_0 ;
  wire \rx_shift_reg[9]_i_1_n_0 ;
  wire \rx_shift_reg_reg_n_0_[8] ;
  wire \rx_shift_reg_reg_n_0_[9] ;
  wire rx_valid;
  wire rx_valid_i_1_n_0;
  wire rx_valid_i_2_n_0;
  wire ss_n_IBUF;
  (* RTL_KEEP = "yes" *) wire [2:0]state;
  wire [6:1]tx_shift_reg;
  wire \tx_shift_reg[7]_i_1_n_0 ;
  wire \tx_shift_reg[7]_i_3_n_0 ;
  wire tx_valid;
  wire tx_valid_reg;

  LUT3 #(
    .INIT(8'hE0)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\FSM_sequential_state[0]_i_2_n_0 ),
        .I1(\FSM_sequential_state[0]_i_3_n_0 ),
        .I2(rst_n_IBUF),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF101313)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(\FSM_sequential_state[1]_i_3_n_0 ),
        .I3(\FSM_sequential_state[1]_i_4_n_0 ),
        .I4(state[0]),
        .I5(ss_n_IBUF),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0800080008080800)) 
    \FSM_sequential_state[0]_i_3 
       (.I0(\bit_counter_reg_n_0_[1] ),
        .I1(state[0]),
        .I2(ss_n_IBUF),
        .I3(state[1]),
        .I4(\rx_shift_reg_reg_n_0_[9] ),
        .I5(\rx_shift_reg_reg_n_0_[8] ),
        .O(\FSM_sequential_state[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h2F22222200000000)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(\FSM_sequential_state[1]_i_3_n_0 ),
        .I2(ss_n_IBUF),
        .I3(state[1]),
        .I4(\FSM_sequential_state[1]_i_4_n_0 ),
        .I5(rst_n_IBUF),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000700000000)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(\rx_shift_reg_reg_n_0_[8] ),
        .I1(\rx_shift_reg_reg_n_0_[9] ),
        .I2(state[1]),
        .I3(state[2]),
        .I4(ss_n_IBUF),
        .I5(state[0]),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(\bit_counter_reg_n_0_[3] ),
        .I1(\bit_counter_reg_n_0_[0] ),
        .I2(\bit_counter_reg_n_0_[2] ),
        .I3(\bit_counter_reg_n_0_[1] ),
        .O(\FSM_sequential_state[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFA7FF)) 
    \FSM_sequential_state[1]_i_4 
       (.I0(state[2]),
        .I1(tx_valid),
        .I2(\bit_counter_reg_n_0_[1] ),
        .I3(\bit_counter_reg_n_0_[3] ),
        .I4(\bit_counter_reg_n_0_[0] ),
        .I5(\bit_counter_reg_n_0_[2] ),
        .O(\FSM_sequential_state[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hBABAAABA00000000)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(\FSM_sequential_state[2]_i_2_n_0 ),
        .I1(ss_n_IBUF),
        .I2(state[2]),
        .I3(\bit_counter_reg_n_0_[3] ),
        .I4(\FSM_sequential_state[2]_i_3_n_0 ),
        .I5(rst_n_IBUF),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000002000)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(state[0]),
        .I1(ss_n_IBUF),
        .I2(\rx_shift_reg_reg_n_0_[9] ),
        .I3(\rx_shift_reg_reg_n_0_[8] ),
        .I4(state[1]),
        .I5(\FSM_sequential_state[1]_i_3_n_0 ),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFD)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(tx_valid),
        .I1(\bit_counter_reg_n_0_[1] ),
        .I2(\bit_counter_reg_n_0_[2] ),
        .I3(\bit_counter_reg_n_0_[0] ),
        .O(\FSM_sequential_state[2]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "READ_DATA:100,READ_ADD:011,WRITE:010,CHK_CMD:001,IDLE:000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(\<const0> ));
  (* FSM_ENCODED_STATES = "READ_DATA:100,READ_ADD:011,WRITE:010,CHK_CMD:001,IDLE:000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(\<const0> ));
  (* FSM_ENCODED_STATES = "READ_DATA:100,READ_ADD:011,WRITE:010,CHK_CMD:001,IDLE:000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]),
        .R(\<const0> ));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT6 #(
    .INIT(64'h000000330000FEEE)) 
    \bit_counter[0]_i_1 
       (.I0(\bit_counter[0]_i_2_n_0 ),
        .I1(state[1]),
        .I2(\bit_counter[3]_i_4_n_0 ),
        .I3(state[0]),
        .I4(\bit_counter_reg_n_0_[0] ),
        .I5(state[2]),
        .O(\bit_counter[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hDF00)) 
    \bit_counter[0]_i_2 
       (.I0(\bit_counter_reg_n_0_[1] ),
        .I1(\bit_counter_reg_n_0_[2] ),
        .I2(\bit_counter_reg_n_0_[3] ),
        .I3(state[0]),
        .O(\bit_counter[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \bit_counter[1]_i_1 
       (.I0(\bit_counter[3]_i_6_n_0 ),
        .I1(\bit_counter_reg_n_0_[1] ),
        .I2(\bit_counter_reg_n_0_[0] ),
        .O(\bit_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \bit_counter[2]_i_1 
       (.I0(\bit_counter[3]_i_6_n_0 ),
        .I1(\bit_counter_reg_n_0_[2] ),
        .I2(\bit_counter_reg_n_0_[1] ),
        .I3(\bit_counter_reg_n_0_[0] ),
        .O(\bit_counter[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAABAAAFFFFFFFF)) 
    \bit_counter[3]_i_1 
       (.I0(ss_n_IBUF),
        .I1(\bit_counter[3]_i_4_n_0 ),
        .I2(\bit_counter[3]_i_5_n_0 ),
        .I3(state[0]),
        .I4(\FSM_sequential_state[1]_i_3_n_0 ),
        .I5(rst_n_IBUF),
        .O(\bit_counter[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h01FF)) 
    \bit_counter[3]_i_2 
       (.I0(\bit_counter_reg_n_0_[3] ),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[2]),
        .O(bit_counter));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \bit_counter[3]_i_3 
       (.I0(\bit_counter[3]_i_6_n_0 ),
        .I1(\bit_counter_reg_n_0_[3] ),
        .I2(\bit_counter_reg_n_0_[2] ),
        .I3(\bit_counter_reg_n_0_[1] ),
        .I4(\bit_counter_reg_n_0_[0] ),
        .O(\bit_counter[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \bit_counter[3]_i_4 
       (.I0(\rx_shift_reg_reg_n_0_[8] ),
        .I1(\rx_shift_reg_reg_n_0_[9] ),
        .O(\bit_counter[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \bit_counter[3]_i_5 
       (.I0(state[1]),
        .I1(state[2]),
        .O(\bit_counter[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h33333C2C33333020)) 
    \bit_counter[3]_i_6 
       (.I0(\bit_counter[3]_i_4_n_0 ),
        .I1(state[2]),
        .I2(state[0]),
        .I3(\FSM_sequential_state[1]_i_3_n_0 ),
        .I4(state[1]),
        .I5(\tx_shift_reg[7]_i_3_n_0 ),
        .O(\bit_counter[3]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_counter_reg[0] 
       (.C(CLK),
        .CE(bit_counter),
        .D(\bit_counter[0]_i_1_n_0 ),
        .Q(\bit_counter_reg_n_0_[0] ),
        .R(\bit_counter[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_counter_reg[1] 
       (.C(CLK),
        .CE(bit_counter),
        .D(\bit_counter[1]_i_1_n_0 ),
        .Q(\bit_counter_reg_n_0_[1] ),
        .R(\bit_counter[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_counter_reg[2] 
       (.C(CLK),
        .CE(bit_counter),
        .D(\bit_counter[2]_i_1_n_0 ),
        .Q(\bit_counter_reg_n_0_[2] ),
        .R(\bit_counter[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_counter_reg[3] 
       (.C(CLK),
        .CE(bit_counter),
        .D(\bit_counter[3]_i_3_n_0 ),
        .Q(\bit_counter_reg_n_0_[3] ),
        .R(\bit_counter[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h80FF)) 
    mem_reg_i_1
       (.I0(din[8]),
        .I1(din[9]),
        .I2(rx_valid),
        .I3(rst_n_IBUF),
        .O(mem_reg));
  LUT1 #(
    .INIT(2'h1)) 
    mem_reg_i_2
       (.I0(rst_n_IBUF),
        .O(SR));
  LUT3 #(
    .INIT(8'h40)) 
    mem_reg_i_3
       (.I0(din[9]),
        .I1(rx_valid),
        .I2(din[8]),
        .O(WEA));
  LUT2 #(
    .INIT(4'hB)) 
    miso_i_1
       (.I0(ss_n_IBUF),
        .I1(rst_n_IBUF),
        .O(miso_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    miso_i_2
       (.I0(state[1]),
        .I1(state[0]),
        .O(miso_i_2_n_0));
  LUT6 #(
    .INIT(64'h000B000000080000)) 
    miso_i_3
       (.I0(p_1_in_0),
        .I1(\FSM_sequential_state[2]_i_3_n_0 ),
        .I2(\bit_counter_reg_n_0_[3] ),
        .I3(miso_i_4_n_0),
        .I4(state[2]),
        .I5(DOBDO[7]),
        .O(miso_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    miso_i_4
       (.I0(state[0]),
        .I1(state[1]),
        .O(miso_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    miso_reg
       (.C(CLK),
        .CE(miso_i_2_n_0),
        .D(miso_i_3_n_0),
        .Q(miso_OBUF),
        .R(miso_i_1_n_0));
  LUT3 #(
    .INIT(8'h08)) 
    \rd_addr[7]_i_1 
       (.I0(rx_valid),
        .I1(din[9]),
        .I2(din[8]),
        .O(\rd_addr_reg[7] ));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \rx_data[9]_i_1 
       (.I0(\bit_counter_reg_n_0_[2] ),
        .I1(\bit_counter_reg_n_0_[3] ),
        .I2(\rx_data[9]_i_2_n_0 ),
        .I3(miso_i_4_n_0),
        .I4(\bit_counter_reg_n_0_[0] ),
        .I5(\bit_counter_reg_n_0_[1] ),
        .O(\rx_data[9]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \rx_data[9]_i_2 
       (.I0(ss_n_IBUF),
        .I1(state[2]),
        .O(\rx_data[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[0] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(D),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[1] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[2] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[3] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[4] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[5] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[6] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[7] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[8] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(p_1_in[8]),
        .Q(din[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[9] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(\rx_shift_reg_reg_n_0_[8] ),
        .Q(din[9]),
        .R(SR));
  LUT4 #(
    .INIT(16'h1110)) 
    \rx_shift_reg[9]_i_1 
       (.I0(state[2]),
        .I1(ss_n_IBUF),
        .I2(state[1]),
        .I3(state[0]),
        .O(\rx_shift_reg[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shift_reg_reg[0] 
       (.C(CLK),
        .CE(\rx_shift_reg[9]_i_1_n_0 ),
        .D(D),
        .Q(p_1_in[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shift_reg_reg[1] 
       (.C(CLK),
        .CE(\rx_shift_reg[9]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(p_1_in[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shift_reg_reg[2] 
       (.C(CLK),
        .CE(\rx_shift_reg[9]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(p_1_in[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shift_reg_reg[3] 
       (.C(CLK),
        .CE(\rx_shift_reg[9]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(p_1_in[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shift_reg_reg[4] 
       (.C(CLK),
        .CE(\rx_shift_reg[9]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(p_1_in[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shift_reg_reg[5] 
       (.C(CLK),
        .CE(\rx_shift_reg[9]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(p_1_in[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shift_reg_reg[6] 
       (.C(CLK),
        .CE(\rx_shift_reg[9]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(p_1_in[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shift_reg_reg[7] 
       (.C(CLK),
        .CE(\rx_shift_reg[9]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(p_1_in[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shift_reg_reg[8] 
       (.C(CLK),
        .CE(\rx_shift_reg[9]_i_1_n_0 ),
        .D(p_1_in[8]),
        .Q(\rx_shift_reg_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_shift_reg_reg[9] 
       (.C(CLK),
        .CE(\rx_shift_reg[9]_i_1_n_0 ),
        .D(\rx_shift_reg_reg_n_0_[8] ),
        .Q(\rx_shift_reg_reg_n_0_[9] ),
        .R(SR));
  LUT5 #(
    .INIT(32'h0000E200)) 
    rx_valid_i_1
       (.I0(rx_valid_i_2_n_0),
        .I1(state[2]),
        .I2(rx_valid),
        .I3(rst_n_IBUF),
        .I4(ss_n_IBUF),
        .O(rx_valid_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    rx_valid_i_2
       (.I0(\bit_counter_reg_n_0_[2] ),
        .I1(\bit_counter_reg_n_0_[3] ),
        .I2(miso_i_4_n_0),
        .I3(\bit_counter_reg_n_0_[0] ),
        .I4(\bit_counter_reg_n_0_[1] ),
        .I5(state[2]),
        .O(rx_valid_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_valid_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(rx_valid_i_1_n_0),
        .Q(rx_valid),
        .R(\<const0> ));
  LUT5 #(
    .INIT(32'h00000008)) 
    \tx_shift_reg[1]_i_1 
       (.I0(DOBDO[0]),
        .I1(tx_valid),
        .I2(\bit_counter_reg_n_0_[1] ),
        .I3(\bit_counter_reg_n_0_[2] ),
        .I4(\bit_counter_reg_n_0_[0] ),
        .O(p_1_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_shift_reg[2]_i_1 
       (.I0(tx_shift_reg[1]),
        .I1(\tx_shift_reg[7]_i_3_n_0 ),
        .I2(DOBDO[1]),
        .O(p_1_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_shift_reg[3]_i_1 
       (.I0(tx_shift_reg[2]),
        .I1(\tx_shift_reg[7]_i_3_n_0 ),
        .I2(DOBDO[2]),
        .O(p_1_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_shift_reg[4]_i_1 
       (.I0(tx_shift_reg[3]),
        .I1(\tx_shift_reg[7]_i_3_n_0 ),
        .I2(DOBDO[3]),
        .O(p_1_in__0[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_shift_reg[5]_i_1 
       (.I0(tx_shift_reg[4]),
        .I1(\tx_shift_reg[7]_i_3_n_0 ),
        .I2(DOBDO[4]),
        .O(p_1_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_shift_reg[6]_i_1 
       (.I0(tx_shift_reg[5]),
        .I1(\tx_shift_reg[7]_i_3_n_0 ),
        .I2(DOBDO[5]),
        .O(p_1_in__0[6]));
  LUT5 #(
    .INIT(32'h00010000)) 
    \tx_shift_reg[7]_i_1 
       (.I0(ss_n_IBUF),
        .I1(\bit_counter_reg_n_0_[3] ),
        .I2(state[0]),
        .I3(state[1]),
        .I4(state[2]),
        .O(\tx_shift_reg[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_shift_reg[7]_i_2 
       (.I0(tx_shift_reg[6]),
        .I1(\tx_shift_reg[7]_i_3_n_0 ),
        .I2(DOBDO[6]),
        .O(p_1_in__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \tx_shift_reg[7]_i_3 
       (.I0(\bit_counter_reg_n_0_[0] ),
        .I1(\bit_counter_reg_n_0_[2] ),
        .I2(\bit_counter_reg_n_0_[1] ),
        .I3(tx_valid),
        .I4(\bit_counter_reg_n_0_[3] ),
        .O(\tx_shift_reg[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tx_shift_reg_reg[1] 
       (.C(CLK),
        .CE(\tx_shift_reg[7]_i_1_n_0 ),
        .D(p_1_in__0[1]),
        .Q(tx_shift_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tx_shift_reg_reg[2] 
       (.C(CLK),
        .CE(\tx_shift_reg[7]_i_1_n_0 ),
        .D(p_1_in__0[2]),
        .Q(tx_shift_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tx_shift_reg_reg[3] 
       (.C(CLK),
        .CE(\tx_shift_reg[7]_i_1_n_0 ),
        .D(p_1_in__0[3]),
        .Q(tx_shift_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tx_shift_reg_reg[4] 
       (.C(CLK),
        .CE(\tx_shift_reg[7]_i_1_n_0 ),
        .D(p_1_in__0[4]),
        .Q(tx_shift_reg[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tx_shift_reg_reg[5] 
       (.C(CLK),
        .CE(\tx_shift_reg[7]_i_1_n_0 ),
        .D(p_1_in__0[5]),
        .Q(tx_shift_reg[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tx_shift_reg_reg[6] 
       (.C(CLK),
        .CE(\tx_shift_reg[7]_i_1_n_0 ),
        .D(p_1_in__0[6]),
        .Q(tx_shift_reg[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \tx_shift_reg_reg[7] 
       (.C(CLK),
        .CE(\tx_shift_reg[7]_i_1_n_0 ),
        .D(p_1_in__0[7]),
        .Q(p_1_in_0),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    tx_valid_i_1
       (.I0(din[8]),
        .I1(rst_n_IBUF),
        .I2(rx_valid),
        .I3(din[9]),
        .O(tx_valid_reg));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \wr_addr[7]_i_1 
       (.I0(din[9]),
        .I1(rx_valid),
        .I2(din[8]),
        .O(E));
endmodule
