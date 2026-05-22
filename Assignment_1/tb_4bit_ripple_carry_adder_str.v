module tb_rca_4bit_structural;

  reg  [3:0] a, b;
  reg  cin;
  wire [3:0] sum;
  wire cout;

  rca_4bit_structural uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    $dumpfile("output.vcd");
    $dumpvars;
  end

  initial begin
    a = 4'b0000; b = 4'b0000; cin = 0; #10;  // 0+0      = 0
    a = 4'b0001; b = 4'b0001; cin = 0; #10;  // 1+1      = 2
    a = 4'b0011; b = 4'b0010; cin = 0; #10;  // 3+2      = 5
    a = 4'b0101; b = 4'b0011; cin = 1; #10;  // 5+3+1    = 9
    a = 4'b1010; b = 4'b0101; cin = 0; #10;  // 10+5     = 15
    a = 4'b1111; b = 4'b0001; cin = 0; #10;  // 15+1     = 16 (cout=1)
    a = 4'b1111; b = 4'b1111; cin = 1; #10;  // 15+15+1  = 31 (cout=1)
    a = 4'b1100; b = 4'b0011; cin = 0; #10;  // 12+3     = 15
    $finish;
  end

endmodule
