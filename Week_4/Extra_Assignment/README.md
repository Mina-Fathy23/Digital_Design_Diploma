# 💡 Advanced Digital Circuits Assignment (Extra)

---

## Section 1: Linear Feedback Shift Register (LFSR)

### 💡 Pseudo-Random Number Generator

---

4-bit LFSR with mixed reset/set flip-flops for sequence generation.

---

### ⚙️ Specifications

#### Inputs:
- **clk**: Clock
- **rst**: Async active-high reset (FF2-FF4)
- **set**: Async active-high set (FF1)

#### Output:
- **out[3:0]**: Random sequence output

#### Sequence Characteristics:
- 15 unique states before repetition
- Maximum-length polynomial (x⁴ + x + 1)
- Special flip-flop configuration:
  - FF1: Async set
  - FF2-FF4: Async reset

#### Testbench:
- Reset/set assertion checks
- Sequence validation
- Coverage of full 15-state cycle

---

## Section 2: Parameterized Adder Unit

### 💡 Configurable N-bit Adder

---

Flexible adder supporting half/full adder modes with optional pipelining.

---

### ⚙️ Specifications

#### Parameters:
| Parameter | Values | Default | Description |
|-----------|--------|---------|-------------|
| WIDTH | >0 | 4 | Data bit-width |
| PIPELINE_ENABLE | 0/1 | 1 | Register outputs |
| USE_FULL_ADDER | 0/1 | 1 | Enable carry-in |

#### Operational Modes:
1. **Combinational** (PIPELINE_ENABLE=0)
   - Immediate output
2. **Pipelined** (PIPELINE_ENABLE=1)
   - Clock-synchronized results
3. **Half-Adder** (USE_FULL_ADDER=0)
   - Ignores cin
4. **Full-Adder** (USE_FULL_ADDER=1)
   - Uses cin

#### Verification:
- 4 testbenches covering all parameter combinations
- Randomized input testing
- Timing checks for pipelined version

---

## Section 3: Configurable Shift Register

### 💡 Multi-mode Shifter

---

8-bit register with programmable direction and shift amount.

---

### ⚙️ Specifications

#### Parameters:
| Parameter | Values | Default |
|-----------|--------|---------|
| SHIFT_DIRECTION | LEFT/RIGHT | LEFT |
| SHIFT_AMOUNT | 1-7 | 1 |

#### Key Features:
- Async active-high reset
- Parallel load capability
- Variable shift distance (1-7 bits)
- Bidirectional operation

#### Test Cases:
1. **Right Shift** (Amount=2):
   - Reset → Load → Shift → Load → Shift
2. **Left Shift** (Amount=1):
   - Reset → Load → Shift → Load → Shift

#### Verification:
- Waveform analysis of shift patterns
- Boundary case testing
- Load/shift interaction checks

---

*Note: All designs include self-checking testbenches with 100% functional coverage.*