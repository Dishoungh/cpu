//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Sat Feb  1 13:47:07 2025
//Host        : trinity running 64-bit Gentoo Linux
//Command     : generate_target cpu_bd.bd
//Design      : cpu_bd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "cpu_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=cpu_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "cpu_bd.hwdef" *) 
module cpu_bd
   (addr,
    clk,
    din,
    dout,
    en,
    rst,
    rst_busy,
    we);
  input [11:0]addr;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN cpu_bd_clka_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;
  input [31:0]din;
  output [31:0]dout;
  input en;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;
  output rst_busy;
  input [3:0]we;

  wire [11:0]addr;
  wire clk;
  wire [31:0]din;
  wire [31:0]dout;
  wire en;
  wire rst;
  wire rst_busy;
  wire [3:0]we;

  cpu_bd_blk_mem_gen_0_1 data_memory
       (.addra(addr),
        .clka(clk),
        .dina(din),
        .douta(dout),
        .ena(en),
        .rsta(rst),
        .rsta_busy(rst_busy),
        .wea(we));
endmodule
