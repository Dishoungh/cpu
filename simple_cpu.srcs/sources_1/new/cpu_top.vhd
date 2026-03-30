----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2026 12:21:19 PM
-- Design Name: 
-- Module Name: cpu_top - Behavioral
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

entity cpu_top is
    generic
    (
        WIDTH : integer
    );
    port
    (
        clk : in std_logic;
        arst : in std_logic;
        res : out std_logic_vector(WIDTH-1 downto 0)
    );
end cpu_top;

architecture Behavioral of cpu_top is

begin

with arst select res <=
    "01010101010101010101010101010101" when '0',
    "00000000000000000000000000000000" when others;

end Behavioral;
