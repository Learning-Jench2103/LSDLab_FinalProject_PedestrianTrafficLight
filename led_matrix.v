module led_matrix (clk ,rst, pattern, sel, row ,column);
input clk ,rst ,pattern;
input [1:0] sel;
output [7:0] row ,column ;
reg [7:0] row ,column ;

always@(posedge clk or posedge rst)begin
	if(rst) 
		row <= 8'd1;
	else if(row == 8'b10000000) 
		row <= 8'b0000001;
	else 
		row <= row<<1'b1;
end

always@(*)begin
	if(pattern==0)begin
			case(row)
			8'b00000001: column=8'b00011100;
			8'b00000010: column=8'b00011100;
			8'b00000100: column=8'b00001000;
			8'b00001000: column=8'b00111110;
			8'b00010000: column=8'b00101010;
			8'b00100000: column=8'b00001000;
			8'b01000000: column=8'b00010100;
			8'b10000000: column=8'b00100010;
			default    : column=8'b00000000;
			endcase
	end
	else begin
		case(sel)
			2'b00:begin
				case(row)
				8'b00000001: column=8'b00111000;
				8'b00000010: column=8'b00111000;
				8'b00000100: column=8'b10010000;
				8'b00001000: column=8'b01111110;
				8'b00010000: column=8'b00010000;
				8'b00100000: column=8'b00110100;
				8'b01000000: column=8'b01001000;
				8'b10000000: column=8'b10000000;
				default    : column=8'b00000000;
				endcase
			end
			2'b01:begin
				case(row)
				8'b00000001: column=8'b00111000;
				8'b00000010: column=8'b00111000;
				8'b00000100: column=8'b01010000;
				8'b00001000: column=8'b00111100;
				8'b00010000: column=8'b00010010;
				8'b00100000: column=8'b00110000;
				8'b01000000: column=8'b01001100;
				8'b10000000: column=8'b01000000;
				default    : column=8'b00000000;
				endcase
			end
			2'b10:begin
				case(row)
				8'b00000001: column=8'b00111000;
				8'b00000010: column=8'b00111000;
				8'b00000100: column=8'b00010000;
				8'b00001000: column=8'b01011000;
				8'b00010000: column=8'b00110100;
				8'b00100000: column=8'b00010000;
				8'b01000000: column=8'b00101000;
				8'b10000000: column=8'b00100100;
				default    : column=8'b00000000;
				endcase
			end
			2'b11:begin
				case(row)
				8'b00000001: column=8'b00111000;
				8'b00000010: column=8'b00111000;
				8'b00000100: column=8'b01010000;
				8'b00001000: column=8'b00111100;
				8'b00010000: column=8'b00010010;
				8'b00100000: column=8'b00110000;
				8'b01000000: column=8'b01001100;
				8'b10000000: column=8'b01000000;
				default    : column=8'b00000000;
				endcase
			end
		endcase
	end
end

endmodule