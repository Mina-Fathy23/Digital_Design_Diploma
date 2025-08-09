# 📡 SPI-RAM Wrapper Design

### 💡 FPGA SPI Slave Interface with Embedded Single-Port RAM  
**Team Project**  
- **Design Implementation (Verilog/RTL):** Eng. Mark Tamer  
- **Verification & Testbench Development:** Eng. Mina Fathy Hakim  

---

Configurable SPI slave interface with embedded RAM for data storage in FPGA applications, supporting read/write operations via SPI commands.

---


#### FSM Modle:
![SPI_Wrapper_FSM](https://github.com/Mina-Fathy23/Digital_Design_Diploma/blob/d54bd75e69a4d6600e60ddfa9fc32b470d70fe58/SPI_Wrapper_Project_2/SPI_Wrapper_FSM.jpg).


---

### ⚙️ Specifications

#### Core Parameters:
| Parameter        | Default | Description                          |
|------------------|---------|--------------------------------------|
| MEM_DEPTH        | 256     | RAM depth in words                   |
| ADDR_SIZE        | 8       | Address bus width (bits)             |
| SPI_FRAME_SIZE   | 10      | SPI frame length in bits             |

#### SPI Commands:
| Bits [9:8] | Command  | Description                  |
|------------|----------|------------------------------|
| 2'b00      | SET_ADDR | Set target RAM address       |
| 2'b01      | WR_DATA  | Write data to RAM            |
| 2'b10      | RD_DATA  | Read data from RAM           |
| 2'b11      | NOP      | No operation                 |

#### Module Hierarchy:
- **spi_slave** — Handles SPI protocol, shifts data in/out.
- **ram** — Single-port RAM for storing data.
- **slave_ram_wrapper** — Integrates SPI and RAM, manages command decoding.

---

### 🔌 Interface Description

#### SPI Ports:
| Signal  | Direction | Function                               |
|---------|-----------|----------------------------------------|
| clk     | Input     | FPGA system clock                      |
| rst_n   | Input     | Active-low reset                       |
| ss_n    | Input     | SPI slave select                       |
| mosi    | Input     | SPI master out/slave in                |
| miso    | Output    | SPI master in/slave out                |

#### RAM Ports:
| Signal  | Direction | Function                               |
|---------|-----------|----------------------------------------|
| din     | Input     | Data input (10-bit command + payload)  |
| dout    | Output    | Data output (8-bit read value)         |
| wr_en   | Input     | Write enable strobe                    |
| rd_en   | Input     | Read enable strobe                     |

---

### 🧠 State Machine (FSM)

| State     | Code  | Description                              |
|-----------|-------|------------------------------------------|
| IDLE      | 000   | Wait for ss_n low                        |
| CHK_CMD   | 001   | Decode received SPI command              |
| WR_ADDR   | 010   | Store target address                     |
| WR_DATA   | 011   | Write to RAM                             |
| RD_DATA   | 100   | Read from RAM                            |

**Timing Note:**  
- Command phase: 10 clock cycles  
- Read phase: 8 clock cycles for data transfer  

---

### 📂 Memory Organization

- **Address Range:** 0x00–0xFF for general-purpose storage  
- **Write Sequence:** SET_ADDR → WR_DATA  
- **Read Sequence:** SET_ADDR → RD_DATA  

---

### 📊 Key Features

1. **Protocol Support**:
   - SPI Mode 0 (CPOL=0, CPHA=0)
   - Single-cycle RAM read latency
   - Synchronous 50 MHz operation

2. **Design Constraints**:
   ```tcl
   create_clock -period 20 -name clk [get_ports clk]
   set_property PACKAGE_PIN W5 [get_ports clk]
   set_property IOSTANDARD LVCMOS33 [get_ports clk]
   ```

---

### 🛠️ Verification & Testing

- **Testbench Components**:
  - SPI master model
  - RAM output checker
  - Command sequence validator

- **Coverage Goals**:
  - 100% FSM state coverage
  - All commands validated

---

### 📁 File Manifest

| File Name                  | Purpose                          |
|----------------------------|----------------------------------|
| SPI_SLAVE.v                | SPI slave logic                  |
| single_port_RAM.v          | RAM module                       |
| slave_ram_wrapper.v        | Top-level integration            |
| tb_slave_ram_wrapper.v     | Testbench                        |
