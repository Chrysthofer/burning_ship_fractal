module burning_ship (

input  clk, rst,
output signed [31:0] out,
output [0:0] out_en);

/* verilator tracing_off */

wire [31:0] in;
wire itr = 1'b0;
wire cheguei;
wire proc_req_in, proc_out_en;
wire [0:0] addr_in;
wire [0:0] addr_out;

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
wire [4:0] mem_addr_wr;
wire [6:0] pc_sim_val;
`endif

processor#(.NUBITS(32),
.NBMANT(23),
.NBEXPO(8),
.NBOPER(7),
.NUGAIN(128),
.MDATAS(29),
.MINSTS(91),
.SDEPTH(32),
.DDEPTH(64),
.NBIOIN(1),
.NBIOOU(1),
.FFTSIZ(8),
.F_NEG_M(1),
.SET(1),
.LOD(1),
.LES(1),
.JIZ(1),
.F_MLT(1),
.F_ADD(1),
.P_LOD(1),
.SF_GRE(1),
.F_ABS_M(1),
.F_SU1(1),
.ADD(1),
.OUT(1),
.DFILE("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/burning_ship/Hardware/burning_ship_data.mif"),
.IFILE("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/burning_ship/Hardware/burning_ship_inst.mif"))

`ifdef YANC_SIM_VIS
p_burning_ship (clk, rst, in, out, addr_in, addr_out, proc_req_in, proc_out_en, itr, cheguei, mem_wr, mem_addr_wr,pc_sim_val);
`else
p_burning_ship (clk, rst, in, out, addr_in, addr_out, proc_req_in, proc_out_en, itr, cheguei);
`endif

assign out_en = proc_out_en;

/* verilator tracing_on */

// ----------------------------------------------------------------------------
// Simulation -----------------------------------------------------------------
// ----------------------------------------------------------------------------

`ifdef YANC_SIM_VIS

// I/O ------------------------------------------------------------------------

reg signed [31:0] out_sig_0 = 0;
reg out_en_sim_0 = 0;

always @ (posedge clk) begin
   if (out_en == 1) out_sig_0 <= out;
end
always @ (*) begin
   out_en_sim_0 = out_en == 1;
end

// variables ------------------------------------------------------------------

/* verilator tracing_off */  // float decode helpers (not traced)
reg signed [23:0] sm_me2; always @ (*) sm_me2 = (out[31]) ? -$signed({1'b0, out[22:0]}) : $signed({1'b0, out[22:0]});
reg signed [7:0] e_me2; always @ (*)  e_me2 = $signed(out[30:23]);
/* verilator tracing_on */

real me2_f_main_v_xmin_e_ = 0.0;
real me2_f_main_v_ymin_e_ = 0.0;
real me2_f_main_v_dx_e_ = 0.0;
real me2_f_main_v_dy_e_ = 0.0;
real me2_f_main_v_bail_e_ = 0.0;
real me2_f_main_v_fy_e_ = 0.0;
reg [31:0] me1_f_main_v_py_e_ = 0;
real me2_f_main_v_cy_e_ = 0.0;
real me2_f_main_v_fx_e_ = 0.0;
reg [31:0] me1_f_main_v_px_e_ = 0;
real me2_f_main_v_cx_e_ = 0.0;
real me2_f_main_v_zx_e_ = 0.0;
real me2_f_main_v_zy_e_ = 0.0;
real me2_f_main_v_zx2_e_ = 0.0;
real me2_f_main_v_zy2_e_ = 0.0;
reg [31:0] me1_f_main_v_n_e_ = 0;
real me2_f_main_v_ax_e_ = 0.0;
real me2_f_main_v_ay_e_ = 0.0;

always @ (posedge clk) begin
   if (mem_addr_wr == 1 && mem_wr) me2_f_main_v_xmin_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 2 && mem_wr) me2_f_main_v_ymin_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 4 && mem_wr) me2_f_main_v_dx_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 6 && mem_wr) me2_f_main_v_dy_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 8 && mem_wr) me2_f_main_v_bail_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 10 && mem_wr) me2_f_main_v_fy_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 12 && mem_wr) me1_f_main_v_py_e_ <= out;
   if (mem_addr_wr == 14 && mem_wr) me2_f_main_v_cy_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 15 && mem_wr) me2_f_main_v_fx_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 16 && mem_wr) me1_f_main_v_px_e_ <= out;
   if (mem_addr_wr == 18 && mem_wr) me2_f_main_v_cx_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 19 && mem_wr) me2_f_main_v_zx_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 20 && mem_wr) me2_f_main_v_zy_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 21 && mem_wr) me2_f_main_v_zx2_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 22 && mem_wr) me2_f_main_v_zy2_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 23 && mem_wr) me1_f_main_v_n_e_ <= out;
   if (mem_addr_wr == 25 && mem_wr) me2_f_main_v_ax_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 26 && mem_wr) me2_f_main_v_ay_e_ <= sm_me2*$pow(2.0,e_me2);
end

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

reg [19:0] min [0:91-1];

/* verilator tracing_off */ reg signed [19:0] linetab /* verilator public_flat */ =-1; /* verilator tracing_on */
reg signed [19:0] linetabs=-1;

initial	$readmemb("pc_burning_ship_mem.txt",min);

always @ (posedge clk) begin
if (pc_sim_val < 91) linetab <= min[pc_sim_val];
linetabs <= linetab;   
valr1    <= {{(25){1'b0}}, pc_sim_val};
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