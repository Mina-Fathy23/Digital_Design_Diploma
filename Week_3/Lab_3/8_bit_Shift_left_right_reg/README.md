# 💡 8-bit Bidirectional Shift Register

---

Universal shift register with synchronous reset and directional control.

---

## ⚙️ Specifications

### Inputs:
- **SI**: Serial input
- **clk**: Clock
- **reset**: Asynchronous reset
- **LEFT_RIGHT**: Shift direction (1=right, 0=left)

### Outputs:
- **PO**: Parallel output (8-bit)

### Operation Modes:
- Right shift: MSB←SI, LSB discarded
- Left shift: LSB←SI, MSB discarded
- Reset clears all bits

---