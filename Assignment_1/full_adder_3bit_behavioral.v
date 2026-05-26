// full_adder_3bit_beh.v — Design file (Behavioral Modeling)

module full_adder_3bit_beh (
    input  wire [2:0] a,      // 3-bit input A
    input  wire [2:0] b,      // 3-bit input B
    input  wire       cin,    // Carry in
    output reg  [2:0] sum,    // 3-bit sum output
    output reg        cout    // Carry out
);

    reg [3:0] result;   // 4-bit to hold full result

    always @(a or b or cin) begin
        result = a + b + cin;   // add all three
        sum    = result[2:0];   // lower 3 bits = sum
        cout   = result[3];     // bit 3 = carry out
    end

endmodule
