// tb_full_adder_3bit.v — Testbench (simulation only)

`timescale 1ns / 1ps

module tb_full_adder_3bit;

    // Stimulus signals
    reg  [2:0] a, b;
    reg        cin;

    // Observation wires
    wire [2:0] sum;
    wire       cout;

    // Instantiate the 3-bit full adder
    full_adder_3bit uut (
        .a   (a),
        .b   (b),
        .cin (cin),
        .sum (sum),
        .cout(cout)
    );

    // Task: display one result row with decimal values
    task show_result;
        begin
            $display("  %b (%0d) | %b (%0d) | %b | %b (%0d) |  %b  | %s",
                     a, a, b, b, cin,
                     sum, sum, cout,
                     ({cout,sum} == (a + b + cin)) ?
                     "PASS" : "FAIL");
        end
    endtask

    integer i, j;   // loop variables

    initial begin
        $display("======================================================");
        $display("         3-Bit Full Adder — Structural Model          ");
        $display("======================================================");
        $display("  A (dec) | B (dec) | Cin | Sum (dec) | Cout | Check");
        $display("---------|---------|-----|-----------|------|-------");

        // Test all combinations using nested loop
        for (i = 0; i < 8; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin

                // Test with cin = 0
                a = i; b = j; cin = 0; #10;
                show_result;

                // Test with cin = 1
                a = i; b = j; cin = 1; #10;
                show_result;

            end
        end

        $display("======================================================");
        $finish;
    end

endmodule
