# 💡 Sequential ALU with Registered Inputs

---

4-operation ALU with pipelined inputs and synchronous reset.

---

## ⚙️ Specifications

### Inputs:
- **A, B**: 4-bit operands
- **opcode**: Operation selector
- **clk**: Clock
- **rst**: Synchronous reset

### Outputs:
- **out**: 8-bit result

### Operations:
| opcode | Operation | 
|--------|-----------|
| 00     | Addition  |
| 01     | Multiplication |
| 10     | Bitwise OR |
| 11     | Bitwise AND |

### Testbench Features:
- Clock generation
- Reset sequence
- Opcode cycling
- Result verification

### Pipeline:
- Inputs registered before operation
- Output registered after operation

---