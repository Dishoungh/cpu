
################################################################
# This is a generated script based on design: riscv
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2024.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   if { [string compare $scripts_vivado_version $current_vivado_version] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2042 -severity "ERROR" " This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Sourcing the script failed since it was created with a future version of Vivado."}

   } else {
     catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   }

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source riscv_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# data_memory, control_unit, cla32, mux_d32_s1, mux_d32_s1, mux_d32_s1, mux_d32_s1, mux_d32_s1, mux_d32_s1, mux_d32_s1, mux_d32_s1, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, reg32, decoder5, mux_d32_s5, mux_d32_s5, cla32, mux_d32_s1, sll, srl, sra, mux_d32_s1, mux_d32_s3

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-1
   set_property BOARD_PART digilentinc.com:arty-z7-20:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name riscv

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:dist_mem_gen:8.0\
xilinx.com:ip:xlslice:1.0\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:ip:util_vector_logic:2.0\
xilinx.com:ip:xlconcat:2.1\
xilinx.com:ip:ila:6.2\
xilinx.com:ip:util_reduced_logic:2.0\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
data_memory\
control_unit\
cla32\
mux_d32_s1\
mux_d32_s1\
mux_d32_s1\
mux_d32_s1\
mux_d32_s1\
mux_d32_s1\
mux_d32_s1\
mux_d32_s1\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
reg32\
decoder5\
mux_d32_s5\
mux_d32_s5\
cla32\
mux_d32_s1\
sll\
srl\
sra\
mux_d32_s1\
mux_d32_s3\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: overflow_block
proc create_hier_cell_overflow_block { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_overflow_block() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 0 -to 0 a_sign
  create_bd_pin -dir I -from 0 -to 0 b_sign
  create_bd_pin -dir I -from 0 -to 0 sum_sign
  create_bd_pin -dir O -from 0 -to 0 ov
  create_bd_pin -dir I -from 0 -to 0 negate

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {xor} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_0


  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {xor} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_1


  # Create instance: util_vector_logic_2, and set properties
  set util_vector_logic_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_2 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {not} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_2


  # Create instance: util_vector_logic_3, and set properties
  set util_vector_logic_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_3 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {not} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_3


  # Create instance: util_vector_logic_4, and set properties
  set util_vector_logic_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_4 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {xor} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_4


  # Create instance: util_vector_logic_5, and set properties
  set util_vector_logic_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_5 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {and} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_5


  # Create instance: util_vector_logic_6, and set properties
  set util_vector_logic_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_6 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {and} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_6


  # Create instance: util_vector_logic_7, and set properties
  set util_vector_logic_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_7 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {or} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_7


  # Create instance: util_vector_logic_8, and set properties
  set util_vector_logic_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_8 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {and} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_8


  # Create port connections
  connect_bd_net -net Net [get_bd_pins negate] [get_bd_pins util_vector_logic_6/Op2] [get_bd_pins util_vector_logic_3/Op1]
  connect_bd_net -net Op2_1 [get_bd_pins sum_sign] [get_bd_pins util_vector_logic_0/Op2]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins util_vector_logic_0/Res] [get_bd_pins util_vector_logic_8/Op1]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins util_vector_logic_1/Res] [get_bd_pins util_vector_logic_2/Op1]
  connect_bd_net -net util_vector_logic_2_Res [get_bd_pins util_vector_logic_2/Res] [get_bd_pins util_vector_logic_5/Op1]
  connect_bd_net -net util_vector_logic_3_Res [get_bd_pins util_vector_logic_3/Res] [get_bd_pins util_vector_logic_5/Op2]
  connect_bd_net -net util_vector_logic_4_Res [get_bd_pins util_vector_logic_4/Res] [get_bd_pins util_vector_logic_6/Op1]
  connect_bd_net -net util_vector_logic_5_Res [get_bd_pins util_vector_logic_5/Res] [get_bd_pins util_vector_logic_7/Op1]
  connect_bd_net -net util_vector_logic_6_Res [get_bd_pins util_vector_logic_6/Res] [get_bd_pins util_vector_logic_7/Op2]
  connect_bd_net -net util_vector_logic_7_Res [get_bd_pins util_vector_logic_7/Res] [get_bd_pins util_vector_logic_8/Op2]
  connect_bd_net -net util_vector_logic_8_Res [get_bd_pins util_vector_logic_8/Res] [get_bd_pins ov]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins a_sign] [get_bd_pins util_vector_logic_0/Op1] [get_bd_pins util_vector_logic_1/Op1] [get_bd_pins util_vector_logic_4/Op1]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins b_sign] [get_bd_pins util_vector_logic_1/Op2] [get_bd_pins util_vector_logic_4/Op2]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: Branch_Block
proc create_hier_cell_Branch_Block { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_Branch_Block() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I Negative
  create_bd_pin -dir I Zero
  create_bd_pin -dir I Carry
  create_bd_pin -dir I Overflow
  create_bd_pin -dir I BEQ
  create_bd_pin -dir I BNE
  create_bd_pin -dir I BLT
  create_bd_pin -dir I BGE
  create_bd_pin -dir I BLTU
  create_bd_pin -dir I BGEU
  create_bd_pin -dir O BranchTaken

  # Create instance: beq, and set properties
  set beq [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 beq ]
  set_property CONFIG.C_SIZE {1} $beq


  # Create instance: bne, and set properties
  set bne [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 bne ]
  set_property CONFIG.C_SIZE {1} $bne


  # Create instance: bltu, and set properties
  set bltu [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 bltu ]
  set_property CONFIG.C_SIZE {1} $bltu


  # Create instance: blt, and set properties
  set blt [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 blt ]
  set_property CONFIG.C_SIZE {1} $blt


  # Create instance: bge, and set properties
  set bge [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 bge ]
  set_property CONFIG.C_SIZE {1} $bge


  # Create instance: bgeu, and set properties
  set bgeu [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 bgeu ]
  set_property CONFIG.C_SIZE {1} $bgeu


  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property CONFIG.NUM_PORTS {6} $xlconcat_0


  # Create instance: branch_or, and set properties
  set branch_or [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_reduced_logic:2.0 branch_or ]
  set_property -dict [list \
    CONFIG.C_OPERATION {or} \
    CONFIG.C_SIZE {6} \
  ] $branch_or


  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {not} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_0


  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {xor} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_1


  # Create instance: util_vector_logic_2, and set properties
  set util_vector_logic_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_2 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {not} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_2


  # Create instance: util_vector_logic_3, and set properties
  set util_vector_logic_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_3 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {not} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_3


  # Create port connections
  connect_bd_net -net BEQ_1 [get_bd_pins BEQ] [get_bd_pins beq/Op1]
  connect_bd_net -net BGEU_1 [get_bd_pins BGEU] [get_bd_pins bgeu/Op1]
  connect_bd_net -net BGE_1 [get_bd_pins BGE] [get_bd_pins bge/Op1]
  connect_bd_net -net BLTU_1 [get_bd_pins BLTU] [get_bd_pins bltu/Op1]
  connect_bd_net -net BLT_1 [get_bd_pins BLT] [get_bd_pins blt/Op1]
  connect_bd_net -net BNE_1 [get_bd_pins BNE] [get_bd_pins bne/Op1]
  connect_bd_net -net Carry_1 [get_bd_pins Carry] [get_bd_pins bgeu/Op2] [get_bd_pins util_vector_logic_3/Op1]
  connect_bd_net -net Negative_1 [get_bd_pins Negative] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net Overflow_1 [get_bd_pins Overflow] [get_bd_pins util_vector_logic_1/Op2]
  connect_bd_net -net Zero_1 [get_bd_pins Zero] [get_bd_pins beq/Op2] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net beq_Res [get_bd_pins beq/Res] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net bge_Res [get_bd_pins bge/Res] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net bgeu_Res [get_bd_pins bgeu/Res] [get_bd_pins xlconcat_0/In5]
  connect_bd_net -net blt_Res [get_bd_pins blt/Res] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net bltu_Res [get_bd_pins bltu/Res] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net bne_Res [get_bd_pins bne/Res] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net branch_or_Res [get_bd_pins branch_or/Res] [get_bd_pins BranchTaken]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins util_vector_logic_0/Res] [get_bd_pins bne/Op2]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins util_vector_logic_1/Res] [get_bd_pins blt/Op2] [get_bd_pins util_vector_logic_2/Op1]
  connect_bd_net -net util_vector_logic_2_Res [get_bd_pins util_vector_logic_2/Res] [get_bd_pins bge/Op2]
  connect_bd_net -net util_vector_logic_3_Res [get_bd_pins util_vector_logic_3/Res] [get_bd_pins bltu/Op2]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins xlconcat_0/dout] [get_bd_pins branch_or/Op1]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: ALU
proc create_hier_cell_ALU { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_ALU() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 31 -to 0 a
  create_bd_pin -dir I -from 31 -to 0 b
  create_bd_pin -dir I negate
  create_bd_pin -dir I -from 2 -to 0 opcode
  create_bd_pin -dir O -from 31 -to 0 result
  create_bd_pin -dir O Carry
  create_bd_pin -dir O -from 0 -to 0 Negative
  create_bd_pin -dir O -from 0 -to 0 Zero
  create_bd_pin -dir O -from 0 -to 0 Overflow

  # Create instance: cla32_0, and set properties
  set block_name cla32
  set block_cell_name cla32_0
  if { [catch {set cla32_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $cla32_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: mux_d32_s1_0, and set properties
  set block_name mux_d32_s1
  set block_cell_name mux_d32_s1_0
  if { [catch {set mux_d32_s1_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $mux_d32_s1_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: sll_0, and set properties
  set block_name sll
  set block_cell_name sll_0
  if { [catch {set sll_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sll_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: bSlice_4down0, and set properties
  set bSlice_4down0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 bSlice_4down0 ]
  set_property CONFIG.DIN_FROM {4} $bSlice_4down0


  # Create instance: slt, and set properties
  set slt [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 slt ]
  set_property -dict [list \
    CONFIG.C_OPERATION {xor} \
    CONFIG.C_SIZE {1} \
  ] $slt


  # Create instance: sltu, and set properties
  set sltu [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 sltu ]
  set_property -dict [list \
    CONFIG.C_OPERATION {not} \
    CONFIG.C_SIZE {1} \
  ] $sltu


  # Create instance: xlconcat_slt, and set properties
  set xlconcat_slt [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_slt ]
  set_property -dict [list \
    CONFIG.IN0_WIDTH {1} \
    CONFIG.IN1_WIDTH {31} \
  ] $xlconcat_slt


  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [list \
    CONFIG.CONST_VAL {0} \
    CONFIG.CONST_WIDTH {31} \
  ] $xlconstant_0


  # Create instance: xlconcat_sltu, and set properties
  set xlconcat_sltu [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_sltu ]
  set_property -dict [list \
    CONFIG.IN0_WIDTH {1} \
    CONFIG.IN1_WIDTH {31} \
  ] $xlconcat_sltu


  # Create instance: sum_31, and set properties
  set sum_31 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 sum_31 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {31} \
    CONFIG.DIN_TO {31} \
  ] $sum_31


  # Create instance: xor_logic, and set properties
  set xor_logic [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 xor_logic ]
  set_property -dict [list \
    CONFIG.C_OPERATION {xor} \
    CONFIG.C_SIZE {32} \
  ] $xor_logic


  # Create instance: srl_0, and set properties
  set block_name srl
  set block_cell_name srl_0
  if { [catch {set srl_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $srl_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: sra_0, and set properties
  set block_name sra
  set block_cell_name sra_0
  if { [catch {set sra_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sra_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: mux_srl_sra, and set properties
  set block_name mux_d32_s1
  set block_cell_name mux_srl_sra
  if { [catch {set mux_srl_sra [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $mux_srl_sra eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: or_logic, and set properties
  set or_logic [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 or_logic ]
  set_property -dict [list \
    CONFIG.C_OPERATION {or} \
    CONFIG.C_SIZE {32} \
  ] $or_logic


  # Create instance: and_logic, and set properties
  set and_logic [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 and_logic ]
  set_property CONFIG.C_SIZE {32} $and_logic


  # Create instance: alu_result_mux, and set properties
  set block_name mux_d32_s3
  set block_cell_name alu_result_mux
  if { [catch {set alu_result_mux [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $alu_result_mux eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: slice_negative, and set properties
  set slice_negative [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 slice_negative ]
  set_property -dict [list \
    CONFIG.DIN_FROM {31} \
    CONFIG.DIN_TO {31} \
  ] $slice_negative


  # Create instance: util_reduced_logic_0, and set properties
  set util_reduced_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_reduced_logic:2.0 util_reduced_logic_0 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {or} \
    CONFIG.C_SIZE {32} \
  ] $util_reduced_logic_0


  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {not} \
    CONFIG.C_SIZE {1} \
  ] $util_vector_logic_1


  # Create instance: overflow_block
  create_hier_cell_overflow_block $hier_obj overflow_block

  # Create instance: a_31, and set properties
  set a_31 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 a_31 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {31} \
    CONFIG.DIN_TO {31} \
  ] $a_31


  # Create instance: b_31, and set properties
  set b_31 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 b_31 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {31} \
    CONFIG.DIN_TO {31} \
  ] $b_31


  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {not} \
    CONFIG.C_SIZE {32} \
  ] $util_vector_logic_0


  # Create port connections
  connect_bd_net -net a_1 [get_bd_pins a] [get_bd_pins xor_logic/Op1] [get_bd_pins or_logic/Op1] [get_bd_pins and_logic/Op1] [get_bd_pins a_31/Din] [get_bd_pins cla32_0/a] [get_bd_pins sll_0/a] [get_bd_pins sra_0/a] [get_bd_pins srl_0/a]
  connect_bd_net -net a_31_Dout [get_bd_pins a_31/Dout] [get_bd_pins overflow_block/a_sign]
  connect_bd_net -net and_logic_Res [get_bd_pins and_logic/Res] [get_bd_pins alu_result_mux/in7]
  connect_bd_net -net b_1 [get_bd_pins b] [get_bd_pins bSlice_4down0/Din] [get_bd_pins xor_logic/Op2] [get_bd_pins or_logic/Op2] [get_bd_pins and_logic/Op2] [get_bd_pins b_31/Din] [get_bd_pins util_vector_logic_0/Op1] [get_bd_pins mux_d32_s1_0/in0]
  connect_bd_net -net b_31_Dout [get_bd_pins b_31/Dout] [get_bd_pins overflow_block/b_sign]
  connect_bd_net -net cla32_0_cout [get_bd_pins cla32_0/cout] [get_bd_pins sltu/Op1] [get_bd_pins Carry]
  connect_bd_net -net cla32_0_sum [get_bd_pins cla32_0/sum] [get_bd_pins sum_31/Din] [get_bd_pins alu_result_mux/in0]
  connect_bd_net -net mux_d32_s1_0_out0 [get_bd_pins mux_d32_s1_0/out0] [get_bd_pins cla32_0/b]
  connect_bd_net -net mux_d32_s3_0_out [get_bd_pins alu_result_mux/out0] [get_bd_pins result] [get_bd_pins slice_negative/Din] [get_bd_pins util_reduced_logic_0/Op1]
  connect_bd_net -net mux_srl_sra_out0 [get_bd_pins mux_srl_sra/out0] [get_bd_pins alu_result_mux/in5]
  connect_bd_net -net or_logic_Res [get_bd_pins or_logic/Res] [get_bd_pins alu_result_mux/in6]
  connect_bd_net -net overflow_block_Res [get_bd_pins overflow_block/ov] [get_bd_pins slt/Op2] [get_bd_pins Overflow]
  connect_bd_net -net sel_1 [get_bd_pins negate] [get_bd_pins overflow_block/negate] [get_bd_pins cla32_0/cin] [get_bd_pins mux_d32_s1_0/sel] [get_bd_pins mux_srl_sra/sel]
  connect_bd_net -net sel_2 [get_bd_pins opcode] [get_bd_pins alu_result_mux/sel]
  connect_bd_net -net slice_negative_Dout [get_bd_pins slice_negative/Dout] [get_bd_pins Negative]
  connect_bd_net -net sll_0_y [get_bd_pins sll_0/y] [get_bd_pins alu_result_mux/in1]
  connect_bd_net -net slt_Res [get_bd_pins slt/Res] [get_bd_pins xlconcat_slt/In0]
  connect_bd_net -net sltu_Res [get_bd_pins sltu/Res] [get_bd_pins xlconcat_sltu/In0]
  connect_bd_net -net sra_0_y [get_bd_pins sra_0/y] [get_bd_pins mux_srl_sra/in1]
  connect_bd_net -net srl_0_y [get_bd_pins srl_0/y] [get_bd_pins mux_srl_sra/in0]
  connect_bd_net -net sum_31_Dout [get_bd_pins sum_31/Dout] [get_bd_pins slt/Op1] [get_bd_pins overflow_block/sum_sign]
  connect_bd_net -net util_reduced_logic_0_Res [get_bd_pins util_reduced_logic_0/Res] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins util_vector_logic_0/Res] [get_bd_pins mux_d32_s1_0/in1]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins util_vector_logic_1/Res] [get_bd_pins Zero]
  connect_bd_net -net xlconcat_slt_dout [get_bd_pins xlconcat_slt/dout] [get_bd_pins alu_result_mux/in2]
  connect_bd_net -net xlconcat_sltu_dout [get_bd_pins xlconcat_sltu/dout] [get_bd_pins alu_result_mux/in3]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins xlconcat_slt/In1] [get_bd_pins xlconcat_sltu/In1]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins bSlice_4down0/Dout] [get_bd_pins sll_0/b] [get_bd_pins sra_0/b] [get_bd_pins srl_0/b]
  connect_bd_net -net xor_logic_Res [get_bd_pins xor_logic/Res] [get_bd_pins alu_result_mux/in4]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: Register_File
proc create_hier_cell_Register_File { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_Register_File() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I arst
  create_bd_pin -dir I -from 31 -to 0 wData
  create_bd_pin -dir O -from 31 -to 0 PC_Out
  create_bd_pin -dir I -from 31 -to 0 PC_In
  create_bd_pin -dir I we
  create_bd_pin -dir I -from 4 -to 0 rd
  create_bd_pin -dir O -from 31 -to 0 rs1
  create_bd_pin -dir O -from 31 -to 0 rs2
  create_bd_pin -dir I -from 4 -to 0 rAddr1
  create_bd_pin -dir I -from 4 -to 0 rAddr2

  # Create instance: x0, and set properties
  set block_name reg32
  set block_cell_name x0
  if { [catch {set x0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x1, and set properties
  set block_name reg32
  set block_cell_name x1
  if { [catch {set x1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x2, and set properties
  set block_name reg32
  set block_cell_name x2
  if { [catch {set x2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x3, and set properties
  set block_name reg32
  set block_cell_name x3
  if { [catch {set x3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x3 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x4, and set properties
  set block_name reg32
  set block_cell_name x4
  if { [catch {set x4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x4 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x5, and set properties
  set block_name reg32
  set block_cell_name x5
  if { [catch {set x5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x5 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x6, and set properties
  set block_name reg32
  set block_cell_name x6
  if { [catch {set x6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x6 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x7, and set properties
  set block_name reg32
  set block_cell_name x7
  if { [catch {set x7 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x7 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x8, and set properties
  set block_name reg32
  set block_cell_name x8
  if { [catch {set x8 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x8 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x9, and set properties
  set block_name reg32
  set block_cell_name x9
  if { [catch {set x9 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x9 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x10, and set properties
  set block_name reg32
  set block_cell_name x10
  if { [catch {set x10 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x10 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x11, and set properties
  set block_name reg32
  set block_cell_name x11
  if { [catch {set x11 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x11 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x12, and set properties
  set block_name reg32
  set block_cell_name x12
  if { [catch {set x12 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x12 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x13, and set properties
  set block_name reg32
  set block_cell_name x13
  if { [catch {set x13 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x13 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x14, and set properties
  set block_name reg32
  set block_cell_name x14
  if { [catch {set x14 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x14 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x15, and set properties
  set block_name reg32
  set block_cell_name x15
  if { [catch {set x15 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x15 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x16, and set properties
  set block_name reg32
  set block_cell_name x16
  if { [catch {set x16 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x16 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x17, and set properties
  set block_name reg32
  set block_cell_name x17
  if { [catch {set x17 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x17 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x18, and set properties
  set block_name reg32
  set block_cell_name x18
  if { [catch {set x18 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x18 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x19, and set properties
  set block_name reg32
  set block_cell_name x19
  if { [catch {set x19 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x19 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x20, and set properties
  set block_name reg32
  set block_cell_name x20
  if { [catch {set x20 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x20 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x21, and set properties
  set block_name reg32
  set block_cell_name x21
  if { [catch {set x21 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x21 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x22, and set properties
  set block_name reg32
  set block_cell_name x22
  if { [catch {set x22 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x22 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x23, and set properties
  set block_name reg32
  set block_cell_name x23
  if { [catch {set x23 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x23 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x24, and set properties
  set block_name reg32
  set block_cell_name x24
  if { [catch {set x24 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x24 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x25, and set properties
  set block_name reg32
  set block_cell_name x25
  if { [catch {set x25 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x25 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x26, and set properties
  set block_name reg32
  set block_cell_name x26
  if { [catch {set x26 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x26 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x27, and set properties
  set block_name reg32
  set block_cell_name x27
  if { [catch {set x27 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x27 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x28, and set properties
  set block_name reg32
  set block_cell_name x28
  if { [catch {set x28 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x28 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x29, and set properties
  set block_name reg32
  set block_cell_name x29
  if { [catch {set x29 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x29 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x30, and set properties
  set block_name reg32
  set block_cell_name x30
  if { [catch {set x30 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x30 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x31, and set properties
  set block_name reg32
  set block_cell_name x31
  if { [catch {set x31 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $x31 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: pc, and set properties
  set block_name reg32
  set block_cell_name pc
  if { [catch {set pc [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pc eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property CONFIG.CONST_VAL {0} $xlconstant_0


  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property CONFIG.CONST_VAL {1} $xlconstant_1


  # Create instance: reg_decoder, and set properties
  set block_name decoder5
  set block_cell_name reg_decoder
  if { [catch {set reg_decoder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $reg_decoder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: rs1_mux, and set properties
  set block_name mux_d32_s5
  set block_cell_name rs1_mux
  if { [catch {set rs1_mux [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $rs1_mux eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: rs2_mux, and set properties
  set block_name mux_d32_s5
  set block_cell_name rs2_mux
  if { [catch {set rs2_mux [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $rs2_mux eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [list \
    CONFIG.CONST_VAL {0} \
    CONFIG.CONST_WIDTH {32} \
  ] $xlconstant_2


  # Create instance: reg_ila, and set properties
  set reg_ila [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 reg_ila ]
  set_property -dict [list \
    CONFIG.C_MONITOR_TYPE {Native} \
    CONFIG.C_NUM_OF_PROBES {33} \
    CONFIG.C_PROBE0_WIDTH {32} \
    CONFIG.C_PROBE10_WIDTH {32} \
    CONFIG.C_PROBE11_WIDTH {32} \
    CONFIG.C_PROBE12_WIDTH {32} \
    CONFIG.C_PROBE13_WIDTH {32} \
    CONFIG.C_PROBE14_WIDTH {32} \
    CONFIG.C_PROBE15_WIDTH {32} \
    CONFIG.C_PROBE16_WIDTH {32} \
    CONFIG.C_PROBE17_WIDTH {32} \
    CONFIG.C_PROBE18_WIDTH {32} \
    CONFIG.C_PROBE19_WIDTH {32} \
    CONFIG.C_PROBE1_WIDTH {32} \
    CONFIG.C_PROBE20_WIDTH {32} \
    CONFIG.C_PROBE21_WIDTH {32} \
    CONFIG.C_PROBE22_WIDTH {32} \
    CONFIG.C_PROBE23_WIDTH {32} \
    CONFIG.C_PROBE24_WIDTH {32} \
    CONFIG.C_PROBE25_WIDTH {32} \
    CONFIG.C_PROBE26_WIDTH {32} \
    CONFIG.C_PROBE27_WIDTH {32} \
    CONFIG.C_PROBE28_WIDTH {32} \
    CONFIG.C_PROBE29_WIDTH {32} \
    CONFIG.C_PROBE2_WIDTH {32} \
    CONFIG.C_PROBE30_WIDTH {32} \
    CONFIG.C_PROBE31_WIDTH {32} \
    CONFIG.C_PROBE32_WIDTH {32} \
    CONFIG.C_PROBE3_WIDTH {32} \
    CONFIG.C_PROBE4_WIDTH {32} \
    CONFIG.C_PROBE5_WIDTH {32} \
    CONFIG.C_PROBE6_WIDTH {32} \
    CONFIG.C_PROBE7_WIDTH {32} \
    CONFIG.C_PROBE8_WIDTH {32} \
    CONFIG.C_PROBE9_WIDTH {32} \
  ] $reg_ila


  # Create port connections
  connect_bd_net -net Net [get_bd_pins x20/q] [get_bd_pins reg_ila/probe20] [get_bd_pins rs1_mux/in20] [get_bd_pins rs2_mux/in20]
  connect_bd_net -net Net1 [get_bd_pins x3/q] [get_bd_pins reg_ila/probe3] [get_bd_pins rs1_mux/in3] [get_bd_pins rs2_mux/in3]
  connect_bd_net -net Net2 [get_bd_pins x4/q] [get_bd_pins reg_ila/probe4] [get_bd_pins rs1_mux/in4] [get_bd_pins rs2_mux/in4]
  connect_bd_net -net Net3 [get_bd_pins x0/q] [get_bd_pins reg_ila/probe0] [get_bd_pins rs1_mux/in0] [get_bd_pins rs2_mux/in0]
  connect_bd_net -net Net4 [get_bd_pins x5/q] [get_bd_pins reg_ila/probe5] [get_bd_pins rs1_mux/in5] [get_bd_pins rs2_mux/in5]
  connect_bd_net -net Net5 [get_bd_pins x6/q] [get_bd_pins reg_ila/probe6] [get_bd_pins rs1_mux/in6] [get_bd_pins rs2_mux/in6]
  connect_bd_net -net Net6 [get_bd_pins x7/q] [get_bd_pins reg_ila/probe7] [get_bd_pins rs1_mux/in7] [get_bd_pins rs2_mux/in7]
  connect_bd_net -net Net7 [get_bd_pins x8/q] [get_bd_pins reg_ila/probe8] [get_bd_pins rs1_mux/in8] [get_bd_pins rs2_mux/in8]
  connect_bd_net -net Net8 [get_bd_pins x9/q] [get_bd_pins reg_ila/probe9] [get_bd_pins rs1_mux/in9] [get_bd_pins rs2_mux/in9]
  connect_bd_net -net Net9 [get_bd_pins x21/q] [get_bd_pins reg_ila/probe21] [get_bd_pins rs1_mux/in21] [get_bd_pins rs2_mux/in21]
  connect_bd_net -net Net10 [get_bd_pins x22/q] [get_bd_pins reg_ila/probe22] [get_bd_pins rs1_mux/in22] [get_bd_pins rs2_mux/in22]
  connect_bd_net -net Net11 [get_bd_pins x23/q] [get_bd_pins reg_ila/probe23] [get_bd_pins rs1_mux/in23] [get_bd_pins rs2_mux/in23]
  connect_bd_net -net Net12 [get_bd_pins x24/q] [get_bd_pins reg_ila/probe24] [get_bd_pins rs1_mux/in24] [get_bd_pins rs2_mux/in24]
  connect_bd_net -net Net13 [get_bd_pins x25/q] [get_bd_pins reg_ila/probe25] [get_bd_pins rs1_mux/in25] [get_bd_pins rs2_mux/in25]
  connect_bd_net -net Net14 [get_bd_pins x26/q] [get_bd_pins reg_ila/probe26] [get_bd_pins rs1_mux/in26] [get_bd_pins rs2_mux/in26]
  connect_bd_net -net Net15 [get_bd_pins x27/q] [get_bd_pins reg_ila/probe27] [get_bd_pins rs1_mux/in27] [get_bd_pins rs2_mux/in27]
  connect_bd_net -net Net16 [get_bd_pins x28/q] [get_bd_pins reg_ila/probe28] [get_bd_pins rs1_mux/in28] [get_bd_pins rs2_mux/in28]
  connect_bd_net -net Net17 [get_bd_pins x29/q] [get_bd_pins reg_ila/probe29] [get_bd_pins rs1_mux/in29] [get_bd_pins rs2_mux/in29]
  connect_bd_net -net Net18 [get_bd_pins x30/q] [get_bd_pins reg_ila/probe30] [get_bd_pins rs1_mux/in30] [get_bd_pins rs2_mux/in30]
  connect_bd_net -net Net19 [get_bd_pins x31/q] [get_bd_pins reg_ila/probe31] [get_bd_pins rs1_mux/in31] [get_bd_pins rs2_mux/in31]
  connect_bd_net -net arst_0_1 [get_bd_pins arst] [get_bd_pins x0/arst] [get_bd_pins x1/arst] [get_bd_pins x2/arst] [get_bd_pins x3/arst] [get_bd_pins x12/arst] [get_bd_pins x13/arst] [get_bd_pins x14/arst] [get_bd_pins x15/arst] [get_bd_pins x16/arst] [get_bd_pins x17/arst] [get_bd_pins x18/arst] [get_bd_pins x19/arst] [get_bd_pins x20/arst] [get_bd_pins x21/arst] [get_bd_pins x4/arst] [get_bd_pins x22/arst] [get_bd_pins x23/arst] [get_bd_pins x24/arst] [get_bd_pins x25/arst] [get_bd_pins x26/arst] [get_bd_pins x27/arst] [get_bd_pins x28/arst] [get_bd_pins x29/arst] [get_bd_pins x30/arst] [get_bd_pins x31/arst] [get_bd_pins x5/arst] [get_bd_pins pc/arst] [get_bd_pins x6/arst] [get_bd_pins x7/arst] [get_bd_pins x8/arst] [get_bd_pins x9/arst] [get_bd_pins x10/arst] [get_bd_pins x11/arst]
  connect_bd_net -net clk_0_1 [get_bd_pins clk] [get_bd_pins reg_ila/clk] [get_bd_pins x0/clk] [get_bd_pins x1/clk] [get_bd_pins x2/clk] [get_bd_pins x3/clk] [get_bd_pins x12/clk] [get_bd_pins x13/clk] [get_bd_pins x14/clk] [get_bd_pins x15/clk] [get_bd_pins x16/clk] [get_bd_pins x17/clk] [get_bd_pins x18/clk] [get_bd_pins x19/clk] [get_bd_pins x20/clk] [get_bd_pins x21/clk] [get_bd_pins x4/clk] [get_bd_pins x22/clk] [get_bd_pins x23/clk] [get_bd_pins x24/clk] [get_bd_pins x25/clk] [get_bd_pins x26/clk] [get_bd_pins x27/clk] [get_bd_pins x28/clk] [get_bd_pins x29/clk] [get_bd_pins x30/clk] [get_bd_pins x31/clk] [get_bd_pins x5/clk] [get_bd_pins pc/clk] [get_bd_pins x6/clk] [get_bd_pins x7/clk] [get_bd_pins x8/clk] [get_bd_pins x9/clk] [get_bd_pins x10/clk] [get_bd_pins x11/clk]
  connect_bd_net -net d_1 [get_bd_pins wData] [get_bd_pins x1/d] [get_bd_pins x2/d] [get_bd_pins x3/d] [get_bd_pins x12/d] [get_bd_pins x13/d] [get_bd_pins x14/d] [get_bd_pins x15/d] [get_bd_pins x16/d] [get_bd_pins x17/d] [get_bd_pins x18/d] [get_bd_pins x19/d] [get_bd_pins x20/d] [get_bd_pins x21/d] [get_bd_pins x4/d] [get_bd_pins x22/d] [get_bd_pins x23/d] [get_bd_pins x24/d] [get_bd_pins x25/d] [get_bd_pins x26/d] [get_bd_pins x27/d] [get_bd_pins x28/d] [get_bd_pins x29/d] [get_bd_pins x30/d] [get_bd_pins x31/d] [get_bd_pins x5/d] [get_bd_pins x6/d] [get_bd_pins x7/d] [get_bd_pins x8/d] [get_bd_pins x9/d] [get_bd_pins x10/d] [get_bd_pins x11/d]
  connect_bd_net -net d_2 [get_bd_pins PC_In] [get_bd_pins pc/d]
  connect_bd_net -net en_1 [get_bd_pins we] [get_bd_pins reg_decoder/en]
  connect_bd_net -net pc_q [get_bd_pins pc/q] [get_bd_pins PC_Out] [get_bd_pins reg_ila/probe32]
  connect_bd_net -net reg_decoder_out1 [get_bd_pins reg_decoder/out1] [get_bd_pins x1/we]
  connect_bd_net -net reg_decoder_out2 [get_bd_pins reg_decoder/out2] [get_bd_pins x2/we]
  connect_bd_net -net reg_decoder_out3 [get_bd_pins reg_decoder/out3] [get_bd_pins x3/we]
  connect_bd_net -net reg_decoder_out4 [get_bd_pins reg_decoder/out4] [get_bd_pins x4/we]
  connect_bd_net -net reg_decoder_out5 [get_bd_pins reg_decoder/out5] [get_bd_pins x5/we]
  connect_bd_net -net reg_decoder_out6 [get_bd_pins reg_decoder/out6] [get_bd_pins x6/we]
  connect_bd_net -net reg_decoder_out7 [get_bd_pins reg_decoder/out7] [get_bd_pins x7/we]
  connect_bd_net -net reg_decoder_out8 [get_bd_pins reg_decoder/out8] [get_bd_pins x8/we]
  connect_bd_net -net reg_decoder_out9 [get_bd_pins reg_decoder/out9] [get_bd_pins x9/we]
  connect_bd_net -net reg_decoder_out10 [get_bd_pins reg_decoder/out10] [get_bd_pins x10/we]
  connect_bd_net -net reg_decoder_out11 [get_bd_pins reg_decoder/out11] [get_bd_pins x11/we]
  connect_bd_net -net reg_decoder_out12 [get_bd_pins reg_decoder/out12] [get_bd_pins x12/we]
  connect_bd_net -net reg_decoder_out13 [get_bd_pins reg_decoder/out13] [get_bd_pins x13/we]
  connect_bd_net -net reg_decoder_out14 [get_bd_pins reg_decoder/out14] [get_bd_pins x14/we]
  connect_bd_net -net reg_decoder_out15 [get_bd_pins reg_decoder/out15] [get_bd_pins x15/we]
  connect_bd_net -net reg_decoder_out16 [get_bd_pins reg_decoder/out16] [get_bd_pins x16/we]
  connect_bd_net -net reg_decoder_out17 [get_bd_pins reg_decoder/out17] [get_bd_pins x17/we]
  connect_bd_net -net reg_decoder_out18 [get_bd_pins reg_decoder/out18] [get_bd_pins x18/we]
  connect_bd_net -net reg_decoder_out19 [get_bd_pins reg_decoder/out19] [get_bd_pins x19/we]
  connect_bd_net -net reg_decoder_out20 [get_bd_pins reg_decoder/out20] [get_bd_pins x20/we]
  connect_bd_net -net reg_decoder_out21 [get_bd_pins reg_decoder/out21] [get_bd_pins x21/we]
  connect_bd_net -net reg_decoder_out22 [get_bd_pins reg_decoder/out22] [get_bd_pins x22/we]
  connect_bd_net -net reg_decoder_out23 [get_bd_pins reg_decoder/out23] [get_bd_pins x23/we]
  connect_bd_net -net reg_decoder_out24 [get_bd_pins reg_decoder/out24] [get_bd_pins x24/we]
  connect_bd_net -net reg_decoder_out25 [get_bd_pins reg_decoder/out25] [get_bd_pins x25/we]
  connect_bd_net -net reg_decoder_out26 [get_bd_pins reg_decoder/out26] [get_bd_pins x26/we]
  connect_bd_net -net reg_decoder_out27 [get_bd_pins reg_decoder/out27] [get_bd_pins x27/we]
  connect_bd_net -net reg_decoder_out28 [get_bd_pins reg_decoder/out28] [get_bd_pins x28/we]
  connect_bd_net -net reg_decoder_out29 [get_bd_pins reg_decoder/out29] [get_bd_pins x29/we]
  connect_bd_net -net reg_decoder_out30 [get_bd_pins reg_decoder/out30] [get_bd_pins x30/we]
  connect_bd_net -net reg_decoder_out31 [get_bd_pins reg_decoder/out31] [get_bd_pins x31/we]
  connect_bd_net -net rs1_mux_out0 [get_bd_pins rs1_mux/out0] [get_bd_pins rs1]
  connect_bd_net -net rs2_mux_out0 [get_bd_pins rs2_mux/out0] [get_bd_pins rs2]
  connect_bd_net -net sel_1 [get_bd_pins rd] [get_bd_pins reg_decoder/sel]
  connect_bd_net -net sel_2 [get_bd_pins rAddr1] [get_bd_pins rs1_mux/sel]
  connect_bd_net -net sel_3 [get_bd_pins rAddr2] [get_bd_pins rs2_mux/sel]
  connect_bd_net -net x10_q [get_bd_pins x10/q] [get_bd_pins reg_ila/probe10] [get_bd_pins rs1_mux/in10] [get_bd_pins rs2_mux/in10]
  connect_bd_net -net x11_q [get_bd_pins x11/q] [get_bd_pins reg_ila/probe11] [get_bd_pins rs1_mux/in11] [get_bd_pins rs2_mux/in11]
  connect_bd_net -net x12_q [get_bd_pins x12/q] [get_bd_pins reg_ila/probe12] [get_bd_pins rs1_mux/in12] [get_bd_pins rs2_mux/in12]
  connect_bd_net -net x13_q [get_bd_pins x13/q] [get_bd_pins reg_ila/probe13] [get_bd_pins rs1_mux/in13] [get_bd_pins rs2_mux/in13]
  connect_bd_net -net x14_q [get_bd_pins x14/q] [get_bd_pins reg_ila/probe14] [get_bd_pins rs1_mux/in14] [get_bd_pins rs2_mux/in14]
  connect_bd_net -net x15_q [get_bd_pins x15/q] [get_bd_pins reg_ila/probe15] [get_bd_pins rs1_mux/in15] [get_bd_pins rs2_mux/in15]
  connect_bd_net -net x16_q [get_bd_pins x16/q] [get_bd_pins reg_ila/probe16] [get_bd_pins rs1_mux/in16] [get_bd_pins rs2_mux/in16]
  connect_bd_net -net x17_q [get_bd_pins x17/q] [get_bd_pins reg_ila/probe17] [get_bd_pins rs1_mux/in17] [get_bd_pins rs2_mux/in17]
  connect_bd_net -net x18_q [get_bd_pins x18/q] [get_bd_pins reg_ila/probe18] [get_bd_pins rs1_mux/in18] [get_bd_pins rs2_mux/in18]
  connect_bd_net -net x19_q [get_bd_pins x19/q] [get_bd_pins reg_ila/probe19] [get_bd_pins rs1_mux/in19] [get_bd_pins rs2_mux/in19]
  connect_bd_net -net x1_q [get_bd_pins x1/q] [get_bd_pins reg_ila/probe1] [get_bd_pins rs1_mux/in1] [get_bd_pins rs2_mux/in1]
  connect_bd_net -net x2_q [get_bd_pins x2/q] [get_bd_pins reg_ila/probe2] [get_bd_pins rs1_mux/in2] [get_bd_pins rs2_mux/in2]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins x0/we]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins xlconstant_1/dout] [get_bd_pins pc/we]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins xlconstant_2/dout] [get_bd_pins x0/d]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set clk [ create_bd_port -dir I -type clk clk ]
  set reset [ create_bd_port -dir I reset ]

  # Create instance: Data_Memory_RAM, and set properties
  set block_name data_memory
  set block_cell_name Data_Memory_RAM
  if { [catch {set Data_Memory_RAM [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Data_Memory_RAM eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Register_File
  create_hier_cell_Register_File [current_bd_instance .] Register_File

  # Create instance: ALU
  create_hier_cell_ALU [current_bd_instance .] ALU

  # Create instance: Program_Memory_ROM, and set properties
  set Program_Memory_ROM [ create_bd_cell -type ip -vlnv xilinx.com:ip:dist_mem_gen:8.0 Program_Memory_ROM ]
  set_property -dict [list \
    CONFIG.coefficient_file {/home/dishoungh/workspace/cpu/Sources/COE/RV32I/rv32ui-p-addi.coe} \
    CONFIG.data_width {32} \
    CONFIG.depth {1024} \
    CONFIG.memory_type {rom} \
  ] $Program_Memory_ROM


  # Create instance: Control_Unit, and set properties
  set block_name control_unit
  set block_cell_name Control_Unit
  if { [catch {set Control_Unit [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Control_Unit eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: pc_slice, and set properties
  set pc_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 pc_slice ]
  set_property -dict [list \
    CONFIG.DIN_FROM {9} \
    CONFIG.DOUT_WIDTH {10} \
  ] $pc_slice


  # Create instance: PC_Adder, and set properties
  set block_name cla32
  set block_cell_name PC_Adder
  if { [catch {set PC_Adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $PC_Adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: constant_4, and set properties
  set constant_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 constant_4 ]
  set_property -dict [list \
    CONFIG.CONST_VAL {4} \
    CONFIG.CONST_WIDTH {32} \
  ] $constant_4


  # Create instance: constant_0, and set properties
  set constant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 constant_0 ]
  set_property -dict [list \
    CONFIG.CONST_VAL {0} \
    CONFIG.CONST_WIDTH {1} \
  ] $constant_0


  # Create instance: rd_slice, and set properties
  set rd_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 rd_slice ]
  set_property -dict [list \
    CONFIG.DIN_FROM {11} \
    CONFIG.DIN_TO {7} \
  ] $rd_slice


  # Create instance: rs1_slice, and set properties
  set rs1_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 rs1_slice ]
  set_property -dict [list \
    CONFIG.DIN_FROM {19} \
    CONFIG.DIN_TO {15} \
  ] $rs1_slice


  # Create instance: rs2_slice, and set properties
  set rs2_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 rs2_slice ]
  set_property -dict [list \
    CONFIG.DIN_FROM {24} \
    CONFIG.DIN_TO {20} \
  ] $rs2_slice


  # Create instance: b_src_mux, and set properties
  set block_name mux_d32_s1
  set block_cell_name b_src_mux
  if { [catch {set b_src_mux [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $b_src_mux eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: alu_mem_mux, and set properties
  set block_name mux_d32_s1
  set block_cell_name alu_mem_mux
  if { [catch {set alu_mem_mux [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $alu_mem_mux eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Branch_Block
  create_hier_cell_Branch_Block [current_bd_instance .] Branch_Block

  # Create instance: pc_src_mux, and set properties
  set block_name mux_d32_s1
  set block_cell_name pc_src_mux
  if { [catch {set pc_src_mux [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pc_src_mux eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: lui_mux, and set properties
  set block_name mux_d32_s1
  set block_cell_name lui_mux
  if { [catch {set lui_mux [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $lui_mux eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: lui_constant_0, and set properties
  set lui_constant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 lui_constant_0 ]
  set_property -dict [list \
    CONFIG.CONST_VAL {0} \
    CONFIG.CONST_WIDTH {32} \
  ] $lui_constant_0


  # Create instance: auipc_jal_or, and set properties
  set auipc_jal_or [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 auipc_jal_or ]
  set_property -dict [list \
    CONFIG.C_OPERATION {or} \
    CONFIG.C_SIZE {1} \
  ] $auipc_jal_or


  # Create instance: luimux_pc_mux, and set properties
  set block_name mux_d32_s1
  set block_cell_name luimux_pc_mux
  if { [catch {set luimux_pc_mux [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $luimux_pc_mux eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: b_plus4_mux, and set properties
  set block_name mux_d32_s1
  set block_cell_name b_plus4_mux
  if { [catch {set b_plus4_mux [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $b_plus4_mux eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: wData_mux, and set properties
  set block_name mux_d32_s1
  set block_cell_name wData_mux
  if { [catch {set wData_mux [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $wData_mux eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: PC_mux, and set properties
  set block_name mux_d32_s1
  set block_cell_name PC_mux
  if { [catch {set PC_mux [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $PC_mux eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: PC_mux_concat, and set properties
  set PC_mux_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 PC_mux_concat ]
  set_property -dict [list \
    CONFIG.IN0_WIDTH {31} \
    CONFIG.IN1_WIDTH {1} \
  ] $PC_mux_concat


  # Create instance: res_pc_slice, and set properties
  set res_pc_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 res_pc_slice ]
  set_property -dict [list \
    CONFIG.DIN_FROM {31} \
    CONFIG.DIN_TO {1} \
  ] $res_pc_slice


  # Create instance: ila_instr, and set properties
  set ila_instr [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_instr ]
  set_property -dict [list \
    CONFIG.C_MONITOR_TYPE {Native} \
    CONFIG.C_PROBE0_WIDTH {32} \
  ] $ila_instr


  # Create port connections
  connect_bd_net -net ALU_Carry [get_bd_pins ALU/Carry] [get_bd_pins Branch_Block/Carry]
  connect_bd_net -net ALU_Negative [get_bd_pins ALU/Negative] [get_bd_pins Branch_Block/Negative]
  connect_bd_net -net ALU_Overflow [get_bd_pins ALU/Overflow] [get_bd_pins Branch_Block/Overflow]
  connect_bd_net -net ALU_Zero [get_bd_pins ALU/Zero] [get_bd_pins Branch_Block/Zero]
  connect_bd_net -net ALU_result [get_bd_pins ALU/result] [get_bd_pins Data_Memory_RAM/addr] [get_bd_pins alu_mem_mux/in0]
  connect_bd_net -net Branch_Block_Res [get_bd_pins Branch_Block/BranchTaken] [get_bd_pins pc_src_mux/sel]
  connect_bd_net -net Control_Unit_ALU_Op [get_bd_pins Control_Unit/ALU_Op] [get_bd_pins ALU/opcode]
  connect_bd_net -net Control_Unit_AUIPC [get_bd_pins Control_Unit/AUIPC] [get_bd_pins auipc_jal_or/Op1]
  connect_bd_net -net Control_Unit_BEQ [get_bd_pins Control_Unit/BEQ] [get_bd_pins Branch_Block/BEQ]
  connect_bd_net -net Control_Unit_BGE [get_bd_pins Control_Unit/BGE] [get_bd_pins Branch_Block/BGE]
  connect_bd_net -net Control_Unit_BGEU [get_bd_pins Control_Unit/BGEU] [get_bd_pins Branch_Block/BGEU]
  connect_bd_net -net Control_Unit_BLT [get_bd_pins Control_Unit/BLT] [get_bd_pins Branch_Block/BLT]
  connect_bd_net -net Control_Unit_BLTU [get_bd_pins Control_Unit/BLTU] [get_bd_pins Branch_Block/BLTU]
  connect_bd_net -net Control_Unit_BNE [get_bd_pins Control_Unit/BNE] [get_bd_pins Branch_Block/BNE]
  connect_bd_net -net Control_Unit_B_Src [get_bd_pins Control_Unit/B_Src] [get_bd_pins b_src_mux/sel]
  connect_bd_net -net Control_Unit_Immediate [get_bd_pins Control_Unit/Immediate] [get_bd_pins b_src_mux/in1] [get_bd_pins pc_src_mux/in1]
  connect_bd_net -net Control_Unit_JAL [get_bd_pins Control_Unit/JAL] [get_bd_pins auipc_jal_or/Op2] [get_bd_pins b_plus4_mux/sel]
  connect_bd_net -net Control_Unit_JALR [get_bd_pins Control_Unit/JALR] [get_bd_pins wData_mux/sel] [get_bd_pins PC_mux/sel]
  connect_bd_net -net Control_Unit_LUI [get_bd_pins Control_Unit/LUI] [get_bd_pins lui_mux/sel]
  connect_bd_net -net Control_Unit_MemRead [get_bd_pins Control_Unit/MemRead] [get_bd_pins Data_Memory_RAM/load] [get_bd_pins alu_mem_mux/sel]
  connect_bd_net -net Control_Unit_MemSigned [get_bd_pins Control_Unit/MemSigned] [get_bd_pins Data_Memory_RAM/signext]
  connect_bd_net -net Control_Unit_MemSize [get_bd_pins Control_Unit/MemSize] [get_bd_pins Data_Memory_RAM/size]
  connect_bd_net -net Control_Unit_MemWrite [get_bd_pins Control_Unit/MemWrite] [get_bd_pins Data_Memory_RAM/store]
  connect_bd_net -net Control_Unit_RegWrite [get_bd_pins Control_Unit/RegWrite] [get_bd_pins Register_File/we]
  connect_bd_net -net Data_Memory_RAM_dout [get_bd_pins Data_Memory_RAM/dout] [get_bd_pins alu_mem_mux/in1]
  connect_bd_net -net PC_Adder_sum [get_bd_pins PC_Adder/sum] [get_bd_pins pc_slice/Din] [get_bd_pins luimux_pc_mux/in1] [get_bd_pins wData_mux/in1] [get_bd_pins PC_mux/in0]
  connect_bd_net -net PC_mux_concat_dout [get_bd_pins PC_mux_concat/dout] [get_bd_pins PC_mux/in1]
  connect_bd_net -net PC_mux_out0 [get_bd_pins PC_mux/out0] [get_bd_pins Register_File/PC_In]
  connect_bd_net -net Program_Memory_ROM_spo [get_bd_pins Program_Memory_ROM/spo] [get_bd_pins rd_slice/Din] [get_bd_pins rs1_slice/Din] [get_bd_pins rs2_slice/Din] [get_bd_pins ila_instr/probe0] [get_bd_pins Control_Unit/instr]
  connect_bd_net -net Register_File_PC_Out [get_bd_pins Register_File/PC_Out] [get_bd_pins PC_Adder/a]
  connect_bd_net -net Register_File_rs1 [get_bd_pins Register_File/rs1] [get_bd_pins lui_mux/in0]
  connect_bd_net -net Register_File_rs2 [get_bd_pins Register_File/rs2] [get_bd_pins Data_Memory_RAM/din] [get_bd_pins b_src_mux/in0]
  connect_bd_net -net alu_mem_mux_out [get_bd_pins alu_mem_mux/out0] [get_bd_pins res_pc_slice/Din] [get_bd_pins wData_mux/in0]
  connect_bd_net -net auipc_jal_or_Res [get_bd_pins auipc_jal_or/Res] [get_bd_pins luimux_pc_mux/sel]
  connect_bd_net -net b_plus4_mux_out0 [get_bd_pins b_plus4_mux/out0] [get_bd_pins ALU/b]
  connect_bd_net -net b_src_mux_out [get_bd_pins b_src_mux/out0] [get_bd_pins b_plus4_mux/in0]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins Register_File/clk] [get_bd_pins ila_instr/clk] [get_bd_pins Data_Memory_RAM/clk]
  connect_bd_net -net constant_4_dout [get_bd_pins constant_4/dout] [get_bd_pins pc_src_mux/in0] [get_bd_pins b_plus4_mux/in1]
  connect_bd_net -net constant_5_dout [get_bd_pins constant_0/dout] [get_bd_pins PC_mux_concat/In1] [get_bd_pins PC_Adder/cin]
  connect_bd_net -net lui_constant_0_dout [get_bd_pins lui_constant_0/dout] [get_bd_pins lui_mux/in1]
  connect_bd_net -net lui_mux_out0 [get_bd_pins lui_mux/out0] [get_bd_pins luimux_pc_mux/in0]
  connect_bd_net -net luimux_pc_mux_out0 [get_bd_pins luimux_pc_mux/out0] [get_bd_pins ALU/a]
  connect_bd_net -net negate_1 [get_bd_pins Control_Unit/Negate] [get_bd_pins ALU/negate]
  connect_bd_net -net pc_slice_Dout [get_bd_pins pc_slice/Dout] [get_bd_pins Program_Memory_ROM/a]
  connect_bd_net -net pc_src_mux_out0 [get_bd_pins pc_src_mux/out0] [get_bd_pins PC_Adder/b]
  connect_bd_net -net rd_slice_Dout [get_bd_pins rd_slice/Dout] [get_bd_pins Register_File/rd]
  connect_bd_net -net res_pc_slice_Dout [get_bd_pins res_pc_slice/Dout] [get_bd_pins PC_mux_concat/In0]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins Register_File/arst] [get_bd_pins Data_Memory_RAM/arst]
  connect_bd_net -net rs1_slice_Dout [get_bd_pins rs1_slice/Dout] [get_bd_pins Register_File/rAddr1]
  connect_bd_net -net rs2_slice_Dout [get_bd_pins rs2_slice/Dout] [get_bd_pins Register_File/rAddr2]
  connect_bd_net -net wData_mux_out0 [get_bd_pins wData_mux/out0] [get_bd_pins Register_File/wData]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


