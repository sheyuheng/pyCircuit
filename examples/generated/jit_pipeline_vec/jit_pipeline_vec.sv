`include "pyc_add.sv"
`include "pyc_mux.sv"
`include "pyc_and.sv"
`include "pyc_or.sv"
`include "pyc_xor.sv"
`include "pyc_not.sv"
`include "pyc_reg.sv"
`include "pyc_fifo.sv"

`include "pyc_byte_mem.sv"

module JitPipelineVec (
  input logic sys_clk,
  input logic sys_rst,
  input logic [15:0] a,
  input logic [15:0] b,
  input logic sel,
  output logic tag,
  output logic [15:0] data,
  output logic [7:0] lo8
);

logic v1;
logic [24:0] v2;
logic v3;
logic [24:0] v4;
logic [15:0] a__jit_pipeline_vec__L19;
logic [15:0] b__jit_pipeline_vec__L20;
logic sel__jit_pipeline_vec__L21;
logic [15:0] v5;
logic [15:0] sum___jit_pipeline_vec__L24;
logic [15:0] v6;
logic [15:0] x__jit_pipeline_vec__L25;
logic [15:0] data__jit_pipeline_vec__L26;
logic [15:0] data__jit_pipeline_vec__L28;
logic [15:0] v7;
logic [15:0] data__jit_pipeline_vec__L27;
logic v8;
logic tag__jit_pipeline_vec__L29;
logic [7:0] v9;
logic [7:0] lo8__jit_pipeline_vec__L30;
logic [24:0] v10;
logic [24:0] v11;
logic [24:0] v12;
logic [24:0] v13;
logic [24:0] v14;
logic [24:0] v15;
logic [24:0] v16;
logic [24:0] v17;
logic [24:0] v18;
logic [24:0] bus__jit_pipeline_vec__L33;
logic [24:0] PIPE0__bus_s0__next;
logic [24:0] v19;
logic [24:0] PIPE0__bus_s0;
logic [24:0] PIPE1__bus_s1__next;
logic [24:0] v20;
logic [24:0] PIPE1__bus_s1;
logic [24:0] PIPE2__bus_s2__next;
logic [24:0] v21;
logic [24:0] PIPE2__bus_s2;
logic [24:0] bus__jit_pipeline_vec__L35;
logic [7:0] v22;
logic [15:0] v23;
logic v24;
logic [7:0] v25;
logic [15:0] v26;
logic v27;

assign v1 = 1'd1;
assign v2 = 25'd0;
assign v3 = v1;
assign v4 = v2;
assign a__jit_pipeline_vec__L19 = a;
assign b__jit_pipeline_vec__L20 = b;
assign sel__jit_pipeline_vec__L21 = sel;
pyc_add #(.WIDTH(16)) v5_inst (
  .a(a__jit_pipeline_vec__L19),
  .b(b__jit_pipeline_vec__L20),
  .y(v5)
);
assign sum___jit_pipeline_vec__L24 = v5;
pyc_xor #(.WIDTH(16)) v6_inst (
  .a(a__jit_pipeline_vec__L19),
  .b(b__jit_pipeline_vec__L20),
  .y(v6)
);
assign x__jit_pipeline_vec__L25 = v6;
assign data__jit_pipeline_vec__L26 = x__jit_pipeline_vec__L25;
assign data__jit_pipeline_vec__L28 = sum___jit_pipeline_vec__L24;
pyc_mux #(.WIDTH(16)) v7_inst (
  .sel(sel__jit_pipeline_vec__L21),
  .a(data__jit_pipeline_vec__L28),
  .b(data__jit_pipeline_vec__L26),
  .y(v7)
);
assign data__jit_pipeline_vec__L27 = v7;
assign v8 = (a__jit_pipeline_vec__L19 == b__jit_pipeline_vec__L20);
assign tag__jit_pipeline_vec__L29 = v8;
assign v9 = data__jit_pipeline_vec__L27[7:0];
assign lo8__jit_pipeline_vec__L30 = v9;
assign v10 = {{17{1'b0}}, lo8__jit_pipeline_vec__L30};
assign v11 = (v4 | v10);
assign v12 = {{9{1'b0}}, data__jit_pipeline_vec__L27};
assign v13 = (v12 << 8);
assign v14 = (v11 | v13);
assign v15 = {{24{1'b0}}, tag__jit_pipeline_vec__L29};
assign v16 = (v15 << 24);
assign v17 = (v14 | v16);
assign v18 = v17;
assign bus__jit_pipeline_vec__L33 = v18;
pyc_reg #(.WIDTH(25)) v19_inst (
  .clk(sys_clk),
  .rst(sys_rst),
  .en(v3),
  .d(PIPE0__bus_s0__next),
  .init(v4),
  .q(v19)
);
assign PIPE0__bus_s0 = v19;
assign PIPE0__bus_s0__next = bus__jit_pipeline_vec__L33;
pyc_reg #(.WIDTH(25)) v20_inst (
  .clk(sys_clk),
  .rst(sys_rst),
  .en(v3),
  .d(PIPE1__bus_s1__next),
  .init(v4),
  .q(v20)
);
assign PIPE1__bus_s1 = v20;
assign PIPE1__bus_s1__next = PIPE0__bus_s0;
pyc_reg #(.WIDTH(25)) v21_inst (
  .clk(sys_clk),
  .rst(sys_rst),
  .en(v3),
  .d(PIPE2__bus_s2__next),
  .init(v4),
  .q(v21)
);
assign PIPE2__bus_s2 = v21;
assign PIPE2__bus_s2__next = PIPE1__bus_s1;
assign bus__jit_pipeline_vec__L35 = PIPE2__bus_s2;
assign v22 = bus__jit_pipeline_vec__L35[7:0];
assign v23 = bus__jit_pipeline_vec__L35[23:8];
assign v24 = bus__jit_pipeline_vec__L35[24];
assign v25 = v22;
assign v26 = v23;
assign v27 = v24;
assign tag = v27;
assign data = v26;
assign lo8 = v25;

endmodule

