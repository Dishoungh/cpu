library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pc_tb is
end pc_tb;

architecture Darkstar of pc_tb is
    signal clock    : std_logic := '0';
    signal reset    : std_logic := '1';
    signal data     : std_logic_vector(15 downto 0);
    signal q_out    : std_logic_vector(15 downto 0); 
    
    component program_counter is
        port
        (
            clk : in std_logic;
            rst : in std_logic;
            d   : in std_logic_vector(15 downto 0);
            q   : out std_logic_vector(15 downto 0)
        );
    end component;
begin
    clock <= not clock after 1 ns;
    reset <= '1', '0' after 5 ns;
    
    dut: component program_counter
    port map
    (
        clk => clock,
        rst => reset,
        d   => data,
        q   => q_out
    );
    
    stimulus: process begin
        data <= "0000000000000000";
        wait until (reset = '0');
        
        data <= "0000000000000000";
        wait for 2 ns;
        
        data <= "0000000000000001";
        wait for 2 ns;
        
        data <= "0000000000000100";
        wait for 2 ns;
        
        data <= "0000000000010000";
        wait for 2 ns;
        
        data <= "0000000000010100";
        wait for 2 ns;
        
        data <= "0000001001000000";
        wait for 2 ns;
        
        data <= "0000000100100000";
        wait for 2 ns;
        
        data <= "1100000000100000";
        wait for 2 ns;
        
    end process stimulus;

end Darkstar;
