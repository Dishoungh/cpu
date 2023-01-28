----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 10:07:35 PM
-- Design Name: 
-- Module Name: demux - Custom_Arch
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

entity demux is
    generic
    (
        WIDTH : integer
    );
    port
    (
        A   : in std_logic_vector(WIDTH-1 downto 0);
        Sel : in std_logic;
        O1  : out std_logic_vector(WIDTH-1 downto 0);
        O2  : out std_logic_vector(WIDTH-1 downto 0)
    );
end demux;

architecture Custom_Arch of demux is
    
    component one_bit_demux is
        port
        (
            A   : in std_logic;
            Sel : in std_logic;
            O1  : out std_logic;
            O2  : out std_logic
        );
    end component;
     
begin
    -- Generate n Demultiplexers
    gen: for i in 0 to (WIDTH-1) generate
        subcomponent: one_bit_demux port map
        (
            A   => A(i),
            Sel => Sel,
            O1  => O1(i),
            O2  => O2(i)
        );
    end generate;
end Custom_Arch;
