----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 05:27:23 PM
-- Design Name: 
-- Module Name: half_adder - Custom_Arch
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

entity half_adder is
    port
    (
        A    : in std_logic;     -- First operand of half adder
        B    : in std_logic;     -- Second operand of half adder
        Sum  : out std_logic;    -- Sum of First and Second Op
        Cout : out std_logic     -- Carry out bit
    );
end half_adder;

architecture Custom_Arch of half_adder is

begin
    -- Sum = A xor B
    Sum <= A xor B;
    
    -- Cout = A and B
    Cout <= A and B;

end Custom_Arch;
