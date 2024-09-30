// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "cla32,Vivado 2024.1" *)
module riscv_cla32_0_2(a, b, cin, cout, sum);
  input [31:0]a;
  input [31:0]b;
  input cin;
  output cout;
  output [31:0]sum;
endmodule
