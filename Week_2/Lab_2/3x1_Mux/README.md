# 💡 3:1 Multiplexer Design with Testbench  

---  

Implementation of a 3:1 multiplexer in Verilog using both dataflow and behavioral modeling styles, including a complete testbench that uses dataflow Design as a **golden Model**.  

---  

## ⚙️ Specifications  

### Inputs:  
- **in0, in1, in2** (1 bit each): Data inputs  
- **sel** (2 bits): Selection input  

### Output:  
- **out** (1 bit): Selected output  

### Selection Logic:  
| sel[1:0] | Output  |  
|----------|---------|  
| 00       | in0     |  
| 01       | in1     |  
| 10       | in2     |  
| 11       | Undefined (default: 0) |  
