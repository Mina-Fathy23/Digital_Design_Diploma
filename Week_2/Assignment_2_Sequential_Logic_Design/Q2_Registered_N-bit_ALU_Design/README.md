# 💡 Registered N-bit ALU Design

---

Sequential version of the ALU with clocked output and synchronous reset.

---

## ⚙️ Specifications

### New Features:
- **clk**: Clock input
- **rst**: Synchronous reset (active high)
- Output registered on clock edges

### Behavior:
- All operations from combinational ALU preserved
- Output updates on rising clock edge when not reset
- Reset clears output synchronously

---