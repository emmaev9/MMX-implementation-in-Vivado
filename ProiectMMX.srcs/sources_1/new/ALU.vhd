
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
  Port (A: in std_logic_vector(63 downto 0);
        B: in std_logic_vector(63 downto 0);
        instruction: in std_logic_vector(2 downto 0);
        ADDSel: in std_logic_vector(7 downto 0);
        ShiftSel: in std_logic_vector(7 downto 0);
        ShiftBTN: in std_logic;
        reset: in std_logic;
        CLK: in std_logic;
        Rez: out std_logic_vector(63 downto 0));
end ALU;

architecture Behavioral of ALU is

component PCMPEQW 
  Port (A,B: in std_logic_vector(63 downto 0);
        Res: out std_logic_vector(63 downto 0));      
end component;

component ADD
  Port (A: in std_logic_vector(63 downto 0);
        B: in std_logic_vector(63 downto 0);
        sel: in std_logic_vector(7 downto 0);
        sum: out std_logic_vector(63 downto 0));
end component;

component PSRA
  Port (
        CLK: std_logic;
        A: in std_logic_vector(63 downto 0); 
        B: in std_logic_vector(63 downto 0);
        sel: in std_logic_vector(7 downto 0);
        btn: in std_logic;
        reset: in std_logic;
        result: out std_logic_vector(63 downto 0)
        );
end component;

component PAND 
  Port (A,B: in std_logic_vector(63 downto 0);
        result: out std_logic_vector(63 downto 0));
end component;

component PMADDWD
  Port (A,B: in std_logic_vector(63 downto 0);
        Res: out std_logic_vector(63 downto 0));
end component;

component mux8to1
  Port (sel: in std_logic_vector(2 downto 0);
        a,b,c,d,e,f,g,h: in std_logic_vector(63 downto 0);
        aluMuxOut: out std_logic_vector(63 downto 0)
   );
end component;


signal ADD_result, PAND_result, PMADDWD_result, PSRA_result,PCMPEQW_result, MOVD_result: std_logic_vector(63 downto 0):=x"0000000000000000";
signal shiftCount: std_logic_vector(4 downto 0);
signal SSel: std_logic_vector(15 downto 0);
signal A1,A2,A3,A4,A5: std_logic_vector(63 downto 0):=A;
signal B1,B2,B3,B4,B5: std_logic_vector(63 downto 0):=B;

begin
    adunare: ADD port map(A=>A,B=>B,sel=>AddSel,sum=>ADD_result);   
    si: PAND port map(A=>A,B=>B, result=>PAND_result);   
    inmultire: PMADDWD port map(A=>A2,B=>B2,res=> PMADDWD_result);  
    comparatie:PCMPEQW port map(A=>A1, B=>B1, Res=>PCMPEQW_result);           
    shiftare: PSRA port map(CLK=>CLK,A=>A,B=>B,sel=>ShiftSel,btn=>ShiftBtn, reset=>reset, result=>PSRA_result);  
    aluMux: mux8to1 port map(sel=>instruction, a=>ADD_result, b=>PAND_result, c=>PMADDWD_result, d=>PSRA_result, e =>PCMPEQW_result, f => B, 
                             g=>x"0000000000000000", h=>x"0000000000000000", aluMuxOut => Rez);
                             
    --Rez <= ADD_result;
    
end Behavioral;
