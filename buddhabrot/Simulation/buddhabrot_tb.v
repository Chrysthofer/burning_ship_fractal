`timescale 1ns/1ps

module buddhabrot_tb();

// clock and reset generation -------------------------------------------------

reg clk, rst;

initial begin
    clk = 0;
    rst = 1;
    #10.000000;
    rst = 0;
end

always #5.000000 clk = ~clk;

// processor instance ---------------------------------------------------------

/* verilator tracing_off */

wire signed [31:0] proc_io_out;
wire [0:0] proc_out_en;

/* verilator tracing_on */
buddhabrot proc(clk,rst,proc_io_out,proc_out_en);

/* verilator tracing_off */

// output ports ---------------------------------------------------------------

// port 0 variables
integer data_out_0;
reg signed [31:0] out_sig_0 = 0;
reg out_en_0 = 0;

// open a file for writing on each port
initial begin
    data_out_0 = $fopen("C:/Users/LCOM/Desktop/burning_ship_fractal/fractal_proc/buddhabrot/Simulation/output_0.txt", "w"); // check the output data in this file
end

// decode output ports
always @ (*) begin
    // port 0 decoding
    out_sig_0 = proc_io_out;
    out_en_0  = proc_out_en == 1;
end

// implement writing to the file
always @ (posedge clk) begin
    // write to port 0
    if (out_en_0 == 1'b1) begin $fdisplay(data_out_0, "%0d", out_sig_0); $fflush(data_out_0); end
end

// signal registration, progress bar and finish ------------------------------

integer chrys;

always @ (posedge clk) if (proc.valr10 == 147) begin
    $display("Info: end of program!");
    $finish;
end

initial begin

    $dumpfile("buddhabrot_tb.vcd");

    $dumpvars(0,buddhabrot_tb.clk);
    $dumpvars(0,buddhabrot_tb.rst);
    $dumpvars(0,buddhabrot_tb.proc.out_en_sim_0);
    $dumpvars(0,buddhabrot_tb.proc.out_sig_0);
    $dumpvars(0,buddhabrot_tb.proc.valr2);
    $dumpvars(0,buddhabrot_tb.proc.linetabs);
    $dumpvars(0,buddhabrot_tb.proc.me1_f_main_v_ii_e_);
    $dumpvars(0,buddhabrot_tb.proc.me1_f_main_v_sy_e_);
    $dumpvars(0,buddhabrot_tb.proc.me2_f_main_v_cy_e_);
    $dumpvars(0,buddhabrot_tb.proc.me1_f_main_v_sx_e_);
    $dumpvars(0,buddhabrot_tb.proc.me2_f_main_v_cx_e_);
    $dumpvars(0,buddhabrot_tb.proc.me2_f_main_v_zx_e_);
    $dumpvars(0,buddhabrot_tb.proc.me2_f_main_v_zy_e_);
    $dumpvars(0,buddhabrot_tb.proc.me1_f_main_v_n_e_);
    $dumpvars(0,buddhabrot_tb.proc.me1_f_main_v_escaped_e_);
    $dumpvars(0,buddhabrot_tb.proc.me2_f_main_v_zx2_e_);
    $dumpvars(0,buddhabrot_tb.proc.me2_f_main_v_zy2_e_);
    $dumpvars(0,buddhabrot_tb.proc.me1_f_main_v_k_e_);
    $dumpvars(0,buddhabrot_tb.proc.me1_f_main_v_px_e_);
    $dumpvars(0,buddhabrot_tb.proc.me1_f_main_v_py_e_);
    $dumpvars(0,buddhabrot_tb.proc.me1_f_main_v_idx_e_);
    $dumpvars(0,buddhabrot_tb.proc.me1_f_main_v_p_e_);
    $dumpvars(0,buddhabrot_tb.proc.p_buddhabrot.core.sp.pointeri);
    $dumpvars(0,buddhabrot_tb.proc.p_buddhabrot.core.sp.fl_max);
    $dumpvars(0,buddhabrot_tb.proc.p_buddhabrot.core.sp.fl_full);
    $dumpvars(0,buddhabrot_tb.proc.p_buddhabrot.core.ula.delta_float);
    $dumpvars(0,buddhabrot_tb.proc.p_buddhabrot.core.ula.delta_int);

    if ($test$plusargs("HEADER_ONLY")) begin #1; $dumpflush; $finish; end

    for (chrys = 10; chrys <= 100; chrys = chrys + 10) begin
        #900000000.000000;  // wall-clock slice of the total sim time
        $display("Progress: %0d%% complete", chrys);
        $fflush;
    end

    $display("Simulation Complete!");
    $finish;

end

endmodule
