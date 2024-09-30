// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "reg32,Vivado 2024.1" *)
module riscv_x1_10(clk, arst, we, d, q);
  input clk /* synthesis syn_isclock = 1 */;
  input arst;
  input we;
  input [31:0]d;
  output [31:0]q;
endmodule
