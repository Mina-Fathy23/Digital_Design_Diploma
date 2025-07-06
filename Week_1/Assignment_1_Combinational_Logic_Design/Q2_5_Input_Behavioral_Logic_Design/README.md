# 💡 5-Input Behavioral Logic Design  

---  

Implementation of a 5-input, 2-output digital circuit using behavioral Verilog/VHDL coding style. Features bitwise operations and multiplexing with a 3-bit data input.

---  

## ⚙️ Specifications  

### Inputs:  
- **D** (3 bits): Data input (D[2:0])  
- **A, B, C** (1 bit each): Control inputs  
- **Sel** (1 bit): Multiplexer selector  

### Outputs:  
- **Out** (1 bit): Primary output  
- **out_bar** (1 bit): Complementary output  

### Logic Components:  
1. **AND2**: 2-input AND gate  
2. **OR1**: 2-input OR gate  
3. **MUX1**: 2:1 Multiplexer  

### Behavioral Description:  
- Bitwise operations on D[2:0] inputs  
- Conditional output selection based on 'Sel'  
- Complementary output generation  

![Behavioral Logic Schematic](behavioral_schematic.png)  