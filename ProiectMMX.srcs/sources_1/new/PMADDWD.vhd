library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PMADDWD is
  Port (A,B: in std_logic_vector(63 downto 0);
        Res: out std_logic_vector(63 downto 0));
end PMADDWD;

architecture Behavioral of PMADDWD is

component WallaceTree
  Port (a,b: in std_logic_vector(15 downto 0);
        prod: out std_logic_vector(31 downto 0);
        cout: out std_logic );
end component;

component CP32_Adder
  Port (x,y: in std_logic_vector(31 downto 0);
        cin: in std_logic;
        s: out std_logic_vector(31 downto 0);
        cout: out std_logic
     );
end component;

signal mul1,mul2,mul3,mul4: std_logic_vector(31 downto 0);
signal c1,c2,c3,c4: std_logic;

begin
    multiply1: WallaceTree port map(a => A(15 downto 0), b => B(15 downto 0), prod => mul1, cout => c1);
    multiply2: WallaceTree port map(a => A(31 downto 16), b => B(31 downto 16), prod => mul2, cout => c2);
    multiply3: WallaceTree port map(a => A(47 downto 32), b => B(47 downto 32), prod => mul3, cout => c3);
    multuply4: WallaceTree port map(a=> A(63 downto 48), b => B(63 downto 48), prod => mul4, cout => c4);
    
    add1: CP32_Adder port map(x => mul1, y => mul2, cin=>'0',s => Res(31 downto 0), cout => c1);
    add2: CP32_Adder port map(x => mul3, y => mul4, cin =>'0',s =>Res(63 downto 32), cout => c2); 

end Behavioral;
