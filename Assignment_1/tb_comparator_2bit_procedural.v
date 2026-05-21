module tb_comparator_procedural;

reg [1:0] A, B;
wire A_greater, A_equal, A_less;

comparator_procedural uut (
    .A(A),
    .B(B),
    .A_greater(A_greater),
    .A_equal(A_equal),
    .A_less(A_less)
);

initial begin

    $dumpfile("comparator_procedural.vcd");
    $dumpvars;

    A = 2'b00; B = 2'b00;
    #10;

    A = 2'b01; B = 2'b00;
    #10;

    A = 2'b10; B = 2'b11;
    #10;

    A = 2'b11; B = 2'b01;
    #10;

    $finish;

end

endmodule
