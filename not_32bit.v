module not_32bit(
    input wire [31:0] a,   // 32-bit input vector a
    output wire [31:0] c_o // 32-bit output vector c_o
);

    genvar i; // Declare a generate variable
    generate
        for (i = 0; i < 32; i = i + 1) begin : not_gate_loop
            // Instantiate a NOT gate for each bit
            not u_not(c_o[i], a[i]);
        end
    endgenerate

endmodule

