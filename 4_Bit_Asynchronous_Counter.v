//==============================================================
// 4-Bit Asynchronous Counter
//==============================================================

module asynchronous_counter (
    input  wire clk,
    input  wire reset,
    output reg [3:0] count
);

    // First flip-flop is driven by external clock
    always @(posedge clk or posedge reset) begin
        if (reset)
            count[0] <= 1'b0;
        else
            count[0] <= ~count[0];
    end

    // Each flip-flop is triggered by the previous stage
    always @(negedge count[0] or posedge reset) begin
        if (reset)
            count[1] <= 1'b0;
        else
            count[1] <= ~count[1];
    end

    always @(negedge count[1] or posedge reset) begin
        if (reset)
            count[2] <= 1'b0;
        else
            count[2] <= ~count[2];
    end

    always @(negedge count[2] or posedge reset) begin
        if (reset)
            count[3] <= 1'b0;
        else
            count[3] <= ~count[3];
    end

endmodule

//==============================================================
// Testbench for 4-Bit Asynchronous Counter
//==============================================================

`timescale 1ns/1ps

module asynchronous_counter_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    asynchronous_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, asynchronous_counter_tb);

        clk = 0;
        reset = 1;

        #10 reset = 0;

        #200;

        $finish;
    end

endmodule
