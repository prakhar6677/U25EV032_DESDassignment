// 1-bit comparator

module one_bit_compare(
    input A,
    input B,
    output gt,
    output lt,
    output eq
);

assign gt = A & ~B;
assign lt = ~A & B;
assign eq = ~(A ^ B);

endmodule


// 2-bit comparator using structural modelling

module comparator_structural(
    input [1:0] A,
    input [1:0] B,
    output gt,
    output lt,
    output eq
);

wire gt1, lt1, eq1;
wire gt0, lt0, eq0;

one_bit_compare MSB (
    A[1], B[1], gt1, lt1, eq1
);

one_bit_compare LSB (
    A[0], B[0], gt0, lt0, eq0
);

assign gt = gt1 | (eq1 & gt0);

assign lt = lt1 | (eq1 & lt0);

assign eq = eq1 & eq0;

endmodule
