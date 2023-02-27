library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PSRA is
  Port (
        CLK: std_logic;
        A: in std_logic_vector(63 downto 0); 
        B: in std_logic_vector(63 downto 0);
        sel: in std_logic_vector(7 downto 0);
        btn: in std_logic;
        reset: in std_logic;
        result: out std_logic_vector(63 downto 0)
        );
end PSRA;

architecture Behavioral of PSRA is

component shift is 
  port(CLK: in std_logic;
       reset: in std_logic;
       enable: in std_logic;
       sel: in std_logic;
       SI: in std_logic;
       ALOAD : in std_logic; 
       D   : in std_logic_vector(7 downto 0); 
       o: out std_logic_vector(7 downto 0);
       SO  : out std_logic); 
end component; 

component shiftCounter
  Port (CLK: in std_logic;
        B: in std_logic_vector(4 downto 0);
        button: in std_logic;
        reset: in std_logic;
        enable: out std_logic);
end component;

signal so1,so2,so3,so4,so5,so6,so7,so0: std_logic;
signal ALOAD: std_logic;
signal tmp: std_logic_vector(63 downto 0);
signal r: std_logic_vector(63 downto 0);
signal enable: std_logic;
begin
       process(reset)
       begin
            if reset = '1' then
                ALOAD <= '1';
                tmp <= A;
            else
                ALOAD <= '0';
            end if;
       end process;               
       
        counter: shiftCounter port map(CLK=>CLk,B=>B(4 downto 0), button=>btn, reset=>reset,enable=>enable); 
        p8: Shift port map(CLK=>CLK, reset => reset,ALOAD =>ALOAD, SI=>'0', D=>A(63 downto 56), sel=>sel(7), SO=>so7,o=>r(63 downto 56), enable=>enable);
        p7: Shift port map(CLK=>CLK,reset => reset,ALOAD =>ALOAD, SI=>so7, D=>A(55 downto 48), sel=>sel(6), SO=>so6,o=>r(55 downto 48), enable=>enable);
        p6: Shift port map(CLK=>CLK,reset => reset,ALOAD =>ALOAD, SI=>so6, D=>A(47 downto 40),sel=>sel(5), SO=>so5, o=>r(47 downto 40), enable=>enable);
        p5: Shift port map(CLK=>CLK,reset => reset,ALOAD =>ALOAD, SI=>so5, D=>A(39 downto 32), sel=>sel(4), SO=>so4, o => r(39 downto 32), enable=>enable);
        p4: Shift port map(CLK=>CLK,reset => reset,ALOAD =>ALOAD, SI=>so4, D=>A(31 downto 24), sel=>sel(3), SO=>so3, o => r(31 downto 24), enable=>enable);
        p3: Shift port map(CLK=>CLK,reset => reset,ALOAD =>ALOAD, SI=>so3, D=>A(23 downto 16), sel=>sel(2), SO=>so2, o => r(23 downto 16), enable=>enable);
        p2: Shift port map(CLK=>CLK,reset => reset,ALOAD =>ALOAD, SI=>so2, D=>A(15 downto 8), sel=>sel(1), SO=>so1, o => r(15 downto 8), enable=>enable);
        p1: Shift port map(CLK=>CLK,reset => reset,ALOAD =>ALOAD, SI=>so1, D=>A(7 downto 0), sel=>sel(0), SO=>so0, o => r(7 downto 0), enable=>enable);
        
        
        result <= r;

end Behavioral;
