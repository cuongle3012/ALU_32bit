module alu_top (
    input wire clk,
    input wire rst_n,
    input wire [2:0] op,
    input wire [31:0] a,
    input wire [31:0] b,
    output reg [31:0] result,
   // output reg [3:0] alu_flag,
    output reg carry
);

    wire [31:0] add_w, sub_w, and_w, or_w, xor_w, not_w, shift_right_w, shift_left_w;
    wire carry_a_w, carry_s_w, eq_o, lt_o, gt_o;
    reg [31:0] result_d, result_w;
    //reg [3:0] alu_flag_d;
    reg carry_d;

    // Instantiate 32-bit modules with wires
    adder_32bit A0(a, b, add_w, carry_a_w);
    sub_32bit S0(a, b, sub_w, carry_s_w);
    and_32bit A1(a, b, and_w);
    or_32bit O0(a, b, or_w);
    not_32bit N0(a, not_w);
    shift_right_32bit SR(a, b[4:0], shift_right_w);
    shift_left_32bit SL(a, b[4:0], shift_left_w);
    comparator_32bit c0(a, b, eq_o, lt_o, gt_o, result_w);
    // ALU operation selection
    always @(*)
        case (op)
            3'b000: begin  // Addition
                {carry_d, result_d} = {carry_a_w, add_w};
            end
            3'b001: begin  // Subtraction
                {carry_d, result_d} = {carry_s_w, sub_w};
            end
            3'b010: begin  // Shift left
                {carry_d, result_d} = {1'b0, shift_left_w};
            end
            3'b011: begin  // Shift right
                {carry_d, result_d} = {1'b0, shift_right_w};
            end
            3'b100: begin  // AND
                {carry_d, result_d} = {1'b0, and_w};
            end
            3'b101: begin  // OR
                {carry_d, result_d} = {1'b0, or_w};
            end
            3'b110: begin  // NOT
                {carry_d, result_d} = {1'b0, not_w};
            end
            3'b111: begin  // compare
                {carry_d, result_d} = {1'b0, result_w};
            end
            default: begin
                carry_d = 1'b0; 
                result_d = 32'b0;
            end
        endcase


    // Update flags
   /* always @(*)
    begin
        alu_flag_d[3] = (result_d[31] == 1'b1) ? 1'b1 : 1'b0;  // Negative flag (N)
        alu_flag_d[2] = (result_d == 32'b0) ? 1'b1 : 1'b0;    // Zero flag (Z)
        alu_flag_d[1] = carry_d;                              // Carry flag (C)
        alu_flag_d[0] = (op == 3'b000 || op == 3'b001) ? (a[31] ^ b[31] ^ carry_a_w) : 1'b0; // Overflow flag (V)
    end*/

    // Clocked process for register updates
    always @(posedge clk or negedge rst_n)
    begin
        if (!rst_n) begin
            carry <=1'b0;
            result <= 32'b0;
           // alu_flag <= 4'b0;
        end
        else begin
            {carry, result} <= {carry_d, result_d};
           // alu_flag <= alu_flag_d;
        end
    end

endmodule

