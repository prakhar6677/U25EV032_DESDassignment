module rca_4bit_behavioral (
  input  [3:0] a, b,
  input  cin,
  output reg [3:0] sum,
  output reg cout
);

  reg [4:0] result;

  always @(*) begin
    result = a + b + cin;   // add all three
    sum    = result[3:0];   // lower 4 bits = sum
    cout   = result[4];     // MSB = carry out
  end

endmodule
