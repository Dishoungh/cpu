----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2023 08:42:32 PM
-- Design Name: 
-- Module Name: immedate_generator - Custom_Arch
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

entity immedate_generator is
    generic
    (
        WIDTH_IN  : integer;
        WIDTH_OUT : integer
    );
    port
    (
        A : in std_logic_vector(WIDTH_IN-1 downto 0);
        O : out std_logic_vector(WIDTH_OUT-1 downto 0)  
    );
    
end immedate_generator;

architecture Custom_Arch of immedate_generator is

begin
    -- Concatenate Zeros with input
    O <= "0" & A;
end Custom_Arch;
