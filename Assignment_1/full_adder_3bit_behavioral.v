// full_adder_3bit_beh.v — 3-bit Full Adder (Behavioral Modeling)

module full_adder_3bit_beh (
    input  wire [2:0] a,      // 3-bit input A
    input  wire [2:0] b,      // 3-bit input B
    input  wire       cin,    // Carry in
    output reg  [2:0] sum,    // 3-bit sum output
    output reg        cout    // Carry out
);

    // 4-bit internal wire to hold the full addition result
    // (3-bit + 3-bit + 1-bit can produce a 4-bit result)
    reg [3:0] result;

    // always block — re-executes whenever a, b, or cin changes
    always @(a or b or cin) begin

        // Add all three inputs together
        // result is 4 bits wide to capture the carry
        result = a + b + cin;

        // Lower 3 bits go to sum output
        sum  = result[2:0];

        // The 4th bit (index 3) is the carry out
        cout = result[3];

    end

endmodule
