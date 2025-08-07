This project implements a 5-stage pipelined RISC processor in Verilog, following the standard stages of instruction execution: Fetch, Decode, Execute, Memory, and Writeback. It also integrates essential modules like forwarding and hazard detection to handle data dependencies in pipelined architecture.

📁 Project Structure
The Pipeline_top module is the top-level integration point that connects all the pipeline stages and the control logic.

Included Modules:
File Name	Description
Fetch_Cycle.v	Implements the Instruction Fetch stage.
Decode_Cyle.v	Implements the Instruction Decode stage.
Execute_Cycle.v	Implements the Execute stage including ALU operations.
Memory_Cycle.v	Implements the Memory access stage.
Writeback_Cycle.v	Implements the Writeback stage.
PC.v	Program Counter logic.
PC_Adder.v	Adds 4 to PC (PC + 4 logic).
Mux.v	General-purpose multiplexers used in pipeline.
Instruction_Memory.v	Stores instruction set (ROM).
Control_Unit_Top.v	Top-level control unit generating control signals.
Register_File.v	General-purpose register file.
Sign_Extend.v	Sign extends immediate values from instruction.
ALU.v	Arithmetic Logic Unit for executing instructions.
Data_Memory.v	RAM for load/store operations.
Hazard_unit.v	Detects and handles data hazards (forwarding unit).

🛠️ How It Works
Pipelined Architecture
The processor operates in 5 stages:

Fetch: Retrieves the next instruction using the program counter.

Decode: Decodes the instruction and reads from register file.

Execute: Performs ALU operations or branch calculations.

Memory: Handles load/store to data memory.

Writeback: Writes the result back to the register file.

Hazard Handling
A hazard unit is implemented for data forwarding to resolve RAW (Read-After-Write) hazards.

The design assumes no control hazards handling for branches beyond flushing
