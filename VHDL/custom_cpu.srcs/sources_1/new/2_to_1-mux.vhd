----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/28/2023 10:06:16 PM
-- Design Name: 
-- Module Name: 2_to_1-mux - Custom_Arch
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

entity mux_2_to_1 is
    generic
    (
        WIDTH   :   integer
    );
    port
    (
        A       :   in std_logic;
        B       :   in std_logic;
        Sel     :   in std_logic;
        Output  :   out std_logic
    );
end mux_2_to_1;

architecture Custom_Arch of mux_2_to_1 is

begin
    Output  <=  ((not Sel) and A) or (Sel and B);
end Custom_Arch;
