----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2026 12:55:26 PM
-- Design Name: 
-- Module Name: cpu_tb - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cpu_tb is
end cpu_tb;

architecture Simulation of cpu_tb is
    -- Constants
    constant clock_period : time := 1 ns;
    constant WIDTH : integer := 32;
    
    -- UUT Signals
    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal in_data : std_logic_vector(WIDTH-1 downto 0) := x"DEADBEEF";
    signal out_data : std_logic_vector(WIDTH-1 downto 0);

begin

-- UUT Instantiation
--uut: entity work.cpu_top
--generic map
--(
--    WIDTH => 32
--)
--port map
--(
--    clk => clock,
--    arst => reset,
--    res => result
--);

uut: entity work.reg
generic map
(
    WIDTH => WIDTH  
)
port map
(
    clk => clock,
    arst => reset,
    d => in_data,
    q => out_data
);

clock_process: process
begin
    while true loop
        clock <= '0';
        wait for 500 ps;
        clock <= '1';
        wait for 500 ps;
    end loop;
end process;

test: process
begin
    wait for 50 ns;
    reset <= '1';
    wait for 50 ns;
    reset <= '0';
    wait for 10 ns;
    in_data <= x"00000000";
    wait for 10 ns;
    in_data <= x"55555555";
    wait for 10 ns;
    in_data <= x"01234567";
    wait for 10 ns;
    in_data <= x"89ABCDEF";
    wait for 10 ns;
    in_data <= x"99777799";
    wait for 10 ns;
    in_data <= x"ABFF7735";
    wait for 10 ns;
    in_data <= x"0505E7E7";
    wait for 10 ns;
    in_data <= x"BEEFDEAD";
    wait for 10 ns;
    in_data <= x"80000001";
    wait for 10 ns;
    in_data <= x"FFFFFFFF";
    wait for 50 ns;
    stop(0);
end process;
end Simulation;
