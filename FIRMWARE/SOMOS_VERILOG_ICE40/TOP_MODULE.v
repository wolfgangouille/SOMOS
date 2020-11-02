// look in pins.pcf for all the pin names on the TinyFPGA BX board
module top (
  input CLK,    // 16MHz clock
  output USBPU,  // USB pull-up resistor
  input RX,
  output TX,
  output BT_KEY,
  output INTAN_CLK,
  output INTAN_CS,
  output INTAN_MOSI,
  input INTAN_MISO,
  output TFT_CLK,
  output TFT_MOSI,
  output TFT_DCX,
  output TFT_RESX,
  output TFT_CS,
  output LED);
  // drive USB pull-up resistor to '0' to disable USB
  assign USBPU = 0;

  //time variable
  reg [31:0] TIME;
  reg [15:0] M_COUNTER;
  reg [31:0] LOOP_TIME;
  reg [31:0] LOOP_DURATION; //for sending data
  //variables for BT
  wire TICK;
  reg TxEn;
  reg RxEn;
  reg BT_KEY;
  reg Rst_n;
  reg [15:0] BaudRate;
  wire TxDone;
  wire RxDone;
  reg [7:0] NBits;	 //Send one byte at a time ? OK like arduino write
  reg [7:0] TxData;
  wire [7:0] RxData;
  reg TRANSMIT;
  reg NEXT_TRANSMIT;
  reg [2:0] data_mode;
  parameter [2:0] RAW_LOW=3'b000;
  parameter [2:0] RAW_HIGH=3'b001;
  parameter [2:0] RMS_LOW=3'b010;
  parameter [2:0] RMS_HIGH=3'b011;
  parameter [2:0] DEBUGI=3'b100;

  //data variables
  wire [7:0] NUMELE;
  wire DATA_VALID;
  wire [15:0] INTAN_RESULT;

  reg TRIGGER_1; //when all data is ready
  wire DR1;

  reg [15:0] VALUE16_1;
  reg [15:0] VALUE16_2;
  reg [15:0] VALUE16_3;
  reg [15:0] VALUE16_4;
  reg [15:0] VALUE16_5;
  reg [15:0] VALUE16_6;
  reg [15:0] VALUE16_7;
  reg [15:0] VALUE16_8;

  wire [15:0] HPS1;
  wire [15:0] HPS2;
  wire [15:0] HPS3;
  wire [15:0] HPS4;
  wire [15:0] HPS5;
  wire [15:0] HPS6;
  wire [15:0] HPS7;
  wire [15:0] HPS8;

  wire [15:0] COVAR11;
  wire [15:0] COVAR12;
  wire [15:0] COVAR13;
  wire [15:0] COVAR14;
  wire [15:0] COVAR15;
  wire [15:0] COVAR16;
  wire [15:0] COVAR17;
  wire [15:0] COVAR18;

  wire [15:0] COVAR22;
  wire [15:0] COVAR23;
  wire [15:0] COVAR24;
  wire [15:0] COVAR25;
  wire [15:0] COVAR26;
  wire [15:0] COVAR27;
  wire [15:0] COVAR28;

  wire [15:0] COVAR33;
  wire [15:0] COVAR44;
  wire [15:0] COVAR55;
  wire [15:0] COVAR66;
  wire [15:0] COVAR77;
  wire [15:0] COVAR88;

  reg [7:0] VALUEBT1;
  reg [7:0] VALUEBT2;
  reg [7:0] VALUEBT3;
  reg [7:0] VALUEBT4;
  reg [7:0] VALUEBT5;
  reg [7:0] VALUEBT6;
  reg [7:0] VALUEBT7;
  reg [7:0] VALUEBT8;

  reg [15:0] VALUEDISPLAY_1;
  reg [15:0] VALUEDISPLAY_2;
  reg [15:0] VALUEDISPLAY_3;
  reg [15:0] VALUEDISPLAY_4;
  reg [15:0] VALUEDISPLAY_5;
  reg [15:0] VALUEDISPLAY_6;
  reg [15:0] VALUEDISPLAY_7;
  reg [15:0] VALUEDISPLAY_8;

  reg NEXT_X;
//reg LED;

  initial begin

  TIME<=32'b0;
  M_COUNTER<=16'b0;
  LOOP_TIME<=16'b0;
  LOOP_DURATION<=16'b0010000000000000;;
  data_mode<=RMS_HIGH;

  VALUE16_1<=16'b0;
  VALUE16_2<=16'b0;
  VALUE16_3<=16'b0;
  VALUE16_4<=16'b0;
  VALUE16_5<=16'b0;
  VALUE16_6<=16'b0;
  VALUE16_7<=16'b0;
  VALUE16_8<=16'b0;

  VALUEBT1<=8'd0;
  VALUEBT2<=8'd1;
  VALUEBT3<=8'd2;
  VALUEBT4<=8'd3;
  VALUEBT5<=8'd4;
  VALUEBT6<=8'd5;
  VALUEBT7<=8'd6;
  VALUEBT8<=8'd7; //for testing

  VALUEDISPLAY_1<=16'b0;
  VALUEDISPLAY_2<=16'b0;
  VALUEDISPLAY_3<=16'b0;
  VALUEDISPLAY_4<=16'b0;
  VALUEDISPLAY_5<=16'b0;
  VALUEDISPLAY_6<=16'b0;
  VALUEDISPLAY_7<=16'b0;
  VALUEDISPLAY_8<=16'b0;

  TxData<=8'b0;
  Rst_n<=1'b1;
  BaudRate<=16'd9;//9 for 115200, 26 for38400;
  NBits<=8'd8;
  TxData<=8'b0;
  TxEn<=1'b0;
  RxEn<=1'b1;
  TRIGGER_1<=0;
  BT_KEY<=1'b0;
  TRANSMIT<=1'b0;
  NEXT_TRANSMIT<=1'b0;
  NEXT_X<=1'b0;
//LED<=0;
  end


  always @(posedge TxDone) begin
  M_COUNTER<=M_COUNTER+1;
  end


  //BT commands
  always @(posedge RxDone) begin
  	if (RxData==8'd0) begin NEXT_TRANSMIT<=1'b0; end
    if (RxData==8'd1) begin NEXT_TRANSMIT<=1'b1; end
  	if (RxData==8'd2) begin  LOOP_DURATION<=16'b0010000000000000; end    //125Hz
    if (RxData==8'd3) begin  LOOP_DURATION<=16'b0100000000000000; end	  //250Hz
  	if (RxData==8'd9) begin  LOOP_DURATION<=16'b0000001000000000; end    //500Hz
  	if (RxData==8'd10) begin LOOP_DURATION<=16'b0000000100000000; end    //1kHz
  	if (RxData==8'd4) begin data_mode<=RAW_LOW; end
    if (RxData==8'd5) begin data_mode<=RAW_HIGH; end
  	if (RxData==8'd6) begin data_mode<=RMS_LOW; end
    if (RxData==8'd7) begin data_mode<=RMS_HIGH; end
  	if (RxData==8'd8) begin data_mode<=DEBUG; end
  end

  //change to have only one trigger
  always @(posedge DATA_VALID) begin   //DATA_VALID has a frequency of 500kHz
  if (NUMELE==0)

  begin
    TIME<=TIME+1;
    TRIGGER_1<=0;
    if (LOOP_TIME>=LOOP_DURATION) LOOP_TIME<=16'b0;
    else LOOP_TIME<=LOOP_TIME+1; //TIME[14] changes every sec
  end	// for 16 electrodes, 31.25kHz

  if      (NUMELE==4) 	VALUE16_1<=INTAN_RESULT; //same time for all electrodes, update atfter each loop	at about 62.5 kHz
  else if (NUMELE==5) 	VALUE16_2<=INTAN_RESULT; //same time for all electrodes, update atfter each loop	at about 62.5 kHz
  else if (NUMELE==6) 	VALUE16_3<=INTAN_RESULT; //same time for all electrodes, update atfter each loop	at about 62.5 kHz
  else if (NUMELE==7) 	VALUE16_4<=INTAN_RESULT; //same time for all electrodes, update atfter each loop	at about 62.5 kHz
  else if (NUMELE==8) 	VALUE16_5<=INTAN_RESULT;   //same time for all electrodes, update atfter each loop	at about 62.5 kHz
  else if (NUMELE==9) 	VALUE16_6<=INTAN_RESULT;//same time for all electrodes, update atfter each loop	at about 62.5 kHz
  else if (NUMELE==10) VALUE16_7<=INTAN_RESULT;//same time for all electrodes, update atfter each loop	at about 62.5 kHz
  else if (NUMELE==11) VALUE16_8<=INTAN_RESULT; //same time for all electrodes, update atfter each loop	at about 62.5 kHz
  else if (NUMELE==12) TRIGGER_1<=1; //same time for all electrodes, update atfter each loop	at about 62.5 kHz

  end


  always @(posedge DR1) begin   //DATA_VALID has a frequency of 500kHz. TIME does not change at negedge DATA_VALID

  if      (LOOP_TIME==16'b0000000000000000) begin TRANSMIT<=NEXT_TRANSMIT; TxData<=VALUEBT1; end   //RAWRMS1[10:3];//   //RAWRMS1[10:3];//VALUE16_1[15:8];   //6bits loop period = 1.95kbytes/sec
  else if (LOOP_TIME==16'b0000000000000001) TxEn<=TRANSMIT;                                       //7bits loop period = 0.976kbytes/sec
  else if (LOOP_TIME==16'b0000000000010000) begin TxData<=VALUEBT2; end   //RAWRMS2[10:3];//  //RAWRMS2[10:3];//VALUE16_2[15:8];
  else if (LOOP_TIME==16'b0000000000010001) TxEn<=TRANSMIT;
  else if (LOOP_TIME==16'b0000000000100000) begin TxData<=VALUEBT3; end  //RAWRMS3[10:3];//   //RAWRMS3[10:3];//VALUE16_3[15:8];
  else if (LOOP_TIME==16'b0000000000100001) TxEn<=TRANSMIT;
  else if (LOOP_TIME==16'b0000000000110000) begin TxData<=VALUEBT4; end  //RAWRMS4[10:3];//   //RAWRMS4[10:3];//VALUE16_4[15:8];
  else if (LOOP_TIME==16'b0000000000110001) TxEn<=TRANSMIT;
  else if (LOOP_TIME==16'b0000000001000000) begin TxData<=VALUEBT5; end   //RAWRMS5[10:3];//   //RAWRMS1[10:3];//VALUE16_1[15:8];
  else if (LOOP_TIME==16'b0000000001000001) TxEn<=TRANSMIT;
  else if (LOOP_TIME==16'b0000000001010000) begin TxData<=VALUEBT6; end  //RAWRMS6[10:3];//   //RAWRMS2[10:3];//VALUE16_2[15:8];
  else if (LOOP_TIME==16'b0000000001010001) TxEn<=TRANSMIT;
  else if (LOOP_TIME==16'b0000000001100000) begin TxData<=VALUEBT7; end //RAWRMS7[10:3];//   //RAWRMS3[10:3];//VALUE16_3[15:8];
  else if (LOOP_TIME==16'b0000000001100001) TxEn<=TRANSMIT;
  else if (LOOP_TIME==16'b0000000001110000) begin TxData<=VALUEBT8; end //RAWRMS8[10:3];//;   //RAWRMS4[10:3];//VALUE16_4[15:8];
  else if (LOOP_TIME==16'b0000000001110001) TxEn<=TRANSMIT;
  else TxEn<=1'b0;

  if (TIME[3:0]==4'b0011)
    begin
    VALUEDISPLAY_1<=VALUE16_1;   //should not load as the same time as TxData ?
    VALUEDISPLAY_2<=VALUE16_2;
    VALUEDISPLAY_3<=VALUE16_3;
    VALUEDISPLAY_4<=VALUE16_4;
    VALUEDISPLAY_5<=VALUE16_5;
    VALUEDISPLAY_6<=VALUE16_6;
    VALUEDISPLAY_7<=VALUE16_7;
    VALUEDISPLAY_8<=VALUE16_8;
    end
  else if (TIME[3:0]==4'b0110) NEXT_X<=1'b1;
  else NEXT_X<=1'b0;


  end



  //modify data to send at posedge DR1,
  //send it at negedge de DR1
  always @(posedge DR1) begin   //DATA_VALID has a frequency of 500kHz. TIME does not change at negedge DATA_VALID
  if (LOOP_TIME==16'b0000000000000000) begin
  	case(data_mode)
  	RAW_LOW: begin
  		VALUEBT1<={VALUE16_1[15],VALUE16_1[12:6]};
  		VALUEBT2<={VALUE16_2[15],VALUE16_2[12:6]};
  		VALUEBT3<={VALUE16_3[15],VALUE16_3[12:6]};
  		VALUEBT4<={VALUE16_4[15],VALUE16_4[12:6]};
  		VALUEBT5<={VALUE16_5[15],VALUE16_5[12:6]};
  		VALUEBT6<={VALUE16_6[15],VALUE16_6[12:6]};
  		VALUEBT7<={VALUE16_7[15],VALUE16_7[12:6]};
  		VALUEBT8<={VALUE16_8[15],VALUE16_8[12:6]};
  		end
  	RAW_HIGH: begin
  		VALUEBT1<={VALUE16_1[15],VALUE16_1[10:4]};
  		VALUEBT2<={VALUE16_2[15],VALUE16_2[10:4]};
  		VALUEBT3<={VALUE16_3[15],VALUE16_3[10:4]};
  		VALUEBT4<={VALUE16_4[15],VALUE16_4[10:4]};
  		VALUEBT5<={VALUE16_5[15],VALUE16_5[10:4]};
  		VALUEBT6<={VALUE16_6[15],VALUE16_6[10:4]};
  		VALUEBT7<={VALUE16_7[15],VALUE16_7[10:4]};
  		VALUEBT8<={VALUE16_8[15],VALUE16_8[10:4]};
  		end
  	RMS_LOW: begin
  		VALUEBT1<=COVAR11[13:6];//VALUEBT1+1;//{VALUE16_1[15],VALUE16_1[12:6]};
  		VALUEBT2<=COVAR22[13:6];//VALUEBT2+1;//{VALUE16_2[15],VALUE16_2[12:6]};
  		VALUEBT3<=COVAR33[13:6];//VALUEBT3+1;//{VALUE16_3[15],VALUE16_3[12:6]};
  		VALUEBT4<=COVAR44[13:6];//VALUEBT4+1;//{VALUE16_4[15],VALUE16_4[12:6]};
  		VALUEBT5<=COVAR55[13:6];//VALUEBT5+1;//{VALUE16_5[15],VALUE16_5[12:6]};
  		VALUEBT6<=COVAR66[13:6];//VALUEBT6+1;//{VALUE16_6[15],VALUE16_6[12:6]};
  		VALUEBT7<=COVAR77[13:6];//VALUEBT7+1;//{VALUE16_7[15],VALUE16_7[12:6]};
  		VALUEBT8<=COVAR88[13:6];//VALUEBT8+1;//{VALUE16_8[15],VALUE16_8[12:6]};
  		end
  	RMS_HIGH: begin
  		VALUEBT1<=COVAR11[11:4];//VALUEBT1+1;//{VALUE16_1[15],VALUE16_1[12:6]};
  		VALUEBT2<=COVAR22[11:4];//VALUEBT2+1;//{VALUE16_2[15],VALUE16_2[12:6]};
  		VALUEBT3<=COVAR33[11:4];//VALUEBT3+1;//{VALUE16_3[15],VALUE16_3[12:6]};
  		VALUEBT4<=COVAR44[11:4];//VALUEBT4+1;//{VALUE16_4[15],VALUE16_4[12:6]};
  		VALUEBT5<=COVAR55[11:4];//VALUEBT5+1;//{VALUE16_5[15],VALUE16_5[12:6]};
  		VALUEBT6<=COVAR66[11:4];//VALUEBT6+1;//{VALUE16_6[15],VALUE16_6[12:6]};
  		VALUEBT7<=COVAR77[11:4];//VALUEBT7+1;//{VALUE16_7[15],VALUE16_7[12:6]};
  		VALUEBT8<=COVAR88[11:4];//VALUEBT8+1;//{VALUE16_8[15],VALUE16_8[12:6]};
  		end
  	DEBUGI: begin
  		VALUEBT1<=8'd0;//TIME[22:15];//VALUEBT1+1;//{VALUE16_1[15],VALUE16_1[12:6]};
  		VALUEBT2<=8'd1;//TIME[22:15];//VALUEBT2+1;//{VALUE16_2[15],VALUE16_2[12:6]};
  		VALUEBT3<=8'd2;//TIME[22:15];//VALUEBT3+1;//{VALUE16_3[15],VALUE16_3[12:6]};
  		VALUEBT4<=8'd3;//TIME[22:15];//VALUEBT4+1;//{VALUE16_4[15],VALUE16_4[12:6]};
  		VALUEBT5<=8'd4;//TIME[22:15];//VALUEBT5+1;//{VALUE16_5[15],VALUE16_5[12:6]};
  		VALUEBT6<=8'd5;//TIME[22:15];//VALUEBT6+1;//{VALUE16_6[15],VALUE16_6[12:6]};
  		VALUEBT7<=8'd6;//TIME[22:15];//VALUEBT7+1;//{VALUE16_7[15],VALUE16_7[12:6]};
  		VALUEBT8<=8'd7;//TIME[22:15];//VALUEBT8+1;//{VALUE16_8[15],VALUE16_8[12:6]};
  		end
  	endcase

  	end

  end


assign LED = TxEn;
TFT_ROLL_8 monscreen(CLK,CLK,TFT_CLK,TFT_CS,TFT_DCX,TFT_RESX,TFT_MOSI,VALUEDISPLAY_1,VALUEDISPLAY_2,VALUEDISPLAY_3,VALUEDISPLAY_4,VALUEDISPLAY_5,VALUEDISPLAY_6,VALUEDISPLAY_7,VALUEDISPLAY_8,NEXT_X);

  INTAN_RHD2216_ALLELECTRODES maRHD2216(CLK,INTAN_CLK,INTAN_CS,INTAN_MOSI,INTAN_MISO,INTAN_RESULT,NUMELE,DATA_VALID); //
  //it takes 24 cycles at CLK to do one read
  //to loop over the 16 electrodes (TIME+1) it takes 3072 M_CLK cycles

  RMSER_8 monRMSER(CLK,TRIGGER_1,VALUE16_1,VALUE16_2,VALUE16_3,VALUE16_4,VALUE16_5,VALUE16_6,VALUE16_7,VALUE16_8,COVAR11,COVAR22,COVAR33,COVAR44,COVAR55,COVAR66,COVAR77,COVAR88,DR1);
  /*HPF monHPF1(CLK,TRIGGER_1,VALUE16_1,HPS1,DR1);
  HPF monHPF2(CLK,TRIGGER_1,VALUE16_2,HPS2,DR2);
  HPF monHPF3(CLK,TRIGGER_1,VALUE16_3,HPS3,DR3);
  HPF monHPF4(CLK,TRIGGER_1,VALUE16_4,HPS4,DR4);
  HPF monHPF5(CLK,TRIGGER_1,VALUE16_5,HPS5,DR5);
  HPF monHPF6(CLK,TRIGGER_1,VALUE16_6,HPS6,DR6);
  HPF monHPF7(CLK,TRIGGER_1,VALUE16_7,HPS7,DR7);
  HPF monHPF8(CLK,TRIGGER_1,VALUE16_8,HPS8,DR8);*/

  //COVAR_8 mesCOVAR8(CLK,TRIGGER_1,VALUE16_1,VALUE16_2,VALUE16_3,VALUE16_4,VALUE16_5,VALUE16_6,VALUE16_7,VALUE16_8,COVAR11,COVAR22,COVAR33,COVAR44,COVAR55,COVAR66,COVAR77,COVAR88,DR1);
  //MULTIPLIER multi11(CLK,DR1,HPS1,HPS1,COVAR11,DR11);
  //MULTIPLIER multi22(CLK,DR1,HPS2,HPS2,COVAR22,DR22);
//  MULTIPLIER multi12(CLK,DR1,HPS1,HPS2,COVAR12,DR12);
/*  signed_mult multi11(COVAR11, DR1, HPS1[12:5], HPS1[12:5]);
  signed_mult multi12(COVAR12, DR1, HPS1[12:5], HPS2[12:5]);
  signed_mult multi13(COVAR13, DR1, HPS1[12:5], HPS3[12:5]);
  signed_mult multi14(COVAR14, DR1, HPS1[12:5], HPS4[12:5]);
  signed_mult multi15(COVAR15, DR1, HPS1[12:5], HPS5[12:5]);
  signed_mult multi16(COVAR16, DR1, HPS1[12:5], HPS6[12:5]);
  signed_mult multi17(COVAR17, DR1, HPS1[12:5], HPS7[12:5]);
  signed_mult multi18(COVAR18, DR1, HPS1[12:5], HPS8[12:5]);

  signed_mult multi22(COVAR22, DR1, HPS2[12:5], HPS2[12:5]);
  signed_mult multi23(COVAR23, DR1, HPS2[12:5], HPS3[12:5]);
  signed_mult multi24(COVAR24, DR1, HPS2[12:5], HPS4[12:5]);
  signed_mult multi25(COVAR25, DR1, HPS2[12:5], HPS5[12:5]);
  signed_mult multi26(COVAR26, DR1, HPS2[12:5], HPS6[12:5]);
  signed_mult multi27(COVAR27, DR1, HPS2[12:5], HPS7[12:5]);
  signed_mult multi28(COVAR28, DR1, HPS2[12:5], HPS8[12:5]);*/

  //how long does it take to send one byte through wifi?
  UART_BaudRate_generator I_BAUDGEN(CLK,Rst_n,TICK,BaudRate); //basically a TICK generator at 16 times final baudrate
  ////baudrate is 54 is number of M_CLK cycle between each TICK
  //M_CLK is 100MhZ, 10 ns. 54 M_CLK is 540 ns (1.85 MHz)
  //CLK is 16Mhz, 62.5 ns. 9 CLK cycle is 562.5 ns
  //final baudrate to BT is  100Mhz/54/16=115740 Hz
  //final baudrate to BT is  16Mhz/26/16=38461 Hz

  UART_rs232_tx I_RS232TX(CLK,Rst_n,TxEn,TxData,TxDone,TX,TICK,NBits);
  UART_rs232_rx_bis I_RS232RX(CLK,Rst_n,RxEn,RxData,RxDone,RX,TICK,NBits);



  endmodule
