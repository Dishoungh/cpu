----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/27/2023 08:11:10 PM
-- Design Name: 
-- Module Name: arithmetic_shift_right - Custom_Arch
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity arithmetic_shift_right is
    generic
    (
        WIDTH   :   integer
    );
    port
    (
        A   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift
        B   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift A by
        Y   : out std_logic_vector(WIDTH-1 downto 0)    -- Output
    );
end arithmetic_shift_right;

architecture Custom_Arch of arithmetic_shift_right is

begin
    -- Using barrel shifting
    Y <= std_logic_vector(shift_right(signed(A), to_integer(unsigned(B))));
end Custom_Arch;
