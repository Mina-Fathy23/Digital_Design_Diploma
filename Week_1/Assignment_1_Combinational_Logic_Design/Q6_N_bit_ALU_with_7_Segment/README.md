# 💡 N-bit ALU with 7-Segment Display Output

---

Implementation of a 4-bit ALU connected to a 7-segment display for hexadecimal output visualization (0-F). Combines arithmetic/logic operations with display decoding.

---

## ⚙️ Specifications

### Inputs:
- **A, B** (4 bits each): Operands
- **opcode** (2 bits): Operation selector
- **clk** (1 bit): Optional clock for sequential display

### Outputs:
- **segments** (7 bits): Display segments (a-g)
- **ALU_result** (4 bits): Raw ALU output

### ALU Operations:
| Opcode | Operation  | Description          |
|--------|------------|----------------------|
| 00     | ADD        | A + B                |
| 01     | SUB        | Bitwise OR           |
| 10     | AND        | A - B                |
| 11     | XOR        | Bitwise XOR          |
