// tb_full_adder_3bit_df.v — Testbench (simulation only)

`timescale 1ns / 1ps

module tb_full_adder_3bit_df;

    // Stimulus signals
    reg  [2:0] a, b;
    reg        cin;

    // Observation wires
    wire [2:0] sum;
    wire       cout;

    // Instantiate the dataflow 3-bit adder
    full_adder_3bit_df uut (
        .a   (a),
        .b   (b),
        .cin (cin),
        .sum (sum),
        .cout(cout)
    );

    // Wire to hold expected result for self-checking
    wire [3:0] expected;
    assign expected = a + b + cin;   // 4-bit result to capture cout

    // Task: print one result row with PASS/FAIL check
    task show_result;
        begin
            $display(
                "  %b(%0d) + %b(%0d) + %b = %b%b(%0d) | Exp:%b(%0d) | %s",
                a, a,
                b, b,
                cin,
                cout, sum, {cout,sum},
                expected, expected,
                ({cout,sum} == expected) ? "PASS" : "FAIL"
            );
        end
    endtask

    integer i, j;

    initial begin
        $display("============================================================");
        $display("        3-Bit Full Adder — Dataflow Modeling                ");
        $display("============================================================");
        $display("  A(dec) + B(dec) + Cin = Cout|Sum(dec) | Expected | Check ");
        $display("------------------------------------------------------------");

        // Exhaustive test — all 8x8x2 = 128 combinations
        for (i = 0; i < 8; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin
                a = i; b = j; cin = 0; #10;
                show_result;
                a = i; b = j; cin = 1; #10;
                show_result;
            end
        end

        $display("============================================================");
        $finish;
    end

endmodule
