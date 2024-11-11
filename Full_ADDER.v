`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2024 03:27:03 PM
// Design Name: 
// Module Name: Full_ADDER
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

module Full_ADDER8bit (
    input  wire [7:0] x,
    input  wire [7:0] y,
    input  wire       Cin,
    output wire [7:0] z,
    output wire        Cout
);
    wire [8:0] carry;

    assign carry[0] = Cin;

    Full_ADDERA0 FA0 (
        .x    (x[0]),
        .y    (y[0]),
        .Cin  (carry[0]),
        .z    (z[0]),
        .Cout (carry[1])
    );

    Full_ADDERA0 FA1 (
        .x    (x[1]),
        .y    (y[1]),
        .Cin  (carry[1]),
        .z    (z[1]),
        .Cout (carry[2])
    );

    Full_ADDERA0 FA2 (
        .x    (x[2]),
        .y    (y[2]),
        .Cin  (carry[2]),
        .z    (z[2]),
        .Cout (carry[3])
    );

    Full_ADDERA0 FA3 (
        .x    (x[3]),
        .y    (y[3]),
        .Cin  (carry[3]),
        .z    (z[3]),
        .Cout (carry[4])
    );

    Full_ADDERA0 FA4 (
        .x    (x[4]),
        .y    (y[4]),
        .Cin  (carry[4]),
        .z    (z[4]),
        .Cout (carry[5])
    );

    Full_ADDERA0 FA5 (
        .x    (x[5]),
        .y    (y[5]),
        .Cin  (carry[5]),
        .z    (z[5]),
        .Cout (carry[6])
    );

    Full_ADDERA0 FA6 (
        .x    (x[6]),
        .y    (y[6]),
        .Cin  (carry[6]),
        .z    (z[6]),
        .Cout (carry[7])
    );

    Full_ADDERA0 FA7 (
        .x    (x[7]),
        .y    (y[7]),
        .Cin  (carry[7]),
        .z    (z[7]),
        .Cout (carry[8])
    );

    assign Cout = carry[8];
endmodule


module Full_ADDERA0(
    input x,
    input y,
    input Cin,
    output z,
    output Cout
);
    wire s1, c1, c2;

    assign s1 = x ^ y;
    assign z = s1 ^ Cin;
    assign c1 = x & y;
    assign c2 = s1 & Cin;
    assign Cout = c1 | c2;

endmodule


