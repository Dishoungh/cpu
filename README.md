# Introduction

This README will serve as a "short-and-sweet" summary for my work. If you want a highly detailed and "step-by-step" walkthrough of my design, visit my [wiki](https://github.com/Dishoungh/cpu/wiki). Otherwise, the goal of my project is to start with a simple RISC-V CPU design and then incrementally design more advanced features for the CPU.<br>

# Directories

Sources - Contains user source files for Vivado project and is divided into the following sub-directories:

- BIT - Contains bitstream files (.bit)
- COE - Contains memory coefficients files to test sample programs (.coe)
- HDL - Contains HDL source files (.v)
- SIM - Contains testbenches (.v)
- TCL - Contains project TCL scripts to rebuild project (.tcl)
    - To export the project: `write_project_tcl -paths_relative_to ../ -origin_dir_override ../ -target_proj_dir . -force ../Sources/TCL/Project-Recreation-Script.tcl`
- XDC - Contains constraint files (.xdc)

WorkingDir - Working directory of Vivado workspace.

# Special Thanks

I'm dedicating this section to the wonderful people at the [Digital Design HQ discord](https://discord.gg/4YWKUryprY) who have helped me build this project.
- [Mahir Abbas](https://github.com/MahirAbbas)
- [Andrew Clark (FL4SHK)](https://github.com/fl4shk)
- [sarvel](https://sarvel.xyz/)
- [saahm](https://github.com/saahm)
