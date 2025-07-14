# 💡 Combinational Circuit Design Assignment

---

## Section 1: Configurable Encoder Module

### 💡 Gray Code/One-Hot Encoder Design

---

Implementation of a configurable 3-bit encoder with parameterized output encoding (Gray code or one-hot) in Verilog.

---

### ⚙️ Specifications

#### Inputs:
- **A** (3 bits): Binary input (A[2:0])

#### Outputs:
- **B** (7 bits): Encoded output (format depends on parameter)

#### Parameters:
- **USE_GRAY** (1 bit): Encoding selector (default: 1)
  - 1 = Gray code encoding (3-bit output)
  - 0 = One-hot encoding (7-bit output)

#### Encoding Schemes:
| Decimal | Binary | Gray Code | One-Hot |
|---------|--------|-----------|---------|
| 0       | 000    | 000       | 0000001 |
| 1       | 001    | 001       | 0000010 |
| ...     | ...    | ...       | ...     |
| 7       | 111    | 100       | 1000000 |

#### Key Features:
- Parameterized design using `generate`
- Two distinct encoding schemes
- Pure combinational logic
- Default Gray code implementation

---

## Section 2: 1-to-4 Demultiplexer

### 💡 1:4 Demultiplexer Design

---

Implementation of a 1-to-4 demultiplexer in Verilog with exhaustive self-checking testbench.

---

### ⚙️ Specifications

#### Inputs:
- **D** (1 bit): Data input
- **S** (2 bits): Select input (S[1:0])

#### Outputs:
- **Y** (4 bits): Demultiplexed outputs (Y[3:0])

#### Truth Table:
| S[1] | S[0] | Y3 | Y2 | Y1 | Y0 |
|------|------|----|----|----|----|
| 0    | 0    | 0  | 0  | 0  | D  |
| 0    | 1    | 0  | 0  | D  | 0  |
| 1    | 0    | 0  | D  | 0  | 0  |
| 1    | 1    | D  | 0  | 0  | 0  |

#### Key Features:
- Full 1:4 demux functionality
- Single data input routing
- Four output channels
- Pure combinational implementation

---

*Note: Both designs include complete testbenches for functional verification.*