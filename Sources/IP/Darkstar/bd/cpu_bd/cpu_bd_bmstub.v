// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module cpu_bd (
  din,
  clk,
  addr,
  we,
  rst,
  en,
  dout,
  rst_busy
);

  (* X_INTERFACE_IGNORE = "true" *)
  input [31:0]din;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN cpu_bd_clka_0, ASSOCIATED_RESET rst, INSERT_VIP 0" *)
  input clk;
  (* X_INTERFACE_IGNORE = "true" *)
  input [11:0]addr;
  (* X_INTERFACE_IGNORE = "true" *)
  input [3:0]we;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *)
  (* X_INTERFACE_MODE = "slave RST.RST" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
  input rst;
  (* X_INTERFACE_IGNORE = "true" *)
  input en;
  (* X_INTERFACE_IGNORE = "true" *)
  output [31:0]dout;
  (* X_INTERFACE_IGNORE = "true" *)
  output rst_busy;

  // stub module has no contents

endmodule
