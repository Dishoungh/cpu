library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_subtractor is
port
(
    A:      in std_logic;
    B:      in std_logic;
    Diff:   out std_logic;
    Borrow: out std_logic    
);
end half_subtractor;

architecture Darkstar of half_subtractor is

begin
    Diff    <= A xor B;
    Borrow  <= (not A) and B;
end Darkstar;

