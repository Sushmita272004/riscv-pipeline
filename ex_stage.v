module ex_stage (
  input [31:0] a, b,
  input [6:0] opcode,
  input [2:0] funct3,
  input [6:0] funct7,
  output [31:0] result,
  output reg [2:0] alu_ctrl
);

  alu alu_unit (
    .a(a),
    .b(b),
    .alu_ctrl(alu_ctrl),
    .result(result)
  );

  always @(*) begin
    alu_ctrl = 3'b000;
    if (opcode == 7'b0110011) begin // R-type
      if (funct3 == 3'b000 && funct7 == 7'b0000000)
        alu_ctrl = 3'b000; // ADD
      else if (funct3 == 3'b000 && funct7 == 7'b0100000)
        alu_ctrl = 3'b001; // SUB
    end
  end
endmodule
