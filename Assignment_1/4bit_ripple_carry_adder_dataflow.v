module rca_4bit_dataflow (
  input  [3:0] a, b,
  input  cin,
  output [3:0] sum,
  output cout
);

  wire [4:0] result;

  assign result = a + b + cin;   // add all three
  assign sum    = result[3:0];   // lower 4 bits = sum
  assign cout   = result[4];     // MSB = carry out

endmodule
