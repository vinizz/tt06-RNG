module demux (input [3:0] in,
              output reg [7:0] out);

  always @(*)
    case (in)
      4'b0000: out = 8'b00000001;
      4'b0001: out = 8'b00000010;
      4'b0010: out = 8'b00000100;
      4'b0011: out = 8'b00001000;
      4'b0100: out = 8'b00010000;
      4'b0101: out = 8'b00100000;
      4'b0110: out = 8'b01000000;
      4'b0111: out = 8'b10000000;
      default: out = 8'b00000000;
    endcase

endmodule


