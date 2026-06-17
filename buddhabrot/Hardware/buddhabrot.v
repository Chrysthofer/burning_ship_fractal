module buddhabrot (

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
wire [16:0] mem_addr_wr;
wire [7:0] pc_sim_val;
`endif

processor#(.NUBITS(32),
.NBMANT(23),
.NBEXPO(8),
.NBOPER(17),
.NUGAIN(128),
.MDATAS(66563),
.MINSTS(148),
.SDEPTH(16),
.DDEPTH(64),
.NBIOIN(1),
.NBIOOU(1),
.FFTSIZ(8),
.LOD(1),
.SET(1),
.LES(1),
.JIZ(1),
.P_LOD(1),
.STI(1),
.ADD(1),
.F_NEG_M(1),
.P_I2F_M(1),
.F_MLT(1),
.SF_ADD(1),
.SF_SU2(1),
.F_ADD(1),
.SF_GRE(1),
.EQU(1),
.LDI(1),
.F2I(1),
.LIN(1),
.MLT(1),
.OUT(1),
.DFILE("C:/Users/LCOM/Desktop/burning_ship_fractal/fractal_proc/buddhabrot/Hardware/buddhabrot_data.mif"),
.IFILE("C:/Users/LCOM/Desktop/burning_ship_fractal/fractal_proc/buddhabrot/Hardware/buddhabrot_inst.mif"))

`ifdef YANC_SIM_VIS
p_buddhabrot (clk, rst, in, out, addr_in, addr_out, proc_req_in, proc_out_en, itr, cheguei, mem_wr, mem_addr_wr,pc_sim_val);
`else
p_buddhabrot (clk, rst, in, out, addr_in, addr_out, proc_req_in, proc_out_en, itr, cheguei);
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

reg [31:0] me1_f_main_v_ii_e_ = 0;
reg [31:0] me1_f_main_v_sy_e_ = 0;
real me2_f_main_v_cy_e_ = 0.0;
reg [31:0] me1_f_main_v_sx_e_ = 0;
real me2_f_main_v_cx_e_ = 0.0;
real me2_f_main_v_zx_e_ = 0.0;
real me2_f_main_v_zy_e_ = 0.0;
reg [31:0] me1_f_main_v_n_e_ = 0;
reg [31:0] me1_f_main_v_escaped_e_ = 0;
real me2_f_main_v_zx2_e_ = 0.0;
real me2_f_main_v_zy2_e_ = 0.0;
reg [31:0] me1_f_main_v_k_e_ = 0;
reg [31:0] me1_f_main_v_px_e_ = 0;
reg [31:0] me1_f_main_v_py_e_ = 0;
reg [31:0] me1_f_main_v_idx_e_ = 0;
reg [31:0] me1_f_main_v_p_e_ = 0;

always @ (posedge clk) begin
   if (mem_addr_wr == 66537 && mem_wr) me1_f_main_v_ii_e_ <= out;
   if (mem_addr_wr == 66540 && mem_wr) me1_f_main_v_sy_e_ <= out;
   if (mem_addr_wr == 66544 && mem_wr) me2_f_main_v_cy_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 66545 && mem_wr) me1_f_main_v_sx_e_ <= out;
   if (mem_addr_wr == 66546 && mem_wr) me2_f_main_v_cx_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 66548 && mem_wr) me2_f_main_v_zx_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 66549 && mem_wr) me2_f_main_v_zy_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 66550 && mem_wr) me1_f_main_v_n_e_ <= out;
   if (mem_addr_wr == 66551 && mem_wr) me1_f_main_v_escaped_e_ <= out;
   if (mem_addr_wr == 66553 && mem_wr) me2_f_main_v_zx2_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 66554 && mem_wr) me2_f_main_v_zy2_e_ <= sm_me2*$pow(2.0,e_me2);
   if (mem_addr_wr == 66556 && mem_wr) me1_f_main_v_k_e_ <= out;
   if (mem_addr_wr == 66558 && mem_wr) me1_f_main_v_px_e_ <= out;
   if (mem_addr_wr == 66559 && mem_wr) me1_f_main_v_py_e_ <= out;
   if (mem_addr_wr == 66561 && mem_wr) me1_f_main_v_idx_e_ <= out;
   if (mem_addr_wr == 66562 && mem_wr) me1_f_main_v_p_e_ <= out;
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

reg [19:0] min [0:148-1];

/* verilator tracing_off */ reg signed [19:0] linetab /* verilator public_flat */ =-1; /* verilator tracing_on */
reg signed [19:0] linetabs=-1;

initial	$readmemb("pc_buddhabrot_mem.txt",min);

always @ (posedge clk) begin
if (pc_sim_val < 148) linetab <= min[pc_sim_val];
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