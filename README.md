# Introduction

This README will serve as a journal for my work on my RISC-V CPU. For now, I'm attempting to build a basic RISC-V CPU as a side hobby. I used to do some of this on Logisim, but I want to try this on my Arty Zynq board. We'll see where I take this.

# Directories

Sources - Contains user source files for Vivado project and is divided into the following sub-directories:

- BIT - Contains bitstream files (.bit)
- COE - Contains memory coefficients files to test sample programs (.coe)
- IMG - Contains image files for the README (.png)
- HDL - Contains HDL source files (.v)
- SIM - Contains testbenches (.v)
- TCL - Contains project TCL scripts to rebuild project (.tcl)
    - To export the project: `write_project_tcl -paths_relative_to ../ -origin_dir_override ../ -target_proj_dir . -force ../Sources/TCL/Project-Recreation-Script.tcl`
- XDC - Contains constraint files (.xdc)

WorkingDir - Working directory of Vivado workspace.

# Part I - Setting Up Project

I'll set up the project with a basic block design. What I want to do is just create a basic non-pipelined RV64I processor and build from there. Here is the block design:
    - ![Block Design](./Sources/IMG/part-1-block-design.png)


# Special Thanks

I'm dedicating this section to the wonderful people at the [Digital Design HQ discord](https://discord.gg/4YWKUryprY) who have helped me build this project.
- [Mahir Abbas](https://github.com/MahirAbbas)
- [Andrew Clark (FL4SHK)](https://github.com/fl4shk)
- [sarvel](https://sarvel.xyz/)
- [saahm](https://github.com/saahm)
