module tb_xor_nand;

reg a, b;
wire y;

xor_nand uut (
    .a(a),
    .b(b),
    .y(y)
);

initial begin

    $dumpfile("xor_nand.vcd");
    $dumpvars(0, tb_xor_nand);

    a = 0; b = 0;
    #10;

    a = 0; b = 1;
    #10;

    a = 1; b = 0;
    #10;

    a = 1; b = 1;
    #10;

    $finish;

end

endmodule
