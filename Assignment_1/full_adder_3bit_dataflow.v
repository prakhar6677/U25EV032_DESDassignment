// full_adder_3bit_df.v — 3-bit Full Adder (Dataflow Modeling)

module full_adder_3bit_df (
    input  wire [2:0] a,      // 3-bit input A
    input  wire [2:0] b,      // 3-bit input B
    input  wire       cin,    // Carry in (bit 0 stage)
    output wire [2:0] sum,    // 3-bit sum output
    output wire       cout    // Final carry out
);

    // Internal carry wires between bit stages
    wire c1;    // carry out of bit-0, carry into bit-1
    wire c2;    // carry out of bit-1, carry into bit-2

    // ── Bit 0 (LSB) ──────────────────────────────
    assign sum[0] = a[0] ^ b[0] ^ cin;
    assign c1     = (a[0] & b[0]) | (cin & (a[0] ^ b[0]));

    // ── Bit 1 (Middle) ───────────────────────────
    assign sum[1] = a[1] ^ b[1] ^ c1;
    assign c2     = (a[1] & b[1]) | (c1 & (a[1] ^ b[1]));

    // ── Bit 2 (MSB) ──────────────────────────────
    assign sum[2] = a[2] ^ b[2] ^ c2;
    assign cout   = (a[2] & b[2]) | (c2 & (a[2] ^ b[2]));

endmodule
