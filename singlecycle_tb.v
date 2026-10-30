`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench: singlecycle_tb
// Runs the 6-instruction test program stored in instmem.v, dumps a waveform
// (cpu.vcd) and self-checks the final register values.
//
// Program (registers preset at reset: $t0=1, $t1=3, $t2=2, $s0=0):
//   add $t2,$t1,$t0   -> $t2 = 4
//   sub $t2,$t1,$t0   -> $t2 = 2
//   and $t2,$t1,$t0   -> $t2 = 1
//   sw  $t1,4($s0)    -> Mem[4..7] = 3
//   lw  $t2,4($s0)    -> $t2 = 3
//   add $t3,$t1,$t2   -> $t3 = 6
//////////////////////////////////////////////////////////////////////////////////
module singlecycle_tb();
    wire [31:0] ALUresult;
    reg clk, rst;

    singlecycle s1(clk, rst, ALUresult);

    // Waveform dump
    initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, singlecycle_tb);
    end

    // 10 ns clock; posedges at 5, 15, 25, ...
    initial clk = 0;
    always #5 clk = ~clk;

    // Reset is active low. Release it away from a clock edge (at 7 ns).
    // Instruction k is committed at posedge 15 + 10*k, so the 6th (k=5)
    // finishes at 65 ns. Check at 70 ns.
    initial begin
        rst = 0;
        #7  rst = 1;
        #63 begin
            $display("---------------------------------------------");
            $display("$t2 = %0d (expect 3)", s1.regfile_0.registers[10]);
            $display("$t3 = %0d (expect 6)", s1.regfile_0.registers[11]);
            if (s1.regfile_0.registers[10] === 32'd3 &&
                s1.regfile_0.registers[11] === 32'd6)
                $display("PASS");
            else
                $display("FAIL");
            $display("---------------------------------------------");
            $finish;
        end
    end

    // Print the instruction and ALU result each cycle (sampled at negedge)
    always @(negedge clk)
        if (rst)
            $display("t=%0t  PC=%0d  instr=%h  ALUresult=%0d",
                     $time, s1.pc_0.PC, s1.instruction, ALUresult);
endmodule