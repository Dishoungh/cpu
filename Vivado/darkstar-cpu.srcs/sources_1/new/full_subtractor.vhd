library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_subtractor is
port
(
    A:      in std_logic;
    B:      in std_logic;
    Bin:    in std_logic;
    Diff:   out std_logic;
    Bout:   out std_logic    
);
end full_subtractor;

architecture Darkstar of full_subtractor is

    --Signals
    signal hs1_diff:    std_logic;
    signal hs1_bout:    std_logic;
    signal hs2_bout:    std_logic;
    
    --Submodules
    component half_subtractor is
        port
        (
            A:      in std_logic;
            B:      in std_logic;
            Diff:   out std_logic;
            Borrow: out std_logic    
        );
    end component;
    
begin
    
    hs1: half_subtractor
    port map
    (
        A => A,
        B => B,
        Diff => hs1_diff,
        Borrow => hs1_bout
    );
    
    hs2: half_subtractor
    port map
    (
        A => hs1_diff,
        B => Bin,
        Diff => Diff,
        Borrow => hs2_bout
    );
    
    Bout <= hs1_bout or hs2_bout;
    
end Darkstar;
