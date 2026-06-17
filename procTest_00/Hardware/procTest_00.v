module procTest_00 (

input  clk, rst,
output signed [22:0] out,
output [0:0] out_en);

/* verilator tracing_off */

wire [22:0] in;
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
wire [1:0] mem_addr_wr;
wire [3:0] pc_sim_val;
`endif

processor#(.NUBITS(23),
.NBMANT(16),
.NBEXPO(6),
.NBOPER(4),
.NUGAIN(128),
.MDATAS(4),
.MINSTS(10),
.SDEPTH(5),
.DDEPTH(5),
.NBIOIN(1),
.NBIOOU(1),
.FFTSIZ(8),
.LOD(1),
.SET(1),
.ADD(1),
.OUT(1),
.DFILE("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/procTest_00/Hardware/procTest_00_data.mif"),
.IFILE("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/procTest_00/Hardware/procTest_00_inst.mif"))

`ifdef YANC_SIM_VIS
p_procTest_00 (clk, rst, in, out, addr_in, addr_out, proc_req_in, proc_out_en, itr, cheguei, mem_wr, mem_addr_wr,pc_sim_val);
`else
p_procTest_00 (clk, rst, in, out, addr_in, addr_out, proc_req_in, proc_out_en, itr, cheguei);
`endif

assign out_en = proc_out_en;

/* verilator tracing_on */

// ----------------------------------------------------------------------------
// Simulation -----------------------------------------------------------------
// ----------------------------------------------------------------------------

`ifdef YANC_SIM_VIS

// I/O ------------------------------------------------------------------------

reg signed [22:0] out_sig_0 = 0;
reg out_en_sim_0 = 0;

always @ (posedge clk) begin
   if (out_en == 1) out_sig_0 <= out;
end
always @ (*) begin
   out_en_sim_0 = out_en == 1;
end

// variables ------------------------------------------------------------------

reg [22:0] me1_f_main_v_a_e_ = 0;
reg [22:0] me1_f_main_v_b_e_ = 0;
reg [22:0] me1_f_main_v_c_e_ = 0;

always @ (posedge clk) begin
   if (mem_addr_wr == 1 && mem_wr) me1_f_main_v_a_e_ <= out;
   if (mem_addr_wr == 2 && mem_wr) me1_f_main_v_b_e_ <= out;
   if (mem_addr_wr == 3 && mem_wr) me1_f_main_v_c_e_ <= out;
end

// instructions ---------------------------------------------------------------

reg [22:0] valr2=0;
/* verilator tracing_off */
reg [22:0] valr1 /* verilator public_flat */=0;
reg [22:0] valr3 /* verilator public_flat */=0;
reg [22:0] valr4 /* verilator public_flat */=0;
reg [22:0] valr5 /* verilator public_flat */=0;
reg [22:0] valr6 /* verilator public_flat */=0;
reg [22:0] valr7 /* verilator public_flat */=0;
reg [22:0] valr8 /* verilator public_flat */=0;
reg [22:0] valr9 /* verilator public_flat */=0;
reg [22:0] valr10 /* verilator public_flat */=0;
/* verilator tracing_on */

reg [19:0] min [0:10-1];

/* verilator tracing_off */ reg signed [19:0] linetab /* verilator public_flat */ =-1; /* verilator tracing_on */
reg signed [19:0] linetabs=-1;

initial	$readmemb("pc_procTest_00_mem.txt",min);

always @ (posedge clk) begin
if (pc_sim_val < 10) linetab <= min[pc_sim_val];
linetabs <= linetab;   
valr1    <= {{(19){1'b0}}, pc_sim_val};
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