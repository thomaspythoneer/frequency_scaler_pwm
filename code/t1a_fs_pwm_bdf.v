/*
# Team ID:          eYRC#3750
# Theme:            MazeSolver Bot
# Author List:      Thomas sajeev varghese , Rohan Maheshwari
# Filename:         t1a_fs_pwm_bdf.v
# File Description: This top-level module connects a frequency scaling block to a
#                   PWM generator block.
# Global variables: None
*/

module t1a_fs_pwm_bdf(
	clk_50M,
	duty_cycle,
	pwm_signal,
	clk_195KHz,
	clk_3125KHz
);


	input wire	clk_50M;
	input wire	[3:0] duty_cycle;
	output wire	pwm_signal;
	output wire	clk_195KHz;
	output wire	clk_3125KHz;

	// Internal wire to carry the scaled clock from the frequency scaler to the PWM generator.
	wire	SYNTHESIZED_WIRE_0;

	assign	clk_3125KHz = SYNTHESIZED_WIRE_0;


	// Instantiation of the frequency scaling module.
	// It divides the 50MHz clock down to 3.125MHz.
	frequency_scaling	b2v_inst(
		.clk_50M(clk_50M),
		.clk_3125KHz(SYNTHESIZED_WIRE_0));

	// Instantiation of the PWM generator module.
	// It takes the scaled clock and duty cycle to produce the PWM output.
	pwm_generator	b2v_inst1(
		.clk_3125KHz(SYNTHESIZED_WIRE_0),
		.duty_cycle(duty_cycle),
		.clk_195KHz(clk_195KHz),
		.pwm_signal(pwm_signal));


endmodule