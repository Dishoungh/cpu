// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Sun Sep 29 19:48:36 2024
// Host        : trinity running 64-bit Gentoo Linux
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ riscv_util_vector_logic_1_1_sim_netlist.v
// Design      : riscv_util_vector_logic_1_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "riscv_util_vector_logic_1_1,util_vector_logic_v2_0_4_util_vector_logic,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "util_vector_logic_v2_0_4_util_vector_logic,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (Op1,
    Op2,
    Res);
  input [31:0]Op1;
  input [31:0]Op2;
  output [31:0]Res;

  wire [31:0]Op1;
  wire [31:0]Op2;
  wire [31:0]Res;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_vector_logic_v2_0_4_util_vector_logic inst
       (.Op1(Op1),
        .Op2(Op2),
        .Res(Res));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_vector_logic_v2_0_4_util_vector_logic
   (Res,
    Op2,
    Op1);
  output [31:0]Res;
  input [31:0]Op2;
  input [31:0]Op1;

  wire [31:0]Op1;
  wire [31:0]Op2;
  wire [31:0]Res;

  LUT2 #(
    .INIT(4'h6)) 
    \Res[0]_INST_0 
       (.I0(Op2[0]),
        .I1(Op1[0]),
        .O(Res[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[10]_INST_0 
       (.I0(Op2[10]),
        .I1(Op1[10]),
        .O(Res[10]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[11]_INST_0 
       (.I0(Op2[11]),
        .I1(Op1[11]),
        .O(Res[11]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[12]_INST_0 
       (.I0(Op2[12]),
        .I1(Op1[12]),
        .O(Res[12]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[13]_INST_0 
       (.I0(Op2[13]),
        .I1(Op1[13]),
        .O(Res[13]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[14]_INST_0 
       (.I0(Op2[14]),
        .I1(Op1[14]),
        .O(Res[14]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[15]_INST_0 
       (.I0(Op2[15]),
        .I1(Op1[15]),
        .O(Res[15]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[16]_INST_0 
       (.I0(Op2[16]),
        .I1(Op1[16]),
        .O(Res[16]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[17]_INST_0 
       (.I0(Op2[17]),
        .I1(Op1[17]),
        .O(Res[17]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[18]_INST_0 
       (.I0(Op2[18]),
        .I1(Op1[18]),
        .O(Res[18]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[19]_INST_0 
       (.I0(Op2[19]),
        .I1(Op1[19]),
        .O(Res[19]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[1]_INST_0 
       (.I0(Op2[1]),
        .I1(Op1[1]),
        .O(Res[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[20]_INST_0 
       (.I0(Op2[20]),
        .I1(Op1[20]),
        .O(Res[20]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[21]_INST_0 
       (.I0(Op2[21]),
        .I1(Op1[21]),
        .O(Res[21]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[22]_INST_0 
       (.I0(Op2[22]),
        .I1(Op1[22]),
        .O(Res[22]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[23]_INST_0 
       (.I0(Op2[23]),
        .I1(Op1[23]),
        .O(Res[23]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[24]_INST_0 
       (.I0(Op2[24]),
        .I1(Op1[24]),
        .O(Res[24]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[25]_INST_0 
       (.I0(Op2[25]),
        .I1(Op1[25]),
        .O(Res[25]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[26]_INST_0 
       (.I0(Op2[26]),
        .I1(Op1[26]),
        .O(Res[26]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[27]_INST_0 
       (.I0(Op2[27]),
        .I1(Op1[27]),
        .O(Res[27]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[28]_INST_0 
       (.I0(Op2[28]),
        .I1(Op1[28]),
        .O(Res[28]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[29]_INST_0 
       (.I0(Op2[29]),
        .I1(Op1[29]),
        .O(Res[29]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[2]_INST_0 
       (.I0(Op2[2]),
        .I1(Op1[2]),
        .O(Res[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[30]_INST_0 
       (.I0(Op2[30]),
        .I1(Op1[30]),
        .O(Res[30]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[31]_INST_0 
       (.I0(Op2[31]),
        .I1(Op1[31]),
        .O(Res[31]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[3]_INST_0 
       (.I0(Op2[3]),
        .I1(Op1[3]),
        .O(Res[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[4]_INST_0 
       (.I0(Op2[4]),
        .I1(Op1[4]),
        .O(Res[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[5]_INST_0 
       (.I0(Op2[5]),
        .I1(Op1[5]),
        .O(Res[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[6]_INST_0 
       (.I0(Op2[6]),
        .I1(Op1[6]),
        .O(Res[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[7]_INST_0 
       (.I0(Op2[7]),
        .I1(Op1[7]),
        .O(Res[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[8]_INST_0 
       (.I0(Op2[8]),
        .I1(Op1[8]),
        .O(Res[8]));
  LUT2 #(
    .INIT(4'h6)) 
    \Res[9]_INST_0 
       (.I0(Op2[9]),
        .I1(Op1[9]),
        .O(Res[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
