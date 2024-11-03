module sinegen (
    input   logic clk,
    input   logic en,
    input   logic rst,
    input   logic [7:0] incr,
    output  logic [7:0] dout
);
    wire [7:0] count;
    counter #(8) counter_0 (clk, rst, en, incr, count);
    rom #(8, 8) rom (clk, count, dout);
endmodule
