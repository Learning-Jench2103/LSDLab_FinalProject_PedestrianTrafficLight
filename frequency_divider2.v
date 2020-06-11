module frequency_divider2(clk, rst, divided_clk);
	input clk, rst;
	output divided_clk;
	
	reg divided_clk;
	reg [24:0]count;
	
	always@(posedge clk or posedge rst) begin
		if(rst)begin
			divided_clk <= 1'b0;
			count <= 25'b0;
		end
		else if(count == 25'd24000)begin
			divided_clk <= ~divided_clk;
			count <= 25'b0;
		end
		else begin
			count <= count + 25'b1;
		end
	end
endmodule