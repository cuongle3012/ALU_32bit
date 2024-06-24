module shift_right_32bit (
    input wire [31:0] a,
    input wire [4:0] b,
    output reg [31:0] c_o
);

    always@* begin : shift_right
        case (b)
            5'b00000: c_o = a;                   // No shift
            5'b00001: c_o = {1'b0, a[31:1]};     // Shift right by 1 bit
            5'b00010: c_o = {2'b0, a[31:2]};     // Shift right by 2 bits
            5'b00011: c_o = {3'b0, a[31:3]};     // Shift right by 3 bits
            5'b00100: c_o = {4'b0, a[31:4]};     // Shift right by 4 bits
            5'b00101: c_o = {5'b0, a[31:5]};     // Shift right by 5 bits
            5'b00110: c_o = {6'b0, a[31:6]};     // Shift right by 6 bits
            5'b00111: c_o = {7'b0, a[31:7]};     // Shift right by 7 bits
            5'b01000: c_o = {8'b0, a[31:8]};     // Shift right by 8 bits
            5'b01001: c_o = {9'b0, a[31:9]};     // Shift right by 9 bits
            5'b01010: c_o = {10'b0, a[31:10]};   // Shift right by 10 bits
            5'b01011: c_o = {11'b0, a[31:11]};   // Shift right by 11 bits
            5'b01100: c_o = {12'b0, a[31:12]};   // Shift right by 12 bits
            5'b01101: c_o = {13'b0, a[31:13]};   // Shift right by 13 bits
            5'b01110: c_o = {14'b0, a[31:14]};   // Shift right by 14 bits
            5'b01111: c_o = {15'b0, a[31:15]};   // Shift right by 15 bits
            5'b10000: c_o = {16'b0, a[31:16]};   // Shift right by 16 bits
            5'b10001: c_o = {17'b0, a[31:17]};   // Shift right by 17 bits
            5'b10010: c_o = {18'b0, a[31:18]};   // Shift right by 18 bits
            5'b10011: c_o = {19'b0, a[31:19]};   // Shift right by 19 bits
            5'b10100: c_o = {20'b0, a[31:20]};   // Shift right by 20 bits
            5'b10101: c_o = {21'b0, a[31:21]};   // Shift right by 21 bits
            5'b10110: c_o = {22'b0, a[31:22]};   // Shift right by 22 bits
            5'b10111: c_o = {23'b0, a[31:23]};   // Shift right by 23 bits
            5'b11000: c_o = {24'b0, a[31:24]};   // Shift right by 24 bits
            5'b11001: c_o = {25'b0, a[31:25]};   // Shift right by 25 bits
            5'b11010: c_o = {26'b0, a[31:26]};   // Shift right by 26 bits
            5'b11011: c_o = {27'b0, a[31:27]};   // Shift right by 27 bits
            5'b11100: c_o = {28'b0, a[31:28]};   // Shift right by 28 bits
            5'b11101: c_o = {29'b0, a[31:29]};   // Shift right by 29 bits
            5'b11110: c_o = {30'b0, a[31:30]};   // Shift right by 30 bits
            5'b11111: c_o = {31'b0, a[31]};      // Shift right by 31 bits
            default: c_o = 32'b0;                // Default case: Shift right by 32 bits (result is all zeros)
        endcase
    end : shift_right

endmodule

