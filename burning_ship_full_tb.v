`timescale 1ns/1ps

// burning_ship_full_tb.v  (raiz do projeto)
// Testbench customizado para gerar a IMAGEM INTEIRA:
//   - SEM $dumpfile/$dumpvars  -> sem VCD de gigas; o Verilator (--trace-fst) cuida
//     do trace de topo sozinho, que e' pequeno (so' sinais do testbench).
//   - $finish por CONTAGEM DE PIXELS (1280*720 = 921600), nao por tempo fixo
//     -> a simulacao so' termina quando a imagem inteira foi escrita.
//   - cap de seguranca por ciclos, para nunca travar indefinidamente.
//   - portas/instanciacao IDENTICAS ao burning_ship_tb.v gerado pelo SAPHO.

module burning_ship_full_tb();

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

wire signed [31:0] proc_io_out;
wire [0:0] proc_out_en;

burning_ship proc(clk,rst,proc_io_out,proc_out_en);

// output port 0 --------------------------------------------------------------

integer data_out_0;
reg signed [31:0] out_sig_0 = 0;
reg out_en_0 = 0;

initial begin
    data_out_0 = $fopen("C:/Users/chrys/Desktop/burning_ship_fractal/burning_ship/Simulation/output_0.txt", "w");
end

// decode output port 0 (igual ao testbench gerado)
always @ (*) begin
    if (proc_out_en == 1) out_sig_0 <= proc_io_out;
    out_en_0 = proc_out_en == 1;
end

// pixel counting + finish ----------------------------------------------------

localparam integer TOTAL_PIXELS = 1280 * 720;   // 921600
localparam integer MAX_CYCLES   = 600000000;     // cap (~2x os ~310M ciclos estimados)

integer pixel_count = 0;
integer cycle_count = 0;

always @ (posedge clk) begin
    cycle_count = cycle_count + 1;

    if (out_en_0 == 1'b1) begin
        $fdisplay(data_out_0, "%0d", out_sig_0);
        pixel_count = pixel_count + 1;
        if (pixel_count % 1280 == 0) $fflush(data_out_0);   // flush por linha -> viewer le ao vivo
        if (pixel_count >= TOTAL_PIXELS) begin
            $fclose(data_out_0);
            $display("[burning_ship] DONE: %0d pixels em %0d ciclos", pixel_count, cycle_count);
            $finish;
        end
    end

    if (cycle_count >= MAX_CYCLES) begin
        $fclose(data_out_0);
        $display("[burning_ship] CAP DE SEGURANCA: %0d ciclos, %0d/%0d pixels", cycle_count, pixel_count, TOTAL_PIXELS);
        $finish;
    end
end

endmodule
