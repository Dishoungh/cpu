# Overview

This is documentation for my CPU design.

Logisim - Contains my Logisim schematic of my RISC-V implementation.
Vivado - Contains the Vivado project of my RISC-V implementation.

# Part 1.1: Creating Non-Pipelined RISC-V CPU

As far as ISA I want to build this CPU off of, I want to make a CPU based on the RISC-V ISA.

I'm using this CPU Design as a model for my datapath<br>
![CPU Design Inspiration](./images/CPU.png)

This is from David A. Patterson's and John L. Hennessy's RISC-V Edition of Computer Organization and Design.

The goal here is to create a basic processor with idealized memory and no pipelining (that will be for a later part).

## Logisim

I'm implementing on Logisim first since I want to use the schematic I create in Logisim as a stepping stone and as a visual guide for implementing the RTL in Vivado.

I'm using the [Unprivileged RISC-V Instruction Set Manual (Volume 1)](https://riscv.org/wp-content/uploads/2019/12/riscv-spec-20191213.pdf) published in December 2019 as reference.

Just to make this easy on me since I'm a noob (at the time of this edit), I'll start by implementing the RV64I variant since it seems according to the spec sheet, that architecture serves as the basis for the RISC-V extensions.

### Instruction Types Explained

In **Page 129** of the manual, it describes the instruction layout is explained. I don't want to repeat a bunch of info from the manual. You can read it yourself, so I'll just parse out very important notes here so you don't have to read the manuals. This [article](https://msyksphinz-self.github.io/riscv-isadoc/html/index.html) provides more detailed descriptions of the individual instructions for the base ISA and the extensions.


The CPU implements some form of a [split-cache architecture](https://en.wikipedia.org/wiki/Modified_Harvard_architecture).
Instruction cache is 64KB (Address Width is 13 bits; (2^13) Addressable Lines * 64 Bits Per Line / 8 Bits Per Byte = 64KB).
Data cache is 1MB (Address Width is 17 bits; (2^17) Addressable Lines * 64 Bits Per Line / 8 Bits Per Byte = 1MB).

Because I can't figure out how to address individual bytes in memory blocks, instructions that load/store bytes and half-words are not supported.

## Vivado

TBD

# Part 1.2: TBD

TBD
