----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/10/2023 10:34:31 PM
-- Design Name: 
-- Module Name: mux - Custom_Arch
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

entity mux is
    generic
    (
        WIDTH : integer
    );
    port
    (
        A   : in std_logic_vector(WIDTH-1 downto 0);
        B   : in std_logic_vector(WIDTH-1 downto 0);
        Sel : in std_logic;
        O   : out std_logic_vector(WIDTH-1 downto 0)
    );
end mux;

architecture Custom_Arch of mux is

    component one_bit_mux is
        port
        (
            A   : in std_logic;
            B   : in std_logic;
            Sel : in std_logic;
            O   : out std_logic
        );
    end component;
    
begin
    -- Generate n Multiplexers
    gen: for i in 0 to (WIDTH-1) generate
        subcomponent: one_bit_mux port map
        (
            A   => A(i),
            B   => B(i),
            Sel => Sel,
            O   => O(i)
        );
    end generate;
end Custom_Arch;
