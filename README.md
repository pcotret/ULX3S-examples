# ULX3S-examples

Examples for the ULX3S, 85F variant. Taken from: https://github.com/kost/ulx3s-ghdl-examples

**Based on Yosys toolchain with VHDL code! (thanks to the ghdl-yosys plugin)**

```bash
# Check VHDL sources
ghdl -a $(MODULE).vhd
# Synthesize the design
yosys -m ghdl -p 'ghdl $(MODULE); synth_ecp5 -json $(MODULE).json'
# Place and route
nextpnr-ecp5 --85k --json $(MODULE).json --lpf ulx3s_v20.lpf --textcfg ulx3s_out.config
# Generate the bitstream
ecppack ulx3s_out.config ulx3s.bit
# Download to the board
fujprog ulx3s.bit
```

## References

- Default ULX3S project: https://github.com/pcotret/ULX3S-Blinky
- ULX3S toolchain: https://github.com/ulx3s/ulx3s-toolchain
- GHDL/Yosys plugin: https://github.com/ghdl/ghdl-yosys-plugin