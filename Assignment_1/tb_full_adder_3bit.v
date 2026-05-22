module tb_adder_3bit_structural;

  reg  [2:0] a, b;
  reg  cin;
  wire [2:0] sum;
  wire cout;

  // Instantiate the design
  adder_3bit_structural uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  // Required for EPWave
  initial begin
    $dumpfile("output.vcd");
    $dumpvars;
  end

  // Test cases
  initial begin
    a = 3'b000; b = 3'b000; cin = 0; #10;  // 0+0+0 = 0
    a = 3'b001; b = 3'b001; cin = 0; #10;  // 1+1   = 2
    a = 3'b011; b = 3'b010; cin = 0; #10;  // 3+2   = 5
    a = 3'b101; b = 3'b010; cin = 1; #10;  // 5+2+1 = 8
    a = 3'b111; b = 3'b001; cin = 0; #10;  // 7+1   = 8
    a = 3'b111; b = 3'b111; cin = 1; #10;  // 7+7+1 = 15
    $finish;
  end

endmodule
