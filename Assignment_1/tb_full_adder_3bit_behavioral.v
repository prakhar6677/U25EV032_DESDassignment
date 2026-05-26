// tb_full_adder_3bit_beh.v — Testbench (simulation only)

`timescale 1ns / 1ps

module tb_full_adder_3bit_beh;

    reg  [2:0] a, b;    // input signals
    reg        cin;     // carry in
    wire [2:0] sum;     // output sum
    wire       cout;    // output carry

    // Connect testbench to design
    full_adder_3bit_beh uut (
        .a   (a),
        .b   (b),
        .cin (cin),
        .sum (sum),
        .cout(cout)
    );

    initial begin
        $display("================================");
        $display("  3-Bit Full Adder — Behavioral ");
        $display("================================");
        $display(" A   | B   |Cin|Sum  |Cout");
        $display("-----|-----|---|-----|----");

        a = 3'b000; b = 3'b000; cin = 0; #10;
        $display(" %b | %b |  %b | %b |  %b", a, b, cin, sum, cout);

        a = 3'b001; b = 3'b001; cin = 0; #10;
        $display(" %b | %b |  %b | %b |  %b", a, b, cin, sum, cout);

        a = 3'b011; b = 3'b101; cin = 0; #10;
        $display(" %b | %b |  %b | %b |  %b", a, b, cin, sum, cout);

        a = 3'b111; b = 3'b111; cin = 0; #10;
        $display(" %b | %b |  %b | %b |  %b", a, b, cin, sum, cout);

        a = 3'b111; b = 3'b111; cin = 1; #10;
        $display(" %b | %b |  %b | %b |  %b", a, b, cin, sum, cout);

        $display("================================");
        $finish;
    end

endmodule
