`timescale 1ns/1ps
/*
# Team ID:          eYRC#3750
# Theme:            MazeSolver Bot
# Author List:      Thomas sajeev varghese , Rohan Maheshwari
# Filename:         pwm_generator.v
# File Description: Generates a PWM signal and a divided clock signal from a
#                   3.125 MHz input clock.
# Global variables: None
*/

module pwm_generator(
    input        clk_3125KHz,
    input  [3:0] duty_cycle,
    output reg   clk_195KHz,
    output reg   pwm_signal
);

    // Set the initial state for the output signals at the start of simulation.
    initial begin
        clk_195KHz = 0;
        pwm_signal = 1;
    end

    // A 4-bit counter that divides the input clock by 16.
    reg [3:0] div_counter = 4'b0000;

    always @(posedge clk_3125KHz) begin

        // Generates the PWM signal by comparing the counter to the duty cycle value.
        if (div_counter >= duty_cycle) begin
            pwm_signal <= 1'b0;
        end else begin
            pwm_signal <= 1'b1;
        end

        // Increments the counter on each clock cycle, rolling over from 15 to 0.
        if (div_counter == 4'b1111) begin
            div_counter <= 0;
        end else begin
            div_counter <= div_counter + 1'b1;
        end

        // Generates a 195.3125 KHz clock with a 50% duty cycle.
        if (div_counter > 4'b0111) begin
            clk_195KHz <= 1'b0;
        end else begin
            clk_195KHz <= 1'b1;
        end
    end

endmodule