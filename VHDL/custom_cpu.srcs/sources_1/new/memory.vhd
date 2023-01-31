----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/03/2023 06:50:57 PM
-- Design Name: 
-- Module Name: memory - Custom_Arch
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory is
    generic
    (
        WIDTH : integer
    );
    port
    (
        Addr        :   in std_logic_vector(WIDTH-1 downto 0);  -- Address to write/read RAM
        Write_Data  :   in std_logic_vector(WIDTH-1 downto 0);  -- Data to write RAM
        Clock       :   in std_logic;
        we          :   in std_logic;                           -- Write enable (Write data to address if 1 | Read if 0)
        Read_Data   :   out std_logic_vector(WIDTH-1 downto 0)
    );
end memory;

architecture Custom_Arch of memory is
    
    Type RAM is Array(0 to 2 ** WIDTH - 1) of std_logic_vector(WIDTH - 1 downto 0); -- Establish RAM size
    
    signal RAM_Block : RAM;
    
begin
    process (Clock)
    begin
        if (rising_edge(Clock)) then
            if (we = '1') then  -- Write Data
                RAM_Block(to_integer(unsigned(Addr))) <= Write_Data;
            end if;
            
            Read_Data <= RAM_Block(to_integer(unsigned(Addr))); -- Read Data
        end if;
    end process;
end Custom_Arch;
