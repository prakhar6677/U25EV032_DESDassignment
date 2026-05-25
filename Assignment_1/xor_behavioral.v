// xor_gate.v — Design file (synthesizable)

module xor_gate (
    input  wire a,   // First input
    input  wire b,   // Second input
    output reg  y    // Output
);

    // Behavioral modeling: describe WHAT the circuit does, not HOW it's built
    always @(a or b) begin
        y = a ^ b;   // ^ is the XOR operator in Verilog
    end

endmodule
