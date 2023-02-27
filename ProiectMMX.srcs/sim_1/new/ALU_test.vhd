
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_test is
 -- Port ( );
end ALU_test;

architecture Behavioral of ALU_test is
component ALU 
  Port (A: in std_logic_vector(63 downto 0);
        B: in std_logic_vector(63 downto 0);
        instruction: in std_logic_vector(2 downto 0);
        ADDSel: in std_logic_vector(7 downto 0);
        ShiftSel: in std_logic_vector(7 downto 0);
        ShiftBTN: in std_logic;
        reset: in std_logic;
        CLK: in std_logic;
        Rez: out std_logic_vector(63 downto 0));
end component;

signal A: std_logic_vector(63 downto 0);
signal B: std_logic_vector(63 downto 0);
signal instruction: std_logic_vector(2 downto 0);
signal ADDSel: std_logic_vector(7 downto 0);
signal ShiftSel: std_logic_vector(7 downto 0);
signal CLK: std_logic;
signal Rez: std_logic_vector(63 downto 0);
signal reset, ShiftBTN: std_logic;

begin
    p: alu port map(A=>A,B=>B,instruction=>instruction, ADDSel=>ADDSel, ShiftSel=>ShiftSel,ShiftBTN=>ShiftBTN, reset=>reset, CLK=>CLK, Rez=>Rez);
    process
    begin
        CLK <= '1'; wait for 10 ns;
        CLK <= '0'; wait for 10 ns;
    end process;
    
    process
    begin
        reset <= '1'; wait for 20 ns;
        reset <= '0'; wait for 500 ns;
    end process;
    
    process
    begin
       A<= x"1607_1200_A000_7007";
       B<= x"0307_0080_A000_EFFA";
         wait for 500 ns;

    end process;
    
    process
    begin
        ShiftBTN <= '1'; wait for 20 ns;
    end process;
    
    
     process
     begin
        instruction <= "000";--addb
        ADDSel <= "00000000";
        wait for 20 ns;
          instruction <= "000";--add
              ADDSel <= "10101010";
              wait for 20 ns;
               instruction <= "000";--add
                           ADDSel <= "01110111";
                           wait for 20 ns;
                            instruction <= "000";--add
                                        ADDSel <= "11111111";
                                        wait for 20 ns;
        
        
        
        instruction <= "001";--and
        wait for 20 ns;
        instruction <= "010";--mul
        wait for 20 ns;
        instruction <= "011";--shift
        ShiftSel <= "11111111";
        wait for 200 ns;
         instruction <= "011";--shift
               ShiftSel <= "01010101";
               wait for 200 ns;
         instruction <= "011";--shift
                      ShiftSel <= "10001000";
                      wait for 200 ns;
                       instruction <= "011";--shift
                             ShiftSel <= "10000000";
                             wait for 200 ns;
        
        instruction <= "100";--compare
        wait for 20 ns;
        instruction <= "101";--move
        wait for 20 ns;
     end process;
    
    

end Behavioral;
