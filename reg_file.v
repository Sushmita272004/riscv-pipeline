module reg_file (
  input clk,
  input [4:0] rs1, rs2, rd,
  input [31:0] wd,
  input we,
  output [31:0] a, b
);
  reg [31:0] regs[0:31];

  assign a = regs[rs1];
  assign b = regs[rs2];

  initial begin
    regs[2] = 32'd10; // x2
    regs[3] = 32'd5;  // x3
    regs[5] = 32'd4;  // x5
    regs[7] = 32'd8;  // x7 (for lw base address)
  end

  always @(posedge clk) begin
    if (we)
      regs[rd] <= wd;
  end
endmodule
