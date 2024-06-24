module full_sub(
    input a,
    input b,
    input c_i,
    output d_o,
    output b_o
);

    assign d_o = a ^ b ^ c_i;
    assign b_o = ((~a) & (b ^ c_i)) | (b & c_i);
    
endmodule

