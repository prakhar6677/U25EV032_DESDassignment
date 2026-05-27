`timescale 1ns / 1ps

module tb_rca_4bit_behavioral;

    // --------------------------
    // Declare testbench signals
    // --------------------------
    reg  [3:0] a;       // drives input a of DUT
    reg  [3:0] b;       // drives input b of DUT
    reg        cin;     // drives carry-in of DUT

    wire [3:0] sum;     // receives sum output from DUT
    wire       cout;    // receives carry-out from DUT

    // --------------------------
    // Connect testbench to DUT
    // --------------------------
    rca_4bit_behavioral DUT (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // --------------------------
    // EPWave waveform dump
    // --------------------------
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_rca_4bit_behavioral);
    end

    // --------------------------
    // Apply test inputs
    // --------------------------
    initial begin

        $display("-----------------------------------------------");
        $display("   4-bit RCA Behavioral Model — Test Results   ");
        $display("-----------------------------------------------");
        $display("  A  |  B  | Cin | Sum | Cout |   Decimal      ");
        $display("-----|-----|-----|-----|------|----------------");

        // Test 1 : 0 + 0 + 0 = 0
        a = 4'd0;  b = 4'd0;  cin = 1'b0; #10;
        $display("  %0d  |  %0d  |  %0d  |  %0d  |  %0d   | %0d + %0d = %0d",
                  a, b, cin, sum, cout, a, b, {cout,sum});

        // Test 2 : 2 + 3 = 5
        a = 4'd2;  b = 4'd3;  cin = 1'b0; #10;
        $display("  %0d  |  %0d  |  %0d  |  %0d  |  %0d   | %0d + %0d = %0d",
                  a, b, cin, sum, cout, a, b, {cout,sum});

        // Test 3 : 3 + 4 = 7
        a = 4'd3;  b = 4'd4;  cin = 1'b0; #10;
        $display("  %0d  |  %0d  |  %0d  |  %0d  |  %0d   | %0d + %0d = %0d",
                  a, b, cin, sum, cout, a, b, {cout,sum});

        // Test 4 : 7 + 8 = 15
        a = 4'd7;  b = 4'd8;  cin = 1'b0; #10;
        $display("  %0d  |  %0d  |  %0d  | %0d  |  %0d   | %0d + %0d = %0d",
                  a, b, cin, sum, cout, a, b, {cout,sum});

        // Test 5 : 9 + 6 = 15
        a = 4'd9;  b = 4'd6;  cin = 1'b0; #10;
        $display("  %0d  |  %0d  |  %0d  | %0d  |  %0d   | %0d + %0d = %0d",
                  a, b, cin, sum, cout, a, b, {cout,sum});

        // Test 6 : 5 + 5 + cin(1) = 11
        a = 4'd5;  b = 4'd5;  cin = 1'b1; #10;
        $display("  %0d  |  %0d  |  %0d  | %0d  |  %0d   | %0d + %0d + cin = %0d",
                  a, b, cin, sum, cout, a, b, {cout,sum});

        // Test 7 : 15 + 1 = 16 → overflow
        a = 4'd15; b = 4'd1;  cin = 1'b0; #10;
        $display(" %0d  |  %0d  |  %0d  |  %0d  |  %0d   | %0d + %0d = %0d (overflow)",
                  a, b, cin, sum, cout, a, b, {cout,sum});

        // Test 8 : 15 + 15 = 30 → overflow
        a = 4'd15; b = 4'd15; cin = 1'b0; #10;
        $display(" %0d  | %0d  |  %0d  | %0d  |  %0d   | %0d + %0d = %0d (overflow)",
                  a, b, cin, sum, cout, a, b, {cout,sum});

        // Test 9 : 15 + 15 + cin(1) = 31 → max possible value
        a = 4'd15; b = 4'd15; cin = 1'b1; #10;
        $display(" %0d  | %0d  |  %0d  | %0d  |  %0d   | %0d + %0d + cin = %0d (max)",
                  a, b, cin, sum, cout, a, b, {cout,sum});

        $display("-----------------------------------------------");
        $display("          Simulation Complete                  ");
        $display("-----------------------------------------------");

        $finish;
    end

endmodule
