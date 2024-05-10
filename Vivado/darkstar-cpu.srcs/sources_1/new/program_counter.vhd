library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_counter is
port
(
    clk:    in std_logic;
    rst:    in std_logic;
    d:      in std_logic_vector(15 downto 0);
    q:      out std_logic_vector(15 downto 0)
);
end program_counter;

architecture Darkstar of program_counter is
begin
    process (clk)
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                q <= "0000000000000000";
            else
                q <= d;
            end if;
       end if;
    end process;
end Darkstar;
