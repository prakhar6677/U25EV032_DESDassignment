// XOR Gate using Gate Level Modeling
// y = (a AND NOT b) OR (NOT a AND b)
module xor_gate (
    input  wire a,
    input  wire b,
    output wire y
);

    // Internal wires to carry intermediate signals
    wire not_a;       // Stores NOT a
    wire not_b;       // Stores NOT b
    wire and1_out;    // Stores (a AND NOT b)
    wire and2_out;    // Stores (NOT a AND b)

    // Step 1: Invert inputs
    not g1 (not_a, a);
    not g2 (not_b, b);

    // Step 2: AND combinations
    and g3 (and1_out, a,     not_b);
    and g4 (and2_out, not_a, b    );

    // Step 3: OR the two AND results
    or  g5 (y, and1_out, and2_out);

endmodule
