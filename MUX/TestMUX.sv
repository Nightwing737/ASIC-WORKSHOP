module MUX_tb;

    reg [3:0] I;
    reg [1:0] S;
    wire Y;

    // Instantiate MUX
    MUX uut (
        .I(I),
        .S(S),
        .Y(Y)
    );

    initial begin
        $monitor("I = %b, S = %b, Y = %b", I, S, Y);

        // S = 00 -> Y = I[0]
        I = 4'b0001; S = 2'b00; #10;
        I = 4'b0000; S = 2'b00; #10;

        // S = 01 -> Y = I[1]
        I = 4'b0010; S = 2'b01; #10;
        I = 4'b0000; S = 2'b01; #10;

        // S = 10 -> Y = I[2]
        I = 4'b0100; S = 2'b10; #10;
        I = 4'b0000; S = 2'b10; #10;

        // S = 11 -> Y = I[3]
        I = 4'b1000; S = 2'b11; #10;
        I = 4'b0000; S = 2'b11; #10;

        $finish;
    end

endmodule