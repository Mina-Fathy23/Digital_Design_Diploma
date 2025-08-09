# 💡 Dual-Port RAM Module

### 💡 Synchronous Read/Write Memory Block

---

Parameterized dual-port memory with independent read/write interfaces and block select capability.

---

### ⚙️ Specifications

#### Parameters:
| Parameter    | Default | Description                     |
|--------------|---------|---------------------------------|
| MEM_WIDTH    | 16      | Data bus width (bits)           |
| MEM_DEPTH    | 1024    | Memory depth (words)            |
| ADDER_SIZE   | 10      | Address bus width (bits)        |

#### Ports:
| Port        | Direction | Width        | Description                          |
|-------------|-----------|--------------|--------------------------------------|
| din         | Input     | MEM_WIDTH    | Data input for write operations      |
| addr_wr     | Input     | ADDER_SIZE   | Write address                        |
| addr_rd     | Input     | ADDER_SIZE   | Read address                         |
| wr_en       | Input     | 1            | Write enable (active high)           |
| rd_en       | Input     | 1            | Read enable (active high)            |
| blk_select  | Input     | 1            | Memory block enable (active high)    |
| clk         | Input     | 1            | System clock                         |
| rst         | Input     | 1            | Asynchronous reset (active high)     |
| dout        | Output    | MEM_WIDTH    | Data output                          |

#### Key Features:
- **True Dual-Port Operation**:
  - Simultaneous read/write access
  - Independent address buses
- **Synchronous Control**:
  - All operations clock-edge triggered
  - Output register for clean timing
- **Memory Protection**:
  - Block-level access control
  - Asynchronous reset clears output
- **Technology Agnostic**:
  - Infers BRAM in FPGA synthesis
  - Scalable for ASIC implementation

#### Timing Characteristics:
- **Write Operation**:
  - Data latched on rising clock edge when wr_en=1
  - Address must be stable before clock edge
- **Read Operation**:
  - 1-cycle latency from rd_en assertion
  - Output held until next read

---

### 📊 Memory Map Example (MEM_DEPTH=1024)

```mermaid
graph LR
    A[0x000] --> B[First Word]
    C[0x3FF] --> D[Last Word]
    E[addr_wr] --> |Write| F[Selected Word]
    G[addr_rd] --> |Read| H[Selected Word]