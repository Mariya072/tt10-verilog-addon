`timescale 1ns / 1ps

module wallace_tree_multiplier_tb;

    // Inputs
    reg [3:0] A, B;
    
    // Output
    wire [7:0] product;

    // Instantiate the Wallace Tree Multiplier
    wallace_tree_multiplier uut (
        .A(A), 
        .B(B), 
        .product(product)
    );

    initial begin
        // Monitor values
        $monitor("Time=%0t | A=%b (%d) | B=%b (%d) | Product=%b (%d)", 
                 $time, A, A, B, B, product, product);
        
        // Test cases
        A = 4'b0000; B = 4'b0000; #10;  // 0 * 0
        A = 4'b0001; B = 4'b0001; #10;  // 1 * 1
        A = 4'b0011; B = 4'b0010; #10;  // 3 * 2
        A = 4'b0101; B = 4'b0011; #10;  // 5 * 3
        A = 4'b0110; B = 4'b0100; #10;  // 6 * 4
        A = 4'b1001; B = 4'b0101; #10;  // 9 * 5
        A = 4'b1111; B = 4'b1111; #10;  // 15 * 15

        // End simulation
        $finish;
    end
endmodule
