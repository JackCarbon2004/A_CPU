`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024
// Design Name: 
// Module Name: Dual_Port_RAM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//      8-bit dual-port RAM with separate read/write ports.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Dual_Port_RAM (
    input wire CLK,                  // Clock signal
    // Port A - Read Port for Operand A
    input wire [7:0] Addr_A,         // Address for operand A
    output reg [7:0] Data_A,         // Data output for operand A
    // Port B - Read Port for Operand B
    input wire [7:0] Addr_B,         // Address for operand B
    output reg [7:0] Data_B,         // Data output for operand B
    // Port C - Write Port for Result Z
    input wire [7:0] Addr_C,         // Address to write Z
    input wire [7:0] Data_C,         // Data to write (Z)
    input wire WE_C,                 // Write Enable for port C
    // Optional: Data_Out for debugging or general-purpose reads
    output wire [7:0] Data_Out_RAM
    );

    // Define the memory array
    reg [7:0] memory_array [255:0]; // 256 x 8-bit memory

    // Read Port A
    always @(posedge CLK) begin
        Data_A <= memory_array[Addr_A];
    end

    // Read Port B
    always @(posedge CLK) begin
        Data_B <= memory_array[Addr_B];
    end

    // Write Port C
    always @(posedge CLK) begin
        if (WE_C) begin
            memory_array[Addr_C] <= Data_C;
        end
    end

    // Optional: Continuous read for debugging
    assign Data_Out_RAM = memory_array[Addr_C];

endmodule
