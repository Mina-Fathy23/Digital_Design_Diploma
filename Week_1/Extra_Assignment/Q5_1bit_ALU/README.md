# 💡 1-Bit ALU Design  

---  

Implementation of a 1-bit Arithmetic Logic Unit (ALU) in Verilog using conditional operators for multiplexer logic. Supports 3 operations selected by a 2-bit control signal.  

---  

## ⚙️ Specifications  

### Inputs:  
- **a, b** (1 bit each): Data inputs  
- **cin** (1 bit): Carry-in (for arithmetic ops)  
- **op** (2 bits): Operation select  

### Outputs:  
- **result** (1 bit): ALU output  
- **cout** (1 bit): Carry-out  

### Operation Table:  
| op[1:0] | Operation  | Description          |  
|---------|------------|----------------------|  
| 00      | AND        | a & b                |  
| 01      | OR         | a or b                |  
| 10      | ADD        | a + b + cin          |   

---

![Design Schematic](https://github.com/Mina-Fathy23/Digital_Design_Diploma/blob/4424926229489cd080328ed1fc9ed08ca99507fa/Week_1/Extra_Assignment/Q5_1bit_ALU/Screenshot%202025-07-06%20202641.jpg)
