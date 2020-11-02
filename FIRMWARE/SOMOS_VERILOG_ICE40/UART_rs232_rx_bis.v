module UART_rs232_rx_bis (Clk,Rst_n,RxEn,RxData,RxDone,Rx,Tick,NBits);		//Define my module as UART_rs232_rx

input Clk, Rst_n, RxEn,Rx,Tick;		//Define 1 bit inputs
input [7:0] NBits;			//Define 4 bits inputs


output RxDone;				//Define 1 bit output
output [7:0]RxData;			//Define 8 bits output (this will eb the 1byte received data)


//Variabels used for state machine...
parameter  IDLE = 1'b0, READ = 1'b1; 	//We haev 2 states for the State Machine state 0 and 1 (READ adn IDLE)
reg  State, Next;			//Create some registers for the states
reg  read_enable = 1'b0;		//Variable that will enable or NOT the data in read
reg  start_bit = 1'b1;			//Variable used to notify when the start bit was detected (first falling edge of RX)
reg  RxDone = 1'b0;			//Variable used to notify when the data read process is done
reg [7:0] Bit = 8'b00000;		//Variable used for the bit by bit read loop (in this case 8 bits so 8 loops)
reg [3:0] counter = 4'b0000;		//Counter variable used to count the tick pulses up to 16
reg [7:0] Read_data= 8'b00000000;	//Register where we store the Rx input bits before assigning it to the RxData output
reg [7:0] RxData;			//We register the output as well so we store the value
reg [1:0] Rx_edge=2'b00;
reg [1:0] Tick_edge=2'b00;

wire Rx_negedge;
wire Tick_posedge;











////////////////////////////////////////////////////////////////////////////
///////////////////////////Read the input data//////////////////////////////
////////////////////////////////////////////////////////////////////////////


//always @ (posedge Clk)
//begin
//	if (State==IDLE & Rx_negedge==1 & RxDone==0) begin State <= READ; read_enable <= 1'b1; end		 //If Rx is low (Start bit detected) we start the read process
//	if (RxDone==1)	begin State <= IDLE; read_enable <= 1'b0;	end	 //If RxDone is high, than we get back to IDLE and wait for Rx input to go low (start bit detect)
//end


//determine  falling edge of Rx
always @ (negedge Clk or negedge Rst_n)
begin

	if(!Rst_n)
	begin
	Rx_edge <= 2'b00;
	Tick_edge <= 2'b00;
	end	
	else
	begin
	Rx_edge <={Rx_edge[0], Rx};
	Tick_edge <={Tick_edge[0],Tick};
	end
		
end

assign Rx_negedge = Rx_edge[1] & !Rx_edge[0]; //negedge Rx_edge,  when Rx get low
assign Tick_posedge = !Tick_edge[1] & Tick_edge[0]; //negedge Rx_edge,  when Rx get low


/*always @ (posedge Clk)
begin
if ((Rx_negedge==1) & (start_bit==1)) begin
counter<=4'b0000;
//Read_data<=Read_data+1;
//RxData<=Read_data;
//RxDone<=1'b1;
end
else RxDone<=1'b0;
end*/

always @ (negedge Clk)
begin
if ((Rx_negedge==1) & (start_bit==1)) read_enable<=1'b1;
if (RxDone==1'b1) read_enable<=1'b0;
end


always @ (posedge Clk)
begin

if ((Tick_posedge==1) & (read_enable==1)) begin
	counter<=counter+1;
	if (counter==4'b1000 & (start_bit==1)) begin
		counter<=4'b0000;
		start_bit<=1'b0;
	end

	if (counter==4'b1111 & (start_bit==0) & (Bit<NBits)) begin //sometimes counter get updated before test so its better to check if above rather than equal threshold
		counter<=4'b0000;
		Read_data<={Rx,Read_data[7:1]};//Read_data+1;//{Rx,Read_data[7:1]};
		Bit<=Bit+1;
	end

	if (counter==4'b1111 & (start_bit==0) & (Bit==NBits)) begin //normally if counter reaches 1111 its not a start bit already
		counter<=4'b0000;
		RxDone<=1'b1;
		start_bit<=1'b1;
		Bit<=8'b0;
	end
end
else RxDone<=1'b0;



end

always @ (negedge Clk)
begin

if (NBits == 8'b00001000)
begin
RxData[7:0] <= Read_data[7:0];	
end

if (NBits == 8'b00000111)
begin
RxData[7:0] <= {1'b0,Read_data[7:1]};	
end

if (NBits == 8'b00000110)
begin
RxData[7:0] <= {1'b0,1'b0,Read_data[7:2]};	
end
end



//End of the RX mdoule
endmodule

