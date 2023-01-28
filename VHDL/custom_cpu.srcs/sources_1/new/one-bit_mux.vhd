----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2023 08:05:16 PM
-- Design Name: 
-- Module Name: one-bit_mux - Custom_Arch
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

entity one_bit_mux is
    port
    (
        A   : in std_logic;
        B   : in std_logic;
        Sel : in std_logic;
        O   : out std_logic
    );
end one_bit_mux;

architecture Custom_Arch of one_bit_mux is

    signal nSA : std_logic;
    signal SB  : std_logic;
    
begin
    nSA <= A and (not Sel);
    SB  <= B and Sel;
    O   <= nSA or SB;
end Custom_Arch;
