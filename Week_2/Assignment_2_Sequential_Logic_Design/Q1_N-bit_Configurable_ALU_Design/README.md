# 💡 N-bit Configurable ALU Design

---

Parameterized N-bit Arithmetic Logic Unit with 4 operations, supporting randomized verification.

---

## ⚙️ Specifications

### Parameters:
- **N** (default=4): Data width
- **OPCODE** (default=0): Operation selector

### Inputs:
- **In0, In1** (N bits): Operands
- **opcode** (2 bits): Operation control

### Outputs:
- **Out** (N bits): Result

### Operations:
| OPCODE | Operation | Description |
|--------|-----------|-------------|
| 00 | ADD | In0 + In1 |
| 01 | OR | Bitwise OR |
| 10 | SUB | In0 - In1 |
| 11 | XOR | Bitwise XOR |

### Testbenches:
1. N=4, OPCODE=0 (Addition)
2. N=4, OPCODE=1 (OR)
3. N=4, OPCODE=2 (Subtraction)
4. N=4, OPCODE=3 (XOR)

---