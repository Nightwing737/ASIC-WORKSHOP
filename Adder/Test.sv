module Adder_tb;
    reg a;
    reg b;
    wire c;

    // Instantiate the design
    Adder uut (
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        // Display results
        $monitor("a = %b, b = %b, c = %b", a, b, c);

        // Test cases
        a = 0; b = 0;
        #10;

        a = 0; b = 1;
        #10;

        a = 1; b = 0;
        #10;

        a = 1; b = 1;
        #10;

        $finish;
    end

endmodule