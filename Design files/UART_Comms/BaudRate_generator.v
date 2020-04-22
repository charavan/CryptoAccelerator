/* In binary rates Baud rate is the same as Bit rate. There are plenty of Baud rates we can choose.
Not all of them work in the windows comms. Our FPGA for this project is a Nexys-4 Artix-7 with a clock frequency of 100MHz. 
The baud rate we want to work is 115200. 
If we want the Ticks to be 16 times the frequency of the UART signal we need a frequenct 16 times the 115200Hz.

The UART signal width is 1/115200 which is equal to 8,68 us. The period of the clock is 1/100MhHz equal to 10ns.
To get a tick we need to count (8680ns/16)/10ns = 54,25 pulses. The error % is small enough to be neglected.

----> Our top file's Baud Rate is set to 54. <---------
*/

`timescale 1ns/1ns

module BaudRate_generator( input clock, reset    ,
                           input [8:0] Baudrate ,    //Our Baudrate's preset value from top
			   output       Tick	 );

reg [8:0] Baudrate_count;


assign Tick = (Baudrate_count == Baudrate);


always @(posedge  clock or posedge reset) begin

	if(reset) Baudrate_count <= 9'b1;

	else if (Tick) Baudrate_count <= 9'b1;

	else Baudrate_count <= Baudrate_count + 1'b1;

end 

endmodule 