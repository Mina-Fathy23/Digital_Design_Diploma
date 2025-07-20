# 💡 Sequential Counter Designs Assignment

---

## Section 1: 4-bit Synchronous Counter with Async Set

### 💡 Binary Counter (0-15) with Forced Set

---

Synchronous 4-bit counter with asynchronous active-low set control.

---

### ⚙️ Specifications

#### Inputs:
- **clk**: Clock input
- **set_n**: Async active-low set (forces all bits high)

#### Outputs:
- **out[3:0]**: Counter value (0→15)

#### Key Features:
- Synchronous counting on clock edges
- Asynchronous set overrides counting
- Self-rollover at 15
- Golden reference: Ripple counter from Assignment 3

#### Testbench:
- Instantiates both counters
- Verifies sync/async behavior
- Checks count sequence integrity

---

## Section 2: Extended Clock Divider Counter

### 💡 Frequency Division Enhancement

---

4-bit counter with additional clock division outputs.

---

### ⚙️ Specifications

#### New Outputs:
- **div_2**: 50% input frequency (from out[0])
- **div_4**: 25% input frequency (from out[1])

#### Implementation:
- Reuses base counter from Section 1
- Taps specific counter bits for division
- No additional logic required

#### Testbench:
- Frequency measurement checks
- Phase alignment verification
- Duty cycle validation

---

## Section 3: 2-bit Gray Code Counter

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

*Note: All testbenches include self-checking mechanisms with golden references where applicable.*