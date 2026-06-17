`timescale 1ns/1ps

module burning_ship_fast_top(
    input wire clk,
    input wire rst,
    output reg signed [31:0] proc_io_out,
    output reg [0:0] proc_out_en,
    output reg done,
    output reg [10:0] pixel_x,
    output reg [9:0] pixel_y
);

localparam integer WIDTH    = 1280;
localparam integer HEIGHT   = 720;
localparam integer MAX_ITER = 256;
localparam integer FRAC     = 20;
localparam signed [31:0] SCALE  = 32'sd1048576;
localparam signed [31:0] X_MIN  = -32'sd2097152; // -2.0 in Q12.20
localparam signed [31:0] Y_MIN  = -32'sd2097152; // -2.0 in Q12.20
localparam signed [31:0] X_STEP =  32'sd2867;    // 3.5 / 1280 in Q12.20
localparam signed [31:0] Y_STEP =  32'sd4369;    // 3.0 / 720 in Q12.20
localparam signed [31:0] BAIL   =  32'sd4194304; // 4.0 in Q12.20

function signed [31:0] abs_q;
    input signed [31:0] value;
    begin
        abs_q = value[31] ? -value : value;
    end
endfunction

function [31:0] burning_ship_iter;
    input signed [31:0] cx;
    input signed [31:0] cy;
    integer n;
    reg escaped;
    reg signed [31:0] zx;
    reg signed [31:0] zy;
    reg signed [31:0] ax;
    reg signed [31:0] ay;
    reg signed [31:0] zx2;
    reg signed [31:0] zy2;
    reg signed [63:0] mul_zx;
    reg signed [63:0] mul_zy;
    reg signed [63:0] mul_abs;
    reg signed [63:0] shifted_zx;
    reg signed [63:0] shifted_zy;
    reg signed [63:0] shifted_abs;
    begin
        zx = 0;
        zy = 0;
        escaped = 1'b0;
        burning_ship_iter = MAX_ITER;

        for (n = 0; n < MAX_ITER; n = n + 1) begin
            if (!escaped) begin
                mul_zx = zx * zx;
                mul_zy = zy * zy;
                shifted_zx = mul_zx >>> FRAC;
                shifted_zy = mul_zy >>> FRAC;
                zx2 = shifted_zx[31:0];
                zy2 = shifted_zy[31:0];

                if ((zx2 + zy2) > BAIL) begin
                    escaped = 1'b1;
                    burning_ship_iter = n;
                end else begin
                    ax = abs_q(zx);
                    ay = abs_q(zy);
                    mul_abs = ax * ay;
                    shifted_abs = mul_abs >>> (FRAC - 1);
                    zy = shifted_abs[31:0] + cy;
                    zx = zx2 - zy2 + cx;
                    burning_ship_iter = n + 1;
                end
            end
        end
    end
endfunction

wire signed [31:0] current_cx = X_MIN + $signed({1'b0, pixel_x}) * X_STEP;
wire signed [31:0] current_cy = Y_MIN + $signed({1'b0, pixel_y}) * Y_STEP;

always @(posedge clk) begin
    if (rst) begin
        pixel_x <= 0;
        pixel_y <= 0;
        proc_io_out <= 0;
        proc_out_en <= 1'b0;
        done <= 1'b0;
    end else if (!done) begin
        proc_io_out <= burning_ship_iter(current_cx, current_cy);
        proc_out_en <= 1'b1;

        if (pixel_x == 11'd1279) begin
            pixel_x <= 0;
            if (pixel_y == 10'd719) begin
                pixel_y <= pixel_y;
                done <= 1'b1;
            end else begin
                pixel_y <= pixel_y + 1'b1;
            end
        end else begin
            pixel_x <= pixel_x + 1'b1;
        end
    end else begin
        proc_out_en <= 1'b0;
    end
end

endmodule
