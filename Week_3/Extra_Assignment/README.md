# 💡 Advanced 4-bit Counter with Clock Division

---

## Section 1: Synchronous Counter with Async Set & Frequency Division

### 💡 Enhanced 4-bit Binary Counter

---

Integrated design combining synchronous counting, asynchronous control, and clock division outputs.

---

### ⚙️ Specifications

#### Inputs:
- **clk**: Clock input
- **set_n**: Async active-low set (forces output to 1111)
- **rst**: Synchronous reset (optional extension)

#### Outputs:
- **out[3:0]**: Binary count (0→15)
- **div_2**: 50% input frequency (derived from out[0])
- **div_4**: 25% input frequency (derived from out[1])

#### Core Features:
1. **Counting Logic**:
   - Synchronous increment on rising clock edges
   - Automatic rollover at maximum value (15)
   - Asynchronous set overrides counting

2. **Frequency Division**:
   - div_2 = out[0] (toggles at half clock rate)
   - div_4 = out[1] (toggles at quarter clock rate)

3. **Verification**:
   - Golden reference: Ripple counter from Assignment 3
   - Self-checking testbench validates:
     - Async set functionality
     - Binary count sequence
     - Clock division ratios
     - Signal phase relationships

#### Performance Characteristics:
- Maximum operational frequency: Dependent on target technology
- Setup/hold times: Meets standard synchronous design requirements

---

## Section 2: 2-bit Gray Code Counter

### 💡 Binary-to-Gray Conversion Counter

---

Synchronous Gray code generator with binary counter core.

---

### ⚙️ Specifications

#### Inputs:
- **clk**: Clock
- **rst**: Synchronous reset

#### Outputs:
- **gray_out[1:0]**: Gray code sequence (00→01→11→10)

#### Conversion Logic:
- gray_out[1] = binary[1]
- gray_out[0] = binary[1] ^ binary[0]

#### Testbench:
- Reset sequence validation
- Gray code transition checking
- Consecutive value single-bit change verification

---

*Note: All designs include RTL verification with 0 lint errors and functional testbenches with coverage metrics.*