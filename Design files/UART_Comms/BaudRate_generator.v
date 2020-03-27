/* In binary rates Baud rate is the same as Bit rate. There are plenty of Baud rates we can choose.
Not all of them work in the windows comms. Our FPGA for this project is a Nexys-4 Artix-7 with a clock frequency of 100MHz. The baud rate we want to work is 14400. 
If we want the Ticks to have 16 times the frequency of the UART signal we need a frequenct 16 times the 14400Hz.

The UART signal width is 1/14400 with is equal to 69,4 us. The period of the clock is 1/100MhHz equal to 10ns.
To get 16 ticks we need to count (69400ns/16)/10ns = 434,02 pulses. The error % is small enough to be neglected.
Our top file's Baud Rate is set to 434.
*/

module BaudRate_generator( input clock, reset    ,
                           input [15:0] Baudrate ,    //Our Baudrate's preset value from top
			   output       Tick	 );

reg [15:0] Baudrate_count;


assign Tick = (Baudrate_count == Baudrate);


always @(posedge  clock or posedge reset) begin

	if(reset) Baudrate_count<= 16'b1;

	else if (Tick) Baudrate_count<= 16'b1;

	else Baudrate_count <= Baudrate_count + 1'b1;

end 

endmodule 