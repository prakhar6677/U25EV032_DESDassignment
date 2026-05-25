// tb_xor_structural.v — Testbench (simulation only)

`timescale 1ns / 1ps

module tb_xor_structural;

    // Declare stimulus signals and observation wire
    reg  a, b;     // We drive these, so reg
    wire y;        // Driven by DUT, so wire

    // Instantiate the structural XOR design
    xor_structural uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Print header
        $display("===========================");
        $display("  XOR via NAND (Structural)");
        $display("===========================");
        $display("  A | B | Y (XOR)");
        $display("  --|---|--------");

        // Apply all 4 input combinations with 10ns gap each
        a = 0; b = 0; #10;
        $display("  %b | %b |   %b", a, b, y);

        a = 0; b = 1; #10;
        $display("  %b | %b |   %b", a, b, y);

        a = 1; b = 0; #10;
        $display("  %b | %b |   %b", a, b, y);

        a = 1; b = 1; #10;
        $display("  %b | %b |   %b", a, b, y);

        $display("===========================");
        $finish;
    end

endmodule
