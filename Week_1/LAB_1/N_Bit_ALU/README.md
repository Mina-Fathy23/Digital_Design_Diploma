# 💡 Arithmetic Logic Unit (ALU) Design  

---  

Implementation of a configurable ALU in Verilog/VHDL supporting 4 core operations. The ALU performs arithmetic and logical operations based on a 1-bit opcode input.  

---  

## ⚙️ Specifications  
### Inputs:  
- **in0** (4 bits): First operand (default width)  
- **in1** (4 bits): Second operand  
- **opcode** (1 bit): Operation selector  

### Outputs:  
- **result** (4 bits): Operation output  
- **flags** (Optional): Status flags (overflow, zero, etc.)  

### Operation Table:  
| Opcode | Operation        | Description           |  
|--------|------------------|-----------------------|  
| 0      | Addition         | in0 + in1             |  
| 0      | OR               | Bitwise OR            |  
| 1      | Subtraction      | in0 - in1             |  
| 1      | XOR              | Bitwise XOR           |  

### Key Features:  
- Configurable data width (default 4-bit)  
- Pure combinational logic  
- Extensible operation set  