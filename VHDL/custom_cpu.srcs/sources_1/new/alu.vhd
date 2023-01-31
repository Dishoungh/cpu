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
--      13. Not A
entity alu is
    generic
    (
        WIDTH : integer
    );
    port
    (
        A        : in std_logic_vector(WIDTH-1 downto 0);
        B        : in std_logic_vector(WIDTH-1 downto 0);
        opcode   : in std_logic_vector(3 downto 0);
        result   : out std_logic_vector(WIDTH-1 downto 0);
        zero     : out std_logic;
        less     : out std_logic;
        greater  : out std_logic;
        carry    : out std_logic;
        overflow : out std_logic
    );
end alu;

architecture Custom_Arch of alu is
    
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
    
    -- Adder Signals
    signal adderSum             : std_logic_vector(WIDTH-1 downto 0);
    signal adderCout            : std_logic;
    signal adderOverflow        : std_logic;
    
    ---------------------------------------------------------------------------------------------
    
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
    
    -- Subtractor Signals
    signal subtractorDiff       : std_logic_vector(WIDTH-1 downto 0);
    signal subtractorBout       : std_logic;
    signal subtractorOverflow   : std_logic;
    
    ---------------------------------------------------------------------------------------------
    
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
    
    -- Multiplier Signals
    signal multiplierOutput     : std_logic_vector(WIDTH-1 downto 0);
    
    ---------------------------------------------------------------------------------------------
    
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
    
    -- LLS Signals
    signal llsOutput            : std_logic_vector(WIDTH-1 downto 0);
    
    ---------------------------------------------------------------------------------------------
    
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
    
    -- LRS Signals
    signal lrsOutput            : std_logic_vector(WIDTH-1 downto 0);
    
    ---------------------------------------------------------------------------------------------
    
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
    
    -- ALS Signals
    signal alsOutput            : std_logic_vector(WIDTH-1 downto 0);
    
    ---------------------------------------------------------------------------------------------
    
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
    
    -- ARS Signals
    signal arsOutput            : std_logic_vector(WIDTH-1 downto 0);
    
    ---------------------------------------------------------------------------------------------
    
    -- Left Rotation Component
    component left_rotate is
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
    
    -- Left Rotation Signals
    signal leftRotOutput        : std_logic_vector(WIDTH-1 downto 0);
    
    ---------------------------------------------------------------------------------------------
    
    -- Right Rotation Component
    component right_rotate is
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
    
    -- Left Rotation Signals
    signal rightRotOutput       : std_logic_vector(WIDTH-1 downto 0);
    
    ---------------------------------------------------------------------------------------------
    
    -- Comparator
    component comparator is
        generic
        (
            WIDTH   : integer
        );
        port
        (
            A   : in std_logic_vector(WIDTH-1 downto 0);    -- A input
            G   : out std_logic;                            -- A greater than B
            L   : out std_logic;                            -- A less than B
            E   : out std_logic                             -- A equal to B    
        );
    end component;
    
    ---------------------------------------------------------------------------------------------
    
    -- 4 to 1 Multiplexer
    component mux_4_to_1 is
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
    end component;
    
    ---------------------------------------------------------------------------------------------
    
    -- Miscellaneous Signals
    signal andOut               : std_logic_vector(WIDTH-1 downto 0);
    signal orOut                : std_logic_vector(WIDTH-1 downto 0);
    signal xorOut               : std_logic_vector(WIDTH-1 downto 0);
    signal invertedOut          : std_logic_vector(WIDTH-1 downto 0);
    
    ---------------------------------------------------------------------------------------------
    
begin
    -- Instantiate Adder
    add: adder
    generic map
    (
        WIDTH       =>  WIDTH
    )
    port map
    (
        A           =>  A,
        B           =>  B,
        Cin         =>  '0',
        Sum         =>  adderSum,
        Cout        =>  adderCout,
        Overflow    =>  adderOverflow
    );
    
    -- Instantiate Subtractor
    sub: subtractor
    generic map
    (
        WIDTH       =>  WIDTH
    )
    port map
    (
        A           =>  A,
        B           =>  B,
        Bin         =>  '0',
        Difference  =>  subtractorDiff,
        Bout        =>  subtractorBout,
        Overflow    =>  subtractorOverflow
    );
    
    -- Instantiate Multiplier
    mult: multiplier
    generic map
    (
        WIDTH       =>  WIDTH
    )
    port map
    (
        A           =>  A((WIDTH/2)-1 downto 0),
        B           =>  B((WIDTH/2)-1 downto 0),
        Y           =>  multiplierOutput
    );
    
    -- Instantiate LLS
    lls: logical_shift_left
    generic map
    (
        WIDTH       =>  WIDTH
    )
    port map
    (
        A           =>  A,
        B           =>  B,
        Y           =>  llsOutput
    );
    
    -- Instantiate LRS
    lrs: logical_shift_right
    generic map
    (
        WIDTH       =>  WIDTH
    )
    port map
    (
        A           =>  A,
        B           =>  B,
        Y           =>  lrsOutput
    );
    
    -- Instantiate ALS
    als: arithmetic_shift_left
    generic map
    (
        WIDTH       =>  WIDTH
    )
    port map
    (
        A           =>  A,
        B           =>  B,
        Y           =>  alsOutput
    );
    
    
    -- Instantiate ARS
    ars: arithmetic_shift_right
    generic map
    (
        WIDTH       =>  WIDTH
    )
    port map
    (
        A           =>  A,
        B           =>  B,
        Y           =>  arsOutput
    );
    
    -- Instantiate Left Rotation
    lRot: left_rotate
    generic map
    (
        WIDTH       =>  WIDTH
    )
    port map
    (
        A           =>  A,
        B           =>  B,
        Y           =>  leftRotOutput
    );
    
    -- Instantiate Right Rotation
    rRot: right_rotate
    generic map
    (
        WIDTH       =>  WIDTH
    )
    port map
    (
        A           =>  A,
        B           =>  B,
        Y           =>  rightRotOutput
    );
    
    -- Instantiate A-B Comparator
    AB_Comp: comparator
    generic map
    (
        WIDTH       =>  WIDTH
    )
    port map
    (
        A           =>  subtractorDiff,
        G           =>  greater,
        L           =>  less,
        E           =>  zero
    );
    
    -- Generate n 4-to-1 Mux
    gen: for i in 0 to (WIDTH-1) generate
        subcomponent: mux_4_to_1
        generic map
        (
            WIDTH       =>  WIDTH
        )
        port map
        (
            A           =>  '0',
            B           =>  adderSum(i),
            C           =>  subtractorDiff(i),
            D           =>  multiplierOutput(i),
            E           =>  llsOutput(i),
            F           =>  lrsOutput(i),
            G           =>  alsOutput(i),
            H           =>  arsOutput(i),
            I           =>  leftRotOutput(i),
            J           =>  rightRotOutput(i),
            K           =>  andOut(i),
            L           =>  orOut(i),
            M           =>  xorOut(i),
            N           =>  invertedOut(i),
            O           =>  '0',
            P           =>  '0',
            Sel         =>  opcode,
            Output      =>  result(i)
        );
    end generate;
    
    -- Carry output
    carry       <=  adderCout or subtractorBout;
    
    -- Overflow output
    overflow    <=  adderOverflow or subtractorOverflow;
    
    -- AND
    andOut      <=  A and B;
    
    -- OR
    orOut       <=  A or B;
    
    -- XOR
    xorOut      <=  A xor B;
    
    -- Invert
    invertedOut <= not A;
    
end Custom_Arch;
