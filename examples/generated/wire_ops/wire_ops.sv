`include "pyc_add.sv"
`include "pyc_mux.sv"
`include "pyc_and.sv"
`include "pyc_or.sv"
`include "pyc_xor.sv"
`include "pyc_not.sv"
`include "pyc_reg.sv"
`include "pyc_fifo.sv"

`include "pyc_byte_mem.sv"

module WireOps (
  input logic sys_clk,
  input logic sys_rst,
  input logic [7:0] a,
  input logic [7:0] b,
  input logic sel,
  output logic [7:0] y
);

logic [7:0] v1;
logic v2;
logic [7:0] v3;
logic v4;
logic [7:0] a__wire_ops__L9;
logic [7:0] b__wire_ops__L10;
logic sel__wire_ops__L11;
logic [7:0] v5;
logic [7:0] COMB__y__wire_ops__L14;
logic [7:0] v6;
logic [7:0] COMB__y__wire_ops__L16;
logic [7:0] v7;
logic [7:0] COMB__y__wire_ops__L15;
logic [7:0] y_reg__next;
logic [7:0] v8;
logic [7:0] y_reg;
logic [7:0] r__wire_ops__L18;

assign v1 = 8'd0;
assign v2 = 1'd1;
assign v3 = v1;
assign v4 = v2;
assign a__wire_ops__L9 = a;
assign b__wire_ops__L10 = b;
assign sel__wire_ops__L11 = sel;
pyc_xor #(.WIDTH(8)) v5_inst (
  .a(a__wire_ops__L9),
  .b(b__wire_ops__L10),
  .y(v5)
);
assign COMB__y__wire_ops__L14 = v5;
pyc_and #(.WIDTH(8)) v6_inst (
  .a(a__wire_ops__L9),
  .b(b__wire_ops__L10),
  .y(v6)
);
assign COMB__y__wire_ops__L16 = v6;
pyc_mux #(.WIDTH(8)) v7_inst (
  .sel(sel__wire_ops__L11),
  .a(COMB__y__wire_ops__L16),
  .b(COMB__y__wire_ops__L14),
  .y(v7)
);
assign COMB__y__wire_ops__L15 = v7;
pyc_reg #(.WIDTH(8)) v8_inst (
  .clk(sys_clk),
  .rst(sys_rst),
  .en(v4),
  .d(y_reg__next),
  .init(v3),
  .q(v8)
);
assign y_reg = v8;
assign r__wire_ops__L18 = y_reg;
assign y_reg__next = COMB__y__wire_ops__L15;
assign y = r__wire_ops__L18;

endmodule

