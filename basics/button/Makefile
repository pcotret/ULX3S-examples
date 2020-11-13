MODULE:=button
all: bitstream download

bitstream:
	ghdl -a $(MODULE).vhdl
	yosys -m ghdl -p 'ghdl $(MODULE); synth_ecp5 -json $(MODULE).json'
	nextpnr-ecp5 --85k --json $(MODULE).json --lpf ulx3s_v20.lpf --textcfg ulx3s_out.config 
	ecppack ulx3s_out.config ulx3s.bit
download:
	fujprog ulx3s.bit