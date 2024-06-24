module or_32bit(
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] c_o
);

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : or_gate_loop
            or u_or(c_o[i], a[i], b[i]);
        end
    endgenerate

endmodule

