// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "data_memory,Vivado 2024.1" *)
module riscv_data_memory_0_0(clk, arst, signext, load, store, size, addr, din, dout);
  input clk /* synthesis syn_isclock = 1 */;
  input arst;
  input signext;
  input load;
  input store;
  input [1:0]size;
  input [31:0]addr;
  input [31:0]din;
  output [31:0]dout;
endmodule
