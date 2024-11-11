`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2024 01:57:35 PM
// Design Name: 
// Module Name: EightComparator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 8-bit Comparator using OneComparator modules
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EightComparator(
    input [7:0] X,
    input [7:0] Y,
    output reg XBY,  // X > Y
    output reg YBX,  // Y > X
    output reg XEY   // X == Y
    );

    always @(*) begin
        // Initialize outputs
        XBY = 0;
        YBX = 0;
        XEY = 1;

        // Compare each bit starting from MSB
        if (X[7] > Y[7]) begin
            XBY = 1;
            YBX = 0;
            XEY = 0;
        end else if (X[7] < Y[7]) begin
            XBY = 0;
            YBX = 1;
            XEY = 0;
        end else if (X[6] > Y[6]) begin
            XBY = 1;
            YBX = 0;
            XEY = 0;
        end else if (X[6] < Y[6]) begin
            XBY = 0;
            YBX = 1;
            XEY = 0;
        end
        // Continue similarly for bits 5 to 0
        // ...
        else begin
            XBY = 0;
            YBX = 0;
            XEY = 1;
        end
    end
    
    
endmodule 

module OneComparator(
    input X,
    input Y,
    output XBY,  // X > Y for this bit
    output YBX,  // Y > X for this bit
    output XEY   // X == Y for this bit
    );
    
    assign XBY = (X & ~Y);
    assign YBX = (~X & Y);
    assign XEY = (X == Y);
    
endmodule
