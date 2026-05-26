`timescale 1ns/1ps

module tb_rca_4bit;

    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    // Use the correct module name from design
    rca_4bit_structural uut (
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout)
    );

    initial begin
        $display("=====================================");
        $display("  4-bit Ripple Carry Adder — Test    ");
        $display("=====================================");
        $display("  A  |  B  |Cin| Sum |Cout| Dec");
        $display("-----|-----|---|-----|-----|----");

        a = 0;  b = 0;  cin = 0; #10;
        $display("  %b | %b |  %b | %b |  %b  | %0d+%0d=%0d", a,b,cin,sum,cout,a,b,{cout,sum});

        a = 1;  b = 1;  cin = 0; #10;
        $display("  %b | %b |  %b | %b |  %b  | %0d+%0d=%0d", a,b,cin,sum,cout,a,b,{cout,sum});

        a = 5;  b = 3;  cin = 0; #10;
        $display("  %b | %b |  %b | %b |  %b  | %0d+%0d=%0d", a,b,cin,sum,cout,a,b,{cout,sum});

        a = 7;  b = 8;  cin = 0; #10;
        $display("  %b | %b |  %b | %b |  %b  | %0d+%0d=%0d", a,b,cin,sum,cout,a,b,{cout,sum});

        a = 15; b = 15; cin = 1; #10;
        $display("  %b | %b |  %b | %b |  %b  | %0d+%0d=%0d", a,b,cin,sum,cout,a,b,{cout,sum});

        $display("=====================================");
        $finish;
    end

endmodule
