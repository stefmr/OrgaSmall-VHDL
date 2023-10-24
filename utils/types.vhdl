library ieee;
use ieee.std_logic_1164.all;

package types is
    
    type flags is record
        C : std_logic;
        Z : std_logic;
        N : std_logic;
    end record;

    type opcode is (
        OP_FETCH,
        OP_ADD,
        OP_ADC,
        OP_SUB,
        OP_AND,
        OP_OR,
        OP_XOR,
        OP_CMP,
        OP_MOV,
        OP_RESERVED_01,
        OP_RESERVED_02,
        OP_RESERVED_03,
        OP_RESERVED_04,
        OP_RESERVED_05,
        OP_RESERVED_06,
        OP_RESERVED_07,
        OP_STR_M,
        OP_LOAD_M,
        OP_STR_R,
        OP_LOAD_R,
        OP_JMP,
        OP_JC,
        OP_JZ,
        OP_JN,
        OP_INC,
        OP_DEC,
        OP_SHR,
        OP_SHL,
        OP_RESERVED_08,
        OP_RESERVED_09,
        OP_RESERVED_10,
        OP_SET
    );

end package;
