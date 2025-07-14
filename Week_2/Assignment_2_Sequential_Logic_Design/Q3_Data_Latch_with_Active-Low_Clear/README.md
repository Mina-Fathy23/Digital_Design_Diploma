# 💡 Data Latch with Active-Low Clear

---

Level-sensitive latch with asynchronous clear.

---

## ⚙️ Specifications

### Inputs:
- **CLR** (active low)
- **D**: Data
- **G**: Gate

### Truth Table:
| CLR | G | D | Q |
|-----|---|---|---|
| 0 | X | X | 0 |
| 1 | 0 | X | Q₀ |
| 1 | 1 | D | D |

---