module sub_32bit(
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] d,
    output wire b_o
);
    wire [31:0] b_w;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : full_subtractors
            if (i == 0)
                full_sub FS (.a(a[i]), .b(b[i]), .c_i(1'b0), .d_o(d[i]), .b_o(b_w[i]));
            else
                full_sub FS (.a(a[i]), .b(b[i]), .c_i(b_w[i-1]), .d_o(d[i]), .b_o(b_w[i]));
        end
    endgenerate

    assign b_o = b_w[31];
endmodule

