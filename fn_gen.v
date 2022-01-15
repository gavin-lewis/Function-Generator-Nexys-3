module fn_gen(input m_rst,m_clk,	//m_clk = FPGA clock (100MHz)
			input [6:0]delay,
			input set_freq, 
			output reg start_pulse,stop_pulse
			);
			
parameter pulse_width = 10; //Sets pulse widths of start and stop pulses in multiple of 10ns
                            //pulse_width = x --> x*10ns (start & stop pulse widths)
         
//reg [19:0]count_reg;
reg [31:0]count_reg;
reg [6:0]delay_lock;
//wire [19:0]repeat_rate;
wire [31:0]repeat_rate;
assign repeat_rate=set_freq ? 999999 : 499999;  //set_freq=0 --> 100 Hz
                                                //set_freq=1 --> 200 Hz 
initial 
begin

count_reg <= 0;
start_pulse <= 0;
stop_pulse <= 0;
delay_lock <= 0;
end

always @(posedge m_clk or posedge m_rst) 
begin
    if (m_rst)              //Reset to the initial values
		begin
        count_reg <= 0;
        start_pulse <= 0; stop_pulse <= 0;
		end 
	else 
		begin
		delay_lock<=delay;
        if (count_reg < repeat_rate) count_reg <= count_reg + 1;else count_reg <= 0;//Generates specified repeat rate
	
		if((count_reg >=1) & (count_reg <=pulse_width)) start_pulse <= 1; else start_pulse <= 0;    //Generates start pulse of specified pulse width
		if((count_reg >=delay_lock+1) & (count_reg <=delay_lock+pulse_width)) 
		      stop_pulse <= 1; else stop_pulse <= 0;   //Generates stop pulse of specified pulse width and 
		                                               //specified delay (delay_lock) btween start and stop pulses
		                                               //specified delay is in multiple of 10ns
		end
end



endmodule