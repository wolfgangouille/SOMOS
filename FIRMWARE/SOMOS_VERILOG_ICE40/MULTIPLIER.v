`timescale 1ns / 1ps

module MULTIPLIER(M_CLK,TRIGGER,DATA_IN_1,DATA_IN_2,DATA_OUT,DATA_READY);

input M_CLK;
input TRIGGER;
input [15:0] DATA_IN_1;
input [15:0] DATA_IN_2;

//output [15:0] LPF;
output [15:0] DATA_OUT;

output DATA_READY;
reg DATA_READY;

reg [15:0] DATA_1;
reg [15:0] DATA_2;

reg [15:0] ABS_1;
reg [15:0] ABS_2;

reg [31:0] TEMP_RESULT;
reg [15:0] DATA_OUT;

reg [1:0] TRIGSHIFT;
reg [7:0] COUNTER;

initial begin

	DATA_1<=16'b0;
	DATA_2<=16'b0;
	ABS_1<=16'b0;
	ABS_2<=16'b0;
	TEMP_RESULT<=32'b00000000000000000000000000000000;
	TRIGSHIFT<=2'b0;
	DATA_READY<=0;
	COUNTER=8'b0;

end

always @(posedge M_CLK) begin
	TRIGSHIFT<={TRIGSHIFT[0],TRIGGER};
	if (TRIGSHIFT[0]&&!TRIGSHIFT[1])  begin
	  DATA_READY<=0;
		COUNTER<=8'b0;
		DATA_1<=DATA_IN_1;
		DATA_2<=DATA_IN_2;
	end //posedge du trig

	if (COUNTER<8'd8) COUNTER<=COUNTER+1;

	if (COUNTER==8'd2) begin //compute absolute value
		if (DATA_1[15]==1'b1) ABS_1 <= ~DATA_1+1;
		else ABS_1<=DATA_1;
		if (DATA_2[15]==1'b1) ABS_1 <= ~DATA_2+1;
		else ABS_2<=DATA_2;
	end

	else if (COUNTER==8'd3) begin //compute product
		TEMP_RESULT<=ABS_1*ABS_2;
	end

	else if (COUNTER==8'd4) begin // define margins
			if (TEMP_RESULT>=32'b00000000000000111111111111111111) DATA_OUT<=16'b0111111111111;
			else DATA_OUT<=TEMP_RESULT[18:3];
	end
	if (COUNTER==8'd5) begin
		if (DATA_1[15]^DATA_2[15]) DATA_OUT<= ~DATA_OUT+1;
	end

	else if (COUNTER==8'd6) DATA_READY<=1;
	else if (COUNTER==8'd7) DATA_READY<=0;

end



endmodule
