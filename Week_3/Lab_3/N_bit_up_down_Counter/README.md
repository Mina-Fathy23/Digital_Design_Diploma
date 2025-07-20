# 💡 N-bit Up/Down Counter

---

Parameterized synchronous counter with load capability and directional control.

---

## ⚙️ Specifications

### Parameters:
- **WIDTH** (default=3): Counter bit-width

### Inputs:
- **clk**: Clock
- **reset**: Active-low asynchronous reset
- **en_load**: Load enable
- **load**: Parallel load value
- **up_ndown**: Count direction (1=up, 0=down)

### Outputs:
- **cnt**: Counter value

### Functionality:
- Reset → Clears counter
- en_load=1 → Loads parallel value
- up_ndown=1 → Increments
- up_ndown=0 → Decrements

---