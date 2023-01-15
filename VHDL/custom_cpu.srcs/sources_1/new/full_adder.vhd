----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 05:27:23 PM
-- Design Name: 
-- Module Name: full_adder - Custom_Arch
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

entity full_adder is
    port
    (
        A    : in std_logic;    -- First operand of FA
        B    : in std_logic;    -- Second operand of FA
        Cin  : in std_logic;    -- Carry in bit
        Sum  : out std_logic;   -- Sum (A + B)
        Cout : out std_logic    -- Carry out bit
    );
end full_adder;

architecture Custom_Arch of full_adder is
    
    signal HA1_Sum  : std_logic;    -- Intermediate Sum Signal
    signal HA1_Cout : std_logic;    -- Intermediate Cout Signal
    signal HA2_Cout : std_logic;    -- Cout from Second HA for final Cout value
    
    component half_adder is
        port
        (
            A    : in std_logic;     -- First operand of half adder
            B    : in std_logic;     -- Second operand of half adder
            Sum  : out std_logic;    -- Sum of First and Second Op
            Cout : out std_logic     -- Carry out bit
        );
    end component;
    
begin
    -- Generate First Half Adder
    HA1: half_adder port map
    (
        A       => A,
        B       => B,
        Sum     => HA1_Sum,
        Cout    => HA1_Cout
    );
    
    -- Generate Second Half Adder
    HA2: half_adder port map
    (
        A       => HA1_Sum,
        B       => Cin,
        Sum     => Sum,
        Cout    => HA2_Cout
    );
    
    -- Cout = HA1_Cout or HA2_Cout
    Cout <= HA1_Cout or HA2_Cout;
    
end Custom_Arch;
