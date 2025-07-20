# 💡 Sequential Logic Design Assignment

---

## Section 1: DFF with Clock Enable & Preset Verification

### 💡 Testbench for D Flip-Flop with Controls

---

Self-checking testbench for DFF with enable and asynchronous preset.

---

### ⚙️ Specifications

#### Design Under Test:
- **D_FF.v** module
- Features:
  - Clock enable (E)
  - Active-low preset (PRE_n)
  - Positive-edge triggered

#### Testbench Features:
- Reset sequence verification
- Clock enable validation
- Preset functionality testing
- Randomized input stimulus
- Self-checking assertions

---

## Section 2: Parameterized Flip-Flop Verification

### 💡 Dual Testbench for Configurable FF

---

Verification of parameterized FF with DFF/TFF modes using golden models.

---

### ⚙️ Specifications

#### Design Under Test:
- **Param_FF.v** module
- Parameters:
  - FF_TYPE: "DFF" or "TFF"

#### Testbench Strategy:
1. **Testbench 1** (DFF mode):
   - Overrides FF_TYPE="DFF"
   - Uses golden DFF model for comparison
2. **Testbench 2** (TFF mode):
   - Overrides FF_TYPE="TFF"
   - Uses golden TFF model for comparison

#### Verification:
- Asynchronous reset testing
- Mode-specific functionality
- Input randomization
- Output comparison

---

## Section 3: BCD Up Counter (MOD 10)

### 💡 Decade Counter with Clock Division

---

Synchronous MOD-10 counter with frequency division output.

---

### ⚙️ Specifications

#### Inputs:
- **Clk**: Clock input
- **Rst**: Async active-high reset

#### Outputs:
- **Clk_div10_out**: Clock divided by 10

#### Features:
- 10-state BCD counting (0000→1001)
- Output toggles at 1/10th input frequency
- Reset initializes to 0000

---

## Section 4: 4-bit Ripple Counter

### 💡 Structural Implementation

---

Ripple counter built from DFF components with inverted outputs.

---

### ⚙️ Specifications

#### Inputs:
- **clk**: Clock
- **rstn**: Active-low reset

#### Outputs:
- **out[3:0]**: Counter value

#### Implementation:
- Structural modeling
- Cascaded DFF stages
- Output taken from Qn (inverted)

---

## Section 5: Parameterized Shift Register

### 💡 Advanced Shift Register Design

---

Configurable shift register with multiple control modes.

---

### ⚙️ Specifications

#### Parameters:
- **LOAD_AVALUE**: Async load value
- **SHIFT_DIRECTION**: "LEFT"/"RIGHT"
- **LOAD_SVALUE**: Sync load value
- **SHIFT_WIDTH**: Data width

#### Control Priority:
1. Async clear/set
2. Sync clear/set
3. Parallel load
4. Shift operation

---

## Section 6: Sequential Logic Element

### 💡 Configurable Flip-Flop/Latch

---

Multi-mode sequential element with synchronous/asynchronous controls.

---

### ⚙️ Specifications

#### Modes:
- **LAT=0**: Flip-flop behavior
- **LAT=1**: Latch behavior

#### Control Signals:
- 2 async controls (ALn, ADn)
- 2 sync controls (SLn, SD)
- Clock enable (EH)

#### Truth Table:
Implements complex state transitions based on 8 control signals

---

*Note: All designs include QuestaSim verification with 0 lint errors. Schematics available for designs in Sections 3,4,6.*