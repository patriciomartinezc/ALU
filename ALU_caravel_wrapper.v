module alu(
    input [7:0] A, B,       // ALU 8-bit Inputs                 
    input [1:0] ALU_Sel,    // ALU Selection
    output reg [7:0] ALU_Out, // ALU 8-bit Output
    input [27:0] io_oeb
);

assign io_oeb = 27'b0000_0000_1111_1111_1111_1111_111; // input = 1 output = 0 

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
