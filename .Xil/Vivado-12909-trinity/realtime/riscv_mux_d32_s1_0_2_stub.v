// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "mux_d32_s1,Vivado 2024.1" *)
module riscv_mux_d32_s1_0_2(in0, in1, sel, out);
  input [31:0]in0;
  input [31:0]in1;
  input sel;
  output [31:0]out;
endmodule
