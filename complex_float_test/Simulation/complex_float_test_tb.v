`timescale 1ns/1ps

module complex_float_test_tb();

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
wire [7:0] proc_out_en;

/* verilator tracing_on */
complex_float_test proc(clk,rst,proc_io_out,proc_out_en);

/* verilator tracing_off */

// output ports ---------------------------------------------------------------

// port 0 variables
integer data_out_0;
reg signed [31:0] out_sig_0 = 0;
reg out_en_0 = 0;

// port 1 variables
integer data_out_1;
reg signed [31:0] out_sig_1 = 0;
reg out_en_1 = 0;

// port 2 variables
integer data_out_2;
reg signed [31:0] out_sig_2 = 0;
reg out_en_2 = 0;

// port 3 variables
integer data_out_3;
reg signed [31:0] out_sig_3 = 0;
reg out_en_3 = 0;

// port 4 variables
integer data_out_4;
reg signed [31:0] out_sig_4 = 0;
reg out_en_4 = 0;

// port 5 variables
integer data_out_5;
reg signed [31:0] out_sig_5 = 0;
reg out_en_5 = 0;

// port 6 variables
integer data_out_6;
reg signed [31:0] out_sig_6 = 0;
reg out_en_6 = 0;

// port 7 variables
integer data_out_7;
reg signed [31:0] out_sig_7 = 0;
reg out_en_7 = 0;

// open a file for writing on each port
initial begin
    data_out_0 = $fopen("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/complex_float_test/Simulation/output_0.txt", "w"); // check the output data in this file
    data_out_1 = $fopen("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/complex_float_test/Simulation/output_1.txt", "w"); // check the output data in this file
    data_out_2 = $fopen("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/complex_float_test/Simulation/output_2.txt", "w"); // check the output data in this file
    data_out_3 = $fopen("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/complex_float_test/Simulation/output_3.txt", "w"); // check the output data in this file
    data_out_4 = $fopen("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/complex_float_test/Simulation/output_4.txt", "w"); // check the output data in this file
    data_out_5 = $fopen("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/complex_float_test/Simulation/output_5.txt", "w"); // check the output data in this file
    data_out_6 = $fopen("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/complex_float_test/Simulation/output_6.txt", "w"); // check the output data in this file
    data_out_7 = $fopen("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/complex_float_test/Simulation/output_7.txt", "w"); // check the output data in this file
end

// decode output ports
always @ (*) begin
    // port 0 decoding
    out_sig_0 = proc_io_out;
    out_en_0  = proc_out_en == 1;
    // port 1 decoding
    out_sig_1 = proc_io_out;
    out_en_1  = proc_out_en == 2;
    // port 2 decoding
    out_sig_2 = proc_io_out;
    out_en_2  = proc_out_en == 4;
    // port 3 decoding
    out_sig_3 = proc_io_out;
    out_en_3  = proc_out_en == 8;
    // port 4 decoding
    out_sig_4 = proc_io_out;
    out_en_4  = proc_out_en == 16;
    // port 5 decoding
    out_sig_5 = proc_io_out;
    out_en_5  = proc_out_en == 32;
    // port 6 decoding
    out_sig_6 = proc_io_out;
    out_en_6  = proc_out_en == 64;
    // port 7 decoding
    out_sig_7 = proc_io_out;
    out_en_7  = proc_out_en == 128;
end

// implement writing to the file
always @ (posedge clk) begin
    // write to port 0
    if (out_en_0 == 1'b1) begin $fdisplay(data_out_0, "%0d", out_sig_0); $fflush(data_out_0); end
    // write to port 1
    if (out_en_1 == 1'b1) begin $fdisplay(data_out_1, "%0d", out_sig_1); $fflush(data_out_1); end
    // write to port 2
    if (out_en_2 == 1'b1) begin $fdisplay(data_out_2, "%0d", out_sig_2); $fflush(data_out_2); end
    // write to port 3
    if (out_en_3 == 1'b1) begin $fdisplay(data_out_3, "%0d", out_sig_3); $fflush(data_out_3); end
    // write to port 4
    if (out_en_4 == 1'b1) begin $fdisplay(data_out_4, "%0d", out_sig_4); $fflush(data_out_4); end
    // write to port 5
    if (out_en_5 == 1'b1) begin $fdisplay(data_out_5, "%0d", out_sig_5); $fflush(data_out_5); end
    // write to port 6
    if (out_en_6 == 1'b1) begin $fdisplay(data_out_6, "%0d", out_sig_6); $fflush(data_out_6); end
    // write to port 7
    if (out_en_7 == 1'b1) begin $fdisplay(data_out_7, "%0d", out_sig_7); $fflush(data_out_7); end
end

// signal registration, progress bar and finish ------------------------------

integer chrys;

always @ (posedge clk) if (proc.valr10 == 111) begin
    $display("Info: end of program!");
    $finish;
end

initial begin

    $dumpfile("complex_float_test_tb.vcd");

    $dumpvars(0,complex_float_test_tb.clk);
    $dumpvars(0,complex_float_test_tb.rst);
    $dumpvars(0,complex_float_test_tb.proc.out_en_sim_0);
    $dumpvars(0,complex_float_test_tb.proc.out_sig_0);
    $dumpvars(0,complex_float_test_tb.proc.out_en_sim_1);
    $dumpvars(0,complex_float_test_tb.proc.out_sig_1);
    $dumpvars(0,complex_float_test_tb.proc.out_en_sim_2);
    $dumpvars(0,complex_float_test_tb.proc.out_sig_2);
    $dumpvars(0,complex_float_test_tb.proc.out_en_sim_3);
    $dumpvars(0,complex_float_test_tb.proc.out_sig_3);
    $dumpvars(0,complex_float_test_tb.proc.out_en_sim_4);
    $dumpvars(0,complex_float_test_tb.proc.out_sig_4);
    $dumpvars(0,complex_float_test_tb.proc.out_en_sim_5);
    $dumpvars(0,complex_float_test_tb.proc.out_sig_5);
    $dumpvars(0,complex_float_test_tb.proc.out_en_sim_6);
    $dumpvars(0,complex_float_test_tb.proc.out_sig_6);
    $dumpvars(0,complex_float_test_tb.proc.out_en_sim_7);
    $dumpvars(0,complex_float_test_tb.proc.out_sig_7);
    $dumpvars(0,complex_float_test_tb.proc.valr2);
    $dumpvars(0,complex_float_test_tb.proc.linetabs);
    $dumpvars(0,complex_float_test_tb.proc.me2_f_global_v_a_e_);
    $dumpvars(0,complex_float_test_tb.proc.me2_f_global_v_b_e_);
    $dumpvars(0,complex_float_test_tb.proc.me2_f_global_v_c_e_);
    $dumpvars(0,complex_float_test_tb.proc.me2_f_global_v_r_arith_e_);
    $dumpvars(0,complex_float_test_tb.proc.me2_f_global_v_r_sqrt_e_);
    $dumpvars(0,complex_float_test_tb.proc.me2_f_global_v_r_sin_e_);
    $dumpvars(0,complex_float_test_tb.proc.comp_me3_f_global_v_z1_e_);
    $dumpvars(0,complex_float_test_tb.proc.comp_me3_f_global_v_z2_e_);
    $dumpvars(0,complex_float_test_tb.proc.comp_me3_f_global_v_zmul_e_);
    $dumpvars(0,complex_float_test_tb.proc.me2_f_global_v_r_re_e_);
    $dumpvars(0,complex_float_test_tb.proc.me2_f_global_v_r_im_e_);
    $dumpvars(0,complex_float_test_tb.proc.me2_f_global_v_r_mod2_e_);
    $dumpvars(0,complex_float_test_tb.proc.comp_me3_f_global_v_zsum_e_);
    $dumpvars(0,complex_float_test_tb.proc.me2_f_global_v_r_sum_re_e_);
    $dumpvars(0,complex_float_test_tb.proc.me2_f_global_v_r_phase_e_);
    $dumpvars(0,complex_float_test_tb.proc.p_complex_float_test.core.instr_fetch.isp_blk.isp.pointeri);
    $dumpvars(0,complex_float_test_tb.proc.p_complex_float_test.core.instr_fetch.isp_blk.isp.fl_max);
    $dumpvars(0,complex_float_test_tb.proc.p_complex_float_test.core.instr_fetch.isp_blk.isp.fl_full);
    $dumpvars(0,complex_float_test_tb.proc.p_complex_float_test.core.sp.pointeri);
    $dumpvars(0,complex_float_test_tb.proc.p_complex_float_test.core.sp.fl_max);
    $dumpvars(0,complex_float_test_tb.proc.p_complex_float_test.core.sp.fl_full);
    $dumpvars(0,complex_float_test_tb.proc.p_complex_float_test.core.ula.delta_float);
    $dumpvars(0,complex_float_test_tb.proc.p_complex_float_test.core.ula.delta_int);

    if ($test$plusargs("HEADER_ONLY")) begin #1; $dumpflush; $finish; end

    for (chrys = 10; chrys <= 100; chrys = chrys + 10) begin
        #5000.000000;  // wall-clock slice of the total sim time
        $display("Progress: %0d%% complete", chrys);
        $fflush;
    end

    $display("Simulation Complete!");
    $finish;

end

endmodule
