// 1-bit Full Adder using Gate Level Modelling

module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

wire x1, a1, a2, a3;

// Sum = A XOR B XOR Cin
xor(x1, A, B);
xor(Sum, x1, Cin);

// Carry calculation
and(a1, A, B);
and(a2, B, Cin);
and(a3, A, Cin);

or(Cout, a1, a2, a3);

endmodule



// 3-bit Full Adder

module fulladder_3bit (
    input [2:0] A,
    input [2:0] B,
    input Cin,
    output [2:0] Sum,
    output Cout
);

wire c1, c2;

// First full adder
full_adder FA0 (
    A[0],
    B[0],
    Cin,
    Sum[0],
    c1
);

// Second full adder
full_adder FA1 (
    A[1],
    B[1],
    c1,
    Sum[1],
    c2
);

// Third full adder
full_adder FA2 (
    A[2],
    B[2],
    c2,
    Sum[2],
    Cout
);

endmodule
