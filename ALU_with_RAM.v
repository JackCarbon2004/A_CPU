`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024
// Design Name: 
// Module Name: ALU_with_DualPort_RAM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//      Top-level module integrating Dual-Port RAM and ALU, facilitating read and write operations.
//      Includes outputs for ALU result (Z) and comparator flags.
// 
// Dependencies: 
//      Dual_Port_RAM.v, fullALU.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_with_DualPort_RAM (
    input wire CLK,                  // Clock signal
    // Control signals for reading operands
    input wire [7:0] Addr_A,         // Address of operand A
    input wire [7:0] Addr_B,         // Address of operand B
    // Control signals for ALU operations
    input wire [3:0] Opcode,         // Operation code for ALU
    input wire Cin,                  // Carry-in for ALU
    // Control signals for writing result
    input wire [7:0] Addr_Z,         // Address to write result Z
    input wire WE_Z,                 // Write Enable for writing Z to RAM
    // Optional: Data inputs for general RAM write operations
    input wire [7:0] Data_In_RAM,    // Data to write to RAM (if needed)
    // Data outputs from RAM
    output wire [7:0] Data_A_Out,    // Data read from Addr_A
    output wire [7:0] Data_B_Out,    // Data read from Addr_B
    // New Output Ports
    output wire [7:0] Z_Out,         // ALU Result Output
    output wire [2:0] Comparator_Flags // Comparator Flags: XBY, YBX, XEY
    );
    
    // Wires to hold operands and result
    wire [7:0] A;
    wire [7:0] B;
    wire [7:0] Z;
    wire Cout;
    wire XBY, YBX, XEY;
    
    // Instantiate the Dual-Port RAM module
    Dual_Port_RAM dpram (
        .CLK(CLK),
        .Addr_A(Addr_A),
        .Data_A(A),
        .Addr_B(Addr_B),
        .Data_B(B),
        .Addr_C(Addr_Z),
        .Data_C(Z),
        .WE_C(WE_Z),
        .Data_Out_RAM() // Unused
    );
    
    // Instantiate the ALU
    fullALU alu (
        .x(A),
        .y(B),
        .opcode(Opcode),
        .Cin(Cin),
        .z(Z),
        .Cout(Cout),
        .XBY(XBY),
        .YBX(YBX),
        .XEY(XEY)
    );
    
    // Assign read data to outputs for verification
    assign Data_A_Out = A;
    assign Data_B_Out = B;
    
    // Assign ALU result to Z_Out
    assign Z_Out = Z;
    
    // Assign comparator flags to Comparator_Flags output
    assign Comparator_Flags = {XBY, YBX, XEY};
    
endmodule
