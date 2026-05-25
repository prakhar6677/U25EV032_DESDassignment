// comparator_2bit.v — Design file (Continuous Assignment)

module comparator_2bit (
    input  wire [1:0] a,    // 2-bit input A
    input  wire [1:0] b,    // 2-bit input B
    output wire       gt,   // A > B
    output wire       eq,   // A = B
    output wire       lt    // A < B
);

    // Continuous assignments — always active, update instantly
    assign gt = (a > b);    // 1 when A is greater than B
    assign eq = (a == b);   // 1 when A equals B
    assign lt = (a < b);    // 1 when A is less than B

endmodule
