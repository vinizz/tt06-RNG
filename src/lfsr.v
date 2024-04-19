module lfsr (input clk,
             input reset,
             input [3:0] seed,
             output [3:0] lfsr_out,
             output [7:0] demux_out);

  reg [3:0] lfsr_reg;
  wire feedback;

  assign feedback = lfsr_reg[3] ^ lfsr_reg[2];
  assign lfsr_out = lfsr_reg;

  demux demux_inst (.in(lfsr_reg), .out(demux_out));

  always @(posedge clk or posedge reset)
    if (reset)
      lfsr_reg <= seed;
    else
      lfsr_reg <= {lfsr_reg[2:0], feedback};

endmodule


