module ripple_carry_adder_4bit (
    input  [3:0] a,     // 4-bit input A
    input  [3:0] b,     // 4-bit input B
    input        cin,   // Initial carry-in (usually 0)
    output [3:0] sum,   // 4-bit sum result
    output       cout   // Final carry-out (overflow bit)
);
    // Internal carry wires between the full adders
    wire c1, c2, c3;
    // c1 = carry from FA0 to FA1
    // c2 = carry from FA1 to FA2
    // c3 = carry from FA2 to FA3

    // FA0: processes bit 0 (LSB)
    full_adder FA0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),   // first carry-in is the external cin
        .sum(sum[0]),
        .cout(c1)    // carry ripples to FA1
    );
  // FA1: processes bit 1
    full_adder FA1 (
        .a(a[1]),
        .b(b[1]),
        .cin(c1),    // carry-in from FA0
        .sum(sum[1]),
        .cout(c2)
    );

    // FA2: processes bit 2
    full_adder FA2 (
        .a(a[2]),
        .b(b[2]),
        .cin(c2),    // carry-in from FA1
        .sum(sum[2]),
        .cout(c3)
    );
   // FA3: processes bit 3 (MSB)
    full_adder FA3 (
        .a(a[3]),
        .b(b[3]),
        .cin(c3),    // carry-in from FA2
        .sum(sum[3]),
        .cout(cout)  // final carry-out (overflow)
    );

endmodule
  
