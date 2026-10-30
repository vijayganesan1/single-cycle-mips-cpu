module ALU(
    input [31:0] A,
    input [31:0] B,
    input [2:0] Control,
    output reg [31:0] ALUresult,
    output reg zero
    );
    
    always @(A or B or Control)
    begin
    case(Control)
    3'b000: ALUresult = A&B;
    3'b001: ALUresult = A|B;
    3'b010: ALUresult = A+B;
    3'b110: ALUresult = A-B;
    3'b111: ALUresult = A<B;
    endcase
    end
    
    always @(ALUresult)
    begin
    if(ALUresult==0)
    zero=1;
    else 
    zero=0;
    end
endmodule