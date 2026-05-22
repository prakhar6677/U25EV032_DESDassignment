// 1-bit Full Adder using gate primitives (Gate-Level)
module full_adder (
  input  a, b, cin,
  output sum, cout
);

  wire n1, n2, n3;

  xor g1 (n1,   a,   b  );   // n1  = a XOR b
  xor g2 (sum,  n1,  cin);   // sum = n1 XOR cin

  and g3 (n2,   a,   b  );   // n2  = a AND b
  and g4 (n3,   n1,  cin);   // n3  = n1 AND cin
  or  g5 (cout, n2,  n3 );   // cout = n2 OR n3

endmodule


// 3-bit Adder: connects 3 full_adder modules (Structural)
module adder_3bit_structural (
  input  [2:0] a, b,
  input  cin,
  output [2:0] sum,
  output cout
);

  wire c1, c2;   // carry wires between stages

  full_adder fa0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1)  );
  full_adder fa1 (.a(a[1]), .b(b[1]), .cin(c1),  .sum(sum[1]), .cout(c2)  );
  full_adder fa2 (.a(a[2]), .b(b[2]), .cin(c2),  .sum(sum[2]), .cout(cout));

endmodule
