module processor_top (
  input clk,
  input reset
);
  wire [31:0] instr, pc;
  wire [4:0] rs1, rs2, rd;
  wire [2:0] funct3, alu_ctrl;
  wire [6:0] funct7, opcode;
  wire [31:0] a, b, result;

  if_stage IF (.clk(clk), .reset(reset), .instr(instr), .pc_out(pc));
  id_stage ID (.instr(instr), .pc(pc), .rs1(rs1), .rs2(rs2), .rd(rd), .funct3(funct3), .funct7(funct7), .opcode(opcode));
  reg_file RF (.clk(clk), .rs1(rs1), .rs2(rs2), .rd(rd), .wd(result), .we(1'b1), .a(a), .b(b));
  ex_stage EX (.a(a), .b(b), .opcode(opcode), .funct3(funct3), .funct7(funct7), .result(result), .alu_ctrl(alu_ctrl));
endmodule
