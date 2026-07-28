# Verilog_Counters

---

## 📖 Overview

**Verilog_Counters** is a collection of fundamental **counter circuits** implemented using **Verilog HDL**. This repository covers different types of digital counters that are widely used in digital systems, processors, microcontrollers, FPGA designs, and VLSI circuits.

The repository includes **Asynchronous Counter, Synchronous Counter, Up-Down Counter, Ring Counter, and Johnson Counter** designs. Each module is implemented using synthesizable Verilog HDL and can be verified through dedicated testbenches and simulated to analyze its functional behavior using waveforms.

Counters are essential sequential logic circuits used to count clock pulses, generate timing sequences, divide frequencies, and control the operation of digital systems.

This repository is suitable for students, beginners in digital electronics, and FPGA/VLSI enthusiasts who want to understand counter design and sequential logic using Verilog HDL.

---

# 📖 Modules

## 1. Asynchronous Counter

### Description

An **Asynchronous Counter**, also known as a **Ripple Counter**, is a sequential logic circuit in which the clock signal is applied directly to the first flip-flop, while the output of each flip-flop is used as the clock input for the next flip-flop.

Because the clock signal propagates through the flip-flops sequentially, the output transitions do not occur simultaneously. This creates a ripple effect and introduces propagation delay.

A 4-bit asynchronous counter can count from **0000 to 1111**, representing decimal values from **0 to 15**.

### Inputs

* CLK – Clock Input
* RESET – Reset Input

### Output

* Q – Counter Output

### Counting Sequence

```text
0000 → 0001 → 0010 → 0011
  ↑
  ...
1110 → 1111 → 0000
```

### Features

* Simple counter architecture
* Uses ripple clocking between flip-flops
* Requires fewer logic resources
* Suitable for low-speed counting applications
* Can be used as a frequency divider

---

### 📈 Simulation Waveform

<p align="center">
<img width="1808" height="197" alt="Image" src="https://github.com/user-attachments/assets/9db0af1d-b2ff-4f1f-8570-bdac85327e5c" />
</p>

---

## 2. Synchronous Counter

### Description

A **Synchronous Counter** is a sequential logic circuit in which all flip-flops receive the same clock signal simultaneously.

Unlike an asynchronous counter, all bits change synchronously with the active clock edge. This reduces propagation delay and makes synchronous counters suitable for high-speed digital systems.

A 4-bit synchronous counter can count from **0000 to 1111** and then return to **0000**.

### Inputs

* CLK – Clock Input
* RESET – Reset Input

### Output

* Q – Counter Output

### Counting Sequence

```text
0000 → 0001 → 0010 → 0011
  ↓
...
1110 → 1111 → 0000
```

### Features

* All flip-flops share a common clock
* Faster than asynchronous counters
* Reduced propagation delay
* Suitable for high-speed digital circuits
* Commonly used in FPGA and ASIC designs

---

### 📈 Simulation Waveform

<p align="center">
<img width="1811" height="197" alt="Image" src="https://github.com/user-attachments/assets/bc16a3d5-8e05-4bfb-bfbb-9d1bbd0f0582" />
</p>

---

## 3. Up-Down Counter

### Description

An **Up-Down Counter** is a sequential logic circuit capable of counting in both increasing and decreasing directions.

The direction of counting is controlled using an additional **UP/DOWN control input**. When the control signal is HIGH, the counter increments its value. When the control signal is LOW, the counter decrements its value.

A 4-bit Up-Down Counter can count between **0000 and 1111**.

### Inputs

* CLK – Clock Input
* RESET – Reset Input
* UP_DOWN – Counting Direction Control

### Output

* Q – Counter Output

### Counting Operation

When `UP_DOWN = 1`:

```text
0000 → 0001 → 0010 → 0011 → ... → 1111
```

When `UP_DOWN = 0`:

```text
1111 → 1110 → 1101 → 1100 → ... → 0000
```

### Features

* Supports both upward and downward counting
* Direction controlled by a single input
* Useful in digital control systems
* Commonly used in position and event counting
* Suitable for FPGA and digital system applications

---

### 📈 Simulation Waveform

<p align="center">
<img width="1810" height="222" alt="Image" src="https://github.com/user-attachments/assets/8c444d20-bb99-46d9-a45d-97b1838f7e6a" />
</p>

---

## 4. Ring Counter

### Description

A **Ring Counter** is a shift-register-based counter in which the output of the last flip-flop is connected back to the input of the first flip-flop.

A standard 4-bit Ring Counter contains a single HIGH bit that circulates through the register with every active clock edge.

For example, the counting sequence is:

```text
0001 → 0010 → 0100 → 1000 → 0001
```

The counter requires proper initialization so that one bit is set to HIGH while the remaining bits are LOW.

### Inputs

* CLK – Clock Input
* RESET – Reset Input

### Output

* Q – Counter Output

### Counting Sequence

|  Clock  |  Q3 |  Q2 |  Q1 |  Q0 |
| :-----: | :-: | :-: | :-: | :-: |
| Initial |  0  |  0  |  0  |  1  |
|    1    |  0  |  0  |  1  |  0  |
|    2    |  0  |  1  |  0  |  0  |
|    3    |  1  |  0  |  0  |  0  |
|    4    |  0  |  0  |  0  |  1  |

### Features

* Based on shift-register operation
* Simple decoding structure
* One-hot output sequence
* Requires proper initialization
* Useful for sequence generation and timing control

---

### 📈 Simulation Waveform

<p align="center">
<img width="1812" height="200" alt="Image" src="https://github.com/user-attachments/assets/1987d1b2-6359-42d9-86f1-29d95711e471" />
</p>

---

## 5. Johnson Counter

### Description

A **Johnson Counter**, also known as a **Twisted Ring Counter**, is a shift-register-based counter in which the inverted output of the last flip-flop is connected to the input of the first flip-flop.

For an **N-bit Johnson Counter**, the counter produces **2N unique states**.

For a 4-bit Johnson Counter, the sequence is:

```text
0000 → 1000 → 1100 → 1110 → 1111
     → 0111 → 0011 → 0001 → 0000
```

Johnson Counters are commonly used for sequence generation, timing control, frequency division, and digital control applications.

### Inputs

* CLK – Clock Input
* RESET – Reset Input

### Output

* Q – Counter Output

### Counting Sequence

|  Clock  |  Q3 |  Q2 |  Q1 |  Q0 |
| :-----: | :-: | :-: | :-: | :-: |
| Initial |  0  |  0  |  0  |  0  |
|    1    |  1  |  0  |  0  |  0  |
|    2    |  1  |  1  |  0  |  0  |
|    3    |  1  |  1  |  1  |  0  |
|    4    |  1  |  1  |  1  |  1  |
|    5    |  0  |  1  |  1  |  1  |
|    6    |  0  |  0  |  1  |  1  |
|    7    |  0  |  0  |  0  |  1  |
|    8    |  0  |  0  |  0  |  0  |

### Features

* Also known as a Twisted Ring Counter
* Generates 2N states using N flip-flops
* Simple feedback-based architecture
* Useful for sequence generation
* Suitable for timing and control applications

---

### 📈 Simulation Waveform

<p align="center">
<img width="1807" height="172" alt="Image" src="https://github.com/user-attachments/assets/e57e960e-3eb1-435a-94b5-7a510e6686b7" />
</p>

---

# 🛠 Tools Used

* **Verilog HDL** – Hardware Description Language used to design the counter circuits
* **EDA Playground** – Online platform for Verilog coding and simulation
* **ModelSim / QuestaSim** – HDL simulation and verification
* **GTKWave / EPWave** – Waveform visualization and analysis
* **Xilinx / Altera Quartus II** – FPGA design and synthesis platforms

---

# 🎯 Learning Outcomes

After completing these designs, you will understand:

* Fundamentals of sequential counter circuits
* Difference between synchronous and asynchronous counters
* Operation of Up-Down Counters
* Shift-register-based counter architectures
* Ring Counter operation and one-hot sequences
* Johnson Counter operation and twisted-ring feedback
* Applications of counters in digital systems

---

# 📚 Applications

* Digital Clocks
* Frequency Dividers
* Digital Control Systems
* Sequence Generators
* FPGA Development
* ASIC Design
* Microprocessors
* Embedded Systems
* Communication Systems
* VLSI Design

---

# 🚀 Conclusion

This repository provides a practical introduction to **counter design using Verilog HDL**. By implementing **Asynchronous, Synchronous, Up-Down, Ring, and Johnson Counters**, the fundamentals of clock-driven state transitions, counting sequences, feedback mechanisms, and sequential circuit design can be understood.

These counter circuits serve as essential building blocks for more advanced digital systems such as **timers, frequency dividers, processors, FPGA designs, control systems, and VLSI circuits**.

The designs can be further extended to create **mod-N counters, decade counters, programmable counters, frequency dividers, and complex digital control systems**.
