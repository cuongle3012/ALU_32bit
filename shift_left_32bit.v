module shift_left_32bit (
    input wire [31:0] a,
    input wire [4:0] b,
    output reg [31:0] c_o
);

    always@* begin : shift_left
        case (b)
            5'b00000: c_o = a;                   // No shift
            5'b00001: c_o = {a[30:0], 1'b0};      // Shift left by 1 bit
            5'b00010: c_o = {a[29:0], 2'b0};      // Shift left by 2 bits
            5'b00011: c_o = {a[28:0], 3'b0};      // Shift left by 3 bits
            5'b00100: c_o = {a[27:0], 4'b0};      // Shift left by 4 bits
            5'b00101: c_o = {a[26:0], 5'b0};      // Shift left by 5 bits
            5'b00110: c_o = {a[25:0], 6'b0};      // Shift left by 6 bits
            5'b00111: c_o = {a[24:0], 7'b0};      // Shift left by 7 bits
            5'b01000: c_o = {a[23:0], 8'b0};      // Shift left by 8 bits
            5'b01001: c_o = {a[22:0], 9'b0};      // Shift left by 9 bits
            5'b01010: c_o = {a[21:0], 10'b0};     // Shift left by 10 bits
            5'b01011: c_o = {a[20:0], 11'b0};     // Shift left by 11 bits
            5'b01100: c_o = {a[19:0], 12'b0};     // Shift left by 12 bits
            5'b01101: c_o = {a[18:0], 13'b0};     // Shift left by 13 bits
            5'b01110: c_o = {a[17:0], 14'b0};     // Shift left by 14 bits
            5'b01111: c_o = {a[16:0], 15'b0};     // Shift left by 15 bits
            5'b10000: c_o = {a[15:0], 16'b0};     // Shift left by 16 bits
            5'b10001: c_o = {a[14:0], 17'b0};     // Shift left by 17 bits
            5'b10010: c_o = {a[13:0], 18'b0};     // Shift left by 18 bits
            5'b10011: c_o = {a[12:0], 19'b0};     // Shift left by 19 bits
            5'b10100: c_o = {a[11:0], 20'b0};     // Shift left by 20 bits
            5'b10101: c_o = {a[10:0], 21'b0};     // Shift left by 21 bits
            5'b10110: c_o = {a[9:0], 22'b0};      // Shift left by 22 bits
            5'b10111: c_o = {a[8:0], 23'b0};      // Shift left by 23 bits
            5'b11000: c_o = {a[7:0], 24'b0};      // Shift left by 24 bits
            5'b11001: c_o = {a[6:0], 25'b0};      // Shift left by 25 bits
            5'b11010: c_o = {a[5:0], 26'b0};      // Shift left by 26 bits
            5'b11011: c_o = {a[4:0], 27'b0};      // Shift left by 27 bits
            5'b11100: c_o = {a[3:0], 28'b0};      // Shift left by 28 bits
            5'b11101: c_o = {a[2:0], 29'b0};      // Shift left by 29 bits
            5'b11110: c_o = {a[1:0], 30'b0};      // Shift left by 30 bits
            5'b11111: c_o = {a[0], 31'b0};        // Shift left by 31 bits
            default: c_o = 32'b0;                 // Default case: Shift left by 32 bits (result is all zeros)
        endcase
    end : shift_left

endmodule

