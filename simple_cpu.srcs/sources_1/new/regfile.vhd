----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2026 04:50:47 PM
-- Design Name: 
-- Module Name: regfile - Behavioral
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

entity regfile is
    generic
    (
        WIDTH: integer
    );
    port
    (
        clk : in std_logic;
        arst : in std_logic;
        w_data : in std_logic_vector(WIDTH-1 downto 0);
        wen : in std_logic;
        rd : in std_logic_vector(4 downto 0);
        rs1 : in std_logic_vector(4 downto 0);
        rs2 : in std_logic_vector(4 downto 0);
        pc_in : in std_logic_vector(WIDTH-1 downto 0);
        pc_out : out std_logic_vector(WIDTH-1 downto 0);
        data_out1 : out std_logic_vector(WIDTH-1 downto 0);
        data_out2 : out std_logic_vector(WIDTH-1 downto 0)
    );
end regfile;

architecture Behavioral of regfile is

begin


end Behavioral;
