## Introduction

This README will be an in-depth breakdown of my RISC-V soft processor design in Vivado.<br>

I like to document every little step 

### <ins>Directories</ins>

Sources - Contains user source files for Vivado project and is divided into the following sub-directories:

- BIT - Contains bitstream files (.bit)
- HDL - Contains HDL source files (.v)
- IMG - Contains images for README
- SIM - Contains testbenches (.v)
- TCL - Contains project TCL scripts to rebuild project (.tcl)
    - To export the project: `write_project_tcl -paths_relative_to ../ -origin_dir_override ../ -target_proj_dir . -force ../Sources/TCL/Project-Recreation-Script.tcl`
- XDC - Contains constraint files (.xdc)

WorkingDir - Working directory of Vivado workspace.

## Part I: Setting Up Project

I'm using an [Arty Z7-20 FPGA](https://digilent.com/reference/programmable-logic/arty-z7/start) to test my design.

![Image](./Sources/IMG/PartI-Configuring_Project-Board_Selection.png)

At this point, I have an empty block design:

![Image](./Sources/IMG/PartI-Empty_Block_Design.png)

### <ins>My Design Plans</ins>

My plan is to practice Yocto and practice CPU design at the same time. So, what I'll do is create my soft CPU core as AXI IP. This way, I can get a way to interface with my CPU by giving it instructions and to read statuses to make sure it's functioning properly.

## Part II: Top Block Design





## Special Thanks

I'm dedicating this section to the wonderful people at the [Digital Design HQ discord](https://discord.gg/4YWKUryprY) who have helped me build this project.
- [Mahir Abbas](https://github.com/MahirAbbas)
- [Andrew Clark (FL4SHK)](https://github.com/fl4shk)
- [sarvel](https://sarvel.xyz/)
- [saahm](https://github.com/saahm)
