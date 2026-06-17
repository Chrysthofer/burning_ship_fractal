`timescale 1ns/1ps

module burning_ship_fast_tb();

reg clk;
reg rst;

wire signed [31:0] proc_io_out;
wire [0:0] proc_out_en;
wire done;
wire [10:0] pixel_x;
wire [9:0] pixel_y;

integer data_out_0;
integer pixel_count;

burning_ship_fast_top dut(
    .clk(clk),
    .rst(rst),
    .proc_io_out(proc_io_out),
    .proc_out_en(proc_out_en),
    .done(done),
    .pixel_x(pixel_x),
    .pixel_y(pixel_y)
);

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1'b1;
    pixel_count = 0;
    data_out_0 = $fopen("C:/Users/LCOM/Desktop/burning_ship_fractal/burning_ship_fractal/burning_ship/Simulation/output_0.txt", "w");
    if (data_out_0 == 0) begin
        $display("[burning_ship_fast] ERRO: nao foi possivel abrir output_0.txt");
        $finish;
    end

    $dumpfile("burning_ship_fast_tb.vcd");
    $dumpvars(0, burning_ship_fast_tb.clk);
    $dumpvars(0, burning_ship_fast_tb.rst);
    $dumpvars(0, burning_ship_fast_tb.proc_out_en);
    $dumpvars(0, burning_ship_fast_tb.proc_io_out);
    $dumpvars(0, burning_ship_fast_tb.done);
    $dumpvars(0, burning_ship_fast_tb.pixel_x);
    $dumpvars(0, burning_ship_fast_tb.pixel_y);

    #20 rst = 1'b0;
end

always @(posedge clk) begin
    if (!rst && proc_out_en) begin
        $fdisplay(data_out_0, "%0d", proc_io_out);
        pixel_count = pixel_count + 1;

        if ((pixel_count % 1280) == 0) begin
            $fflush(data_out_0);
            $display("[burning_ship_fast] linha %0d/720", pixel_count / 1280);
        end

        if (pixel_count == 1280 * 720) begin
            $fclose(data_out_0);
            $display("[burning_ship_fast] DONE: %0d pixels escritos em output_0.txt", pixel_count);
            $finish;
        end
    end
end

endmodule
