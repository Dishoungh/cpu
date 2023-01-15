----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/03/2023 06:50:57 PM
-- Design Name: 
-- Module Name: alu - Custom_Arch
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

entity alu is
    generic
    (
        WIDTH : integer := 32
    );
    port
    (
        op1   : in std_logic_vector(WIDTH-1 downto 0);
        op2   : in std_logic_vector(WIDTH-1 downto 0);
        sel   : in std_logic_vector(2 downto 0);
        res   : out std_logic_vector(WIDTH-1 downto 0);
        zero  : out std_logic
    );
end alu;

architecture Custom_Arch of alu is

begin
    

end Custom_Arch;
