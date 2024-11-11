

`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024
// Design Name: 
// Module Name: fullALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//      8-bit ALU combining addition, logical operations, shifts, and comparison.
// 
// Dependencies: 
//      Full_ADDER8bit.v, EightANDerORer.v, EightComparator.v,
//      ShiftLeft.v, ShiftRight.v, NOTer.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fullALU(
    input  wire [7:0] x,       // 8-bit input x
    input  wire [7:0] y,       // 8-bit input y
    input  wire [3:0] opcode,  // 4-bit operation code
    input  wire       Cin,     // Carry-in for addition
    output reg  [7:0] z,       // 8-bit output z
    output wire       Cout,    // Carry-out from addition
    output wire       XBY,     // x > y
    output wire       YBX,     // y > x
    output wire       XEY      // x == y
    );
    
    // Internal wires for various operations
    wire [7:0] add_result;
    wire add_cout;
    
    wire [7:0] and_result;
    wire [7:0] or_result;
    
    wire [7:0] not_result;
    
    wire [7:0] shift_left_result;
    wire [7:0] shift_right_result;
    
    // Instantiate the Full Adder
    Full_ADDER8bit adder (
        .x    (x),
        .y    (y),
        .Cin  (Cin),
        .z    (add_result),
        .Cout (add_cout)
    );
    
    // Instantiate the AND/OR module
    EightANDerORer and_or (
        .X     (x),
        .Y     (y),
        .Zand  (and_result),
        .Zor   (or_result)
    );
    
    // Instantiate the NOT module (assuming NOT is applied to x)
    NOTer noter (
        .X (x),
        .Z (not_result)
    );
    
    // Instantiate the Shift modules
    ShiftLeft shifter_left (
        .X (x),
        .Z (shift_left_result)
    );
    
    ShiftRight shifter_right (
        .X (x),
        .Z (shift_right_result)
    );
    
    // Instantiate the Comparator
    EightComparator comparator (
        .X    (x),
        .Y    (y),
        .XBY  (XBY),
        .YBX  (YBX),
        .XEY  (XEY)
    );
    
    // Assign the carry-out from adder to the output Cout
    assign Cout = add_cout;
    
    // Combinational logic to select the output based on opcode
    always @(*) begin
        case (opcode)
            4'b0000: z = add_result;          // Addition
            4'b0001: z = and_result;          // Bitwise AND
            4'b0010: z = or_result;           // Bitwise OR
            4'b0011: z = not_result;          // Bitwise NOT (x)
            4'b0100: z = shift_left_result;   // Left Shift
            4'b0101: z = shift_right_result;  // Right Shift
            4'b0110: z = XBY ? 8'hFF : 8'h00; // x > y
            4'b0111: z = YBX ? 8'hFF : 8'h00; // y > x
            4'b1000: z = XEY ? 8'hFF : 8'h00; // x == y
            default: z = 8'h00;                // Default case
        endcase
    end
    
endmodule
