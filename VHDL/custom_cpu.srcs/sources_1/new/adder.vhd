----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/10/2023 11:06:33 PM
-- Design Name: 
-- Module Name: adder - Custom_Arch
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

entity adder is
    generic
    (
        WIDTH   : integer
    );
    port
    (
        A        : in std_logic_vector(WIDTH-1 downto 0);    -- A input
        B        : in std_logic_vector(WIDTH-1 downto 0);    -- B input
        Cin      : in std_logic;                             -- Carry in bit
        Sum      : out std_logic_vector(WIDTH-1 downto 0);   -- Sum output
        Cout     : out std_logic;                            -- Carry out bit
        Overflow : out std_logic                             -- Overflow bit
    );
end adder;

architecture Custom_Arch of adder is
    
    signal carry : std_logic_vector(WIDTH downto 0);  -- Holding all carry bits for the n FA's
    
    component full_adder is
        port
        (
            A    : in std_logic;
            B    : in std_logic;
            Cin  : in std_logic;
            Sum  : out std_logic;
            Cout : out std_logic
        );
    end component;
    
begin
    -- Hold Cin to first carry in bit
    carry(0) <= Cin;
    
    -- Generate FA array
    gen: for i in 0 to (WIDTH-1) generate
        subcomponent: full_adder
        port map
        (
            A       => A(i),
            B       => B(i),
            Cin     => carry(i),
            Sum     => Sum(i),
            Cout    => carry(i+1)
        );
    end generate;
    
    -- Final Cout value
    Cout <= carry(WIDTH);
    
    -- Overflow = carry(WIDTH) xor carry(WIDTH-1)
    Overflow <= carry(WIDTH) xor carry(WIDTH-1);

end Custom_Arch;
