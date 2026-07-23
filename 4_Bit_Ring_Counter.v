//==================================================
// 4-Bit Ring Counter - Verilog HDL
//==================================================

module ring_counter (
    input  wire       clk,
    input  wire       reset,
    output reg  [3:0] q
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0001;
        else
            q <= {q[2:0], q[3]};
    end

endmodule

//==================================================
// Testbench for 4-Bit Ring Counter
//==================================================

module ring_counter_tb;

    reg clk;
    reg reset;
    wire [3:0] q;

    // Instantiate Ring Counter
    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;

        // Display output
        $monitor("Time = %0t | Reset = %b | Q = %b",
                 $time, reset, q);

        // Release reset
        #10 reset = 0;

        // Run simulation
        #50;

        $finish;
    end

endmodule
