// 2-bit Comparator using Gate Level Modelling

module comparator_gate (
    input  [1:0] A,
    input  [1:0] B,
    output A_gt_B,
    output A_lt_B,
    output A_eq_B
);

    // Internal wires
    wire a1_gt_b1, a0_gt_b0;
    wire a1_lt_b1, a0_lt_b0;
    wire bit1_equal, bit0_equal;

    // Check equality of individual bits
    xnor(bit1_equal, A[1], B[1]);
    xnor(bit0_equal, A[0], B[0]);

    // A > B conditions
    and(a1_gt_b1, A[1], ~B[1]);

    and(a0_gt_b0, A[0], ~B[0]);
    and(A_gt_B, bit1_equal, a0_gt_b0);

    wire temp_gt;
    or(temp_gt, a1_gt_b1, A_gt_B);

    // A < B conditions
    and(a1_lt_b1, ~A[1], B[1]);

    and(a0_lt_b0, ~A[0], B[0]);
    and(A_lt_B, bit1_equal, a0_lt_b0);

    wire temp_lt;
    or(temp_lt, a1_lt_b1, A_lt_B);

    // Equality condition
    and(A_eq_B, bit1_equal, bit0_equal);

endmodule
