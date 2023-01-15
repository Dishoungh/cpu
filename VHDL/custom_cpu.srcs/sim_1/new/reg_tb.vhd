----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 07:26:29 PM
-- Design Name: 
-- Module Name: reg_tb - TestBench
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

entity reg_tb is
end reg_tb;

architecture TestBench of reg_tb is
    
    constant width : integer := 32;
    
    component reg is
        generic
        (
            WIDTH : integer
        );
        port
        (
            Din   : in std_logic_vector(WIDTH-1 downto 0); -- Data input
            Clk   : in std_logic;                          -- Clock signal
            reset : in std_logic;                          -- reset signal
            Qout  : out std_logic_vector(WIDTH-1 downto 0) -- Q output
        );
    end component;

    signal inp, outp : std_logic_vector(WIDTH-1 downto 0);
    signal clk, rst  : std_logic;

begin

    uut : reg
    generic map
    (
        WIDTH   => width
    )
    port map
    (
        Din     => inp,
        Clk     => clk,
        reset   => rst,
        Qout    => outp
    );
    
    -- Send TestBench parameters
    inp <= x"2581", x"8711" after 200 ns, x"0F0F0" after 650 ns;
    clk <= '0', '1' after 50 ns, '0' after 100 ns, '1' after 150 ns, '0' after 200 ns, '1' after 250 ns, '0' after 300 ns, '1' after 350 ns, '0' after 400 ns, '1' after 450 ns, '0' after 500 ns, '1' after 550 ns, '0' after 600 ns, '1' after 650 ns, '0' after 700 ns, '1' after 750 ns, '0' after 800 ns, '1' after 850 ns, '0' after 900 ns, '1' after 950 ns;
    rst <= '1', '0' after 30 ns;

end Testbench;