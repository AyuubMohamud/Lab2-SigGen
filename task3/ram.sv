module ram #(
    parameter ADDRESS_WIDTH = 8,
              DATA_WIDTH = 8
) (
    input logic clk,
    input logic rd_en,
    input logic [ADDRESS_WIDTH-1:0] rd_addr,
    output logic [DATA_WIDTH-1:0] dout,
    input logic wr_en,
    input logic [ADDRESS_WIDTH-1:0] wr_addr,
    input logic [DATA_WIDTH-1:0] din
);

    logic [DATA_WIDTH-1:0] ram_array [2**ADDRESS_WIDTH-1:0];

    always_ff @(posedge clk) begin
        if (rd_en) begin
            dout <= ram_array[rd_addr];
        end
        if (wr_en) begin
            ram_array[wr_addr] <= din;
        end
    end

endmodule
