module system(clk ,rst, pause, change_state, count_7seg, row ,column, pattern, divided_clk_2, count_7seg_2);
	input clk ,rst, pause, change_state;
	output [7:0] column ,row;
	output [6:0] count_7seg;
	output [6:0] count_7seg_2;
	output pattern;
	output divided_clk_2;
	wire divided_clk_1 ,divided_clk_2 ,pattern;
	wire [3:0] second;
	wire [1:0]sel;
	reg quick;
	
	reg [3:0] second_1;
	reg [3:0] second_2;
	
	always@(second) begin
		if(second >= 10) begin
			second_1 <= second - 10;
			second_2 <= second / 10;
		end
		else begin
			second_1 <= second;
			second_2 <= 0;
		end
	end
	
	always@(posedge clk)
		begin
			if(second <= 5 && second > 0) begin
				quick <= 1;
				end
			else begin
				quick <= 0;
			end
		end

	frequency_divider_1 fd1(.clk(clk), .rst(rst), .divided_clk(divided_clk_1));
	
	counter_1 c1(.clk(divided_clk_1) ,.rst(rst) ,.pause(pause), .change_state(change_state), .second(second), .pattern(pattern));
	
	bin_to_7seg bt7(.bin(second_1), .out_7seg(count_7seg));
	
	bin_to_7seg bt7_2(.bin(second_2), .out_7seg(count_7seg_2));

	frequency_divider2 fd2(.clk(clk), .rst(rst), .divided_clk(divided_clk_2));
	
	counter_2 c2(.clk(divided_clk_2) , .rst(rst) , .pause(pause), .quick(quick), .sel(sel));
	
	led_matrix ledm(.clk(divided_clk_2) ,.rst(rst),.pattern(pattern) ,.sel(sel),.row(row) ,.column(column));
	
endmodule
