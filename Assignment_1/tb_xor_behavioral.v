// tb_xor_gate.v — Testbench file (simulation only, NOT synthesizable)

`timescale 1ns / 1ps   // Time unit = 1ns, precision = 1ps

module tb_xor_gate;    // Testbench has NO ports — it's self-contained

    // Declare signals to drive inputs and observe outputs
    reg  a, b;         // reg because we drive them from an initial block
    wire y;            // wire because it's driven by the design module

    // Instantiate (connect) the design under test (DUT)
    xor_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Initial block: runs once at simulation start (not synthesizable)
    initial begin
        $display("a | b | y (XOR)");
        $display("--|---|-------");

        // Test all 4 combinations of 1-bit inputs
        a = 0; b = 0; #10;
        $display("%b | %b |   %b", a, b, y);

        a = 0; b = 1; #10;
        $display("%b | %b |   %b", a, b, y);

        a = 1; b = 0; #10;
        $display("%b | %b |   %b", a, b, y);

        a = 1; b = 1; #10;
        $display("%b | %b |   %b", a, b, y);

        $finish;   // End simulation
    end

endmodule
