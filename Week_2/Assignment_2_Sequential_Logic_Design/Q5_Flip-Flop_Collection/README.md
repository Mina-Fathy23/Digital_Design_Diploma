# 💡 Flip-Flop Collection

---

Three FF implementations with async reset.

---

## ⚙️ Specifications

### A) T-FlipFlop:
- **t**: Toggle control
- **rstn**: Async reset (active low)

### B) D-FlipFlop:
- Standard with async reset

### C) Parameterized FF:
- **FF_TYPE**:
  - "DFF": Data mode
  - "TFF": Toggle mode

### Common:
- All have q/qbar outputs
- Reset forces q=0, qbar=1

---