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
        a   : in std_logic_vector(WIDTH-1 downto 0);
        b   : in std_logic_vector(WIDTH-1 downto 0);
        sel : in std_logic;
        o   : out std_logic_vector(WIDTH-1 downto 0)
    );
end mux;

architecture Custom_Arch of mux is

begin
    -- VHDL's version of a case statement
    with sel select
        o <= a when '0',
             b when others;
end Custom_Arch;
