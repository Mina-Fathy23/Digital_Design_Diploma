# 💡 4-Bit Binary Range Detector  

---  

Implementation of a combinational logic circuit in Verilog that detects when a 4-bit input is between 3 (0011) and 7 (0111) inclusive.  

---  

## ⚙️ Specifications  

### Input:  
- **A** (4 bits): Binary input (A[3:0], A[0] = LSB)  

### Output:  
- **out** (1 bit): High when 0011 ≤ A ≤ 0111  

### Truth Table:  
| A[3:0] | out |  
|--------|-----|  
| 0000-0010 | 0 |  
| 0011-0111 | 1 |  
| 1000-1111 | 0 |  