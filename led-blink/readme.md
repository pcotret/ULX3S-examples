# LED blink example

Simple LED blink example : one LED blinks at 1Hz (given that the reference clock is 25 MHz).

**Based on Yosys toolchain with VHDL code! (thanks to the ghdl-yosys plugin)**

```bash
# Check VHDL sources
ghdl -a led_blink.vhd
# Synthesize the design
yosys -m ghdl -p 'ghdl led_blink; synth_ecp5 -json led_blink.json'
# Place and route
nextpnr-ecp5 --85k --json led_blink.json --lpf ulx3s_v20.lpf --textcfg ulx3s_out.config
# Generate the bitstream
ecppack ulx3s_out.config ulx3s.bit
# Download to the board
fujprog ulx3s.bit
```

