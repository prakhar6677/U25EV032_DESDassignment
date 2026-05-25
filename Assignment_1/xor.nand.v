// xor_structural.v — Design file (Structural Modeling)

module xor_structural (
    input  wire a,    // First input
    input  wire b,    // Second input
    output wire y     // XOR output
);

    // Internal wires to carry signals between gates
    wire w1, w2, w3;

    // Structural modeling: instantiate gates and connect with wires
    // G1: w1 = a NAND b
    nand G1 (w1, a, b);

    // G2: w2 = a NAND w1
    nand G2 (w2, a, w1);

    // G3: w3 = b NAND w1
    nand G3 (w3, b, w1);

    // G4: y = w2 NAND w3  (final output)
    nand G4 (y, w2, w3);

endmodule
