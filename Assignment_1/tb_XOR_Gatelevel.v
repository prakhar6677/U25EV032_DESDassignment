// Testbench for XOR Gate (Gate Level)
module tb_xor_gate;

    reg  a, b;
    wire y;

    // Connect DUT
    xor_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_xor_gate);

        $display("a | b | y");
        $display("--|---|--");

        a = 0; b = 0; #10; $display("%b | %b | %b", a, b, y);
        a = 0; b = 1; #10; $display("%b | %b | %b", a, b, y);
        a = 1; b = 0; #10; $display("%b | %b | %b", a, b, y);
        a = 1; b = 1; #10; $display("%b | %b | %b", a, b, y);

        $finish;
    end

endmodule
