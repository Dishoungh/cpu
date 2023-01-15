----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 05:27:23 PM
-- Design Name: 
-- Module Name: full_subtractor - Custom_Arch
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

entity full_subtractor is
    port
    (
        A           : in std_logic;     -- First operand of FS
        B           : in std_logic;     -- Second operand of FS
        Bin         : in std_logic;     -- Borrow in bit
        Difference  : out std_logic;    -- Difference (A - B)
        Bout        : out std_logic     -- Borrow out bit
    );
end full_subtractor;

architecture Custom_Arch of full_subtractor is
    
    signal HS1_Diff : std_logic;        -- Intermediate Difference Signal
    signal HS1_Bout : std_logic;        -- Intermediate Bout Signal
    signal HS2_Bout : std_logic;        -- Bout from Second HS for final Bout value
    
    component half_subtractor is
        port
        (
            A           : in std_logic;     -- First operand of half subtractor
            B           : in std_logic;     -- Second operand of half subtractor
            Difference  : out std_logic;    -- Difference of two ops
            Borrow      : out std_logic     -- Borrow bit of subtractor
        );
    end component;
    
begin
    -- Generate First Half Subtractor
    HS1: half_subtractor port map
    (
        A           => A,
        B           => B,
        Difference  => HS1_Diff,
        Borrow      => HS1_Bout
    );
    
    -- Generate Second Half Subtractor
    HS2: half_subtractor port map
    (
        A           => HS1_Diff,
        B           => Bin,
        Difference  => Difference,
        Borrow      => HS2_Bout
    );
    
    -- Bout = HS1_Bout or HS2_Bout
    Bout <= HS1_Bout or HS2_Bout;

end Custom_Arch;
