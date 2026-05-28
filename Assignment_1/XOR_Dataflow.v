// XOR Gate using Dataflow Modeling
module xor_gate (
    input  wire a,
    input  wire b,
    output wire y
);

    assign y = a ^ b;  // Continuous assignment using XOR operator

endmodule
