# 💡 7-Input Logic Circuit Design  

---  

Implementation of a custom logic circuit with 7 inputs and 2 outputs using Verilog/VHDL assign statements. The design features multiplexers, AND, and XNOR gates.  

---  

## ⚙️ Specifications  

### Inputs:  
- **A, B, C, D, E, F** (1 bit each): Primary logic inputs  
- **set** (1 bit): Control signal  

### Outputs:  
- **OUT** (1 bit): Main output  
- **OUT_bar** (1 bit): Complementary output  

### Logic Components:  
1. **MUX1**: 2:1 Multiplexer (selector: 'set')  
2. **AND1**: AND gate  
3. **XNOR1**: XNOR gate  

### Schematic Representation:  
![Logic Circuit Schematic](circuit_schematic.png)  
*(Diagram shows signal flow: Inputs → Logic Gates → MUX → Outputs)*  
