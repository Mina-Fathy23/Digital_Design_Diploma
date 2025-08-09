# 💡 Advanced Digital Design Assignment 5

---

## Section 1: Tesla Car Control Unit (Moore FSM)

### 💡 Highway Speed and Door Lock Controller

---

FSM-based control unit for autonomous vehicles with acceleration and door lock management.

---

#### FSM Design Model:
![Q1_FSM](https://github.com/Mina-Fathy23/Digital_Design_Diploma/blob/11ea9e47bc0fbdb5037e57ef175a694b68d4df69/Week_5/Assignment_5%20_FSMs_and_Memories/Q1_FSM.jpg).

---

### ⚙️ Specifications

#### Input Ports:
- **speed_limit** (8-bit): Maximum allowed speed
- **car_speed** (8-bit): Current vehicle speed
- **leading_distance** (7-bit): Distance to leading vehicle
- **clk**: System clock
- **rst**: Asynchronous reset

#### Output Ports:
- **unlock_doors**: Door lock control
- **accelerate_car**: Engine throttle control

#### States:
- `STOP` (2'b00)
- `ACCELERATE` (2'b01)
- `DECELERATE` (2'b10)

#### Key Features:
- Multiple encoding schemes tested (Binary, Gray, One-Hot)
- Parameterized minimum distance threshold (default: 40m)
- Comprehensive timing/area analysis

#### FPGA Implementation:
- Clock: 100MHz (W5 pin)
- Reset: Button U18
- Visual state indication via LEDs

---

## Section 2: 2-bit Gray Counter (Moore FSM)

### 💡 Cyclic State Machine with Gray Encoding

---

Sequential counter with Gray code output to minimize switching transitions.

---

#### FSM Design Model:
![Q2_FSM](https://github.com/Mina-Fathy23/Digital_Design_Diploma/blob/11ea9e47bc0fbdb5037e57ef175a694b68d4df69/Week_5/Assignment_5%20_FSMs_and_Memories/Q2_FSM.jpg).

---

### ⚙️ Specifications

#### States:
- A (Y=00)
- B (Y=01)
- C (Y=10)
- D (Y=11)

#### Transitions:
- Fixed cyclic progression (A→B→C→D→A)

#### Implementation:
- Asynchronous active-high reset
- Reference design validation
- LED output for state visualization

#### Constraints:
- Clock: W5 pin (100MHz)
- Reset: Button U18
- Output: LEDs[1:0]

---

## Section 3: Serial Error Detector (Mealy FSM)

### 💡 111-Sequence Detector

---

Communication error detector with automatic retransmission request capability.

---

#### FSM Design Model:
![Q3_FSM](https://github.com/Mina-Fathy23/Digital_Design_Diploma/blob/11ea9e47bc0fbdb5037e57ef175a694b68d4df69/Week_5/Assignment_5%20_FSMs_and_Memories/Q3_FSM.jpg).

---

### ⚙️ Specifications

#### Detection Logic:
- Assert ERR on "111" sequence
- Maintains low output for all other patterns

#### Implementation Options:
- Binary state encoding (000,001,010...)
- Comparative analysis of encoding schemes:
  - Sequential
  - Gray
  - One-Hot

#### Performance Metrics:
- LUT utilization
- Register count
- Setup/Hold slack

#### FPGA Mapping:
- Din: Switch input
- ERR: LED output
- Clock: W5 pin (100MHz)

---

## Section 4: Configurable Synchronous RAM

### 💡 Parametric Memory Block

---

Single-port RAM with optional pipeline stages and parity generation.

---

### ⚙️ Specifications

#### Parameters:
- **MEM_WIDTH** (default: 16)
- **MEM_DEPTH** (default: 1024)
- **ADDR_PIPELINE** (default: FALSE)
- **DOUT_PIPELINE** (default: TRUE)
- **PARITY_ENABLE** (default: 1)

#### Control Signals:
- addr_en: Address pipeline enable
- dout_en: Output pipeline enable
- blk_select: Memory bank select

#### Features:
- Synchronous write/read
- Even parity calculation
- Configurable pipeline depth

---

## Section 5: Dual-Clock FIFO Memory

### 💡 First-In-First-Out Buffer

---

Asynchronous FIFO with full/empty flags and independent clock domains.

---

### ⚙️ Specifications

#### Parameters:
- **FIFO_WIDTH** (default: 16)
- **FIFO_DEPTH** (default: 512)

#### Flags:
- full: Write protection
- empty: Read protection

#### Clock Domains:
- clk_a: Write clock (10ns period)
- clk_b: Read clock (10ns period)

#### Safety Features:
- Synchronous reset
- Non-destructive overflow/underflow

---

## Section 6: ALSU with IP Integration (Bonus)

### 💡 Enhanced Arithmetic Unit

---

Upgraded ALSU with Xilinx IP cores and seven-segment display interface.

---

### ⚙️ Specifications

#### IP Integration:
- Multiplier IP (Opcode 3)
- Adder IP (Opcode 2)

#### Display Logic:
- 4-digit seven-segment output
- Format: XX-- (unused) | MSB | LSB
- Error code: E404

#### Output Mapping:
- anode[3:0]: Display select
- cathode[6:0]: Segment control

#### Constraints:
- Clock: 100MHz (W5)
- Reset: Button U18
- Inputs: Switches
- Outputs: LEDs + 7-segment

---

*All designs include:*
- *Comprehensive testbenches*
- *Vivado constraint files*

---

*All designs When through following tests:*
- *Lint-clean RTL*
- *Timing/area analysis*
- *FPGA bitstream successful generation*
