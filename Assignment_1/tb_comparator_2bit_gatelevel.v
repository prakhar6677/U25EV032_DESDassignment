module tb_gate;

reg [1:0] A, B;
wire gt, lt, eq;

comparator_gate uut (
    .A(A),
    .B(B),
    .A_gt_B(gt),
    .A_lt_B(lt),
    .A_eq_B(eq)
);

initial begin

    // Dump commands for waveform
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_gate);

    $display("A B | GT LT EQ");

    A=2'b00; B=2'b00; #10;
    A=2'b01; B=2'b00; #10;
    A=2'b10; B=2'b11; #10;
    A=2'b11; B=2'b01; #10;
    A=2'b10; B=2'b10; #10;

    $finish;
end

initial begin
    $monitor("%b %b | %b %b %b", A, B, gt, lt, eq);
end

endmodule
