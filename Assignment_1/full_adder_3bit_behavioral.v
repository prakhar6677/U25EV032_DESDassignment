module adder_3bit_behavioral (
  input  [2:0] a, b,
  input  cin,
  output reg [2:0] sum,
  output reg cout
);

  reg [3:0] result;

  always @(*) begin
    result = a + b + cin;   // add all three
    sum    = result[2:0];   // lower 3 bits = sum
    cout   = result[3];     // MSB = carry out
  end

endmodule
