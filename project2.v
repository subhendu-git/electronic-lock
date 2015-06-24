`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////
// UBIT: subhendu
// Create Date:    21:43:34 06/26/2014
// Design Name: 
// Module Name:    project2 														
//////////////////////////////////////////////////////////////////////////
module project2(dip,btn,clk,anodes,cathodes,leds);
input [4:0] dip;
input [3:0] btn;
input clk;
output [3:0] anodes;
output [6:0] cathodes;
output [7:0] leds;
reg [3:0] anodes;
reg [6:0] cathodes;
reg [7:0] leds;

reg slow_clk1,slow_clk2;
integer d0 = 0,d1 = 0,d2 = 0,d3 = 0; // variables to store the 4 digits
integer pushcount = 0, clk_count1 = 0, clk_count2 = 0;
integer segment = 0, delay = 0; // segment displays current 7-segment
reg [1:0] status = 2'b00; // status 0 - LOC, 1 - UnLC, 2 - PAUS
reg[3:0] flag = 0; // to record the pressed status of pushbtns
reg firstpress = 0; // flag to register firt button press
integer entrycount = 0; //counter to count 20s from first button press

always @(posedge clk)
begin
	if(clk_count1 > 8000000)
	begin
		clk_count1 = 0;
		slow_clk1 = ~slow_clk1; // 6.25Hz clock for LED blinking
	end
	else clk_count1 = clk_count1 + 1;
	if(clk_count2 > 100000)
	begin
		clk_count2 = 0;
		slow_clk2 = ~slow_clk2; // 500Hz clock for 7-segmented display
	end
	else clk_count2 = clk_count2 + 1;
end

// Blinking leds on UnLC
always @(posedge slow_clk1)
begin
	if(status == 2'b01)
		leds = ~leds;
	else
		leds = 0;
end

// 7-Segment Display
always @(posedge slow_clk2)
begin
	segment = (segment + 1)%4;
	if(status == 2'b00) //LOC
	begin
		if(entrycount <= 5000)
		begin
			if(dip[3:0]==4'b0001) // digit 0 is selected
			begin
				if(btn[0] == 1 && flag[0] == 0)
					begin 
						d0 = d0 + 1;
						flag[0] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[0] == 0)	flag[0] = 0;
				
				if(btn[1] == 1 && flag[1] == 0)
					begin 
						d0 = d0 + 2;
						flag[1] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[1] == 0)	flag[1] = 0;
				
				if(btn[2] == 1 && flag[2] == 0)
					begin 
						d0 = d0 + 4;
						flag[2] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[2] == 0)	flag[2] = 0;
				
				if(btn[3] == 1 && flag[3] == 0)
					begin 
						d0 = d0 + 8;
						flag[3] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[3] == 0)	flag[3] = 0;
				
			end
			else if(dip[3:0]==4'b0010) // digit 1 is selected
			begin
				if(btn[0] == 1 && flag[0] == 0)
					begin 
						d1 = d1 + 1;
						flag[0] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[0] == 0)	flag[0] = 0;
				
				if(btn[1] == 1 && flag[1] == 0)
					begin 
						d1 = d1 + 2;
						flag[1] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[1] == 0)	flag[1] = 0;
				
				if(btn[2] == 1 && flag[2] == 0)
					begin 
						d1 = d1 + 4;
						flag[2] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[2] == 0)	flag[2] = 0;
				
				if(btn[3] == 1 && flag[3] == 0)
					begin 
						d1 = d1 + 8;
						flag[3] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[3] == 0)	flag[3] = 0;
				
			end
			else if(dip[3:0]==4'b0100) // digit 2 is selected 
			begin
				if(btn[0] == 1 && flag[0] == 0)
					begin 
						d2 = d2 + 1;
						flag[0] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1; // register first press of btn
					end
				else if(btn[0] == 0)	flag[0] = 0;
				
				if(btn[1] == 1 && flag[1] == 0)
					begin 
						d2 = d2 + 2;
						flag[1] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[1] == 0)	flag[1] = 0;
				
				if(btn[2] == 1 && flag[2] == 0)
					begin 
						d2 = d2 + 4;
						flag[2] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[2] == 0)	flag[2] = 0;
				
				if(btn[3] == 1 && flag[3] == 0)
					begin 
						d2 = d2 + 8;
						flag[3] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[3] == 0)	flag[3] = 0;
				
			end
			else if(dip[3:0]==4'b1000) // digit 3 is selected
			begin
				if(btn[0] == 1 && flag[0] == 0)
					begin
						d3 = d3 + 1;
						flag[0] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[0] == 0)	flag[0] = 0;
				
				if(btn[1] == 1 && flag[1] == 0)
					begin 
						d3 = d3 + 2;
						flag[1] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[1] == 0)	flag[1] = 0;
				
				if(btn[2] == 1 && flag[2] == 0)
					begin 
						d3 = d3 + 4;
						flag[2] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[2] == 0)	flag[2] = 0;
				
				if(btn[3] == 1 && flag[3] == 0)
					begin 
						d3 = d3 + 8;
						flag[3] = 1; 
						pushcount = pushcount + 1;
						if(firstpress == 0)	firstpress = 1;
					end
				else if(btn[3] == 0)	flag[3] = 0;
			end
			
			if(pushcount > 20) //Transition to PAUS if more than 20 pushes
			begin
				status = 2'b10;
				pushcount = 0;
				firstpress = 0;
				entrycount = 0;
			end
			else if(d0 == 9 && d1 == 8 && d2 == 8 && d3 == 3) //Unlock Code 3889
			begin
				status = 2'b01; // Transition to UnLC mode
				pushcount = 0;
				firstpress = 0;
				entrycount = 0;
				flag = 0;
				d0 = 0;d1 = 0;d2 = 0;d3 = 0;
			end
			else
			begin
				case(segment)
					0: begin anodes = 4'b1111; cathodes = 7'b1111111; end //
					1: begin anodes = 4'b1101; cathodes = 7'b1000110; end	//C
					2: begin anodes = 4'b1011; cathodes = 7'b1000000; end	//O
					3: begin anodes = 4'b0111; cathodes = 7'b1000111; end	//L
				endcase
			end
			if(firstpress == 1)
				entrycount = entrycount + 1; // increment entrycount if first press is set
		end
		else
		begin
			status = 2'b10; // Transition to PAUS if more than 20s has passed
			entrycount = 0;
			pushcount = 0;
			firstpress = 0;
		end
	end
	else if(status == 2'b01) //UnLC
	begin
		if(dip[4] == 1) // If slider 4 is high, go back to LOC 
		begin
			status = 2'b00; // Transistion to LOC
			pushcount = 0;
			
			flag = 0;
			d0 = 0;d1 = 0;d2 = 0;d3 = 0;
		end
		else
		begin
			case(segment)
				0: begin anodes = 4'b1110; cathodes = 7'b1000110; end //C
				1: begin anodes = 4'b1101; cathodes = 7'b1000111; end //L
				2: begin anodes = 4'b1011; cathodes = 7'b0101011; end //n
				3: begin anodes = 4'b0111; cathodes = 7'b1000001; end //U
			endcase
		end
	end
	else if(status == 2'b10) // PAUS
	begin
		if(delay > 2500) //Waiting for 10s in 500Hz clock
		begin
			delay = 0;
			status = 2'b00;
			pushcount = 0;
			
			flag = 0;
			d0 = 0;d1 = 0;d2 = 0;d3 = 0;
		end
		else
			delay = delay + 1;
		
		case(segment)
			0: begin anodes = 4'b1110; cathodes = 7'b0010010;end //S
			1: begin anodes = 4'b1101; cathodes = 7'b1000001;end //U
			2: begin anodes = 4'b1011; cathodes = 7'b0001000;end //A
			3: begin anodes = 4'b0111; cathodes = 7'b0001100;end //P
		endcase
	end
end

endmodule
