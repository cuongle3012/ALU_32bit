module and_32bit(
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] c_o
);

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : and_gate_loop
            and u_and(c_o[i], a[i], b[i]);
        end
    endgenerate

endmodule

