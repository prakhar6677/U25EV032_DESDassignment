// tb_comparator_2bit.v — Testbench (simulation only)

`timescale 1ns / 1ps

module tb_comparator_2bit;

    // Stimulus signals — reg because we assign in initial block
    reg  [1:0] a, b;

    // Observation wires — driven by DUT outputs
    wire gt, eq, lt;

    // Instantiate the design under test
    comparator_2bit uut (
        .a(a),
        .b(b),
        .gt(gt),
        .eq(eq),
        .lt(lt)
    );

    initial begin
        $display("==========================================");
        $display("        2-Bit Comparator Truth Table      ");
        $display("==========================================");
        $display("  A  |  B  |  GT  |  EQ  |  LT  ");
        $display("-----|-----|------|------|------");

        // Test all 16 combinations (4 values of A x 4 values of B)
        a = 2'b00; b = 2'b00; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b00; b = 2'b01; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b00; b = 2'b10; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b00; b = 2'b11; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b01; b = 2'b00; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b01; b = 2'b01; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b01; b = 2'b10; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b01; b = 2'b11; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b10; b = 2'b00; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b10; b = 2'b01; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b10; b = 2'b10; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b10; b = 2'b11; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b11; b = 2'b00; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b11; b = 2'b01; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b11; b = 2'b10; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        a = 2'b11; b = 2'b11; #10;
        $display("  %b  |  %b  |   %b  |   %b  |   %b", a, b, gt, eq, lt);

        $display("==========================================");
        $finish;
    end

endmodule
