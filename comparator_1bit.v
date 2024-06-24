module comparator_1bit (
   input A,B,
   input lt_i, eq_i, gt_i,
   output lt_o, eq_o, gt_o
   );

assign lt_o = (!A&B)|(lt_i&((A&B)|(!A&!B)));
assign eq_o = ((A&B)|(!A&!B))&eq_i;
assign gt_o = (A&!B)|(gt_i&((A&B)|(!A&!B)));

endmodule
