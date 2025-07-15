module testbench;
  reg clk, reset;

  processor_top dut (
    .clk(clk),
    .reset(reset)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, dut);
    $dumpvars(1, dut.IF);
    $dumpvars(1, dut.ID);
    $dumpvars(1, dut.EX);
    $dumpvars(1, dut.RF);
    $dumpvars(1, dut.pc);
    $dumpvars(1, dut.instr);
    $dumpvars(1, dut.result);
    $dumpvars(1, dut.rs1);
    $dumpvars(1, dut.rs2);
    $dumpvars(1, dut.rd);
    $dumpvars(1, dut.a);
    $dumpvars(1, dut.b);
    $dumpvars(1, dut.alu_ctrl);
    clk = 0;
    reset = 1;
    #5 reset = 0;
    #200 $finish;
  end

  always #5 clk = ~clk;
endmodule
