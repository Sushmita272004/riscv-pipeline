// R-type: add x1, x2, x3 | sub x4, x1, x5
// I-type: lw x6, 0(x7)

module if_stage (
  input clk,
  input reset,
  output reg [31:0] instr,
  output reg [31:0] pc_out
);

  reg [31:0] pc;
  reg [31:0] instr_mem[0:15];

  initial begin
    pc = 0;
    // Format: opcode + rs1 + rs2 + rd (simplified)
    instr_mem[0] = 32'b000000000011_00010_000_00001_0110011; // add x1, x2, x3
    instr_mem[1] = 32'b010000000101_00001_000_00100_0110011; // sub x4, x1, x5
    instr_mem[2] = 32'b000000000000_00111_010_00110_0000011; // lw x6, 0(x7)
  end

  always @(posedge clk or posedge reset) begin
    if (reset)
      pc <= 0;
    else
      pc <= pc + 4;
  end

  always @(*) begin
    instr = instr_mem[pc >> 2];
    pc_out = pc;
  end
endmodule
