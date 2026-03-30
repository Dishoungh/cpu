----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2026 05:46:34 PM
-- Design Name: 
-- Module Name: register - Behavioral
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

entity reg is
    generic
    (
        WIDTH : integer
    );
    port
    (
        clk : in std_logic;
        arst : in std_logic;
        d : in std_logic_vector(WIDTH-1 downto 0);
        q : out std_logic_vector(WIDTH-1 downto 0)
    );
end reg;

architecture Behavioral of reg is

begin

-- Generate D Flip Flop Array
gen_dff_array: for i in 0 to (WIDTH-1) generate

    flip_flop: entity work.dff
        port map
        (
            clk => clk,
            arst => arst,
            d => d(i),
            q => q(i)
        );

end generate gen_dff_array;


end Behavioral;
