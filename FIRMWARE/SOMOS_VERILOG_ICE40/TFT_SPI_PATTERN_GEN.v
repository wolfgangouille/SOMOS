`timescale 1ns / 1ps

module TFT_SPI_PATTERN_GEN(clk,reset,interface_on,keeplow,command,tft_clk,cs,mosi);

input clk;
output reset; // spike after each command. data is ready to be read and command to be sent
input keeplow;//to continue several command
input interface_on; // input to activate the interface
input [7:0] command;
output cs;  
output tft_clk;
output mosi;

reg [4:0] counter;

reg [7:0] data_sent;

reg reset;
reg cs;
reg clken;


initial begin
	data_sent <=8'b0;
	reset<=0;
	cs<=1;
	clken<=0;
	counter <= 5'b00000;

end



always @ (posedge clk) begin 
if (counter<5'b01011) counter<=counter+1; // at time 24, put reset high again
else if	(counter==5'b01011) counter <= 5'b00000;
end


always @ (negedge clk) begin //counter updated at posedge
	if (counter==5'b00000) begin
		reset<=0;  //was previously at 1, needs to go back to 0 for next posedge
	end
	else if (counter==5'b00001 && interface_on==1) begin //at time 1, put cs low
		cs<=0;
	end
	else if (counter==5'b00010 && interface_on==1) begin //at time 1, put cs low
		clken<=1;
	end
	else if (counter==5'b01010 && interface_on==1) begin // at time 9, put clken low again
		clken<=0;
	end
	else if (counter==5'b01011) begin // at time 10, put cs and reset high again
		reset<=1;
		if (keeplow==0 && interface_on==1) cs<=1; // on pulse cs si keeplow est 0 et linterface active
	end
end

always @(negedge clk) 
begin
	 if (cs==0) begin
		if (clken == 1) begin
			data_sent<={data_sent[6:0],1'b0}; // update the next bit to send
		end
		else if (clken == 0) begin
			data_sent<=command; // update the next bit to send
		end	
		end
end


assign mosi = data_sent[7];
assign tft_clk = clk && clken;


endmodule
