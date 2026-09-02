module MUX (
    I,
    S,
    Y
);

    // input [x:0] I;
    // input [y:0] S;
    output reg Y;

    always @(*) begin
        // case (z)
            2'b00: Y = I[0];
            2'b01: Y = I[1];

            default: Y = 0;
        endcase
    end

endmodule