module complex_float_test (

input  clk, rst,
output signed [31:0] out,
output [7:0] out_en);

/* verilator tracing_off */

wire [31:0] in;
wire itr = 1'b0;
wire cheguei;
wire proc_req_in, proc_out_en;
wire [0:0] addr_in;
wire [2:0] addr_out;

`ifdef __ICARUS__
 `ifndef YANC_SIM_VIS
  `define YANC_SIM_VIS
 `endif
`endif
`ifdef YANC_TRACE
 `ifndef YANC_SIM_VIS
  `define YANC_SIM_VIS
 `endif
`endif

`ifdef YANC_SIM_VIS
wire mem_wr;
wire [5:0] mem_addr_wr;
wire [7:0] pc_sim_val;
`endif

processor#(.NUBITS(32),
.NBMANT(23),
.NBEXPO(8),
.NBOPER(8),
.NUGAIN(128),
.MDATAS(64),
.MINSTS(196),
.SDEPTH(32),
.DDEPTH(64),
.NBIOIN(1),
.NBIOOU(3),
.FFTSIZ(8),
.LOD(1),
.SET(1),
.F_MLT(1),
.F_ADD(1),
.F2I_M(1),
.OUT(1),
.CAL(1),
.P_LOD(1),
.SF_SU2(1),
.SF_ADD(1),
.SET_P(1),
.PF_NEG_M(1),
.F_LES(1),
.JIZ(1),
.F_DIV(1),
.F_ROT(1),
.PSH(1),
.F_ABS_M(1),
.F_SU2(1),
.F_SGN(1),
.F2I(1),
.I2F(1),
.AND(1),
.F_NEG(1),
.DFILE("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/complex_float_test/Hardware/complex_float_test_data.mif"),
.IFILE("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/complex_float_test/Hardware/complex_float_test_inst.mif"))

`ifdef YANC_SIM_VIS
p_complex_float_test (clk, rst, in, out, addr_in, addr_out, proc_req_in, proc_out_en, itr, cheguei, mem_wr, mem_addr_wr,pc_sim_val);
`else
p_complex_float_test (clk, rst, in, out, addr_in, addr_out, proc_req_in, proc_out_en, itr, cheguei);
`endif

addr_dec #(8) dec_out(proc_out_en, addr_out, out_en);

/* verilator tracing_on */

// ----------------------------------------------------------------------------
// Simulation -----------------------------------------------------------------
// ----------------------------------------------------------------------------

`ifdef YANC_SIM_VIS

// I/O ------------------------------------------------------------------------

reg signed [31:0] out_sig_0 = 0;
reg out_en_sim_0 = 0;
reg signed [31:0] out_sig_1 = 0;
reg out_en_sim_1 = 0;
reg signed [31:0] out_sig_2 = 0;
reg out_en_sim_2 = 0;
reg signed [31:0] out_sig_3 = 0;
reg out_en_sim_3 = 0;
reg signed [31:0] out_sig_4 = 0;
reg out_en_sim_4 = 0;
reg signed [31:0] out_sig_5 = 0;
reg out_en_sim_5 = 0;
reg signed [31:0] out_sig_6 = 0;
reg out_en_sim_6 = 0;
reg signed [31:0] out_sig_7 = 0;
reg out_en_sim_7 = 0;

always @ (posedge clk) begin
   if (out_en == 1) out_sig_0 <= out;
   if (out_en == 2) out_sig_1 <= out;
   if (out_en == 4) out_sig_2 <= out;
   if (out_en == 8) out_sig_3 <= out;
   if (out_en == 16) out_sig_4 <= out;
   if (out_en == 32) out_sig_5 <= out;
   if (out_en == 64) out_sig_6 <= out;
   if (out_en == 128) out_sig_7 <= out;
end
always @ (*) begin
   out_en_sim_0 = out_en == 1;
   out_en_sim_1 = out_en == 2;
   out_en_sim_2 = out_en == 4;
   out_en_sim_3 = out_en == 8;
   out_en_sim_4 = out_en == 16;
   out_en_sim_5 = out_en == 32;
   out_en_sim_6 = out_en == 64;
   out_en_sim_7 = out_en == 128;
end

// variables ------------------------------------------------------------------

/* verilator tracing_off */  // float decode helpers (not traced)
reg signed [23:0] sm_me2; always @ (*) sm_me2 = (out[31]) ? -$signed({1'b0, out[22:0]}) : $signed({1'b0, out[22:0]});
reg signed [7:0] e_me2; always @ (*)  e_me2 = $signed(out[30:23]);
/* verilator tracing_on */

real me2_f_global_v_a_e_ = 0.0;
real me2_f_global_v_b_e_ = 0.0;
real me2_f_global_v_c_e_ = 0.0;
real me2_f_global_v_r_arith_e_ = 0.0;
real me2_f_global_v_r_sqrt_e_ = 0.0;
real me2_f_global_v_r_sin_e_ = 0.0;
real me2_f_global_v_r_re_e_ = 0.0;
real me2_f_global_v_r_im_e_ = 0.0;
real me2_f_global_v_r_mod2_e_ = 0.0;
real me2_f_global_v_r_sum_re_e_ = 0.0;
real me2_f_global_v_r_phase_e_ = 0.0;
/* verilator tracing_off */  // comp raw halves (joined below, not traced)
reg [31:0] me3_f_global_v_z1_e_ /* verilator public_flat */ = 32'dx;
reg [31:0] me3_f_global_v_z1_i_e_ /* verilator public_flat */ = 32'dx;
reg [31:0] me3_f_global_v_z2_e_ /* verilator public_flat */ = 32'dx;
reg [31:0] me3_f_global_v_z2_i_e_ /* verilator public_flat */ = 32'dx;
reg [31:0] me3_f_global_v_zmul_i_e_ /* verilator public_flat */ = 32'dx;
reg [31:0] me3_f_global_v_zmul_e_ /* verilator public_flat */ = 32'dx;
reg [31:0] me3_f_global_v_zsum_i_e_ /* verilator public_flat */ = 32'dx;
reg [31:0] me3_f_global_v_zsum_e_ /* verilator public_flat */ = 32'dx;
/* verilator tracing_on */

always @ (posedge clk) begin
   if (mem_addr_wr == 1 && mem_wr) me2_f_global_v_a_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 3 && mem_wr) me2_f_global_v_b_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 5 && mem_wr) me2_f_global_v_c_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 6 && mem_wr) me2_f_global_v_r_arith_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 8 && mem_wr) me2_f_global_v_r_sqrt_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 10 && mem_wr) me2_f_global_v_r_sin_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 12 && mem_wr) me3_f_global_v_z1_e_ <= out;
   if (mem_addr_wr == 14 && mem_wr) me3_f_global_v_z1_i_e_ <= out;
   if (mem_addr_wr == 16 && mem_wr) me3_f_global_v_z2_e_ <= out;
   if (mem_addr_wr == 18 && mem_wr) me3_f_global_v_z2_i_e_ <= out;
   if (mem_addr_wr == 19 && mem_wr) me3_f_global_v_zmul_i_e_ <= out;
   if (mem_addr_wr == 20 && mem_wr) me3_f_global_v_zmul_e_ <= out;
   if (mem_addr_wr == 21 && mem_wr) me2_f_global_v_r_re_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 22 && mem_wr) me2_f_global_v_r_im_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 23 && mem_wr) me2_f_global_v_r_mod2_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 25 && mem_wr) me3_f_global_v_zsum_i_e_ <= out;
   if (mem_addr_wr == 26 && mem_wr) me3_f_global_v_zsum_e_ <= out;
   if (mem_addr_wr == 27 && mem_wr) me2_f_global_v_r_sum_re_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 34 && mem_wr) me2_f_global_v_r_phase_e_ <= sm_me2*$pow(2.0,e_me2);
end

wire [16+32*2-1:0] comp_me3_f_global_v_z1_e_ = {8'd23, 8'd8, me3_f_global_v_z1_e_, me3_f_global_v_z1_i_e_};
wire [16+32*2-1:0] comp_me3_f_global_v_z2_e_ = {8'd23, 8'd8, me3_f_global_v_z2_e_, me3_f_global_v_z2_i_e_};
wire [16+32*2-1:0] comp_me3_f_global_v_zmul_e_ = {8'd23, 8'd8, me3_f_global_v_zmul_e_, me3_f_global_v_zmul_i_e_};
wire [16+32*2-1:0] comp_me3_f_global_v_zsum_e_ = {8'd23, 8'd8, me3_f_global_v_zsum_e_, me3_f_global_v_zsum_i_e_};

// instructions ---------------------------------------------------------------

reg [31:0] valr2=0;
/* verilator tracing_off */
reg [31:0] valr1 /* verilator public_flat */=0;
reg [31:0] valr3 /* verilator public_flat */=0;
reg [31:0] valr4 /* verilator public_flat */=0;
reg [31:0] valr5 /* verilator public_flat */=0;
reg [31:0] valr6 /* verilator public_flat */=0;
reg [31:0] valr7 /* verilator public_flat */=0;
reg [31:0] valr8 /* verilator public_flat */=0;
reg [31:0] valr9 /* verilator public_flat */=0;
reg [31:0] valr10 /* verilator public_flat */=0;
/* verilator tracing_on */

reg [19:0] min [0:112-1];

/* verilator tracing_off */ reg signed [19:0] linetab /* verilator public_flat */ =-1; /* verilator tracing_on */
reg signed [19:0] linetabs=-1;

initial	$readmemb("pc_complex_float_test_mem.txt",min);

always @ (posedge clk) begin
if (pc_sim_val < 112) linetab <= min[pc_sim_val];
linetabs <= linetab;   
valr1    <= {{(24){1'b0}}, pc_sim_val};
valr2    <= valr1;
valr3    <= valr2;
valr4    <= valr3;
valr5    <= valr4;
valr6    <= valr5;
valr7    <= valr6;
valr8    <= valr7;
valr9    <= valr8;
valr10   <= valr9;
end

`endif

endmodule