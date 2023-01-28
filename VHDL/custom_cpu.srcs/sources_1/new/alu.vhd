----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/03/2023 06:50:57 PM
-- Design Name: 
-- Module Name: alu - Custom_Arch
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


-- ALU Operations:
--      0. Nothing (result = 0)
--      1. Add
--      2. Sub
--      3. Multi
--      4. Logical Shift Left
--      5. Logical Shift Right
--      6. Arithmetic Shift Left
--      7. Arithmetic Shift Right
--      8. Rotate Left
--      9. Rotate Right
--      10. And
--      11. Or
--      12. Xor
entity alu is
    generic
    (
        WIDTH : integer
    );
    port
    (
        A        : in std_logic_vector(WIDTH-1 downto 0);
        B        : in std_logic_vector(WIDTH-1 downto 0);
        opcode   : in std_logic_vector(2 downto 0);
        result   : out std_logic_vector(WIDTH-1 downto 0);
        zero     : out std_logic;
        less     : out std_logic;
        greater  : out std_logic;
        carry    : out std_logic;
        overflow : out std_logic
    );
end alu;

architecture Custom_Arch of alu is
    
    -- Signals
    
    -- Adder Component
    component adder is
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
    end component;
    
    -- Subtractor Component
    component subtractor is
        generic
        (
            WIDTH   : integer
        );
        port
        (
            A           : in std_logic_vector(WIDTH-1 downto 0);    -- A input
            B           : in std_logic_vector(WIDTH-1 downto 0);    -- B input
            Bin         : in std_logic;                             -- Borrow in input
            Difference  : out std_logic_vector(WIDTH-1 downto 0);   -- Difference output
            Bout        : out std_logic;                            -- Borrow out bit
            Overflow    : out std_logic                             -- Overflow bit
        );
    end component;
    
    -- Multiplier Component
    component multiplier is
        generic
        (
            WIDTH  : integer
        );
        port
        (
            A   : in std_logic_vector((WIDTH/2)-1 downto 0);
            B   : in std_logic_vector((WIDTH/2)-1 downto 0);
            Y   : out std_logic_vector(WIDTH-1 downto 0)
        );
    end component;
    
    -- Logical Left Shifter Component
    component logical_shift_left is
        generic
        (
            WIDTH   :   integer
        );
        port
        (
            A   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift
            B   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift A by
            Y   : out std_logic_vector(WIDTH-1 downto 0)    -- Output
        );
    end component;
    
    -- Logical Right Shifter Component
    component logical_shift_right is
        generic
        (
            WIDTH   :   integer
        );
        port
        (
            A   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift
            B   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift A by
            Y   : out std_logic_vector(WIDTH-1 downto 0)    -- Output
        );
    end component;
    
    -- Arithmetic Left Shifter Component
    component arithmetic_shift_left is
        generic
        (
            WIDTH   :   integer
        );
        port
        (
            A   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift
            B   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift A by
            Y   : out std_logic_vector(WIDTH-1 downto 0)    -- Output
        );
    end component;
    
    -- Arthmetic Right Shifter Component
    component arithmetic_shift_right is
        generic
        (
            WIDTH   :   integer
        );
        port
        (
            A   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift
            B   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift A by
            Y   : out std_logic_vector(WIDTH-1 downto 0)    -- Output
        );
    end component;
    
    -- Left Rotation Component
    component rotate_left is
        generic
        (
            WIDTH   :   integer
        );
        port
        (
            A   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift
            B   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift A by
            Y   : out std_logic_vector(WIDTH-1 downto 0)    -- Output
        );
    end component;
    
    -- Right Rotation Component
    component rotate_right is
        generic
        (
            WIDTH   :   integer
        );
        port
        (
            A   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift
            B   : in std_logic_vector(WIDTH-1 downto 0);    -- Value to shift A by
            Y   : out std_logic_vector(WIDTH-1 downto 0)    -- Output
        );
    end component;
    
    -- Comparator
    component comparator is
        generic
        (
            WIDTH   : integer
        );
        port
        (
            A   : in std_logic_vector(WIDTH-1 downto 0);    -- A input
            B   : in std_logic_vector(WIDTH-1 downto 0);    -- B input
            G   : out std_logic;                            -- A greater than B
            L   : out std_logic;                            -- A less than B
            E   : out std_logic                             -- A equal to B    
        );
    end component;
    
    
begin
    

end Custom_Arch;
