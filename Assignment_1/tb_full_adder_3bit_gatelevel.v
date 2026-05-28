module tb_fulladder_3bit;

reg [2:0] A, B;
reg Cin;

wire [2:0] Sum;
wire Cout;

// Instantiate the design
fulladder_3bit uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin

    // Dump file for waveform
    $dumpfile("dump.vcd");

    // Dump variables
    $dumpvars(0, tb_fulladder_3bit);

    $display("A B Cin | Sum Cout");

    // Test cases
    A = 3'b000; B = 3'b000; Cin = 0; #10;

    A = 3'b001; B = 3'b010; Cin = 0; #10;

    A = 3'b011; B = 3'b100; Cin = 0; #10;

    A = 3'b111; B = 3'b001; Cin = 0; #10;

    A = 3'b101; B = 3'b110; Cin = 1; #10;

    $finish;
end

initial begin
    $monitor("%b %b %b | %b %b",
              A, B, Cin, Sum, Cout);
end

endmodule
