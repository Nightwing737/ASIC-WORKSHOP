module tb;
    logic [7:0] a, b;
    logic       gt, eq, lt;
    logic       exp_gt, exp_eq, exp_lt;
    int         mismatches = 0;
    int         checks     = 0;

    cmp8 dut (.a(a), .b(b), .gt(gt), .eq(eq), .lt(lt));

    task check(input logic [7:0] a_in, b_in);
        a = a_in; b = b_in; #10;
        exp_gt = (a_in > b_in);
        exp_eq = (a_in == b_in);
        exp_lt = (a_in < b_in);
        checks++;
        if ({gt,eq,lt} !== {exp_gt,exp_eq,exp_lt}) begin
            mismatches++;
            if (mismatches <= 15)
                $display("MISMATCH: a=%0d b=%0d -> got gt=%0d eq=%0d lt=%0d, expected gt=%0d eq=%0d lt=%0d",
                          a_in, b_in, gt, eq, lt, exp_gt, exp_eq, exp_lt);
        end
    endtask

    initial begin
        check(8'h5A, 8'h53);  // same high nibble, low nibble differs -> targets gt bug
        check(8'h3C, 8'h3F);  // only high nibble matches -> targets eq bug
        check(8'hF0, 8'h1F);  // a's high nibble clearly bigger -> targets lt bug

        for (int i = 0; i < 30; i++)
            check($urandom_range(0,255), $urandom_range(0,255));

        $display("Done: %0d/%0d checks failed", mismatches, checks);
        $finish;
    end
endmodule