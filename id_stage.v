module id_stage (
  input [31:0] instr,
  input [31:0] pc,
  output [4:0] rs1, rs2, rd,
  output [2:0] funct3,
  output [6:0] funct7,
  output [6:0] opcode
);
  assign opcode = instr[6:0];
  assign rd     = instr[11:7];
  assign funct3 = instr[14:12];
  assign rs1    = instr[19:15];
  assign rs2    = instr[24:20];
  assign funct7 = instr[31:25];
endmodule
