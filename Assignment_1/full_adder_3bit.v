// full_adder_1bit.v — 1-bit Full Adder (building block)

module full_adder_1bit (
    input  wire a,      // 1-bit input A
    input  wire b,      // 1-bit input B
    input  wire cin,    // Carry in
    output wire sum,    // Sum output
    output wire cout    // Carry out
);

    // Internal wires for intermediate gate results
    wire xor1_out;   // result of first XOR
    wire and1_out;   // result of first AND
    wire and2_out;   // result of second AND

    // Gate-level structural connections
    // sum = a XOR b XOR cin
    xor G1 (xor1_out, a, b);
    xor G2 (sum,      xor1_out, cin);

    // cout = (a AND b) OR (cin AND (a XOR b))
    and G3 (and1_out, a, b);
    and G4 (and2_out, cin, xor1_out);
    or  G5 (cout,     and1_out, and2_out);

endmodule
