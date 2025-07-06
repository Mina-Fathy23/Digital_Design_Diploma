# 💡 4-bit Priority Encoder Design  

Implementation of a 4-bit priority encoder in Verilog/VHDL. A priority encoder solves the limitation of standard encoders by outputting the code of the highest-priority active input, even when multiple inputs are high.  

## ⚙️ Specifications  

### Inputs:  
- **x3** (1 bit): Highest-priority input  
- **x2** (1 bit): Second-priority input  
- **x1** (1 bit): Third-priority input  
- **x0** (1 bit): Lowest-priority input  

### Outputs:  
- **y1, y0** (2 bits): Binary code representing the highest-priority active input  

### Truth Table:  

| x3 | x2 | x1 | x0 | y1 | y0 |  
|----|----|----|----|----|----|  
| 1  | X  | X  | X  | 1  | 1  |  
| 0  | 1  | X  | X  | 1  | 0  |  
| 0  | 0  | 1  | X  | 0  | 1  |  
| 0  | 0  | 0  | 1  | 0  | 0  |  

### Functionality:  
- Priority order: **x3 > x2 > x1 > x0**  
- Outputs binary code of the highest-priority active input  
- "X" indicates don't-care conditions (input can be 0 or 1)  
- Implicitly outputs "00" when all inputs are 0  
