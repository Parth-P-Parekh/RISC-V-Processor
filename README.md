**Architecture Overview** 
Pipeline Structure:
The processor is organized into five synchronous stages, each handling a distinct part of instruction execution. This arrangement allows the processor to fetch, decode, and execute multiple instructions concurrently, significantly improving throughput compared to non-pipelined designs.

**Fetch**: Retrieves instructions from instruction memory (ROM) using the Program Counter (PC), which is updated by the PC_Adder (PC + 4 logic).

**Decode**: Decodes the instruction, reads operands from the register file, and sign-extends immediate values as needed.

**Execute**: Performs arithmetic and logical operations using the ALU, and computes branch targets.

**Memory**: Accesses data memory (RAM) for load and store operations.

**Writeback**: Writes results back to the register file, completing the instruction lifecycle.
Hazard Handling
**Data Hazards**: The hazard unit detects Read-After-Write (RAW) dependencies and resolves them using data forwarding (bypassing), avoiding unnecessary pipeline stalls wherever possible.
**Control Hazards**: The design assumes handling of branches by pipeline flushing; no advanced branch prediction or speculative execution is implemented.
**Stalls**: If forwarding cannot resolve a hazard, the pipeline is stalled to ensure correctness.

**Simulation and Verification**
Waveform Screenshot: A waveform screenshot is included, demonstrating the correct pipeline operation, hazard resolution, and timing across all stages.(risc_v)
Output Value Files: These files capture register and memory values at each clock cycle, confirming functional correctness and aiding in debugging ,(sim_output)

<img width="1027" height="671" alt="image" src="https://github.com/user-attachments/assets/e3652fec-a6db-44ba-bebe-c71015dc3ae8" />
