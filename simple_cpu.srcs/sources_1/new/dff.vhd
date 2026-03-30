----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2026 05:24:17 PM
-- Design Name: 
-- Module Name: dff - Behavioral
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

entity dff is
    port
    (
        clk : in std_logic;
        arst : in std_logic;
        d : in std_logic;
        q : out std_logic
    );
end dff;

architecture Behavioral of dff is

begin

process(clk, arst)
begin
    if (arst = '1') then
        q <= '0';
    elsif (rising_edge(clk)) then
        q <= d;
    end if;
end process;

end Behavioral;
