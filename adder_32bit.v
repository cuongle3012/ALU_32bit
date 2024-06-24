module adder_32bit(
			input [31:0] a,
			input [31:0] b,
			output [31:0] s,
			output c
);

    wire [31:0] c_w;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : full_adders
            if (i == 0)
                full_adder FA (.a(a[i]), .b(b[i]), .cin(1'b0), .sum(s[i]), .cout(c_w[i]));
            else
                full_adder FA (.a(a[i]), .b(b[i]), .cin(c_w[i-1]), .sum(s[i]), .cout(c_w[i]));
        end
    endgenerate

    assign c = c_w[31];

endmodule



