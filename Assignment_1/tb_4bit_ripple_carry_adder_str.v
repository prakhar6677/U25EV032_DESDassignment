
`timescale 1ns / 1ps

module tb_ripple_carry_adder;

    // Inputs to DUT (reg because driven by testbench)
    reg  [3:0] a;
    reg  [3:0] b;
    reg        cin;

    // Outputs from DUT (wire because driven by design)
    wire [3:0] sum;
    wire       cout;

    // Instantiate the Design Under Test
    ripple_carry_adder_4bit DUT (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Print table header
        $display("  A    |  B    | Cin | Sum   | Cout");
        $display("-------|-------|-----|-------|-----");

        // Test 1: 0 + 0 = 0
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        $display(" %b |  %b |  %b  | %b |  %b", a, b, cin, sum, cout);

        // Test 2: 3 + 4 = 7
        a = 4'b0011; b = 4'b0100; cin = 0; #10;
        $display(" %b |  %b |  %b  | %b |  %b", a, b, cin, sum, cout);

        // Test 3: 7 + 8 = 15
        a = 4'b0111; b = 4'b1000; cin = 0; #10;
        $display(" %b |  %b |  %b  | %b |  %b", a, b, cin, sum, cout);

        // Test 4: 15 + 1 = 16 → overflow (sum=0000, cout=1)
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        $display(" %b |  %b |  %b  | %b |  %b", a, b, cin, sum, cout);

        // Test 5: 5 + 5 + cin=1 = 11
        a = 4'b0101; b = 4'b0101; cin = 1; #10;
        $display(" %b |  %b |  %b  | %b |  %b", a, b, cin, sum, cout);

        // Test 6: 15 + 15 = 30 → sum=1110, cout=1
        a = 4'b1111; b = 4'b1111; cin = 0; #10;
        $display(" %b |  %b |  %b  | %b |  %b", a, b, cin, sum, cout);

        $finish;
    end

endmodule
