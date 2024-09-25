`timescale 1ns / 1ps

module control_unit
(
    input wire[31:0] instr,
    output reg[2:0] ALU_Op,
    output reg Negate,
    output reg RegWrite,
    output reg B_Src,
    output reg MemSigned,
    output reg MemWrite,
    output reg MemRead,
    output reg[1:0] MemSize,
    output reg BEQ,
    output reg BNE,
    output reg BLT,
    output reg BGE,
    output reg BLTU,
    output reg BGEU,
    output reg LUI,
    output reg AUIPC,
    output reg JAL,
    output reg JALR,
    output reg Valid,
    output reg[31:0] Immediate
);

wire[6:0] opcode;
wire[2:0] funct3;
wire[6:0] funct7;

assign opcode = instr[6:0];
assign funct3 = instr[14:12];
assign funct7 = instr[31:25];

always @(*)
begin
    if (opcode == 7'b0110111)                                                           // LUI (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b1;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{12{instr[31]}}, instr[31:12]};
        end
    else if (opcode == 7'b0010111)                                                      // AUIPC (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b1;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{12{instr[31]}}, instr[31:12]};
        end
    else if (opcode == 7'b1101111)                                                      // JAL (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b1;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= 32'd0;
        end
    else if ((opcode == 7'b1100111) && (funct3 == 3'b000))                              // JALR (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b1;
            Valid       <= 1'b1;
            Immediate   <= 32'd0;
        end
    else if ((opcode == 7'b1100011) && (funct3 == 3'b000))                              // BEQ (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b1;
            RegWrite    <= 1'b0;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b1;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
        end
    else if ((opcode == 7'b1100011) && (funct3 == 3'b001))                              // BNE (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b1;
            RegWrite    <= 1'b0;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b1;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
        end
    else if ((opcode == 7'b1100011) && (funct3 == 3'b100))                              // BLT (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b1;
            RegWrite    <= 1'b0;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b1;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
        end
    else if ((opcode == 7'b1100011) && (funct3 == 3'b101))                              // BGE (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b1;
            RegWrite    <= 1'b0;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b1;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
        end
    else if ((opcode == 7'b1100011) && (funct3 == 3'b110))                              // BLTU (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b1;
            RegWrite    <= 1'b0;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b1;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
        end
    else if ((opcode == 7'b1100011) && (funct3 == 3'b111))                              // BGEU (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b1;
            RegWrite    <= 1'b0;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b1;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
        end
    else if ((opcode == 7'b0000011) && (funct3 == 3'b000))                              // LB (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b1;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b1;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31:20]};
        end
    else if ((opcode == 7'b0000011) && (funct3 == 3'b100))                              // LBU (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b1;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31:20]};
        end
    else if ((opcode == 7'b0000011) && (funct3 == 3'b001))                              // LH (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b1;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b1;
            MemSize     <= 2'b01;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31:20]};
        end
    else if ((opcode == 7'b0000011) && (funct3 == 3'b101))                              // LHU (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b1;
            MemSize     <= 2'b01;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31:20]};
        end
    else if ((opcode == 7'b0000011) && (funct3 == 3'b010))                              // LW (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b1;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b1;
            MemSize     <= 2'b10;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31:20]};
        end
    else if ((opcode == 7'b0100011) && (funct3 == 3'b000))                              // SB (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b0;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b1;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31:25], instr[11:7]};
        end
    else if ((opcode == 7'b0100011) && (funct3 == 3'b001))                              // SH (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b0;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b1;
            MemRead     <= 1'b0;
            MemSize     <= 2'b01;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31:25], instr[11:7]};
        end
    else if ((opcode == 7'b0100011) && (funct3 == 3'b010))                              // SW (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b0;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b1;
            MemRead     <= 1'b0;
            MemSize     <= 2'b10;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31:25], instr[11:7]};
        end
    else if ((opcode == 7'b0110011) && (funct3 == 3'b000) && (funct7 == 7'b0000000))    // ADD (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= 32'd0;
        end
    else if ((opcode == 7'b0010011) && (funct3 == 3'b000))                              // ADDI (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31:20]};
        end
    else if ((opcode == 7'b0110011) && (funct3 == 3'b000) && (funct7 == 7'b0100000))    // SUB (RV32I)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b1;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= 32'd0;
        end
    else if ((opcode == 7'b0110011) && (funct3 == 3'b001) && (funct7 == 7'b0000000))    // SLL (RV32I)
        begin
            ALU_Op      <= 3'b001;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= 32'd0;
        end
    else if ((opcode == 7'b0010011) && (funct3 == 3'b001) && (funct7 == 7'b0000000))    // SLLI (RV32I)
        begin
            ALU_Op      <= 3'b001;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {27'd0, instr[24:20]};
        end
    else if ((opcode == 7'b0110011) && (funct3 == 3'b010) && (funct7 == 7'b0000000))    // SLT (RV32I)
        begin
            ALU_Op      <= 3'b010;
            Negate      <= 1'b1;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= 32'd0;
        end
    else if ((opcode == 7'b0010011) && (funct3 == 3'b010))                              // SLTI (RV32I)
        begin
            ALU_Op      <= 3'b010;
            Negate      <= 1'b1;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31:20]};
        end
    else if ((opcode == 7'b0110011) && (funct3 == 3'b011) && (funct7 == 7'b0000000))    // SLTU (RV32I)
        begin
            ALU_Op      <= 3'b011;
            Negate      <= 1'b1;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= 32'd0;
        end
    else if ((opcode == 7'b0010011) && (funct3 == 3'b011))                              // SLTIU (RV32I)
        begin
            ALU_Op      <= 3'b011;
            Negate      <= 1'b1;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {20'd0, instr[31:20]};
        end
    else if ((opcode == 7'b0110011) && (funct3 == 3'b100) && (funct7 == 7'b0000000))    // XOR (RV32I)
        begin
            ALU_Op      <= 3'b100;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= 32'd0;
        end
    else if ((opcode == 7'b0010011) && (funct3 == 3'b100))                              // XORI (RV32I)
        begin
            ALU_Op      <= 3'b100;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31:20]};
        end
    else if ((opcode == 7'b0110011) && (funct3 == 3'b101) && (funct7 == 7'b0000000))    // SRL (RV32I)
        begin
            ALU_Op      <= 3'b101;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= 32'd0;
        end
    else if ((opcode == 7'b0010011) && (funct3 == 3'b101) && (funct7 == 7'b0000000))    // SRLI (RV32I)
        begin
            ALU_Op      <= 3'b101;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {27'd0, instr[24:20]};
        end
    else if ((opcode == 7'b0110011) && (funct3 == 3'b101) && (funct7 == 7'b0100000))    // SRA (RV32I)
        begin
            ALU_Op      <= 3'b101;
            Negate      <= 1'b1;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= 32'd0;
        end
    else if ((opcode == 7'b0010011) && (funct3 == 3'b101) && (funct7 == 7'b0100000))    // SRAI (RV32I)
        begin
            ALU_Op      <= 3'b101;
            Negate      <= 1'b1;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {27'd0, instr[24:20]};
        end
    else if ((opcode == 7'b0110011) && (funct3 == 3'b110) && (funct7 == 7'b0000000))    // OR (RV32I)
        begin
            ALU_Op      <= 3'b110;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= 32'd0;
        end
    else if ((opcode == 7'b0010011) && (funct3 == 3'b110))                              // ORI (RV32I)
        begin
            ALU_Op      <= 3'b110;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31:20]};
        end
    else if ((opcode == 7'b0110011) && (funct3 == 3'b111) && (funct7 == 7'b0000000))    // AND (RV32I)
        begin
            ALU_Op      <= 3'b111;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= 32'd0;
        end
    else if ((opcode == 7'b0010011) && (funct3 == 3'b111))                              // ANDI (RV32I)
        begin
            ALU_Op      <= 3'b111;
            Negate      <= 1'b0;
            RegWrite    <= 1'b1;
            B_Src       <= 1'b1;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b1;
            Immediate   <= {{20{instr[31]}}, instr[31:20]};
        end
    else                                                                                // Invalid (Treat as NOP)
        begin
            ALU_Op      <= 3'b000;
            Negate      <= 1'b0;
            RegWrite    <= 1'b0;
            B_Src       <= 1'b0;
            MemSigned   <= 1'b0;
            MemWrite    <= 1'b0;
            MemRead     <= 1'b0;
            MemSize     <= 2'b00;
            BEQ         <= 1'b0;
            BNE         <= 1'b0;
            BLT         <= 1'b0;
            BGE         <= 1'b0;
            BLTU        <= 1'b0;
            BGEU        <= 1'b0;
            LUI         <= 1'b0;
            AUIPC       <= 1'b0;
            JAL         <= 1'b0;
            JALR        <= 1'b0;
            Valid       <= 1'b0;
            Immediate   <= 32'd0;
        end    
end

endmodule
