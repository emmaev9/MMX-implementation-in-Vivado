library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD is
  Port (A: in std_logic_vector(63 downto 0);
        B: in std_logic_vector(63 downto 0);
        sel: in std_logic_vector(7 downto 0);
        sum: out std_logic_vector(63 downto 0));
end ADD;

architecture Behavioral of ADD is

component CPA_en
  Port (x,y: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        s: out std_logic_vector(7 downto 0);
        cout: out std_logic;
        enable: in std_logic);
end component;

component mux2to1_1bit
 Port (a: in std_logic;
       sel: in std_logic;
       muxOut:out std_logic);
end component;

signal c1,c2,c3,c4,c5,c6,c7,c8: std_logic;
signal cout1,cout2,cout3,cout4,cout5,cout6,cout7,cout8: std_logic;
begin
    s1: CPA_en port map(x => A(7 downto 0), y => B(7 downto 0), cin => '0', s => sum(7 downto 0), cout => c1,enable => '1');
        mux1: mux2to1_1bit port map(a => c1, sel=> sel(0), muxOut => cout1); 
    
    s2: CPA_en port map(x => A(15 downto 8), y => B(15 downto 8), cin => cout1, s => sum(15 downto 8), cout => c2,enable => '1');
        mux2: mux2to1_1bit port map(a => c2, sel=> sel(1), muxOut => cout2); 

    s3: CPA_en port map(x => A(23 downto 16), y=> B(23 downto 16), cin => cout2, s => sum(23 downto 16), cout => c3,enable => '1');
        mux3: mux2to1_1bit port map(a => c3, sel=> sel(2), muxOut => cout3); 

    s4: CPA_en port map(x => A(31 downto 24), y=> B(31 downto 24), cin => cout3, s => sum(31 downto 24), cout => c4,enable => '1');
        mux4: mux2to1_1bit port map(a => c4, sel=> sel(3), muxOut => cout4); 

    s5: CPA_en port map(x => A(39 downto 32), y=> B(39 downto 32), cin => cout4, s => sum(39 downto 32), cout => c5,enable => '1');
        mux5: mux2to1_1bit port map(a => c5, sel=> sel(4), muxOut => cout5); 

    s6: CPA_en port map(x => A(47 downto 40), y=> B(47 downto 40), cin => cout5, s => sum(47 downto 40), cout => c6,enable => '1');
        mux6: mux2to1_1bit port map(a => c6, sel=> sel(5), muxOut => cout6); 

    s7: CPA_en port map(x => A(55 downto 48), y=> B(55 downto 48), cin => cout6, s => sum(55 downto 48), cout => c7,enable => '1');
        mux7 :mux2to1_1bit port map(a => c7, sel=> sel(6), muxOut => cout7); 

    s8: CPA_en port map(x => A(63 downto 56), y=> B(63 downto 56), cin => cout7,s => sum(63 downto 56), cout => c8,enable => '1');    
        mux8: mux2to1_1bit port map(a => c8, sel=> sel(7), muxOut => cout8); 

    

end Behavioral;
