# 💡 Parameterized Latch with Async Controls

---

Configurable-width latch with dual asynchronous controls.

---

## ⚙️ Specifications

### Parameters:
- **LAT_WIDTH**: Data width

### Priority:
1. **aclr** (active high, dominant)
2. **aset** (active high)
3. **gate** controlled data

### Behavior:
- aclr=1 → Output=0
- aset=1 → Output=1
- gate=1 → Output=data
- gate=0 → Hold

---