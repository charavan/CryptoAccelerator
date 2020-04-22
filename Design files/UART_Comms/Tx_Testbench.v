`timescale 1ns/1ns

module Tx_Testbench; // For constraints we need clock , reset ,  message_in[7:0]




reg clock , reset;
reg Tx_en;
reg [7:0] Message_in;

wire [8:0] Baudrate;
wire[3:0] N_bits;
wire Tick_out, Tx_done, Tx_out;



assign Baudrate     = 9'd54;
assign N_bits       = 4'b1000;



initial begin 

clock        <= 1'b0;
reset        <= 1'b1;


#30 reset <= 1'b0;

Message_in   <= 8'h75; /////ASCII for letter "u"

#90000

Message_in   <= 8'h52; /////ASCII for letter "R"

end 

always #5 clock <= clock +  1;

always @(Message_in) begin 

		Tx_en <= 1'b1;

		#10
	
		Tx_en <= 1'b0;
   	

end 

////Instantiation of Baudrate module ( in ,in , [8:0] in , out) /////////
////////////////////////////////////////////////////////////////////////

BaudRate_generator BG1(clock, reset, Baudrate, Tick_out);

///Instantiation of UART transmition module (in, in, in, in, in, in, out, out)///
//////////////////////////////////////////////////////////////////////////// 

UART_Tx Tx1( clock, reset, Tx_en, Tick_out, Message_in, N_bits, Tx_out, Tx_done );






endmodule 