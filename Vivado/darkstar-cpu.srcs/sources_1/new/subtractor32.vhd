library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtractor32 is
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
end subtractor32;

architecture Darkstar of subtractor32 is
    --Signals
    signal t: std_logic_vector(WIDTH-2 downto 0);
    
    --Submodules
    component full_subtractor is
        port
        (
            A:      in std_logic;
            B:      in std_logic;
            Bin:    in std_logic;
            Diff:   out std_logic;
            Bout:   out std_logic    
        );
    end component;
begin

    --First Adder
    first_sub: full_subtractor
    port map
    (
        A => A(0),
        B => B(0),
        Bin => '0',
        Diff => Y(0),
        Bout => t(0)
    );
    
    -- Generate the Full Subtractors for each bit
    gen_subtractors: for i in 1 to WIDTH-2 generate
        subtractors: full_subtractor
        port map
        (
            A => A(i),
            B => B(i),
            Bin => t(i-1),
            Diff => Y(i),
            Bout => t(i)
        );
     end generate gen_subtractors;
    
    --Last Adder
    last_subtractor: full_subtractor
    port map
    (
        A => A(WIDTH-1),
        B => B(WIDTH-1),
        Bin => t(WIDTH-2),
        Diff => Y(WIDTH-1)
    );
end Darkstar;
