// comparator_2bit_proc.v — Design file (Procedural Statements)

module comparator_2bit_proc (
    input  wire [1:0] a,     // 2-bit input A
    input  wire [1:0] b,     // 2-bit input B
    output reg        gt,    // 1 when A > B
    output reg        eq,    // 1 when A = B
    output reg        lt     // 1 when A < B
);

    // always block triggers whenever a or b changes
    always @(a or b) begin

        // Default all outputs to 0 first
        gt = 0;
        eq = 0;
        lt = 0;

        // Procedural if-else decision chain
        if (a > b) begin
            gt = 1;
        end
        else if (a == b) begin
            eq = 1;
        end
        else begin
            lt = 1;
        end

    end

endmodule
