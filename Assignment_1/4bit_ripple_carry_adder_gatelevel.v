// 1-bit Full Adder using Gate Level Modelling

module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

wire x1;
wire a1, a2, a3;

// Sum calculation
xor(x1, A, B);
xor(Sum, x1, Cin);

// Carry calculation
and(a1, A, B);
and(a2, B, Cin);
and(a3, A, Cin);

or(Cout, a1, a2, a3);

endmodule



// 4-bit Ripple Carry Adder

module ripple_carry_adder_4bit (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

wire c1, c2, c3;

// First Full Adder
full_adder FA0 (
    A[0],
    B[0],
    Cin,
    Sum[0],
    c1
);

// Second Full Adder
full_adder FA1 (
    A[1],
    B[1],
    c1,
    Sum[1],
    c2
);

// Third Full Adder
full_adder FA2 (
    A[2],
    B[2],
    c2,
    Sum[2],
    c3
);

// Fourth Full Adder
full_adder FA3 (
    A[3],
    B[3],
    c3,
    Sum[3],
    Cout
);

endmodule
