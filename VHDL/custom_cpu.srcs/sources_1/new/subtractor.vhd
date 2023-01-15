----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 05:27:23 PM
-- Design Name: 
-- Module Name: subtractor - Custom_Arch
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

entity subtractor is
    generic
    (
        WIDTH   : integer
    );
    port
    (
        A           : in std_logic_vector(WIDTH-1 downto 0);    -- A input
        B           : in std_logic_vector(WIDTH-1 downto 0);    -- B input
        Bin         : in std_logic;                             -- Borrow in input
        Difference  : out std_logic_vector(WIDTH-1 downto 0);   -- Difference output
        Bout        : out std_logic;                            -- Borrow out bit
        Overflow    : out std_logic                             -- Overflow bit
    );
end subtractor;

architecture Custom_Arch of subtractor is
    
    signal borrow : std_logic_vector(WIDTH downto 0); --Holding all borrow bits for the n FS's
    
    component full_subtractor is
        port
        (
            A           : in std_logic;
            B           : in std_logic;
            Bin         : in std_logic;
            Difference  : out std_logic;
            Bout        : out std_logic
        );
    end component;
    
begin
    -- Hold Bin to first borrow in bit
    borrow(0) <= Bin;
    
    -- Generate FS array
    gen: for i in 0 to (WIDTH-1) generate
        subcomponent: full_subtractor port map
        (
            A           => A(i),
            B           => B(i),
            Bin         => borrow(i),
            Difference  => Difference(i),
            Bout        => borrow(i+1)
        );
    end generate;
    
    -- Final Bout value
    Bout <= borrow(WIDTH);
    
    -- Overflow = borrow(WIDTH) xor borrow(WIDTH-1)
    Overflow <= borrow(WIDTH) xor borrow(WIDTH-1);
end Custom_Arch;
