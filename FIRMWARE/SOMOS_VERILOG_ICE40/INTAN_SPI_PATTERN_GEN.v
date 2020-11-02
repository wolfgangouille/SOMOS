`timescale 1ns / 1ps

module INTAN_SPI_PATTERN_GEN(clk,reset,interface_on,command,result,intan_clk,cs,miso,mosi);
input clk;
output reset; // spike after each command. data is ready to be read and command to be sent
input interface_on; // input to activate the interface
input [15:0] command;
output [15:0] result;
output cs;  
output intan_clk;
input miso;
output mosi;

reg [15:0] result;
reg [4:0] bitcounter;
reg [4:0] counter;

reg [15:0] data_sent;

reg reset;
reg cs;
reg clken;

initial begin
	reset<=0;
	cs<=1;
	clken<=0;
	result <= 16'b0;
	bitcounter <= 5'b00000;
	counter <= 5'b00000;
	data_sent <=16'b0;
end


always @(posedge clk) 
begin
	if (cs == 1) begin 
		bitcounter <= 5'b00000;
		end
	else if (cs ==0) begin
		if (clken==1 && bitcounter<5'b10000) begin
			bitcounter<=bitcounter+1;
			result<={result[14:0],miso};
		end
	end
end

always @(negedge clk) 
begin
	if (cs == 1) begin 
		data_sent<=command;
	end
	else if (cs==0) begin
		if (clken == 1 && bitcounter<5'b10000) begin
			data_sent<={data_sent[14:0],1'b0}; // update the next bit to send
		end
	end
end


always @ (posedge clk) begin 
if (counter<5'b11000) counter<=counter+1; // at time 24, put reset high again
else if	(counter==5'b11000) counter <= 5'b00000;
end

always @ (negedge clk) begin //counter updated at posedge
	
	if (counter==5'b00000) begin
		reset<=0;  //was previously at 1, needs to go back to 0 for next posedge
	end
	else if (counter==5'b00001 && interface_on==1) begin //at time 1, put cs low
		cs<=0;
	end
	else if (counter==5'b00010 && interface_on==1) begin // at time 2, put clken high, for 17 cycles
		clken<=1;  // possible to do this step with the previous one ???
	end
	else if (counter==5'b10010 && interface_on==1) begin // at time 19, put clken low again
		clken<=0;
	end
	else if (counter==5'b10101 && interface_on==1) begin // at time 20, put cs high again, must last 4 clock cycles, 3 +  next cycle
		cs<=1;
	end
	else if (counter==5'b11000) begin // at time 24, put reset high again
		reset<=1;
	end

end


assign mosi = data_sent[15];

assign intan_clk = clk && clken;



endmodule
