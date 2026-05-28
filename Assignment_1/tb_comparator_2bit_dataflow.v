module tb_dataflow;

reg [1:0] A, B;
wire gt, lt, eq;

comparator_dataflow uut (
    .A(A),
    .B(B),
    .gt(gt),
    .lt(lt),
    .eq(eq)
);

initial begin

    // Dump commands
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_dataflow);

    A=0; B=1; #10;
    A=2; B=1; #10;
    A=3; B=3; #10;
    A=1; B=2; #10;

    $finish;
end

initial begin
    $monitor("A=%b B=%b GT=%b LT=%b EQ=%b",
              A, B, gt, lt, eq);
end

endmodule
