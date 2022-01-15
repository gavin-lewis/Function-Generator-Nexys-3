`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:     
// Design Name: 
// Module Name:    Function_Generator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Function_Generator(
	input wire m_clk,
	output wire start_pulse,
	output wire stop_pulse
    );

// Set parameter values
    parameter set_delay = 10; //Sets the required delay between start and stope pulses in multiple of 10ns
	 parameter set_rst = 100000000;
	 
// Inputs
reg m_rst;
reg [6:0] delay;
reg set_freq;
reg [32:0] m_rst_count; 

// Intermediate Outputs
wire stop_pulse_temp;
wire start_pulse_temp;



initial    // Initialize Inputs
	   begin
		m_rst = 0;
		m_rst_count = 0;
        delay = set_delay; 
        set_freq = 0;
	   end

//Setting the Frequency of generated pulse
always @(posedge m_clk)
	begin
		m_rst_count = m_rst_count +1;
		if(m_rst_count == set_rst) 
		begin
			m_rst = ~m_rst;
			m_rst_count = 0;
		end
	end

fn_gen uut1 (
	.m_rst(m_rst), 
	.m_clk(m_clk), 
	.delay(delay),
	.set_freq(set_freq), 
	.start_pulse(start_pulse_temp), 
	.stop_pulse(stop_pulse_temp)
);


fine_delay_start uut2 (
	//.m_clk(m_clk),
	.start_pulse(start_pulse_temp),
	.delayed_start_pulse(start_pulse)
);

fine_delay_stop uut3 (
	//.m_clk(m_clk),
	.stop_pulse(stop_pulse_temp),
	.delayed_stop_pulse(stop_pulse)
);




endmodule
