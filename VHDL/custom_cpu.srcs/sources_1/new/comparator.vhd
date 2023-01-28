----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 10:07:35 PM
-- Design Name: 
-- Module Name: comparator - Custom_Arch
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

entity comparator is
    generic
    (
        WIDTH   : integer
    );
    port
    (
        A   : in std_logic_vector(WIDTH-1 downto 0);    -- A input
        B   : in std_logic_vector(WIDTH-1 downto 0);    -- B input
        G   : out std_logic;                            -- A greater than B
        L   : out std_logic;                            -- A less than B
        E   : out std_logic                             -- A equal to B    
    );
end comparator;

architecture Custom_Arch of comparator is

begin
    G <= '1' when (A > B) else '0';
    L <= '1' when (A < B) else '0';
    E <= '1' when (A = B) else '0';
end Custom_Arch;
