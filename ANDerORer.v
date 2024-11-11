// Define the OneANDerORer module
module OneANDerORer(
    input X,
    input Y,
    output Zand,
    output Zor
    );

    assign Zand = X & Y;
    assign Zor = X | Y;

endmodule

// Define the EightANDerORer module using generate
module EightANDerORer(
    input [7:0] X,
    input [7:0] Y,
    output [7:0] Zand,
    output [7:0] Zor
    );

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : ANDOR_GEN
            OneANDerORer u0 (
                .X(X[i]),
                .Y(Y[i]),
                .Zand(Zand[i]),
                .Zor(Zor[i])
            );
        end
    endgenerate

endmodule
