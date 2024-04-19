`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  reg [1:0] mode;
  reg [3:0] seed;
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;
  wire [7:0] output_data;

initial clk = 1'b0;
always #50 clk = ~clk;

//reset generation
initial begin
rst_n = 1'b0;
repeat(5) @ (posedge clk);
rst_n = 1'b1;

end

  // Replace tt_um_example with your module name:
  tt_um_rng tt_um_rng (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .ui_in  ({2'b0, mode, seed}),    // Dedicated inputs
      .uo_out (output_data),   // Dedicated outputs
      .uio_in (uio_in),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );

initial begin
   mode<=00;
   seed<=0000;
   uio_in<=00001111;
 
   end

endmodule
