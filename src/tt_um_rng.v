/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_rng (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

wire rst = ! rst_n;
assign uio_oe = 8'b1111_0000;
assign uio_out =  {uio_in[3:0],4'b0000};
//assign ui_in[7:6] = 2'b00;
//assign uio_in = 8'b0000_0000;
 
top top (
            .clk(clk),
            .reset(rst),
            .mode(ui_in[5:4]),
            .seed(ui_in[3:0]),
            .output_data(uo_out)
            );


endmodule
