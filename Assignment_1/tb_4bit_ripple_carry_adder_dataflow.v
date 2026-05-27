`timescale 1ns / 1ps

module tb_ripple_carry_adder;

    reg  [3:0] a;
    reg  [3:0] b;
    reg        cin;

    wire [3:0] sum;
    wire       cout;

    // Instantiate Design Under Test
    ripple_carry_adder_4bit DUT (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // --- Waveform dump block ---
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_ripple_carry_adder);
    end

    // --- Stimulus block ---
    initial begin

        $display("==============================================");
        $display("   4-bit Ripple Carry Adder — Dataflow Model ");
        $display("==============================================");
        $display(" A    | B    | Cin | Sum  | Cout | Decimal");
        $display("------|------|-----|------|------|--------");

        // Test 1: 0 + 0 = 0
        a = 4'b0000; b = 4'b0000; cin = 1'b0; #10;
        $display(" %b | %b |  %b  | %b |  %b   | %0d + %0d = %0d",
                  a, b, cin, sum, cout, a, b, {cout, sum});

        // Test 2: 1 + 1 = 2
        a = 4'b0001; b = 4'b0001; cin = 1'b0; #10;
        $display(" %b | %b |  %b  | %b |  %b   | %0d + %0d = %0d",
                  a, b, cin, sum, cout, a, b, {cout, sum});

        // Test 3: 3 + 4 = 7
        a = 4'b0011; b = 4'b0100; cin = 1'b0; #10;
        $display(" %b | %b |  %b  | %b |  %b   | %0d + %0d = %0d",
                  a, b, cin, sum, cout, a, b, {cout, sum});

        // Test 4: 7 + 8 = 15
        a = 4'b0111; b = 4'b1000; cin = 1'b0; #10;
        $display(" %b | %b |  %b  | %b |  %b   | %0d + %0d = %0d",
                  a, b, cin, sum, cout, a, b, {cout, sum});

        // Test 5: 15 + 1 = 16 → overflow
        a = 4'b1111; b = 4'b0001; cin = 1'b0; #10;
        $display(" %b | %b |  %b  | %b |  %b   | %0d + %0d = %0d (overflow!)",
                  a, b, cin, sum, cout, a, b, {cout, sum});

        // Test 6: 5 + 5 + cin=1 = 11
        a = 4'b0101; b = 4'b0101; cin = 1'b1; #10;
        $display(" %b | %b |  %b  | %b |  %b   | %0d + %0d + cin = %0d",
                  a, b, cin, sum, cout, a, b, {cout, sum});

        // Test 7: 15 + 15 = 30
        a = 4'b1111; b = 4'b1111; cin = 1'b0; #10;
        $display(" %b | %b |  %b  | %b |  %b   | %0d + %0d = %0d",
                  a, b, cin, sum, cout, a, b, {cout, sum});

        $display("==============================================");
        $display(" Simulation complete.");
        $display("==============================================");

        $finish;
    end

endmodule
