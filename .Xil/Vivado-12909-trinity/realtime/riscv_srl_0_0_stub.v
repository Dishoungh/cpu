// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "srl,Vivado 2024.1" *)
module riscv_srl_0_0(a, b, y);
  input [31:0]a;
  input [4:0]b;
  output [31:0]y;
endmodule
