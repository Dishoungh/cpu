----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/03/2023 07:39:25 PM
-- Design Name: 
-- Module Name: d_flip_flop - Custom_Arch
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

entity d_flip_flop is
    port
    (
        D     : in std_logic;   -- D input
        Clk   : in std_logic;   -- Clock signal
        reset : in std_logic;   -- synchronous reset (active high)
        Q     : out std_logic   -- Q output
    );
end d_flip_flop;

architecture Custom_Arch of d_flip_flop is
begin
    process(Clk) is
    begin
        if (rising_edge(Clk)) then -- At rising edge of clock
            if (reset = '1') then  -- If reset is high at rising edge of clock...
                Q <= '0';          -- Reset Q output (0)
            else
                Q <= D;            -- Q follows D (D Flip Flop is transparent)
            end if;
        end if;
    end process;
end architecture;
