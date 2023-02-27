library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MMX is
  Port (CLK: in std_logic;
        BTN: in std_logic_vector(4 downto 0);
        SW: in std_logic_vector(15 downto 0);
        LED:out std_logic_vector(15 downto 0);
        CAT: out std_logic_vector(6 downto 0);
        AN: out std_logic_vector(3 downto 0));
end MMX;

architecture Behavioral of MMX is
component MPG
    Port ( BTN : in STD_LOGIC;
           CLK : in STD_LOGIC;
           enable : inout STD_LOGIC);
end component;

component SSD
    Port ( digit : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component ControlUnit
  Port (SW: in std_logic_vector(12 downto 0);
        AddSel: out std_logic_vector(7 downto 0);
        ShiftSel: out std_logic_vector(7 downto 0);
        RegASel: out std_logic_vector(2 downto 0);
        RegBSel: out std_logic_vector(2 downto 0);
        RegWrite: out std_logic;
        RegWriteSel: out std_logic_vector(2 downto 0);
        instruction: out std_logic_vector(2 downto 0);
        aluSrcB: out std_logic;
        ROMsel: out std_logic_vector(2 downto 0)
        );
end component;

component RegisterFile
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
end component;

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

component ExtendUnit
  Port (A: in std_logic_vector(31 downto 0);
        res: out std_logic_vector(63 downto 0));
end component;

component SSDCounter
  Port (CLK: in std_logic;
        button: in std_logic;
        reset: in std_logic;
        countOut: out std_logic_vector(2 downto 0) );
end component;

component ROM
  Port (addr: in std_logic_vector(2 downto 0);
        data_out: out std_logic_vector(31 downto 0));
end component;

component mux2to1
  Port (a,b: in std_logic_vector(63 downto 0);
        sel: in std_logic;
        result: out std_logic_vector(63 downto 0) );
end component;


signal regEn, reset, ssdEn, shiftEn: std_logic;
signal digit: std_logic_vector(15 downto 0);
signal numberOfByte: std_logic_vector(2 downto 0);
signal MMXresult, regResult: std_logic_vector(63 downto 0);
signal signExt, muxSrcBOut: std_logic_vector(63 downto 0);

--rom signal
signal romOut: std_logic_vector(31 downto 0);
--register signals
signal regOutA, regOutB: std_logic_vector(63 downto 0);
--alu signal
signal aluOut: std_logic_vector(63 downto 0);

--control signals
signal AddSel: std_logic_vector(7 downto 0);
signal ShiftSel: std_logic_vector(7 downto 0);
signal RegASel: std_logic_vector(2 downto 0);
signal RegBSel: std_logic_vector(2 downto 0);
signal RegWrite: std_logic;
signal RegWriteSel: std_logic_vector(2 downto 0);
signal instruction: std_logic_vector(2 downto 0);
signal aluSrcB: std_logic;
signal ROMsel: std_logic_vector(2 downto 0);

--
begin
    monoimpulse1: MPG port map(BTN => BTN(0), CLK => CLK, enable => reset);   --U18
    monoimpulse2: MPG port map(BTN => BTN(1), CLK => CLK, enable => regEn);
    monoimpulse3: MPG port map(BTN => BTN(2), CLK => CLK, enable => ssdEn); --W19
    monoimpulse4: MPG port map(BTN => BTN(3), CLK => CLK, enable => shiftEn); --T17


    control: ControlUnit port map(SW=>SW(12 downto 0), AddSel=>AddSel, ShiftSel=>ShiftSel, RegASel=>RegASel, RegBSel=>RegBSel, 
                                  RegWrite => RegWrite, RegWriteSel => RegWriteSel, instruction=>instruction, aluSrcB => aluSrcB, 
                                  RomSel=>RomSel);
                                                              
    registers: RegisterFile port map(CLK=>CLK,enable=>regEn, reset=>reset, input => aluOut, writeEnable =>RegWrite, writeRegSel => RegWriteSel, regASel=>RegASel, 
                                     regBSel => RegBSel, outA => regOutA, outB => regOutB);   
    mem: ROM port map(addr => ROMSel, data_out => ROMOut);
    extendROMData: extendUnit port map(A=>RomOut, res => SignExt);
    m: mux2to1 port map(a=>regOutB, b=>SignExt, sel=> aluSrcB, result => muxSrcBOut);   
    aluComponent:alu port map(A=>regOutA, B=> muxSrcBOut,instruction => instruction,ShiftBTN=>shiftEn, reset=>reset, AddSel=>AddSel, ShiftSel=>ShiftSel, 
                              CLK => CLK, rez =>aluOut);  
    Counter: SSDCounter port map(CLK=>CLK,button => ssdEn, reset => reset, countOut => numberOfByte);
   
     with SW(15 downto 14) select
           MMXresult <= RegOutA when "00",
                        RegOutB when "01",
                        aluOut when "10",
                        x"aaaaaaaaaaaaaaaa" when others;
    
    process(numberOfByte)
    begin
        case numberOfByte is
            when "000" => digit <= MMXresult(15 downto 0);
            when "001" => digit <= MMXresult(31 downto 16);
            when "010" => digit <= MMXresult(47 downto 32);
            when "011" => digit <= MMXresult(63 downto 48);
            when others => digit<= x"0000";
         end case;
    end process; 
  
  led(15 downto 0) <= sw(15 downto 0);
    
    Digits: SSD port map (digit=>digit, clk => CLK, cat=>cat, an=>an);
end Behavioral;
