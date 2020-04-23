`timescale 1ns/1ns

module Transmitter_Top( input clock, reset, Button,
						input      [7:0] Message_in,
						output               Tx_out ) ; // For constraints we need clock , reset ,  message_in[7:0]




wire [8:0] Baudrate;
wire[3:0] N_bits;
wire Tick_out, Tx_done;

assign Baudrate     = 9'd54;
assign N_bits       = 4'b1000;



////Instantiation of Baudrate module ( in ,in , [8:0] in , out) /////////
////////////////////////////////////////////////////////////////////////

BaudRate_generator BG1(clock, reset, Baudrate, Tick_out);

///Instantiation of UART transmition module (in, in, in, in, in, in, out, out)///
//////////////////////////////////////////////////////////////////////////// 

UART_Tx Tx1( clock, reset, Button, Tick_out, Message_in, N_bits, Tx_out, Tx_done );


endmodule 