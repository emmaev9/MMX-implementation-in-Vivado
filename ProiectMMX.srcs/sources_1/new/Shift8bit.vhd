library ieee; 
use ieee.std_logic_1164.all; 
entity shift is 
  port(CLK: in std_logic;
       reset: in std_logic;
       enable: std_logic;
       sel: in std_logic;
       SI: in std_logic;
       ALOAD : in std_logic; 
       D   : in std_logic_vector(7 downto 0); 
       o: out std_logic_vector(7 downto 0);
       SO  : out std_logic); 
end shift; 
architecture archi of shift is 
 component d_ff
  port(
    clk : in STD_LOGIC;
    din : in STD_LOGIC;
    reset : in STD_LOGIC;
    enable: in STD_LOGIC;   
    dout : out STD_LOGIC
);
end component;

   
  signal q0,q1,q2,q3,q4,q5,q6,q7,q8: std_logic;
  signal tmp: std_logic_vector(7 downto 0); 
  signal din: std_logic;
  signal signif: std_logic;
  
  begin  
  
    
    process (ALOAD, CLK, sel,enable) 
    begin 
    
        if (ALOAD='1') then 
          tmp <= D;
          signif <= tmp(7);          

        elsif CLK'Event and CLK = '1' then
            if enable = '0' then
                    tmp(0) <= tmp(0);
                    tmp(1) <= tmp(1);
                    tmp(2) <= tmp(2);
                    tmp(3) <= tmp(3);
                    tmp(4) <= tmp(4);
                    tmp(5) <= tmp(5);
                    tmp(6) <= tmp(6);
                    tmp(7) <= tmp(7);
            else
                   tmp(0) <= tmp(1);
                   tmp(1) <= tmp(2);
                   tmp(2) <= tmp(3);
                   tmp(3) <= tmp(4);
                   tmp(4) <= tmp(5);
                   tmp(5) <= tmp(6);
                   tmp(6) <= tmp(7);
                   if sel = '1' then
                        tmp(7) <= signif;
                   elsif sel = '0' then
                      tmp(7) <= SI;
                   end if;
            end if;
        end if;
    end process;
    
   -- tmp <= D when ALOAD = '1';
   -- signif <= tmp(7) when ALOAD = '1';
     
  --  forGen: for i in 6 to 0 generate
   --     p: d_ff port map(CLK =>CLK, din=>tmp(i), reset =>reset, dout => tmp(i+1), enable=>enable);
  -- end generate forGen; 
  --  q8 <= signif when sel = '1' else 
  --                    SI     when sel = '0';
   
    
  --  d8: d_ff port map(CLK=>CLK, din => tmp(1), reset=>reset, dout => tmp(0), enable => enable);
  --  d7: d_ff port map(CLK=>CLK, din => tmp(2), reset=>reset, dout => tmp(1), enable => enable);
 --  d6: d_ff port map(CLK=>CLK, din => tmp(3), reset=>reset, dout => tmp(2), enable => enable);
 --  d5: d_ff port map(CLK=>CLK, din => tmp(4), reset=>reset, dout => tmp(3), enable => enable );
 --  d4: d_ff port map(CLK=>CLK, din => tmp(5), reset=>reset, dout => tmp(4), enable => enable);
 --   d3: d_ff port map(CLK=>CLK, din => tmp(6), reset=>reset, dout => tmp(5), enable => enable);
 --   d2: d_ff port map(CLK=>CLK, din => tmp(7), reset=>reset, dout => tmp(6), enable => enable);
 --  d1: d_ff port map(CLK=>CLK, din => q8, reset=>reset, dout => tmp(7), enable => enable);
  
    o <= tmp;    
    SO <= tmp(0);

end archi; 