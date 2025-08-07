module hazard_unit(
    input        rst,
    input        RegWriteM, RegWriteW,  // Write enables from MEM and WB stages
    input [4:0]  RD_M, RD_W,            // Destination registers from MEM and WB
    input [4:0]  Rs1_E, Rs2_E,          // Source registers in EX stage
    output [1:0] ForwardAE, ForwardBE    // Forwarding control signals
);

    // Forwarding priority:
    // 1. EX/MEM (MEM stage) has highest priority
    // 2. MEM/WB (WB stage) has lower priority
    // 3. No forwarding (00) if no hazards
    
    assign ForwardAE = (rst == 1'b0) ? 2'b00 :
                      // Priority to MEM stage forwarding
                      (RegWriteM && (RD_M != 5'h00) && (RD_M == Rs1_E)) ? 2'b10 :
                      // Only check WB stage if MEM didn't match
                      (RegWriteW && (RD_W != 5'h00) && (RD_W == Rs1_E) && 
                       !(RegWriteM && (RD_M != 5'h00) && (RD_M == Rs1_E))) ? 2'b01 : 2'b00;
    
    assign ForwardBE = (rst == 1'b0) ? 2'b00 :
                      (RegWriteM && (RD_M != 5'h00) && (RD_M == Rs2_E)) ? 2'b10 :
                      (RegWriteW && (RD_W != 5'h00) && (RD_W == Rs2_E) && 
                       !(RegWriteM && (RD_M != 5'h00) && (RD_M == Rs2_E))) ? 2'b01 : 2'b00;

endmodule