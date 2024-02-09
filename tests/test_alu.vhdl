library ieee;
use ieee.std_logic_1164.all;

entity alu_tb is
end alu_tb;

architecture testbench of alu_tb is
    signal clk : std_logic;

    signal alu_a_in : std_logic_vector(7 downto 0);
    signal alu_b_in : std_logic_vector(7 downto 0);
    signal alu_out  : std_logic_vector(7 downto 0);
begin

    ALU_INST : entity alu 
    generic map(

                );
    port map(

            );

    CLK_PROCESS : process(clk)
    begin
        clk <= '0';
        wait for 10ns;
        clk <= '1';
        wait for 10ns;
    end process;

    TB : process
    begin


    end process;


end architecture;
