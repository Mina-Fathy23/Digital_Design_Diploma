# 💡 2-to-4 Decoder Design   

---  

Implementation of a 2-to-4 decoder using conditional operators in Verilog/VHDL. Converts 2-bit binary input to one-hot 4-bit output.  

---  

## ⚙️ Specifications  

### Input:  
- **A** (2 bits): Binary input (A[1:0])  

### Output:  
- **D** (4 bits): One-hot output (D[3:0])  

### Truth Table:  
| A[1] | A[0] | D3 | D2 | D1 | D0 |  
|------|------|----|----|----|----|  
| 0    | 0    | 0  | 0  | 0  | 1  |  
| 0    | 1    | 0  | 0  | 1  | 0  |  
| 1    | 0    | 0  | 1  | 0  | 0  |  
| 1    | 1    | 1  | 0  | 0  | 0  |
