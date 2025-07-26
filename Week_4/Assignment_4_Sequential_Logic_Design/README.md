# 💡 Advanced Digital Design Assignment 4

---

## Section 1: Arithmetic Logic Shift Unit (ALSU)

### 💡 Configurable Processing Unit with Error Handling

---

Multi-functional unit combining arithmetic, logical, and shift operations with input/output registers and error detection.

---

### ⚙️ Specifications

#### Input Ports:
- **A, B** (3-bit): Data inputs
- **opcode** (3-bit): Operation selector
- **cin**: Carry-in (for arithmetic ops)
- **serial_in**: Shift/rotate input
- **red_op_A/B**: Reduction operation selectors
- **bypass_A/B**: Data bypass controls
- **direction**: Shift/rotate direction

#### Output Ports:
- **out** (6-bit): Processed result
- **leds** (16-bit): Error indication

#### Key Features:
- Dual-stage pipelining (input + output registers)
- Parameterized priority handling (INPUT_PRIORITY)
- Configurable adder implementation (FULL_ADDER)
- Invalid operation detection with LED blinking
- Comprehensive self-checking testbench

#### Operations:
| Opcode | Operation Type | Description |
|--------|----------------|-------------|
| 000    | Logical        | AND/Reduction AND |
| 001    | Logical        | XOR/Reduction XOR |
| 010    | Arithmetic     | Addition |
| 011    | Arithmetic     | Subtraction |
| 100    | Shift          | Logical Shift |
| 101    | Rotate         | Circular Rotate |

---

## Section 2: Simplified DSP Block

### 💡 Configurable Arithmetic Processing Unit

---

Parameterized DSP block supporting ADD/SUBTRACT operations with pipeline stages.

---

### ⚙️ Specifications

#### Parameters:
- **OPERATION**: "ADD" or "SUBTRACT" (default: "ADD")

#### Data Path:
- Implements D ± B and multiplier_out ± C operations
- Three-stage pipeline for timing closure
- 100MHz clock constraint (W5 pin)

#### Verification:
- Directed testbench for pipeline validation
- Waveform analysis of intermediate stages
- Xilinx xc7a200tffg1156-3 FPGA target

#### Schematic:
![DSP48A1_S Schematic](https://github.com/Mina-Fathy23/Digital_Design_Diploma/blob/58e0bd38487ecae3f8bc698dd10276cb6fa70fee/Week_4/Assignment_4_Sequential_Logic_Design/Q2/Schematic.jpg)


---

## Section 3: Time Division Multiplexer

### 💡 4-Channel 2-bit TDM

---

Sequential multiplexer cycling through four 2-bit inputs at 100MHz.

---

### ⚙️ Specifications

#### Inputs:
- **in0-in3** (2-bit): Data channels
- **clk**: 100MHz system clock
- **rst**: Async reset (button-mapped)

#### Output:
- **out** (2-bit): Time-multiplexed result

#### Internal Logic:
- 2-bit counter for channel selection
- Reset forces channel 0 output
- Complete cycle every 4 clocks

#### FPGA Constraints:
- Inputs: Switches
- Output: LEDs
- Clock: 100MHz (W5)
- Reset: Button U18

---

*Note: All designs include complete verification environments with Vivado constraints and lint-clean RTL.*
