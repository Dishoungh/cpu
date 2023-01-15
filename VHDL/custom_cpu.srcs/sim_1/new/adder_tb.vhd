----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 07:26:29 PM
-- Design Name: 
-- Module Name: adder_tb - TestBench
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

entity adder_tb is
end adder_tb;

architecture TestBench of adder_tb is

    constant width : integer := 32;
    
    component adder is
        generic
        (
            WIDTH   : integer
        );
        port
        (
            A        : in std_logic_vector(WIDTH-1 downto 0);    -- A input
            B        : in std_logic_vector(WIDTH-1 downto 0);    -- B input
            Cin      : in std_logic;                             -- Carry in bit
            Sum      : out std_logic_vector(WIDTH-1 downto 0);   -- Sum output
            Cout     : out std_logic;                            -- Carry out bit
            Overflow : out std_logic                             -- Overflow bit  
        );
    end component;
    
    signal a, b, sum    : std_logic_vector(WIDTH-1 downto 0);
    signal ci, co, over : std_logic;
    
begin
    uut : adder
    generic map
    (
        WIDTH   => width
    )
    port map
    (
        A           => a,
        B           => b,
        Cin         => ci,
        Sum         => sum,
        Cout        => co,
        Overflow    => over 
    );
    
    -- Send TestBench parameters
    a   <= x"00000776";
    b   <= x"00000002", x"FFFFF889" after 800 ns;
    ci  <= '0', '1' after 900 ns;

end TestBench;
