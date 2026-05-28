module tb_behavioral;

reg [1:0] A, B;
wire gt, lt, eq;

comparator_behavioral uut (
    .A(A),
    .B(B),
    .gt(gt),
    .lt(lt),
    .eq(eq)
);

initial begin

    // Dump commands
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_behavioral);

    A=0; B=0; #10;
    A=1; B=3; #10;
    A=2; B=1; #10;
    A=3; B=3; #10;

    $finish;
end

initial begin
    $monitor("A=%b B=%b GT=%b LT=%b EQ=%b",
              A, B, gt, lt, eq);
end

endmodule
