# 💡 D Flip-Flop with Clock Enable and Asynchronous Preset  

---  

Implementation of a D Flip-Flop (DFF) featuring clock enable (CE) and asynchronous preset (PRE) control signals in Verilog/VHDL.  

---  

## ⚙️ Specifications  

### Inputs:  
- **clk** (1 bit): Clock signal  
- **ce** (1 bit): Clock enable (active high)  
- **pre** (1 bit): Asynchronous preset (active high)  
- **d** (1 bit): Data input  

### Output:  
- **q** (1 bit): Registered output  

### Truth Table:  
| PRE | CE | clk ↑ | Q(t+1) |  
|-----|----|-------|--------|  
| 1   | X  | X     | 1      |  
| 0   | 0  | X     | Q(t)   |  
| 0   | 1  | ↑     | D      |  

### Key Features:  
- Asynchronous preset (overrides all other inputs)  
- Synchronous operation when CE=1  
- Positive-edge triggered clocking  
- Power-up initialization capability  

---  

*Note: PRE signal takes precedence over clock/CE for immediate output control.*  