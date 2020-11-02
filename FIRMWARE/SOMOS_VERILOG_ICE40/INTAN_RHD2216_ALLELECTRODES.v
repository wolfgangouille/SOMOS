`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:50:33 02/03/2020 
// Design Name: 
// Module Name:    INTAN_RHD2216_ALLELECTRODES 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module INTAN_RHD2216_ALLELECTRODES(FPGA_CLK,INTAN_CLK,CS,MOSI,MISO,RESULT,ELECTRODE,DATA_VALID);

input FPGA_CLK;
output INTAN_CLK;
output CS;
output MOSI;
input MISO;
output [15:0] RESULT;
output [7:0] ELECTRODE;
output DATA_VALID;

reg [15:0] COM; // la commande a envoyer
wire [15:0] RESULT; //result from miso
reg [7:0] ELECTRODE;
reg [15:0] COM_COUNT; //  command counter

reg  INTAN_ON;

initial begin
	COM_COUNT<=16'b0000000000000000; //numero de la commande
   COM<=16'b1000000011111110; //first command 
	INTAN_ON<=1;
	ELECTRODE<=8'd14;
end


always @(negedge DATA_VALID) begin  //define the command at each step
	if       (COM_COUNT==16'd0)   COM<=16'b1000000011111110; //write reg 0 with fast settle on. turn off fast settle at the end
	else 	if (COM_COUNT==16'd1) 	COM<=16'b1000000100000011; //write reg 1 with VDD sense disabled and ADC buffer bias of 32 for SR<120kS/s. Use  2 for >700kS/s. 4 for 390. 3 for 500 OK
	else 	if (COM_COUNT==16'd2) 	COM<=16'b1000001000000111; //write reg 2 with MUX bias of 40 for SR<120kS/s. Use 4 for >700kS/s. 18 for 390. 7 for 500
	else 	if (COM_COUNT==16'd3) 	COM<=16'b1000001100000010; //write reg 3 with MUX load 0 (default), no TEMP sensing, digout HiZ (not used)
	else 	if (COM_COUNT==16'd4) 	COM<=16'b1000010000011001; //CHANGED 3 to 9 highpassfilter ~10 Hzhz write reg 4 with HiZ INTAN1_MISO , no two-comp, no abs, DSPen on, DSP cuoff freq = 9 => 0.0003112*31254 Hz = 9.72 Hz (if 0, perfect differentiator)
	else 	if (COM_COUNT==16'd5) 	COM<=16'b1000010100000000; //write reg 5 with default parameters (impedance check control not used)
	else 	if (COM_COUNT==16'd6) 	COM<=16'b1000011000000000; //write reg 6 with default parameters (impedance check DAC not used)
	else 	if (COM_COUNT==16'd7) 	COM<=16'b1000011100000000; //write reg 7 with elctrode 0 parameters (no impedance check)
	else 	if (COM_COUNT==16'd8) 	COM<=16'b1000100000101110; //write reg 8 set high cutoff to 1 kHz using internal resistors fH 46
	else 	if (COM_COUNT==16'd9) 	COM<=16'b1000100100000010; //write reg 9  //inactivate auxin1, fH 2
	else 	if (COM_COUNT==16'd10) 	COM<=16'b1000101000011110; //write reg 10 fH  30
	else 	if (COM_COUNT==16'd11) 	COM<=16'b1000101100000011; //write reg 11 inactivate auxin2 fH 3
	else 	if (COM_COUNT==16'd12) 	COM<=16'b1000110000001000; //write reg 12 set low cutoff to 2 Hz using internal resistors fL 8
	else 	if (COM_COUNT==16'd13) 	COM<=16'b1000110100000011; //write reg 13  inactivate auxin3 fL 3 and 0
	else 	if (COM_COUNT==16'd14) 	COM<=16'b1000111011111111; //write reg 14 to inactivate electrode 0 to 7
	else 	if (COM_COUNT==16'd15) 	COM<=16'b1000111111111111; //write reg 15 to activate electrode 8 to 15
	else 	if (COM_COUNT==16'd16) 	COM<=16'b1001000000000000; //write reg 16 to activate electrode 16 to 23
	else 	if (COM_COUNT==16'd17) 	COM<=16'b1001000100000000; //write reg 17 to inactivate electrode 24 to 31
	else 	if (COM_COUNT==16'd18) 	INTAN_ON<=0; 
   // time 17
   // must wait 100 us
	else  if (COM_COUNT==16'd146) 	begin INTAN_ON<=1;COM<=16'b1000000011011110;end //write reg 0 with fast settle off.
  	else  if (COM_COUNT==16'd147) 	begin INTAN_ON<=0;end //write reg 0 with fast settle off.
   // must wait 100 us but now is only 32 *40 ns = 1.2 uS per cycle, wait 128 cycles =10000000
	else  if (COM_COUNT==16'd275) 	begin INTAN_ON<=1; COM<=16'b1000000011011110;end //Calibrate command.
	else  if (COM_COUNT==16'd276) 	COM<=16'b0000000000000000; //Dummy command 1 for calibration (CONVERT 0).
	else  if (COM_COUNT==16'd277) 	COM<=16'b0000000000000000; //Dummy command 2 for calibration (CONVERT 0).
	else  if (COM_COUNT==16'd278) 	COM<=16'b0000000000000000; //Dummy command 3 for calibration (CONVERT 0).
	else  if (COM_COUNT==16'd279) 	COM<=16'b0000000000000000; //Dummy command 4 for calibration (CONVERT 0).
	else  if (COM_COUNT==16'd280) 	COM<=16'b0000000000000000; //Dummy command 5 for calibration (CONVERT 0).
	else  if (COM_COUNT==16'd281) 	COM<=16'b0000000000000000; //Dummy command 6 for calibration (CONVERT 0).
	else  if (COM_COUNT==16'd282) 	COM<=16'b0000000000000000; //Dummy command 7 for calibration (CONVERT 0).
	else  if (COM_COUNT==16'd283) 	COM<=16'b0000000000000000; //Dummy command 8 for calibration (CONVERT 0).	
	else  if (COM_COUNT==16'd284) 	COM<=16'b0000000000000000; //Dummy command 9 for calibration (CONVERT 0).
 	
	else  if (COM_COUNT==16'd285) 	 COM<=16'b0000000000000000;  //CONVERT 0. 
	else  if (COM_COUNT==16'd286) 	 COM<=16'b0000000100000000;  //CONVERT 1. 
	else  if (COM_COUNT==16'd287) 	 COM<=16'b0000001000000000;  //CONVERT 2. 
	else  if (COM_COUNT==16'd288) 	 COM<=16'b0000001100000000;  //CONVERT 3. 
	else  if (COM_COUNT==16'd289) 	 COM<=16'b0000010000000000;  //CONVERT 4. 
	else  if (COM_COUNT==16'd290) 	 COM<=16'b0000010100000000;  //CONVERT 5. 
	else  if (COM_COUNT==16'd291) 	 COM<=16'b0000011000000000;  //CONVERT 6. 
	else  if (COM_COUNT==16'd292) 	 COM<=16'b0000011100000000;  //CONVERT 7. 
	
	else  if (COM_COUNT==16'd293) 	 COM<=16'b0000100000000000;  //CONVERT 8. 
	else  if (COM_COUNT==16'd294) 	 COM<=16'b0000100100000000;  //CONVERT 9. 
	else  if (COM_COUNT==16'd295) 	 COM<=16'b0000101000000000;  //CONVERT 10. 
	else  if (COM_COUNT==16'd296) 	 COM<=16'b0000101100000000;  //CONVERT 11. 
	else  if (COM_COUNT==16'd297) 	 COM<=16'b0000110000000000;  //CONVERT 12. 
	else  if (COM_COUNT==16'd298) 	 COM<=16'b0000110100000000;  //CONVERT 13. 
	else  if (COM_COUNT==16'd299) 	 COM<=16'b0000111000000000;  //CONVERT 14. 
	else  if (COM_COUNT==16'd300) 	 COM<=16'b0000111100000000;  //CONVERT 15. 
	
	
	//else  if (COM_COUNT==16'b0000000100110010) 	COM<=16'b0000000000000000; //CONVERT 02. 38
end

always @(posedge DATA_VALID) begin
		COM_COUNT<=COM_COUNT+1;
	if (COM_COUNT>=16'd285 && COM_COUNT<16'd300) begin //
		if (ELECTRODE==8'd15) ELECTRODE<=8'd0; 
		else ELECTRODE<=ELECTRODE+1;  
		end
	else if (COM_COUNT==16'd300) 	begin  COM_COUNT<=16'd285; ELECTRODE<=8'd14;  end   

end


INTAN_SPI_PATTERN_GEN monmodule(FPGA_CLK,DATA_VALID,INTAN_ON,COM,RESULT,INTAN_CLK,CS,MISO,MOSI);

endmodule

