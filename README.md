# 64-Bit Full Adder with UPduino 3.1 FPGAs
A SystemVerilog implementation of a 64-bit full adder using UPduino 3.1 FPGAs. This project demonstrates a purely combinational adder design using only XOR, AND, and OR gates, without relying on the + operator. The design is fully synthesizable with the iCE40 toolchain (apio / IceStorm / Lattice Radiant).

Each FPGA has 32 configurable I/O pins. Two of these need to be used for the carry-in/out signals to each FPGA, leaving 30 pins. This leaves a maximum of a 10-bit fill adder per UPduino. 
64-bits/10-bits = 6.4 --> 7 FPGAs. 
