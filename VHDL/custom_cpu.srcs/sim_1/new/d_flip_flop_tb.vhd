----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2023 12:22:46 AM
-- Design Name: 
-- Module Name: d_flip_flop_tb - Behavioral
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

entity d_flip_flop_tb is
end d_flip_flop_tb;

architecture TestBench of d_flip_flop_tb is
    
    component d_flip_flop is
        port
        (
            D     : in std_logic;   -- D input
            Clk   : in std_logic;   -- Clock signal
            reset : in std_logic;   -- synchronous reset (active high)
            Q     : out std_logic   -- Q output
        );
    end component;

    signal d, clk, rst, q : std_logic := '0';

begin

    uut : d_flip_flop port map
    (
        D       => d,
        Clk     => clk,
        reset   => rst,
        Q       => q
    );
    
    -- Send TestBench parameters
    d <= '0', '1' after 30 ns, '0' after 120 ns, '1' after 180 ns;
    clk <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0' after 60 ns, '1' after 70 ns, '0' after 80 ns, '1' after 90 ns, '0' after 100 ns, '1' after 110 ns, '0' after 120 ns, '1' after 130 ns, '0' after 140 ns, '1' after 150 ns, '0' after 160 ns, '1' after 170 ns, '0' after 180 ns, '1' after 190 ns, '0' after 200 ns;
    rst <= '1', '0' after 50 ns, '1' after 170 ns, '0' after 190 ns;

end Testbench;
