module counter_1(clk ,rst, pause, change_state, second, pattern);
	input clk,rst, pause, change_state;
	output pattern;
	output [3:0]second;
	
	reg[3:0] second;
	reg[3:0] count = 10;
	reg pattern;
	reg change = 1;
	
	always@(posedge clk) begin
		if(rst)
			change <= 1;
		else if(change_state == 0)
			change <= 1;
		else if(change_state & change) begin
			change = change;
			change = change;
			change = 0;
		end
	end
	
	always@(posedge clk or posedge rst or posedge pause) begin
		if(rst) begin
			count <= 10;
			//change <= 1;
			end
		else if (change_state & change) begin
			//change <= 0;
			if(count < 10) begin
				count <= 14;
			end
			else 
				count <= 9;
			end
		//else if (change_state)
		//	;
		//else if (!change_state & !change)
		//	change <= 1;
		else if (pause) begin
			//change <= 1;
			//count <= count;
			end
		else if (count == 0) begin
			//change <= 1;
			count <= 14;
			end
		else begin
			//change <= 1;
			count <= count - 1;
			end
	end
	
	always@(posedge clk or posedge rst or posedge pause) begin
		if(rst) begin
			pattern <= 0;
			second <= 0;
		end
		else if (pause) begin
			pattern <= pattern;
			second <= second;
		end
		else if(count < 10) begin
			pattern <= 1;
			second <= count + 1;
		end
		else begin
			pattern <= 0;
			second <= 0;
		end
	end
	
endmodule
