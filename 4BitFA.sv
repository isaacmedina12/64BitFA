//=========================================================
// 4-bit Ripple-Carry Adder (UPduino 3.1 target) in SystemVerilog 
// Implemented with XOR and AND/OR logic only
// Made by: Isaac Medina | Tufts University Department of Electrical and Computer Engineering
// Class of 2027
// Only one 4-bit adder implimented
// 
// Pin Mapping in .pcf file 
// GitHub Link: https://github.com/isaacmedina12/64BitFA
//=========================================================

module full_adder (
    input  logic a,
    input  logic b,
    input  logic cin,
    output logic sum,
    output logic couts
);
    // Full adder equation:
    // sum  = a ^ b ^ cin
    // cout = (a & b) | (b & cin) | (a & cin)
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule


module adder10 (
    input  logic [9:0] A,
    input  logic [9:0] B,
    input  logic       Cin,
    output logic [9:0] Sum,
    output logic       Cout
);
    logic [9:0] carry;  // internal carries

    // First stage
    full_adder fa0 (
        .a    (A[0]),
        .b    (B[0]),
        .cin  (Cin),
        .sum  (Sum[0]),
        .cout (carry[0])
    );

    // Generate remaining stages
    genvar i;
    generate
        for (i = 1; i < 10; i++) begin : adder_chain
            full_adder fai (
                .a    (A[i]),
                .b    (B[i]),
                .cin  (carry[i-1]),
                .sum  (Sum[i]),
                .cout (carry[i])
            );
        end
    endgenerate

    // Final carry out
    assign Cout = carry[9];
endmodule