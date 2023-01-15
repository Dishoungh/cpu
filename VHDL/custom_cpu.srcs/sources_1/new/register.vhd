----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/03/2023 06:50:57 PM
-- Design Name: 
-- Module Name: register - Custom_Arch
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

-- 32 bit register
entity reg is
    generic
    (
        WIDTH : integer
    );
    port
    (
        Din   : in std_logic_vector(WIDTH-1 downto 0); -- Data input
        Clk   : in std_logic;                          -- Clock signal
        reset : in std_logic;                          -- reset signal
        Qout  : out std_logic_vector(WIDTH-1 downto 0) -- Q output
    );
end reg;

architecture Custom_Arch of reg is
    
    component d_flip_flop is
        port
        (
            D     : in std_logic;   -- D input
            Clk   : in std_logic;   -- Clock signal
            reset : in std_logic;   -- synchronous reset (active high)
            Q     : out std_logic   -- Q output
        );
    end component;
    
begin
    gen: for i in 0 to (WIDTH-1) generate
        subcomponent: d_flip_flop port map
        (
            D       => Din(i),
            Clk     => Clk,
            reset   => reset,
            Q       => Qout(i)
        );
    end generate;
    
end architecture;
