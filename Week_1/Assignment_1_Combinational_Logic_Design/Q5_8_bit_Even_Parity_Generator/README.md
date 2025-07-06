# 💡 8-Bit Even Parity Generator Design 

---

Implementation of an even parity generator using Verilog/VHDL continuous assignment (`assign` statement). The module calculates a parity bit for error detection and appends it to the original data.

---

## ⚙️ Specifications

### Input:
- **A** (8 bits): Data input bus (A[7:0])

### Output:
- **out_with_parity** (9 bits): {Original data, parity bit} (A[7:0], parity_bit)

### Key Features:
- Uses reduction XOR operator for parity calculation
- Concatenation to append parity bit as LSB
- Pure combinational logic
