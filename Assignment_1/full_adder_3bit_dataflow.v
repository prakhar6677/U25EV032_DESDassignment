module adder_3bit_dataflow (
  input  [2:0] a, b,
  input  cin,
  output [2:0] sum,
  output cout
);

  wire [3:0] result;

  assign result = a + b + cin;   // add all three
  assign sum    = result[2:0];   // lower 3 bits = sum
  assign cout   = result[3];     // MSB = carry out

endmodule
