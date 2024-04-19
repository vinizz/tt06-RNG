
module top (input clk,
            input reset,
            input [1:0] mode,
            input [3:0] seed,
            output [7:0] output_data);

  wire [3:0] lfsr_out, nlfsr_out;
  wire [7:0] lfsr_demux_out, nlfsr_demux_out;

  lfsr lfsr_inst (.clk(clk),
                  .reset(reset),
                  .seed(seed),
                  .lfsr_out(lfsr_out),
                  .demux_out(lfsr_demux_out));

  nlfsr nlfsr_inst (.clk(clk),
                    .reset(reset),
                    .seed(seed),
                    .nlfsr_out(nlfsr_out),
                    .demux_out(nlfsr_demux_out));

  assign output_data = (mode == 2'b00) ? lfsr_out :8'b00000000;
                       (mode == 2'b01) ? nlfsr_out :8'b00000000;
                       (mode == 2'b10) ? lfsr_demux_out :8'b00000000;
                       (mode == 2'b11) ? nlfsr_demux_out :8'b00000000;
                                         lfsr_demux_out;

endmodule
