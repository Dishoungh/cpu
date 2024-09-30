// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "control_unit,Vivado 2024.1" *)
module riscv_control_unit_0_0(instr, ALU_Op, Negate, RegWrite, B_Src, MemSigned, 
  MemWrite, MemRead, MemSize, BEQ, BNE, BLT, BGE, BLTU, BGEU, LUI, AUIPC, JAL, JALR, Valid, Immediate);
  input [31:0]instr;
  output [2:0]ALU_Op;
  output Negate;
  output RegWrite;
  output B_Src;
  output MemSigned;
  output MemWrite;
  output MemRead;
  output [1:0]MemSize;
  output BEQ;
  output BNE;
  output BLT;
  output BGE;
  output BLTU;
  output BGEU;
  output LUI;
  output AUIPC;
  output JAL;
  output JALR;
  output Valid;
  output [31:0]Immediate;
endmodule
