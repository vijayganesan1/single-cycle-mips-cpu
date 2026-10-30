# Single-Cycle MIPS CPU (Verilog)

A 32-bit single-cycle MIPS-style processor written in Verilog and simulated with Icarus Verilog.

## Supported instructions
- R-type: `add`, `sub`, `and`, `or`, `slt`
- Memory: `lw`, `sw`

## Modules
Program counter, instruction memory, main control, ALU control, register file,
sign extender, ALU, data memory, and the muxes that tie them together.

## Test program
| PC | Instruction | Result |
|----|-------------|--------|
| 0  | add $t2,$t1,$t0 | $t2 = 4 |
| 4  | sub $t2,$t1,$t0 | $t2 = 2 |
| 8  | and $t2,$t1,$t0 | $t2 = 1 |
| 12 | sw $t1,4($s0)   | Mem[4] = 3 |
| 16 | lw $t2,4($s0)   | $t2 = 3 |
| 20 | add $t3,$t1,$t2 | $t3 = 6 |

## Run
iverilog -g2012 -o cpu_sim *.v
vvp cpu_sim
gtkwave cpu.vcd
