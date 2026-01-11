`timescale 1ns/1ps
/*
# Team ID:          eYRC#3750
# Theme:            MazeSolver Bot
# Author List:      Thomas sajeev varghese , Rohan Maheshwari
# Filename:         frequency_scaling.v
# File Description: A clock divider module that scales a 50 MHz input clock down 
#                   to 3.125 MHz with a 50% duty cycle.
# Global variables: None
*/

module frequency_scaling (
    input  clk_50M,
    output reg clk_3125KHz
);

    // Sets the initial state of the output clock.
    initial begin
        clk_3125KHz = 0;
    end

    // A 4-bit counter used to divide the 50 MHz clock by 16.
    reg [3:0] div_counter = 4'b0000;

    always @(posedge clk_50M) begin
        // Increments the counter on each clock cycle, rolling over from 15 to 0.
        if (div_counter == 4'b1111) begin
            div_counter <= 0;
        end
        else begin
            div_counter <= div_counter + 1'b1;
        end

        // Generates the output clock with a 50% duty cycle.
        // The output is high for 8 counts and low for the next 8 counts.
        if (div_counter > 4'b0111) begin
            clk_3125KHz <= 1'b0;
        end
        else begin
            clk_3125KHz <= 1'b1;
        end
    end

endmodule