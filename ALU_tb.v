`timescale 1ns / 1ps  

module tb_alu;

    // Inputs
    reg [7:0] A, B;
    reg [1:0] ALU_Sel;

    // Outputs
    wire [7:0] ALU_Out;

    // Instantiate the ALU
    alu test_unit (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out)
    );

    // Testbench behavior
    initial begin
        A = 8'h0A;
        B = 8'h02;
        ALU_Sel = 2'b00; // Selecting A + B

        // Testing A + B
        #10;
        $display("Operation: A + B");
        $display("A = %h, B = %h, ALU_Sel = %b, ALU_Out = %h", A, B, ALU_Sel, ALU_Out);

        // Testing A - B
        ALU_Sel = 2'b01; // Selecting A - B
        A = 8'hF6;
        B = 8'h0A;

        #10;
        $display("Operation: A - B");
        $display("A = %h, B = %h, ALU_Sel = %b, ALU_Out = %h", A, B, ALU_Sel, ALU_Out);

        // Testing A * B
        ALU_Sel = 2'b10; // Selecting A * B
        A = 8'h0F;
        B = 8'h03;

        #10;
        $display("Operation: A * B");
        $display("A = %h, B = %h, ALU_Sel = %b, ALU_Out = %h", A, B, ALU_Sel, ALU_Out);

        // Testing A / B
        ALU_Sel = 2'b11; // Selecting A / B
        A = 8'h1E;
        B = 8'h04;

        #10;
        $display("Operation: A / B");
        $display("A = %h, B = %h, ALU_Sel = %b, ALU_Out = %h", A, B, ALU_Sel, ALU_Out);

        $finish;
    end
endmodule