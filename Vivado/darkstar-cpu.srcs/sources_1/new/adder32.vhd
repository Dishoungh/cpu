library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder32 is
generic
(
    WIDTH:  integer := 32
);
port
(
    A:      in std_logic_vector(WIDTH-1 downto 0);
    B:      in std_logic_vector(WIDTH-1 downto 0);
    Y:      out std_logic_vector(WIDTH-1 downto 0)
);
end adder32;

architecture Darkstar of adder32 is
    --Signals
    signal t: std_logic_vector(WIDTH-2 downto 0);
    
    --Submodules
    component full_adder is
        port
        (
            A:      in std_logic;
            B:      in std_logic;
            Cin:    in std_logic;
            S:      out std_logic;
            Cout:   out std_logic
        );
    end component;
begin

    --First Adder
    first_adder: full_adder
    port map
    (
        A => A(0),
        B => B(0),
        Cin => '0',
        S => Y(0),
        Cout => t(0)
    );
    
    -- Generate the Full Adders for each bit
    gen_adders: for i in 1 to WIDTH-2 generate
        adder: full_adder
        port map
        (
            A => A(i),
            B => B(i),
            Cin => t(i-1),
            S => Y(i),
            Cout => t(i)
        );
     end generate gen_adders;
    
    --Last Adder
    last_adder: full_adder
    port map
    (
        A => A(WIDTH-1),
        B => B(WIDTH-1),
        Cin => t(WIDTH-2),
        S => Y(WIDTH-1)
    );
end Darkstar;
