----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 05:27:23 PM
-- Design Name: 
-- Module Name: half_subtractor - Custom_Arch
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

entity half_subtractor is
    port
    (
        A           : in std_logic;     -- First operand of half subtractor
        B           : in std_logic;     -- Second operand of half subtractor
        Difference  : out std_logic;    -- Difference of two ops
        Borrow      : out std_logic     -- Borrow bit of subtractor
    );
end half_subtractor;

architecture Custom_Arch of half_subtractor is
    
    signal notA : std_logic;    -- Inverted A signal for AND gate (for Borrow bit)
    
begin
    
    -- Invert A
    notA <= not A;
    
    -- Difference = A xor B
        -- 0 - 0 = 0
        -- 0 - 1 = 1
        -- 1 - 0 = 1
        -- 1 - 1 = 0
        -- Results are exactly the same as XOR gate!!!
    Difference <= A xor B;
    
    -- Borrow = notA and B
    -- Borrow bit is only 1 for the MAXTERM (A = 0 and B = 1)
    Borrow <= notA and B;

end Custom_Arch;
