`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2024 03:27:22 PM
// Design Name: 
// Module Name: Rshift
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// ShiftRight.v
// Module to perform a logical right shift on an 8-bit input

module ShiftRight(
    input  [7:0] X,  // 8-bit input
    output [7:0] Z    // 8-bit output after shifting right
);

    // Perform a logical right shift by 1
    assign Z = X >> 1;

endmodule
