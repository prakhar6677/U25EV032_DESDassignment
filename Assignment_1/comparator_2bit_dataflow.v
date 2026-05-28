// 2-bit Comparator using Dataflow Modelling

module comparator_dataflow(
    input [1:0] A,
    input [1:0] B,
    output gt,
    output lt,
    output eq
);

assign gt = (A > B);

assign lt = (A < B);

assign eq = (A == B);

endmodule
