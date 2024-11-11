`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024
// Design Name: 
// Module Name: RAM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//      8-bit synchronous RAM with 256 addresses.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RAM (
    input wire CLK,                // Clock signal
    input wire WE,                 // Write Enable
    input wire [7:0] Addr,         // 8-bit address
    input wire [7:0] Data_In,      // Data to write
    output reg [7:0] Data_Out      // Data read
    );

    // Define the memory array
    reg [7:0] memory_array [255:0]; // 256 x 8-bit memory

    // Synchronous write
    always @(posedge CLK) begin
        if (WE) begin
            memory_array[Addr] <= Data_In;
        end
    end

    // Synchronous read
    always @(posedge CLK) begin
        Data_Out <= memory_array[Addr];
    end

endmodule
