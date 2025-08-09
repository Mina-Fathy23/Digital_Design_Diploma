# 💡 Vending Machine Controller (FSM Design)

### 💡 Coin-Operated Beverage Dispenser

---

Finite State Machine implementation for a simplified vending machine with exact change handling.

---

### ⚙️ Specifications

#### Input Ports:
- **D_in**: Dollar coin detection (1 = inserted)
- **Q_in**: Quarter coin detection (1 = inserted)
- **clk**: System clock
- **rst**: Asynchronous reset (active high)

#### Output Ports:
- **dispense**: Product release signal
- **change**: Coin return signal

#### State Encoding:
| State | Value | Description         |
|-------|-------|---------------------|
| WAIT  | 2'b00 | Idle (await coins)  |
| Q_25  | 2'b01 | 25¢ received        |
| Q_50  | 2'b10 | 50¢ received        |

#### State Transitions:
1. **WAIT → Q_25**: On quarter insertion
2. **Q_25 → Q_50**: On second quarter
3. **Q_50 → WAIT**: On third quarter (full payment)
4. **WAIT → WAIT**: On dollar insertion (immediate dispensing)

#### Output Logic:
- **Dispense Conditions**:
  - Dollar inserted in WAIT state
  - Third quarter inserted in Q_50 state
- **Change Signal**:
  - Only activated for dollar insertion in WAIT state

#### Key Features:
- Moore/Mealy hybrid output logic
- Single-clock domain design
- Synchronous state transitions
- Asynchronous reset

---

### 📊 State Transition Diagram

```mermaid
stateDiagram-v2
    [*] --> WAIT
    WAIT --> Q_25: Q_in
    WAIT --> WAIT: D_in (dispense+change)
    Q_25 --> Q_50: Q_in
    Q_50 --> WAIT: Q_in (dispense)
    Q_25 --> Q_25: ¬Q_in
    Q_50 --> Q_50: ¬Q_in