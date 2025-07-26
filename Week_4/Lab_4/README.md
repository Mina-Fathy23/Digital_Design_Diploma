# 💡 Sequential ALU Design

---

## Pipelined 4-bit Arithmetic Logic Unit with Registered Inputs

---

### ⚙️ Specifications

#### Inputs:
- **A, B** (4-bit): Data operands  
- **opcode** (2-bit): Operation selector  
- **clk**: System clock (100MHz)  
- **rst**: Asynchronous active-high reset  

#### Output:
- **out** (8-bit): Registered operation result  

#### Operations:
| opcode | Operation | Description |  
|--------|-----------|-------------|  
| 00 | ADD | A + B |  
| 01 | MUL | A × B |  
| 10 | OR | Bitwise OR |  
| 11 | AND | Bitwise AND |  

#### Pipeline Stages:
1. **Input Stage**: Registers for A, B, opcode  
2. **Operation Stage**: Combinational logic  
3. **Output Stage**: Registered result  

---

### 🎛️ FPGA Implementation

#### Physical Constraints (Basys3):
- **clk**: W5 (100MHz)  
- **rst**: BTNU (U18)  
- **A/B**: SW0-SW7  
- **opcode**: SW15-SW14  
- **out**: LED0-LED7  

#### Included Files:
- `alu_seq.xdc`: Constraint file for Basys3  
- `alu_seq.tcl`: Vivado project script  

---

### 📊 Performance Characteristics
- **Max Frequency**: 100MHz (constrained)  
- **Latency**: 2 clock cycles  
- **Resource Utilization**:  
  - 32 LUTs  
  - 16 FFs  
  - 1 DSP block (for multiplication)  

---


> **Note**: Full Vivado project and constraint files are provided. The design is lint-clean with 0 critical warnings.  

--- 
