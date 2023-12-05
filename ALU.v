module alu(
    input [7:0] A, B,       // ALU 8-bit Inputs                 
    input [1:0] ALU_Sel,    // ALU Selection
    output reg [7:0] ALU_Out // ALU 8-bit Output
);

    always @(*)
    begin
        case(ALU_Sel)
            2'b00: // Addition
                ALU_Out = A + B;
            2'b01: // Subtraction
                ALU_Out = A - B;
            2'b10: // Multiplication
                ALU_Out = A * B;
            2'b11: // Division
                ALU_Out = A / B;
            default: ALU_Out = A + B;
        endcase
    end
endmodule