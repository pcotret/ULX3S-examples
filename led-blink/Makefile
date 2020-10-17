bitstream:
	ghdl -a led_blink.vhd
	yosys -m ghdl -p 'ghdl led_blink; synth_ecp5 -json led_blink.json'
	nextpnr-ecp5 --85k --json led_blink.json --lpf ulx3s_v20.lpf --textcfg ulx3s_out.config 
	ecppack ulx3s_out.config ulx3s.bit
download:
	fujprog ulx3s.bit
all: bitstream download