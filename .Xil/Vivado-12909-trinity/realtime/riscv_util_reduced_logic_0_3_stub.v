// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "util_reduced_logic_v2_0_6_util_reduced_logic,Vivado 2024.1" *)
module riscv_util_reduced_logic_0_3(Op1, Res);
  input [5:0]Op1;
  output Res;
endmodule
