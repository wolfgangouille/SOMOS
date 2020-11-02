`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module TFT_ROLL_8(M_CLK,FPGA_CLK,TFT_CLK,TFT_CS,TFT_DCX,TFT_RESX,TFT_MOSI,VALUE16_1,VALUE16_2,VALUE16_3,VALUE16_4,VALUE16_5,VALUE16_6,VALUE16_7,VALUE16_8,TRIG_NEXT_X);

input M_CLK;
input FPGA_CLK;
//vers TFT screen
output TFT_CLK;
output TFT_CS;
output TFT_DCX;
output TFT_RESX;
output TFT_MOSI;
//vers spike detector
input [15:0] VALUE16_1;
input [15:0] VALUE16_2;
input [15:0] VALUE16_3;
input [15:0] VALUE16_4;
input [15:0] VALUE16_5;
input [15:0] VALUE16_6;
input [15:0] VALUE16_7;
input [15:0] VALUE16_8;
//input [15:0] VALUE16bis;

input TRIG_NEXT_X;

reg TFT_DCX;
reg TFT_RESX;
reg TFT_CS_KEEPLOW;
reg TFT_ON;
reg [7:0] TFT_COM; // la commande
reg [15:0] TFT_COM_COUNT; //  command counter
reg NEXT_READ;
reg [1:0] LOG_TRIG_NEXT_X;
//graphics variable
reg [15:0] PIX_COUNTER;
reg [15:0] sixteenbitscolor;
reg GOBACK2;
reg [7:0] XCOUNTER;
reg [7:0] YCOUNTER;


reg [7:0] FIRST_COL;
reg [7:0] END_COL;
reg [7:0] FIRST_ROW;
reg [7:0] END_ROW;


reg [31:0] TIME;

reg [6:0] ACT_CAP_1;
reg [6:0] OLD_CAP_1;
reg [6:0] LAST_CLAMP_1;
reg [6:0] OLD_CLAMP_1;


reg [6:0] ACT_CAP_2;
reg [6:0] OLD_CAP_2;
reg [6:0] LAST_CLAMP_2;
reg [6:0] OLD_CLAMP_2;

reg [6:0] ACT_CAP_3;
reg [6:0] OLD_CAP_3;
reg [6:0] LAST_CLAMP_3;
reg [6:0] OLD_CLAMP_3;


reg [6:0] ACT_CAP_4;
reg [6:0] OLD_CAP_4;
reg [6:0] LAST_CLAMP_4;
reg [6:0] OLD_CLAMP_4;

reg [6:0] ACT_CAP_5;
reg [6:0] OLD_CAP_5;
reg [6:0] LAST_CLAMP_5;
reg [6:0] OLD_CLAMP_5;

reg [6:0] ACT_CAP_6;
reg [6:0] OLD_CAP_6;
reg [6:0] LAST_CLAMP_6;
reg [6:0] OLD_CLAMP_6;

reg [6:0] ACT_CAP_7;
reg [6:0] OLD_CAP_7;
reg [6:0] LAST_CLAMP_7;
reg [6:0] OLD_CLAMP_7;

reg [6:0] ACT_CAP_8;
reg [6:0] OLD_CAP_8;
reg [6:0] LAST_CLAMP_8;
reg [6:0] OLD_CLAMP_8;



wire SPIKE_PRESENT;

reg [7:0] DWELL_TIME;
reg [7:0] DWELL_COUNTER;



wire [3:0] VALUE;
wire [15:0] COLOR16;

reg [15:0] COL_POP1;
reg [15:0] COL_POP2;
reg [15:0] COL_POP3;
reg [15:0] COL_POP4;
reg [15:0] COL_POP5;
reg [15:0] COL_POP6;
reg [15:0] COL_POP7;
reg [15:0] COL_POP8;

initial begin
	TIME<=32'b0;

	TFT_DCX<=0;
	TFT_RESX<=1;
	TFT_ON<=0;
	TFT_CS_KEEPLOW<=1;
	LOG_TRIG_NEXT_X<=2'b0;
   //THRESHOLD<=8'b10000000; //
   //THRESHOLD<=8'b01101000;//-15.36 uV
	//THRESHOLD<=8'b01100000;//-20.48 uV
	PIX_COUNTER<=16'b0000000000000000;
	TFT_COM_COUNT<=16'b0000000000000000; // pour compter le nobre de commandes dans la sequence
	TFT_COM<=8'b00000000; //first command for TFT
	GOBACK2<=0;

	sixteenbitscolor<=16'b0011100011111100; //koniku blue
	YCOUNTER<=8'b00000000;
	XCOUNTER<=8'b00000000;


	FIRST_COL<=8'b00000000;
	FIRST_ROW<=8'b00000000;
	END_COL<=8'b01111111;
	END_ROW<=8'b00000000;

	ACT_CAP_1=7'b0;
	LAST_CLAMP_1=7'b0;
	OLD_CLAMP_1=7'b0;
	OLD_CAP_1=7'b0;

	ACT_CAP_2=7'b0;
	LAST_CLAMP_2=7'b0;
	OLD_CLAMP_2=7'b0;
	OLD_CAP_2=7'b0;

	ACT_CAP_3=7'b0;
	LAST_CLAMP_3=7'b0;
	OLD_CLAMP_3=7'b0;
	OLD_CAP_3=7'b0;

	ACT_CAP_4=7'b0;
	LAST_CLAMP_4=7'b0;
	OLD_CLAMP_4=7'b0;
	OLD_CAP_4=7'b0;

	ACT_CAP_5=7'b0;
	LAST_CLAMP_5=7'b0;
	OLD_CLAMP_5=7'b0;
	OLD_CAP_5=7'b0;

		ACT_CAP_6=7'b0;
	LAST_CLAMP_6=7'b0;
	OLD_CLAMP_6=7'b0;
	OLD_CAP_6=7'b0;

		ACT_CAP_7=7'b0;
	LAST_CLAMP_7=7'b0;
	OLD_CLAMP_7=7'b0;
	OLD_CAP_7=7'b0;

		ACT_CAP_8=7'b0;
	LAST_CLAMP_8=7'b0;
	OLD_CLAMP_8=7'b0;
	OLD_CAP_8=7'b0;

	//DWELL_TIME<=8'b01100100;
	DWELL_TIME<=8'b00010000;
   DWELL_COUNTER<=8'b00000000;

// color is 5bits red, 6bits green, 5bit blue

COL_POP1<=16'b1111100000000000; //red
COL_POP2<=16'b1111101111100000; //orange
COL_POP3<=16'b1111111111100000; //yellow
COL_POP4<=16'b0000011111100000; //green
COL_POP5<=16'b0000011111111111; //cyan
COL_POP6<=16'b0000000000011111; //blue
COL_POP7<=16'b0111100000011111; //violet
COL_POP8<=16'b1111100000011111; //magenta




end


always @(posedge TFT_DIV_COUNTER_RESET) begin

if (GOBACK2==0) TFT_COM_COUNT=TFT_COM_COUNT+1;
else if (GOBACK2==1) TFT_COM_COUNT=TFT_COM_COUNT-1;
if (TFT_COM_COUNT==16'b0000000100101110)  NEXT_READ<=1;
else  NEXT_READ<=0;
if (TFT_COM_COUNT==16'b0000000100111011) begin TFT_COM_COUNT=16'b0000000100101101; end
end



always @(negedge TFT_DIV_COUNTER_RESET) begin
//update command
	if       (TFT_COM_COUNT==16'b0000000000000000)     TFT_RESX<=1;  //hardware reset
	else  if (TFT_COM_COUNT==16'b0000000000000001)     TFT_RESX<=0;  //hardware reset
	else  if (TFT_COM_COUNT==16'b0000000000011010)     TFT_RESX<=1;  //hardware reset
	else  if (TFT_COM_COUNT==16'b0000000000011011)     begin TFT_ON<=1; 	TFT_CS_KEEPLOW<=0;TFT_COM<=8'b00000001; end //software reset
	else  if (TFT_COM_COUNT==16'b0000000000011100)     TFT_ON<=0; // wait 120 ms

	else 	if (TFT_COM_COUNT==16'b0000000100011100) 	 begin TFT_ON<=1; TFT_COM<=8'b00010001; end  //sleepout
	else 	if (TFT_COM_COUNT==16'b0000000100011101) 	 TFT_COM<=8'b00101001; //dispon

	else 	if (TFT_COM_COUNT==16'b0000000100011110) 	 TFT_COM<=8'b00111010; //colmod command
	else 	if (TFT_COM_COUNT==16'b0000000100011111) 	 begin TFT_DCX<=1; TFT_COM<=8'b00000101;end //sixteen bits parameters

	else 	if (TFT_COM_COUNT==16'b0000000100100000) 	 begin TFT_DCX<=0; TFT_COM<=8'b00101010; end//caset command
	else 	if (TFT_COM_COUNT==16'b0000000100100001) 	 begin TFT_DCX<=1; TFT_COM<=8'b00000000; end //first parameter 0
	else 	if (TFT_COM_COUNT==16'b0000000100100010) 	 TFT_COM<=8'b00000000; //second parameter = start column 0
	else 	if (TFT_COM_COUNT==16'b0000000100100011) 	 TFT_COM<=8'b00000000; //third parameter 0
	else 	if (TFT_COM_COUNT==16'b0000000100100100) 	 TFT_COM<=8'b10000000; //fourth parameter = end column 128

	else 	if (TFT_COM_COUNT==16'b0000000100100101) 	 begin TFT_DCX<=0; TFT_COM<=8'b00101011;end //raset command
	else 	if (TFT_COM_COUNT==16'b0000000100100110) 	 begin TFT_DCX<=1; TFT_COM<=8'b00000000;end //first parameter 0
	else 	if (TFT_COM_COUNT==16'b0000000100100111) 	 TFT_COM<=8'b00000000; //second parameter = start row 0
	else 	if (TFT_COM_COUNT==16'b0000000100101000) 	 TFT_COM<=8'b00000000; //third parameter 0
	else 	if (TFT_COM_COUNT==16'b0000000100101001) 	 TFT_COM<=8'b10100000; //fourth parameter = end row 160

   //first loop to fill the screen with initial color
	else 	if (TFT_COM_COUNT==16'b0000000100101010) 	 begin TFT_CS_KEEPLOW<=1; TFT_DCX<=0; TFT_COM<=8'b00101100; PIX_COUNTER<=16'b0000000000000000;end //memwrite commande
	else 	if (TFT_COM_COUNT==16'b0000000100101011) 	 begin GOBACK2<=0;TFT_DCX<=1; TFT_COM<=sixteenbitscolor[15:8]; end //data
	else 	if (TFT_COM_COUNT==16'b0000000100101100)
		begin
		TFT_COM<=sixteenbitscolor[7:0];
		if (PIX_COUNTER<16'b1010000000000000)
			begin
			PIX_COUNTER<=PIX_COUNTER+1;
			GOBACK2<=1;
			end //data //
		end
		//exit loop, switch  to white
	else 	if (TFT_COM_COUNT==16'b0000000100101101) 	 begin  GOBACK2<=0; TFT_CS_KEEPLOW<=0;  end //data //

	//second loop is main loop
   //fix data to plot
	else 	if (TFT_COM_COUNT==16'b0000000100101110) 	 begin
	TFT_ON<=1;
	TFT_CS_KEEPLOW<=0; TFT_DCX<=0;

	ACT_CAP_1<=LAST_CLAMP_1;
	OLD_CAP_1<=OLD_CLAMP_1;

	ACT_CAP_2<=LAST_CLAMP_2;
	OLD_CAP_2<=OLD_CLAMP_2;

	ACT_CAP_3<=LAST_CLAMP_3;
	OLD_CAP_3<=OLD_CLAMP_3;

	ACT_CAP_4<=LAST_CLAMP_4;
	OLD_CAP_4<=OLD_CLAMP_4;

	ACT_CAP_5<=LAST_CLAMP_5;
	OLD_CAP_5<=OLD_CLAMP_5;

	ACT_CAP_6<=LAST_CLAMP_6;
	OLD_CAP_6<=OLD_CLAMP_6;

	ACT_CAP_7<=LAST_CLAMP_7;
	OLD_CAP_7<=OLD_CLAMP_7;

	ACT_CAP_8<=LAST_CLAMP_8;
	OLD_CAP_8<=OLD_CLAMP_8;


	FIRST_ROW<=XCOUNTER; // define the draw area (entire row)
	END_ROW<=XCOUNTER;
	FIRST_COL<=8'b0; //0 to 127
	END_COL<=8'd127; //0 to 127
	//depending on num_ele, define FIRST_COL and FIRST_ROW
	TFT_COM<=8'b00101010; //caset command
	end//caset command


	else 	if (TFT_COM_COUNT==16'b0000000100101111) 	 begin  TFT_DCX<=1; TFT_COM<=8'b00000000; end //first parameter 0
	else 	if (TFT_COM_COUNT==16'b0000000100110000) 	 TFT_COM<=FIRST_COL;
	else 	if (TFT_COM_COUNT==16'b0000000100110001) 	 TFT_COM<=8'b00000000; //third parameter 0
	else 	if (TFT_COM_COUNT==16'b0000000100110010)   TFT_COM<=END_COL;	//+30
	else 	if (TFT_COM_COUNT==16'b0000000100110011) 	 begin TFT_DCX<=0; TFT_COM<=8'b00101011;end //raset command
	else 	if (TFT_COM_COUNT==16'b0000000100110100) 	 begin TFT_DCX<=1; TFT_COM<=8'b00000000;end //first parameter 0
	else 	if (TFT_COM_COUNT==16'b0000000100110101) 	 TFT_COM<=FIRST_ROW;
	else 	if (TFT_COM_COUNT==16'b0000000100110110) 	 TFT_COM<=8'b00000000; //third parameter 0
	else 	if (TFT_COM_COUNT==16'b0000000100110111) 	 TFT_COM<=END_ROW;//8'b00011110;	//+30
	else 	if (TFT_COM_COUNT==16'b0000000100111000) 	 begin  TFT_CS_KEEPLOW<=1; TFT_DCX<=0; TFT_COM<=8'b00101100; YCOUNTER<=8'b00000000; end //memwrite commande
	else 	if (TFT_COM_COUNT==16'b0000000100111001) 	 //write first part of command
		begin
		GOBACK2<=0;
		TFT_DCX<=1;
	//	if (YCOUNTER==7'b1000000) begin TFT_COM<=8'b00000000; sixteenbitscolor<=16'b0000000000000000; end
		if ( (YCOUNTER==ACT_CAP_1) || (ACT_CAP_1>=OLD_CAP_1 && YCOUNTER>OLD_CAP_1 && YCOUNTER<=ACT_CAP_1) || (ACT_CAP_1<OLD_CAP_1 && YCOUNTER>=ACT_CAP_1 && YCOUNTER<OLD_CAP_1)) begin TFT_COM<=COL_POP1[15:8]; sixteenbitscolor<=COL_POP1; end//

		else if ((YCOUNTER==ACT_CAP_2) || (ACT_CAP_2>=OLD_CAP_2 && YCOUNTER>OLD_CAP_2 && YCOUNTER<=ACT_CAP_2) || (ACT_CAP_2<OLD_CAP_2 && YCOUNTER>=ACT_CAP_2 && YCOUNTER<OLD_CAP_2)) begin TFT_COM<=COL_POP2[15:8]; sixteenbitscolor<=COL_POP2; end//

		else if ((YCOUNTER==ACT_CAP_3) || (ACT_CAP_3>=OLD_CAP_3 && YCOUNTER>OLD_CAP_3 && YCOUNTER<=ACT_CAP_3) || (ACT_CAP_3<OLD_CAP_3 && YCOUNTER>=ACT_CAP_3 && YCOUNTER<OLD_CAP_3)) begin TFT_COM<=COL_POP3[15:8]; sixteenbitscolor<=COL_POP3; end//

		else if ((YCOUNTER==ACT_CAP_4) || (ACT_CAP_4>=OLD_CAP_4 && YCOUNTER>OLD_CAP_4 && YCOUNTER<=ACT_CAP_4) || (ACT_CAP_4<OLD_CAP_4 && YCOUNTER>=ACT_CAP_4 && YCOUNTER<OLD_CAP_4)) begin TFT_COM<=COL_POP4[15:8]; sixteenbitscolor<=COL_POP4; end//

		else if ((YCOUNTER==ACT_CAP_5) || (ACT_CAP_5>=OLD_CAP_5 && YCOUNTER>OLD_CAP_5 && YCOUNTER<=ACT_CAP_5) || (ACT_CAP_5<OLD_CAP_5 && YCOUNTER>=ACT_CAP_5 && YCOUNTER<OLD_CAP_5)) begin TFT_COM<=COL_POP5[15:8]; sixteenbitscolor<=COL_POP5; end//

		else if ((YCOUNTER==ACT_CAP_6) || (ACT_CAP_6>=OLD_CAP_6 && YCOUNTER>OLD_CAP_6 && YCOUNTER<=ACT_CAP_6) || (ACT_CAP_6<OLD_CAP_6 && YCOUNTER>=ACT_CAP_6 && YCOUNTER<OLD_CAP_6)) begin TFT_COM<=COL_POP6[15:8]; sixteenbitscolor<=COL_POP6; end//

		else if ((YCOUNTER==ACT_CAP_7) || (ACT_CAP_7>=OLD_CAP_7 && YCOUNTER>OLD_CAP_7 && YCOUNTER<=ACT_CAP_7) || (ACT_CAP_7<OLD_CAP_7 && YCOUNTER>=ACT_CAP_7 && YCOUNTER<OLD_CAP_7)) begin TFT_COM<=COL_POP7[15:8]; sixteenbitscolor<=COL_POP7; end//

		else if ((YCOUNTER==ACT_CAP_8) || (ACT_CAP_8>=OLD_CAP_8 && YCOUNTER>OLD_CAP_8 && YCOUNTER<=ACT_CAP_8) || (ACT_CAP_8<OLD_CAP_8 && YCOUNTER>=ACT_CAP_8 && YCOUNTER<OLD_CAP_8)) begin TFT_COM<=COL_POP8[15:8]; sixteenbitscolor<=COL_POP8; end//


		else begin TFT_COM<=8'b00000000; sixteenbitscolor<=16'b0000000000000000; end //background black
		end

	else if (TFT_COM_COUNT == 16'b0000000100111010) 	// write the last part of color
		begin
			TFT_COM<=sixteenbitscolor[7:0];
			if (YCOUNTER<8'd127) //30
				begin
				YCOUNTER<=YCOUNTER+1;
				GOBACK2<=1;
				end
			else if (YCOUNTER==127) // 30 if end
				begin
				YCOUNTER<=8'b00000000;
				GOBACK2<=0;
				end
		end
		else if (TFT_COM_COUNT == 16'b0000000100111011)  TFT_ON<=0;

end

//add list commands here
always @(negedge M_CLK) begin
LOG_TRIG_NEXT_X<={LOG_TRIG_NEXT_X[0],TRIG_NEXT_X};
if (!LOG_TRIG_NEXT_X[1] && LOG_TRIG_NEXT_X[0])
begin

OLD_CLAMP_1<=LAST_CLAMP_1;
if ({VALUE16_1[14:7]}+8'd15>=8'd200) LAST_CLAMP_1<=7'd0;
else if ({VALUE16_1[14:7]}+8'd15>=8'd127) LAST_CLAMP_1<=7'd127;
else LAST_CLAMP_1<={VALUE16_1[13:7]}+7'd15;


OLD_CLAMP_2<=LAST_CLAMP_2;
if ({VALUE16_2[14:7]}+8'd29>=8'd200) LAST_CLAMP_2<=7'd0;
else if ({VALUE16_2[14:7]}+8'd29>=8'd127) LAST_CLAMP_2<=7'd127;
else LAST_CLAMP_2<={VALUE16_2[13:7]}+7'd29;

OLD_CLAMP_3<=LAST_CLAMP_3;
if ({VALUE16_3[14:7]}+8'd43>=8'd200) LAST_CLAMP_3<=7'd0;
else if ({VALUE16_3[14:7]}+8'd43>=8'd127) LAST_CLAMP_3<=7'd127;
else LAST_CLAMP_3<={VALUE16_3[13:7]}+7'd43;


OLD_CLAMP_4<=LAST_CLAMP_4;
if ({VALUE16_4[14:7]}+8'd57>=8'd200) LAST_CLAMP_4<=7'd0;
else if ({VALUE16_4[14:7]}+8'd57>=8'd127) LAST_CLAMP_4<=7'd127;
else LAST_CLAMP_4<={VALUE16_4[13:7]}+7'd57;

OLD_CLAMP_5<=LAST_CLAMP_5;
if ({VALUE16_5[14:7]}+8'd71>=8'd200) LAST_CLAMP_5<=7'd0;
else if ({VALUE16_5[14:7]}+8'd71>=8'd127) LAST_CLAMP_5<=7'd127;
else LAST_CLAMP_5<={VALUE16_5[13:7]}+7'd71;

OLD_CLAMP_6<=LAST_CLAMP_6;
if ({VALUE16_6[14:7]}+8'd85>=8'd200) LAST_CLAMP_6<=7'd0;
else if ({VALUE16_6[14:7]}+8'd85>=8'd127) LAST_CLAMP_6<=7'd127;
else LAST_CLAMP_6<={VALUE16_6[13:7]}+7'd85;

OLD_CLAMP_7<=LAST_CLAMP_7;
if ({VALUE16_7[14:7]}+8'd99>=8'd200) LAST_CLAMP_7<=7'd0;
else if ({VALUE16_7[14:7]}+8'd99>=8'd127) LAST_CLAMP_7<=7'd127;
else LAST_CLAMP_7<={VALUE16_7[13:7]}+7'd99;

OLD_CLAMP_8<=LAST_CLAMP_8;
if ({VALUE16_8[14:7]}+8'd113>=8'd200) LAST_CLAMP_8<=7'd0;
else if ({VALUE16_8[14:7]}+8'd113>=8'd127) LAST_CLAMP_8<=7'd127;
else LAST_CLAMP_8<={VALUE16_8[13:7]}+7'd113;




XCOUNTER<=XCOUNTER+1; end //8:3
if (XCOUNTER==8'b10100000) XCOUNTER<=8'b00000000;
end

TFT_SPI_PATTERN_GEN lemodule(FPGA_CLK,TFT_DIV_COUNTER_RESET,TFT_ON,TFT_CS_KEEPLOW,TFT_COM,TFT_CLK,TFT_CS,TFT_MOSI);

endmodule
