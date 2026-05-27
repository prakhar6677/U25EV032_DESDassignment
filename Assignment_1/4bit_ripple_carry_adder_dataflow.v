module ripple_carry_adder_4bit (
    input  [3:0] a,     // 4-bit input A
    input  [3:0] b,     // 4-bit input B
    input        cin,   // Initial carry-in (tie to 0 for normal add)
    output [3:0] sum,   // 4-bit sum result
    output       cout   // Final carry-out (overflow indicator)
);
    // Internal carry wires connecting the four stages
    wire c1, c2, c3;
    // c1: carry out of bit-0 stage, into bit-1 stage
    // c2: carry out of bit-1 stage, into bit-2 stage
    // c3: carry out of bit-2 stage, into bit-3 stage

    // ---- Bit 0 (LSB) ----
    // sum[0] and c1 are driven by dataflow expressions
    assign sum[0] = a[0] ^ b[0] ^ cin;
    assign c1     = (a[0] & b[0]) | (b[0] & cin) | (a[0] & cin);

    // ---- Bit 1 ----
    assign sum[1] = a[1] ^ b[1] ^ c1;
    assign c2     = (a[1] & b[1]) | (b[1] & c1)  | (a[1] & c1);
    // ---- Bit 2 ----
    assign sum[2] = a[2] ^ b[2] ^ c2;
    assign c3     = (a[2] & b[2]) | (b[2] & c2)  | (a[2] & c2);

    // ---- Bit 3 (MSB) ----
    assign sum[3] = a[3] ^ b[3] ^ c3;
    assign cout   = (a[3] & b[3]) | (b[3] & c3)  | (a[3] & c3);
    // cout is the overflow bit — result exceeded 4-bit range

endmodule
