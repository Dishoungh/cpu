library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.env.finish;

entity add_tb is
end add_tb;

architecture Darkstar of add_tb is
    signal a         : std_logic_vector(31 downto 0);
    signal b         : std_logic_vector(31 downto 0);
    signal c         : std_logic_vector(31 downto 0);
    signal WIDTH     : integer := 32;
    
    component adder32 is
        port
        (
            A:      in std_logic_vector(WIDTH-1 downto 0);
            B:      in std_logic_vector(WIDTH-1 downto 0);
            Y:      out std_logic_vector(WIDTH-1 downto 0)
        );
    end component;
begin
    uut: component adder32
    port map
    (
        A => a,
        B => b,
        Y => c
    );
    
    stimulus: process begin
        a <= "11111111111111111111111111110010";
        b <= "00000000000000000000000000000101";
        wait for 5 ns;
        a <= "00000000000000000000000011001100";
        b <= "10000000000000000000000000110011";
        wait for 5 ns;
        finish;
    end process stimulus;
end Darkstar;
