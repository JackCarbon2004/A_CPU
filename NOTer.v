`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 02:18:31 PM
// Design Name: 
// Module Name: NOTer
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


module NOTer(
    input  [7:0] X,  // 8-bit input
    output [7:0] Z    // 8-bit output after NOT operation
);

    // Perform bitwise NOT
    assign Z = ~X;
   
endmodule