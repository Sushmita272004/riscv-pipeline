module alu (
  input [31:0] a, b,
  input [2:0] alu_ctrl,
  output reg [31:0] result
);
  always @(*) begin
    case (alu_ctrl)
      3'b000: result = a + b; // ADD
      3'b001: result = a - b; // SUB
      default: result = 0;
    endcase
  end
endmodule
