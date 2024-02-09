TOPLEVEL_LANG = vhdl
SIM = ghdl 
COMPILE_ARGS += -2008
STD_VERSION = 08
SIM_ARGS += -t ps
GUI=0

VHDL_SOURCES += ./utils/types.vhdl \
				./rtl/alu/alu.vhdl

TOPLEVEL=alu

##MODULE := test_kara_mul_comb


##COCOTB=$(shell cocotb-config --makefiles)
##include $(COCOTB)/Makefile.sim

analize:
	ghdl -a --std=$(STD_VERSION) $(VHDL_SOURCES)

elaborate:
	ghdl -e --std=$(STD_VERSION) $(TOPLEVEL)

clean:
	rm *.cf
