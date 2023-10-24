library ieee;
use ieee.std_logic_1164.all;

use work.types.all;

entity alu is
    generic(
        WORD_SIZE : natural := 8
    );
    port(
        alu_a_in  : in std_logic_vector(WORD_SIZE - 1 downto 0);
        alu_b_in  : in std_logic_vector(WORD_SIZE - 1 downto 0);

        op_in     : in opcode;

        alu_flags : out std_logic(2 downto 0);
        alu_r_out : out std_logic_vector(WORD_SIZE - 1 downto 0)
    );
end entity;

architecture Behavioural of alu is
    signal alu_a_tmp    : unsigned(WORD_SIZE downto 0);
    signal alu_b_tmp    : unsigned(WORD_SIZE downto 0);
    signal alu_out_tmp  : unsigned(WORD_SIZE downto 0);

    signal flag_regs    : flags;
begin

    process(clk, rst, alu_out_tmp)
    begin
        if (rst = '1') then
            flag_regs <= "000";
        elsif (clk'event and clk='1') then
            flag_regs.N <= alu_out_tmp(WORD_SIZE - 1);
            flag_regs.C <= alu_out_tmp(WORD_SIZE);
            flag_regs.Z <= not or(alu_out_tmp(WORD_SIZE - 1 downto 0);
        end if;
    end process;

    process(op_in)
    begin
        case op_in is
            when OP_ADD     => alu_out_tmp <= alu_a_tmp + alu_b_tmp;
            when OP_ADC     => alu_out_tmp <= alu_a_tmp + alu_b_tmp + flag_regs.C;
            when OP_SUB     => alu_out_tmp <= alu_a_tmp - alu_b_tmp;
            when OP_AND     => alu_out_tmp <= alu_a_tmp and alu_b_tmp;
            when OP_OR      => alu_out_tmp <= alu_a_tmp or  alu_b_tmp;
            when OP_XOR     => alu_out_tmp <= alu_a_tmp xor alu_b_tmp;
            when OP_CMP     => alu_out_tmp <= alu_a_tmp - alu_b_tmp;
            when OP_INC     => alu_out_tmp <= alu_a_tmp + 1;
            when OP_DEC     => alu_out_tmp <= alu_a_tmp - 1;
            when OP_SHR     => alu_out_tmp <= alu_a_in(WORD_SIZE - 2 downto 0) & '0';
            when OP_SHL     => alu_out_tmp <= '0' & alu_a_in(WORD_SIZE - 2 downto 0);
            when others     => alu_out_tmp <= (others => '0');
        end case;
    end process;

    alu_a_tmp <= unsigned(alu_a_in, WORD_SIZE + 1);
    alu_b_tmp <= unsigned(alu_b_in, WORD_SIZE + 1);
    alu_flags <= flag_regs;
    alu_r_out <= alu_out_tmp(WORD_SIZE - 1 downto 0);

end architecture;
