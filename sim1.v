`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   
// Design Name:   Function_Generator
// Module Name:   
// Project Name:  
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Function_Generator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sim1;

	// Inputs
	reg m_clk;

	// Outputs
	wire start_pulse;
	wire stop_pulse;
	//wire delayed_stop_pulse;
	// Instantiate the Unit Under Test (UUT)

	Function_Generator uut (
		.m_clk(m_clk), 
		.start_pulse(start_pulse), 
		.stop_pulse(stop_pulse)
	);

	initial begin
		// Initialize Inputs
		m_clk = 0;
	end
always #5 m_clk = ~m_clk;      
endmodule

