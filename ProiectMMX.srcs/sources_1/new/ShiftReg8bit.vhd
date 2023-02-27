library ieee; 
use ieee.std_logic_1164.all; 
 
entity ShiftReg8bit is 
  port( CLK,
        SI : in  std_logic; 
        input: in std_logic_vector(7 downto 0);
        res: out std_logic_vector(7 downto 0);
        sel: in std_logic_vector(1 downto 0); 
        SO : out std_logic); 
end ShiftReg8bit; 
architecture archi of ShiftReg8bit is 
  signal tmp: std_logic_vector(7 downto 0); 
  begin 
    process (CLK) 
      begin 
        if (CLK'event and CLK='1') then 
            if sel = "11" then --octetul de la care se face shiftarea
                tmp <= input(7) & input(7 downto 1); 
                else if sel = "10" then -- octetii care se modifica
                    tmp <= SI & input(7 downto 1);
                        else if sel = "00" then -- octetii care nu se modifica
                            tmp <= input;
                        end if;
                end if;
            end if;
        end if; 
    end process; 
    SO <= input(0);
    res <= tmp; 
end archi;