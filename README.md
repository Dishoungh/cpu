# Preamble

This is documentation for my CPU design and a journal of my learning experience. I will write this document in a manner to detail everything I'm doing so the more experienced can better guide me to improve my design and the "not-so-experienced" like myself can have an easy, accessible manual on how to design a CPU to prove that it's not as daunting as they may believe. Yeah, it's easy to say this when you already know what you're doing, but I think it would be interesting to see a project like this develop as you're reading this.<br>

The goal here is to initially create a basic RISC-V processor. Over time, I will implement more advanced features and extensions. To try to make the document as concise as possible, I will frequently reference the primary resources in the [Prerequisite Material section](#prerequisite-material).<br>

[Jump to Table of Contents](#table-of-contents)

# Table of Contents

- [Preamble](#preamble)
- [Prerequisite Material](#prerequisite-material)
- [Part I: Learning the RISC-V ISA](#part-i-learning-the-risc-v-isa)
- [Part II: Choosing a Logic Simulator Tool](#part-ii-choosing-a-logic-simulator-tool)
- [Part III: Implementing RV32I (Single Cycle Architecture)](#part-iii-implementing-rv32i-single-cycle-architecture)
	- [Memory Units](#memory-units)
	- [ALU](#alu)
		- [ADD](#add)
		- [SUB](#sub)
		- [Shift Left Logical](#shift-left-logical)
		- [Set if Less Than (Signed)](#set-if-less-than-signed)
		- [Set if Less Than (Unsigned)](#set-if-less-than-unsigned)
		- [XOR](#xor)
		- [Shift Right Logical](#shift-right-logical)
		- [Shift Right Arithmetic](#shift-right-arithmetic)
		- [OR](#or)
		- [AND](#and)
	- [CPU Datapath](#cpu-datapath)
		- [Fetching Instructions](#fetching-instructions)
- [Part IV: Implementing RV32I (Pipelined Architecture)](#part-iv-implementing-rv32i-pipelined-architecture)
- [Special Thanks](#special-thanks)

# Prerequisite Material

Prepping for this, I used these online resource I found:

- Primary
	- [Computer Organization and Design: The Hardware or Software Interface (RISC-V Edition)](./Resources/Computer_Organization_and_Design-The_Hardware_or_Software_Interface_RISC-V_Edition.pdf)
	- [Digital Design and Computer Architecture (RISC-V Edition)](./Resources/Digital_Design_and_Computer_Architecture_RISC-V_Edition.pdf)
	- [Unprivileged RISC-V Instruction Set Manual (Volume 1)](./Resources/RISC-V_Unprivileged_Specification_Manual.pdf)
- Supplementary
	- [All About Circuits](https://www.allaboutcircuits.com/textbook/digital/)
	- [GeeksforGeeks](https://www.geeksforgeeks.org/digital-electronics-logic-design-tutorials/)
	- [Neso Academy - Digital Electronics YouTube Playlist](https://www.youtube.com/playlist?list=PLBlnK6fEyqRjMH3mWf6kwqiTbT798eAOm)

**Note: For the sake of conciseness, I will name the "Computer Organization and Design: The Hardware or Software Interface (RISC-V Edition)" book by John L. Hennessy and David A. Patterson as the "Comp Org book", the "Digital Design and Computer Architecture (RISC-V Edition)" book by Harris & Harris as the "Digital Design book", and the "Unprivileged RISC-V ISA Manual" as the "RISC-V spec".**

[Jump to Table of Contents](#table-of-contents)

# Part I: Learning the RISC-V ISA

The official *RISC-V spec (page 554)* and the *Comp Org book (page 504)* are what I used to learn the instruction formatting.

[Jump to Table of Contents](#table-of-contents)

# Part II: Choosing a Logic Simulator Tool

Now, that I have studied the base ISA a little bit, now it's time for me to start learning by doing. This project will undergo different revisions so I will try my best to journal everything I do while keeping everything as concise as possible for those of you reading this.<br>

For my tool, I will choose [Logisim Evolution](https://github.com/logisim-evolution/logisim-evolution) as my simulator tool. Logisim Evolution is a free and open-source digital circuit simulator tool that is a continuation of the Logisim tool from Dr. Carl Burch.

You can install Logisim Evolution directly from the GitHub link above in the Releases tab. After installing, opening the application will look like this:

![Logisim Menu](./images/Logisim_Menu.png)

[Jump to Table of Contents](#table-of-contents)

# Part III: Implementing RV32I (Single Cycle Architecture)

First, I will implement a single-cycle RISC-V processor. It is the simplest architecture to implement and I will use this as a stepping stone to implement more complex, realistic designs.<br>

## Memory Units

Using Chapter 7 from the Digital Design book to guide my datapath, I will start by adding the memory units of the CPU. Since I'm doing a single-cycle design, I will need to separate the program and data memories, making this a classic [Harvard-style architecture](https://www.geeksforgeeks.org/harvard-architecture/#).<br>

The memory units I will add are:
- Data Memory
- Program Memory
- Register File
	- General Purpose Registers: `x0 - x31`
	- Program Counter: `pc`

<ins>Data Memory</ins>

To build, the data memory, I will need to address to multiple RAM blocks that are byte-addressable. Each RAM block must be able to store or load up to 4 bytes. I must be able to select between storing or loading data. Whether I'm storing or loading data, I need to flag to this RAM block to treat the data as a 8-bit byte, 16-bit halfword, or 32-bit full word.<br>

For the RAM block, there are 9 inputs and 1 output.

- Inputs
	- Unsigned0_Signed1: This will be an input to the bit extenders. In these, I can choose to either zero extend or "one" extend the output. If I choose the "sign mode" on the bit extenders, it will sign extend if I choose load a byte unsigned. If I choose the "input mode" on the bit extenders, it will blindly one or zero extend depending on the input. If I want it to correctly load a byte/half word signed or unsigned with the correct extension, I need to AND the unsigned/signed input flag with the **most significant bit** of the respective data output. That's why I included AND gates at the bit extenders.
		- ![Unsigned or Signed Mode](./images/Memory/Unsigned_or_Signed_RAM_Block.png)
	- Reset: This will asynchronously clear the contents of the RAM to a known state. No instruction will have access to this pin, but this will be here in case if I need it for any init state.
	- Enable: This will enable either the loading or storing modes of the RAM block. This is for when I place this RAM block in outer circuit blocks. I will use the lower 24 bits of the address as the address inputs of the RAM blocks and use the upper 8 bits to decode the enables for those blocks.
	- Load: This will flag the RAM modules in the RAM block to output data.
	- Store: This will flag the RAM modules in the RAM block to save data from the "Data_In" input.
	- Size_Flag: This is a 2 bit input that will signal the RAM block if I want to store or load a byte (8 bits), a half word (16 bits), or a full word (32 bits). If an invalid size flag is detected, the RAM block shouldn't do anything.
		- 00 = Store/Load Byte
		- 01 = Store/Load Half Word
		- 10 = Store/Load Word
		- 11 = Invalid
	- Address: This is a 24-bit input that will address the individual bytes in the RAM modules.
	- Clock: This is the clock signal to synchronously control the RAM modules.
	- Data_In: This is a 32 bit input that will be stored if the store input is enabled. The "Size_Flag" input will determine if a byte, a half word, or a full word will be stored.
- Outputs
 	- Data_Out: This is a 32 bit output that represents the data that is being loaded if the Load input is enabled. The "Size_Flag" input will determine if a byte, a half word, or a full word will be loaded.

![RAM Block](./images/Memory/RAM_Block.png)

Now that the RAM block is implemented, I will decode 16 of these blocks to total my data memory to 256MB (16 * 16 MB = 256 MB).<br>

![Data Memory Module](./images/Memory/Data_Memory.png)

<ins>Program Memory</ins>

For the program memory, I will simply add one Read-Only Memory (ROM) module that is 16MB.

![Program Memory Module](./images/Memory/Program_Memory.png)

<ins>Register File</ins>

According to the RISC-V spec, there are 32 general-purpose registers including a program counter register. In this module, I have 8 inputs and 3 outputs.

- Inputs
	- Read_Register1: This is a 5 bit input that will be our "rs1" from the R,I,S, and B-type instruction formats. It connects to the select bits of a multiplexer that selects which register data that will output as the first register operand.
	- Read_Register2: This is a 5 bit input that will be our "rs2" from the R,S, and B-type instruction formats. It connects to the select bits of a multiplexer that selects which register data that will output as the second register operand.
	- Write_Data: This is a 32 bit input that will be the data to write, assuming the Write_Enable bit is asserted. 
	- Clock: This is our clock signal.
	- Reset: The registers are reset asynchronously. If this input asserts then all of the registers will reset. This is mainly to hard-initialize the registers to a known state.
	- Write_Register: This is a 5 bit input that is connected to the select bits of a 5-to-32 decoder. The decoder controls the write enable bits of each register, with exception to x0 since that will always be hardcoded to a value of 0.
	- Write_Enable: This is the enable input for the decoder to select a register to write to. If enabled, the decoder will select based on the Write_Register value. Otherwise, no register is selected.
	- PC_In: This is the program counter value to update the pc register to. The pc register always has its write enable bit to 1 since the program counter register will always be written at every clock cycle.
- Outputs 
	- Reg1_Out: This is a 32 bit output that is the register data of the first register operand.
	- Reg2_Out: This is a 32 bit output that is the register data of the second register operand.
	- PC_Out: This is a 32 bit output that represents the current program counter value.

![Register File](./images/Register_File.png)

[Jump to Table of Contents](#table-of-contents)

## ALU

Up next is the ALU, which is our arithmetic and logical engine. I will use the ALU that has a 3-bit opcode to implement the following functions:
- 000 = ADD/SUB
- 001 = SLL (Shift Left Logical)
- 010 = SLT (Set if Less Than)
- 011 = SLTU (Set if Less Than (Unsigned))
- 100 = XOR
- 101 = SRL/SRA (Shift Right Logical / Shift Right Arithmetic)
- 110 = OR
- 111 = AND
<br>

I will use the `funct3` bit fields of the instruction to give to the ALU as the "Opcode", which will determine which function to mux out.<br>

**Note: Since the Digital Design book is only implementing a small subset of the ISA, I will be deviating a little bit from the book.**

[Jump to Table of Contents](#table-of-contents)

### ADD

For the first submodule of the ALU, I will create a 32-bit adder. I could just use Logisim's built-in adder module, but I want to manually implement a more advanced version of an adder circuit such as a [Carry Lookahead adder](https://www.geeksforgeeks.org/carry-look-ahead-adder/#) just for fun.

<ins>Half Adder</ins>

My half adder is a standard half adder unit with S = A XOR B and C = A AND B.

![HA](./images/ALU/Half_Adder.png)

<ins>Full Adder</ins>

For a classic full adder, it combines 2 half adders along with an OR gate for the carry out.

![FA](./images/ALU/Full_Adder.png)

<ins>4-Bit Carry Generator</ins>

For our CLA, I will preemptively generate 4 carry bits with one singular carry in. I could try to generate all 32 carry bits, but that is not reasonable. 4 carry bits is large enough at that. One of the biggest pitfalls of the CLA is while it is fast, it gets complex and way too time-consuming to create for a large number of bits. The only reason I even managed to create a CLA4 block was at least Logisim allowed me to copy and paste the same sub-circuit.<br>

For me to create a 32 bit adder with this sub-block, I will need to cascade the CLA4 block 8 times. Yes, that means carry bits will still ripple through these CLA blocks, but having 8 carry bits ripple is a lot better than 32 for a classical Ripple Carry Adder. In a logic simulator that doesn't take propagation delay into account, it doesn't matter, but I still wanted to implement this for my own learning purposes.<br>

Using the formula in the Comp Org book (page 1197 and 1198):

Propagate: `Pi = Ai ⊕ Bi`<br>
Generate: `Gi = Ai ∧ Bi`<br>

Carry: C(i+1) = Gi ∨ (Pi ∧ Ci) = (Ai ∧ Bi) ∨ ((Ai ⊕ Bi) ∧ Ci)

- C0 = Cin<br>
- C1 = G0 ∨ (P0 ∧ C0) = `(A0 ∧ B0) ∨ ((A0 ⊕ B0) ∧ Cin)`<br>
- C2 = G1 ∨ (P1 ∧ C1) = (A1 ∧ B1) ∨ ((A1 ⊕ B1) ∧ (`(A0 ∧ B0) ∨ ((A0 ⊕ B0) ∧ Cin)`))<br>
- C3 = G2 ∨ (P2 ∧ C2) = (A2 ∧ B2) ∨ ((A2 ⊕ B2) ∧ (A1 ∧ B1) ∨ ((A1 ⊕ B1) ∧ (`(A0 ∧ B0) ∨ ((A0 ⊕ B0) ∧ Cin)`)))<br>
- C4 = G3 ∨ (P3 ∧ C3) = (A3 ∧ B3) ∨ ((A3 ⊕ B3) ∧ ((A2 ∧ B2) ∨ ((A2 ⊕ B2) ∧ (A1 ∧ B1) ∨ ((A1 ⊕ B1) ∧ (`(A0 ∧ B0) ∨ ((A0 ⊕ B0) ∧ Cin)`)))))<br>

**As you can see, as the bits increase, the complexity increases dramatically, which is probably why when you Google "32-bit Carry Lookahead adder", the most you'll find is design with cascaded carry lookadhead sub blocks.**

![CLA](./images/ALU/CLA4.png)

<ins>32-Bit Carry Lookahead Adder</ins>

Now, all I have to do is cascade 8 CLA4 blocks for a 32-bit adder module.

![CLA32](./images/ALU/Adder.png)

[Jump to Table of Contents](#table-of-contents)

### SUB

I'm going to add to the adder (yes, that pun was intended) by negating the B input. Remember, A - B is simply A + (-B).  I could just put in the "Subtractor module" but I want to share the same adder module for both functions considering in the RISC-V ISA, the SUB instruction is literally just the ADD instruction with one bit change (funct7[5] = 1). I'll use that bit change to mux out a positive or negative secondary operand while keeping the ADD and SUB instruction using the same funct3 ALU opcode. I've also added in a multiplexer to connect the ALU opcode bit field and an additional mux to select between B and -B for addition or subtraction.

![Adder and Sub](./images/ALU/Add_Sub.png)

[Jump to Table of Contents](#table-of-contents)

### Shift Left Logical

Up next is the Shift Left Logical (SLL) instruction. This will be a simple addition. I will just add in Logisim's built-in shifter module.

![SLL](./images/ALU/Shift_Left_Logical.png)

[Jump to Table of Contents](#table-of-contents)

### Set if Less Than (Signed)

For the Set if Less Than (SLT) instruction, I will need to add flags for the ALU.

- N = Result is Negative
	- Result is negative if the most significant bit, Result[31] is 1. The most significant bit determines the sign and if it is 1, that means the value is negative.
	- `N = Result[31]`
- Z = Result is Zero
	- Result is zero if the 32-bit NOR gate is 1. Remember, a NOR gate can only be 1 if both values are zero.
	- `Z = Result[31] ⊽ Result[30] ⊽ ... Result[1] ⊽ Result[0]`
- C = Carry Out
	- We will use the carry out from the CLA32 block for this, but that's not enough. There can only be a carry out on only addition or subtraction operations (when ALU_Op = 000). We can use a 3-input NOR gate for this and then AND that with the carry out.
	- `C = (ALU_Op[2] ⊽ ALU_Op[1] ⊽ ALU_Op[0]) ∧ Cout`
- V = Overflow
	- The result overflowed if these conditions are true:
		1. The A operand and Sum have different signs.
			- `A[31] ⊕ Sum[31]`
		2. Either the A and B operands have the same sign and the ALU is performing addition OR the A and B operands have different signs and the ALU is performing subtraction.
			- `((A[31] ⊙ B[31]) ∧ ¬ALU_Src) ∨ ((A[31] ⊕ B[31]) ∧ ALU_Src)`
	- `V = (A[31] ⊕ Result[31]) ∧ (((A[31] ⊙ B[31]) ∧ ¬ALU_Src) ∨ ((A[31] ⊕ B[31]) ∧ ALU_Src))`

![Flags](./images/ALU/Adding_Status_Flags.png)

Now that I've added flags to the ALU, I can use these flags for comparisons using *Table 5.2* from the Digital Design book. According to the table, A is less than B as signed values if (A + (-B)) causes `Sum[31] ⊕ V` to be true. 

![SLT](./images/ALU/SLT.png)

**Note: The reason I omitted one of the conditions for Overflow from the Digital Design book was because I need to take into account that other instructions that need to use the adder such as SLT/SLTU don't share the same opcode as ADD/SUB.**

[Jump to Table of Contents](#table-of-contents)

### Set if Less Than (Unsigned)

I will do the exact same thing from SLT except this time the comparison will be unsigned. To determine if A < B as unsigned, `¬Cout` must be true.

![SLTU](./images/ALU/SLTU.png)

[Jump to Table of Contents](#table-of-contents)

### XOR

This one is pretty easy. I just simply added a 32-bit XOR gate for this one.

![XOR](./images/ALU/XOR.png)

[Jump to Table of Contents](#table-of-contents)

### Shift Right Logical

Similarly to the Shift Left Logical, I will add in the shifter module but instead set it up in Logical Right Shift mode.

![SRL](./images/ALU/Shift_Right_Logical.png)

[Jump to Table of Contents](#table-of-contents)

### Shift Right Arithmetic

Since the SRA instruction shares the same opcode with SRL, I will use the special bit to differentiate the two similarly with ADD vs SUB. I will mux out the two logical shift and arithmetic shift with a multiplexer.

![SRA](./images/ALU/Shift_Right_Arithmetic.png)

[Jump to Table of Contents](#table-of-contents)

### OR

I just simply added a 32-bit OR gate for this one.

![OR](./images/ALU/OR.png)

[Jump to Table of Contents](#table-of-contents)

### AND

I just simply added a 32-bit AND gate for this one.

![AND](./images/ALU/AND.png)

[Jump to Table of Contents](#table-of-contents)

## CPU Datapath

My base ALU is now complete with all of the base RV32I arithmetic/logical operations included. If I wish to add more to it, I will do that later. Now it's time to connect these blocks together to implement each instruction one at a time.

![Beginning CPU Connections](./images/CPU_Datapath/Basic_Blocks_No_Connection.png)

[Jump to Table of Contents](#table-of-contents)

### Fetching Instructions

For the CPU to even execute anything, it needs to be given instructions. Instructions are stored in the Program Memory block and are received from inputting a program counter value into the adddress.<br>

The Program Counter value is stored in the `pc` register in the Register file.

![Reg_PC](./images/CPU_Datapath/Program_Counter_Fetching_Instruction.png)

To fetch instructions, connect the PC_Out from the register file to the address input of the program memory. I also went ahead and connected the clock and reset pins to the clock and reset inputs of the data memory and register file blocks.

![Connecting the Program Counter](./images/CPU_Datapath/Connecting_Program_Counter.png)

[Jump to Table of Contents](#table-of-contents)

# Part IV: Implementing RV32I (Pipelined Architecture)

[TBA]

[Jump to Table of Contents](#table-of-contents)

# Special Thanks

I'm dedicating this section to the wonderful people at the [Digital Design HQ discord](https://discord.gg/4YWKUryprY) who have helped me build this project.
- [Mahir Abbas](https://github.com/MahirAbbas)
- [Andrew Clark (FL4SHK)](https://github.com/fl4shk)
- sarvel

[Jump to Table of Contents](#table-of-contents)
