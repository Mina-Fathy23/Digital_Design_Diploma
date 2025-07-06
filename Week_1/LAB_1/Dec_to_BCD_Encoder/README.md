# 💡 Decimal to BCD Encoder Design  

---  

Implementation of a decimal to Binary Coded Decimal (BCD) encoder in Verilog/VHDL. Converts a 10-line decimal input (one-hot encoded) to a 4-bit BCD output.  

---  

## ⚙️ Specifications  
### Inputs:  
- **D0-D9** (10 bits): One-hot decimal input (active high)  

### Outputs:  
- **Y0-Y3** (4 bits): BCD encoded output  

### Truth Table:  
| Decimal | D9 | D8 | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0 | Y3 | Y2 | Y1 | Y0 |  
|---------|----|----|----|----|----|----|----|----|----|----|----|----|----|----|  
| 0       | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  | 0  | 0  | 0  | 0  |  
| 1       | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  | 0  | 0  | 0  | 0  | 1  |  
| 2       | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  | 0  | 0  | 0  | 0  | 1  | 0  |  
| ...     | ...| ...| ...| ...| ...| ...| ...| ...| ...| ...| ...| ...| ...| ...|  
| 9       | 1  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  | 0  | 0  | 1  |  

### Key Features:  
- One-hot input encoding (exactly one input line active at a time)  
- Defaults to "0000" for invalid inputs (multiple lines high)  
- Pure combinational logic implementation  