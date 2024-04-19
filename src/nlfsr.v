module nlfsr (input clk,
              input reset,
              input [3:0] seed,
              output [3:0] nlfsr_out,
              output [7:0] demux_out);

  reg [3:0] nlfsr_reg;
  wire feedback;

  assign feedback = nlfsr_reg[3] ^ (nlfsr_reg[2] & nlfsr_reg[1]);
  assign nlfsr_out = nlfsr_reg;

  demux demux_inst (.in(nlfsr_reg), .out(demux_out));

  always @(posedge clk or posedge reset)
    if (reset)
      nlfsr_reg <= seed;
    else
      nlfsr_reg <= {nlfsr_reg[2:0], feedback};

endmodule
