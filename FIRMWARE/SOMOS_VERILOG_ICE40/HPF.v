`timescale 1ns / 1ps

module HPF(M_CLK,TRIGGER,DATA_IN,HPF,DATA_READY);

input M_CLK;
input TRIGGER;
input [15:0] DATA_IN;
//output [15:0] LPF;
output [15:0] HPF;

output DATA_READY;
reg DATA_READY;

reg [15:0] DATA;
reg [15:0] DELTA_ABS;
reg [15:0] LPF;
reg [15:0] HPF;
reg [31:0] TEMP_LPF;

reg [15:0] ALPHA_MEAN;
reg [1:0] TRIGSHIFT;
reg [7:0] COUNTER;

initial begin
	ALPHA_MEAN<=16'b0000000001000000;

	DATA<=16'b0;
	TEMP_LPF<=32'b10000000000000000000000000000000;
	LPF<=16'b0000000000000000;
	HPF<=16'b0000000000000000;

	DELTA_ABS<=16'b0;

	TRIGSHIFT<=2'b0;
	DATA_READY<=0;
	COUNTER=8'b0;

end

always @(posedge M_CLK) begin
	TRIGSHIFT<={TRIGSHIFT[0],TRIGGER};
	if (TRIGSHIFT[0]&&!TRIGSHIFT[1])  begin
	  DATA_READY<=0;
		COUNTER<=8'b0;
		DATA<=DATA_IN;
	end //posedge du trig

	if (COUNTER<8'd8) COUNTER<=COUNTER+1;


	if (COUNTER==8'd2) begin
		if (DATA>=LPF) DELTA_ABS<=DATA-LPF;
		else DELTA_ABS<=LPF-DATA;
	end

	else if (COUNTER==8'd3) begin //COMPUTE TEMP_MEAN
		if (DATA>=LPF) TEMP_LPF<=TEMP_LPF+ALPHA_MEAN*DELTA_ABS;
		else TEMP_LPF<=TEMP_LPF-ALPHA_MEAN*DELTA_ABS;

	end

	else if (COUNTER==8'd4) begin
		LPF<={TEMP_LPF[31],TEMP_LPF[29:15]}; //need to keep MSB in case of substraction (see above)
	end
	if (COUNTER==8'd5) begin
		HPF<=DATA-LPF;
	end
	else if (COUNTER==8'd6) DATA_READY<=1;
	else if (COUNTER==8'd8) DATA_READY<=0;

end



endmodule
