module tb_structural;

reg [1:0] A, B;
wire gt, lt, eq;

comparator_structural uut (
    .A(A),
    .B(B),
    .gt(gt),
    .lt(lt),
    .eq(eq)
);

initial begin

    // Dump commands
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_structural);

    $display("A B | GT LT EQ");

    A=0; B=0; #10;
    A=1; B=2; #10;
    A=3; B=1; #10;
    A=2; B=2; #10;

    $finish;
end

initial begin
    $monitor("%b %b | %b %b %b", A, B, gt, lt, eq);
end

endmodule
