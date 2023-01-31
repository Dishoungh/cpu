----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/28/2023 10:10:48 PM
-- Design Name: 
-- Module Name: 4_to_1-mux - Custom_Arch
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

entity mux_4_to_1 is
    generic
    (
        WIDTH   :   integer
    );
    port
    (
        A       :   in std_logic;
        B       :   in std_logic;
        C       :   in std_logic;
        D       :   in std_logic;
        E       :   in std_logic;
        F       :   in std_logic;
        G       :   in std_logic;
        H       :   in std_logic;
        I       :   in std_logic;
        J       :   in std_logic;
        K       :   in std_logic;
        L       :   in std_logic;
        M       :   in std_logic;
        N       :   in std_logic;
        O       :   in std_logic;
        P       :   in std_logic;
        Sel     :   in std_logic_vector(3 downto 0);
        Output  :   out std_logic
    );
end mux_4_to_1;

architecture Custom_Arch of mux_4_to_1 is

    signal innerA   : std_logic;
    signal innerB   : std_logic;
    signal innerC   : std_logic;
    signal innerD   : std_logic;
    signal innerE   : std_logic;
    signal innerF   : std_logic;
    signal innerG   : std_logic;
    signal innerH   : std_logic;
    signal innerI   : std_logic;
    signal innerJ   : std_logic;
    signal innerK   : std_logic;
    signal innerL   : std_logic;
    signal innerM   : std_logic;
    signal innerN   : std_logic;
    signal innerO   : std_logic;
    signal innerP   : std_logic;
       
begin
    -- Intermediary Signals
    innerA <= (not Sel(3)) and (not Sel(2)) and (not Sel(1)) and (not Sel(0)) and A;    -- Sel = 0000
    innerB <= (not Sel(3)) and (not Sel(2)) and (not Sel(1)) and (Sel(0))     and B;    -- Sel = 0001
    innerC <= (not Sel(3)) and (not Sel(2)) and (Sel(1))     and (not Sel(0)) and C;    -- Sel = 0010
    innerD <= (not Sel(3)) and (not Sel(2)) and (Sel(1))     and (Sel(0))     and D;    -- Sel = 0011
    innerE <= (not Sel(3)) and (Sel(2))     and (not Sel(1)) and (not Sel(0)) and E;    -- Sel = 0100
    innerF <= (not Sel(3)) and (Sel(2))     and (not Sel(1)) and (Sel(0))     and F;    -- Sel = 0101
    innerG <= (not Sel(3)) and (Sel(2))     and (Sel(1))     and (not Sel(0)) and G;    -- Sel = 0110
    innerH <= (not Sel(3)) and (Sel(2))     and (Sel(1))     and (Sel(0))     and H;    -- Sel = 0111
    innerI <= (Sel(3))     and (not Sel(2)) and (not Sel(1)) and (not Sel(0)) and I;    -- Sel = 1000
    innerJ <= (Sel(3))     and (not Sel(2)) and (not Sel(1)) and (Sel(0))     and J;    -- Sel = 1001
    innerK <= (Sel(3))     and (not Sel(2)) and (Sel(1))     and (not Sel(0)) and K;    -- Sel = 1010
    innerL <= (Sel(3))     and (not Sel(2)) and (Sel(1))     and (Sel(0))     and L;    -- Sel = 1011
    innerM <= (Sel(3))     and (Sel(2))     and (not Sel(1)) and (not Sel(0)) and M;    -- Sel = 1100
    innerN <= (Sel(3))     and (Sel(2))     and (not Sel(1)) and (Sel(0))     and N;    -- Sel = 1101
    innerO <= (Sel(3))     and (Sel(2))     and (Sel(1))     and (not Sel(0)) and O;    -- Sel = 1110
    innerP <= (Sel(3))     and (Sel(2))     and (Sel(1))     and (Sel(0))     and P;    -- Sel = 1111
    
    -- Output
    Output <= innerA or innerB or innerC or innerD or innerE or innerF or innerG or innerH or innerI or innerJ or innerK or innerL or innerM or innerN or innerO or innerP;
end Custom_Arch;
