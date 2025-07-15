# 5-Stage Pipelined RISC-V Processor (Partial Simulation)

## 🚀 Overview
This project implements a simplified 5-stage pipelined RISC-V processor using Verilog. The current version supports:
- Instruction Fetch (IF)
- Instruction Decode (ID)
- Execute (EX) stage with ALU
- Register File with read/write support
- ADD, SUB, and LW instructions (partially)

## 🧠 Features
- R-type instruction support (ADD, SUB)
- Simulated register file and ALU
- PC increment logic
- Data forwarding and hazard detection to be added

## 🛠 Tech Stack
- Verilog (Icarus Verilog)
- GTKWave (waveform analysis)

## 🚀 How to run
Compile the files using Icarus Verilog:
iverilog -o cpu.vvp *.v
vvp cpu.vvp
gtkwave dump.vcd

## 📷 Waveform Output

The following waveform demonstrates instruction execution for an R-type ADD and SUB operation in a 5-stage RISC-V processor:

- PC steps by 4 each cycle
- ALU correctly computes ADD and SUB
- Result is written back to register file