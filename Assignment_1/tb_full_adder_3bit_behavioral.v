// tb_full_adder_3bit_beh.v — Testbench (simulation only)

`timescale 1ns / 1ps

module tb_full_adder_3bit_beh;

    // Stimulus signals
    reg  [2:0] a, b;
    reg        cin;

    // Observation wires
    wire [2:0] sum;
    wire       cout;

    // Instantiate the behavioral 3-bit adder
    full_adder_3bit_beh uut (
        .a   (a),
        .b   (b),
        .cin (cin),
        .sum (sum),
        .cout(cout)
    );

    // Expected result wire — independent reference calculation
    wire [3:0] expected;
    assign expected = a + b + cin;

    // Tracks total tests and failures
    integer pass_count;
    integer fail_count;
    integer i, j;

    // Task: print one result row and update counters
    task show_result;
        begin
            if ({cout, sum} == expected) begin
                pass_count = pass_count + 1;
                $display("  %b(%0d) + %b(%0d) + %b = %b|%b = %0d  | PASS",
                          a, a, b, b, cin, cout, sum,
                          {cout, sum});
            end
            else begin
                fail_count = fail_count + 1;
                $display("  %b(%0d) + %b(%0d) + %b = %b|%b = %0d  | FAIL (expected %0d)",
                          a, a, b, b, cin, cout, sum,
                          {cout, sum}, expected);
            end
        end
    endtask

    initial begin
        // Initialise counters
        pass_count = 0;
        fail_count = 0;

        $display("====================================================");
        $display("     3-Bit Full Adder — Behavioral Modeling         ");
        $display("====================================================");
        $display("  A(d)  +  B(d)  + Cin = Cout|Sum = Dec | Result   ");
        $display("----------------------------------------------------");

        // Exhaustive test — all 8 x 8 x 2 = 128 combinations
        for (i = 0; i < 8; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin

                a = i; b = j; cin = 0; #10;
                show_result;

                a = i; b = j; cin = 1; #10;
                show_result;

            end
        end

        // Summary report
        $display("====================================================");
        $display("  Total tests : %0d", pass_count + fail_count);
        $display("  PASSED      : %0d", pass_count);
        $display("  FAILED      : %0d", fail_count);
        $display("====================================================");

        $finish;
    end

endmodule
