module sigdelay (
    input logic clk,
    input logic rst,
    input logic wr,
    input logic rd,
    input logic [8:0] offset,
    input logic [7:0] mic_signal,
    output logic [7:0] delayed_signal
);
    wire [8:0] count;
    counter #(9) counter0 (clk, rst, 1'b1, 9'd1, count);
    ram #(9, 8) ram0 (clk, rd, count, delayed_signal, wr, count+offset, mic_signal);
endmodule
