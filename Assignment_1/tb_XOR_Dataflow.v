// Testbench for XOR Gate
module tb_xor_gate;

    // Declare inputs as reg (driven by testbench)
    reg a;
    reg b;

    // Declare output as wire (driven by the module)
    wire y;

    // Instantiate the design under test (DUT)
    xor_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Apply all input combinations
    initial begin
        $dumpfile("dump.vcd");     // For waveform viewing
        $dumpvars(0, tb_xor_gate);

        $display("a | b | y");
        $display("--|---|--");

        a = 0; b = 0; #10;
        $display("%b | %b | %b", a, b, y);

        a = 0; b = 1; #10;
        $display("%b | %b | %b", a, b, y);

        a = 1; b = 0; #10;
        $display("%b | %b | %b", a, b, y);

        a = 1; b = 1; #10;
        $display("%b | %b | %b", a, b, y);

        $finish;
    end

endmodule
