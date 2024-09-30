// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "mux_d32_s3,Vivado 2024.1" *)
module riscv_mux_d32_s3_0_0(in0, in1, in2, in3, in4, in5, in6, in7, sel, out);
  input [31:0]in0;
  input [31:0]in1;
  input [31:0]in2;
  input [31:0]in3;
  input [31:0]in4;
  input [31:0]in5;
  input [31:0]in6;
  input [31:0]in7;
  input [2:0]sel;
  output [31:0]out;
endmodule
