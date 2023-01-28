----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2023 08:05:16 PM
-- Design Name: 
-- Module Name: one-bit_demux - Custom_Arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity one_bit_demux is
    port
    (
        A   : in std_logic;
        Sel : in std_logic;
        O1  : out std_logic;
        O2  : out std_logic
    );
end one_bit_demux;

architecture Custom_Arch of one_bit_demux is

begin
    O1 <= A and (not Sel);
    O2 <= A and Sel;
end Custom_Arch;
