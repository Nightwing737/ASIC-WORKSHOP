module cmp4 (
    input  logic [3:0] a, b,
    output logic       gt, eq, lt
);
    assign gt = (a > b);
    assign eq = (a == b);
    assign lt = (a < b);
endmodule

module cmp8 (
    input  logic [7:0] a, b,
    output logic       gt, eq, lt
);
    logic hi_gt, hi_eq, hi_lt, lo_gt, lo_eq, lo_lt;

    cmp4 hi (.a(a[7:4]), .b(b[7:4]), .gt(hi_gt), .eq(hi_eq), .lt(hi_lt));
    cmp4 lo (.a(a[3:0]), .b(b[3:0]), .gt(lo_gt), .eq(lo_eq), .lt(lo_lt));

    assign gt = hi_gt;
    assign eq = hi_eq | lo_eq;
    assign lt = hi_gt | (hi_eq & lo_lt);
endmodule