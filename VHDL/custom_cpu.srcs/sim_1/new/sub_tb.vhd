----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 09:25:42 PM
-- Design Name: 
-- Module Name: sub_tb - TestBench
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

entity sub_tb is
end sub_tb;

architecture TestBench of sub_tb is

    constant width : integer := 32;
    
    component subtractor is
        generic
        (
            WIDTH   : integer
        );
        port
        (
            A           : in std_logic_vector(WIDTH-1 downto 0);    -- A input
            B           : in std_logic_vector(WIDTH-1 downto 0);    -- B input
            Bin         : in std_logic;                             -- Carry in bit
            Difference  : out std_logic_vector(WIDTH-1 downto 0);   -- Difference output
            Bout        : out std_logic                             -- Carry out bit  
        );
    end component;
    
    signal a, b, diff    : std_logic_vector(WIDTH-1 downto 0);
    signal bi, bo       : std_logic;
    
begin
    uut : subtractor
    generic map
    (
        WIDTH   => width
    )
    port map
    (
        A           => a,
        B           => b,
        Bin         => bi,
        Difference  => diff,
        Bout        => bo
    );
    
    -- Send TestBench parameters
    a   <= x"00000776";
    b   <= x"00000002", x"00000233" after 800 ns, x"00001007" after 850 ns;
    bi  <= '0', '1' after 900 ns;

end TestBench;
