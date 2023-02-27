library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegisterFile is
 port(
    CLK         : in  std_logic;
    enable      : in std_logic;
    reset      : in std_logic;
    input       : in  std_logic_vector(63 downto 0);
    writeEnable : in  std_logic;
    regASel     : in  std_logic_vector(2 downto 0);
    regBSel     : in  std_logic_vector(2 downto 0);
    writeRegSel : in  std_logic_vector(2 downto 0);
    outA        : out std_logic_vector(63 downto 0);
    outB        : out std_logic_vector(63 downto 0)
    );
end RegisterFile;

architecture Behavioral of RegisterFile is

signal A,B: std_logic_vector(63 downto 0);
type registerFile is array(0 to 7) of std_logic_vector(63 downto 0);
signal registers : registerFile := (
 0=>x"1607_1200_a000_7007",
 1=>x"0307_f080_a000_effa",
 2=>x"0000_0000_0000_0007",
  3=>x"0000000000000000",
  4=>x"0000000000000000",
  5=>x"0000000000000000",
  6=>x"0000000000000000",  
  7=>x"0000000000000000",
  others =>x"0000000000000000" );

begin
    regFile : process (CLK, reset,writeEnable) is
    begin

    if reset = '1' then
        registers <= (
         0=>x"1607_1200_a000_7007",
         1=>x"0307_f080_a000_effa",
         2=>x"0000_0000_0000_0007",
         3=>x"0000000000000000",
         4=>x"0000000000000000",
         5=>x"0000000000000000",
         6=>x"0000000000000000",  
         7=>x"0000000000000000",
      others =>x"0000000000000000" );
  
    
    elsif rising_edge(CLK) then
      -- Read A and B before bypass
       A <= registers(to_integer(unsigned(regASel)));
       B <= registers(to_integer(unsigned(regBSel)));
      -- Write and bypass
      if enable = '1' and writeEnable = '1' then
        registers(to_integer(unsigned(writeRegSel))) <= input;  -- Write
        if regASel = writeRegSel then  -- Bypass for read A
          A <= input;
        end if;
        if regBSel = writeRegSel then  -- Bypass for read B
          B <= input;
        end if;
      end if;
    end if;
    outA<=A;
    outB<=B;
  end process;

end Behavioral;
