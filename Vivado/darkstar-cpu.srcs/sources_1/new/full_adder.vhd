library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
port
(
    A:      in std_logic;
    B:      in std_logic;
    Cin:    in std_logic;
    S:      out std_logic;
    Cout:   out std_logic
);
end full_adder;

architecture Darkstar of full_adder is

    --Signals
    signal ha1_sum: std_logic;
    signal ha1_cout: std_logic;
    signal ha2_cout: std_logic;
    
    -- Submodules
    component half_adder is
        port
        (
            A:      in std_logic;
            B:      in std_logic;
            S:      out std_logic;
            Cout:   out std_logic
        );
    end component;

begin

    ha1: half_adder
    port map
    (
        A => A,
        B => B,
        S => ha1_sum,
        Cout => ha1_cout
    );
    
    ha2: half_adder
    port map
    (
        A => ha1_sum,
        B => Cin,
        S => S,
        Cout => ha2_cout
    );
    
    Cout <= ha1_cout or ha2_cout;
    
end Darkstar;
