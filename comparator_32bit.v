/*module comparator_1bit (
   input A,B,
		 input lt_i, eq_i, gt_i,
		 output lt_o, eq_o, gt_o
		 );

assign lt_o = (!A&B)|(lt_i&((A&B)|(!A&!B)));
assign eq_o = ((A&B)|(!A&!B))&eq_i;
assign gt_o = (A&!B)|(gt_i&((A&B)|(!A&!B)));

endmodule*/

module comparator_32bit 
 (input [31:0] a,b,
		output lt_o, eq_o, gt_o,
  output reg [31:0] result_w
	       );

wire [31:0] lt_i, eq_i, gt_i;

comparator_1bit cmp_inst0 (.a(a[0]),.a(a[0]),.lt_i(1'b0),.eq_i(1'b1),.gt_i(1'b0),.lt_o(lt_i[0]),.eq_o(eq_i[0]),.gt_o(gt_i[0])); 

genvar i;
generate
for (i=1;i<32;i=i+1) begin
comparator_1bit cmp_inst1(.a(a[i]),.b(b[i]),.lt_i(lt_i[i-1]),.eq_i(eq_i[i-1]),.gt_i(gt_i[i-1]),.lt_o(lt_i[i]),.eq_o(eq_i[i]),.gt_o(gt_i[i]));
end
endgenerate

assign eq_o = eq_i[31];
assign lt_o = lt_i[31];
assign gt_o = gt_i[31];
always@(*) begin
if (eq_o) begin
  result_w = 32'h0;
end else if (lt_o) begin
  result_w = 32'h1; 
end else begin
  result_w = 32'h2;
end
end
endmodule
