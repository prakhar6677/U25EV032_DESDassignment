// tb_comparator_2bit_proc.v — Testbench (simulation only)

`timescale 1ns / 1ps

module tb_comparator_2bit_proc;

    // Stimulus signals
    reg  [1:0] a, b;

    // Observation wires
    wire gt, eq, lt;

    // Instantiate the procedural comparator
    comparator_2bit_proc uut (
        .a(a),
        .b(b),
        .gt(gt),
        .eq(eq),
        .lt(lt)
    );

    // Task to display one row of results
    task show_result;
        begin
            $display("  %b%b (%0d) | %b%b (%0d) |   %b   |   %b   |   %b  ",
                     a[1], a[0], a,
                     b[1], b[0], b,
                     gt, eq, lt);
        end
    endtask

    initial begin
        $display("==============================================");
        $display("   2-Bit Comparator — Procedural Modeling     ");
        $display("==============================================");
        $display("   A (dec) |  B (dec) |  GT  |  EQ  |  LT  ");
        $display("-----------|----------|------|------|------");

        // All 16 combinations
        a = 2'b00; b = 2'b00; #10; show_result;
        a = 2'b00; b = 2'b01; #10; show_result;
        a = 2'b00; b = 2'b10; #10; show_result;
        a = 2'b00; b = 2'b11; #10; show_result;

        a = 2'b01; b = 2'b00; #10; show_result;
        a = 2'b01; b = 2'b01; #10; show_result;
        a = 2'b01; b = 2'b10; #10; show_result;
        a = 2'b01; b = 2'b11; #10; show_result;

        a = 2'b10; b = 2'b00; #10; show_result;
        a = 2'b10; b = 2'b01; #10; show_result;
        a = 2'b10; b = 2'b10; #10; show_result;
        a = 2'b10; b = 2'b11; #10; show_result;

        a = 2'b11; b = 2'b00; #10; show_result;
        a = 2'b11; b = 2'b01; #10; show_result;
        a = 2'b11; b = 2'b10; #10; show_result;
        a = 2'b11; b = 2'b11; #10; show_result;

        $display("==============================================");
        $finish;
    end

endmodule

