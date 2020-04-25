`timescale 1ns/1ns

module UART_Tx( input 	    Clock, Reset, Tx_en,Tick,
                input [7:0]               Message_in, 
				input [3:0]                   N_bits,
				output               Tx_out, Tx_done  );


parameter IDLE = 1'b0 , SEND = 1'b1;    // FSM States

reg [3:0]      counter = 4'b0;
reg            done    = 1'b0; 
reg            c_state, n_state, write_en, t_out;


/////////////////////////////////////

reg            start_bit      = 1'b1;
reg            stop_bit       = 1'b0;

/////////////////////////////////////

reg [7:0]      msg_in_reg     = 8'b0;

reg [3:0]      bit_counter    = 4'b0;
reg [1:0]      d_shift_reg;
wire           Dbnce;



assign Tx_done = done;
assign Tx_out = t_out;



///////State Machine////////
///////////Reset////////////

always @(posedge Clock or posedge Reset) begin 

	if(Reset) begin 

		c_state     <= IDLE;
		d_shift_reg <= 2'b00;
	end

	else  begin
		
	        c_state     <= n_state;
		d_shift_reg <= { d_shift_reg[0], Tx_en };
	end

end 



////////Tx Input enable and Debounce avoidance//////////
////////////////////////////////////////////////////////

assign Dbnce = !d_shift_reg[1] & d_shift_reg[0];  /// Pernaei mono tin prwti timi pou tha dextei

////  Write Enable statement ////
/////////////////////////////////

always @(c_state) begin

	case(c_state)
		
		SEND: write_en <= 1'b1;

		IDLE: write_en <= 1'b0;

	endcase
end

/////////// Next step Decision /////////////
////////////////////////////////////////////

always @ (c_state or Dbnce or Message_in or Tx_done) begin 

	case(c_state) 
	
		IDLE : begin
	
			if(Dbnce)  n_state <= SEND;
			else       n_state <= IDLE;

		end

		SEND : begin 

			if(Tx_done) n_state <= IDLE;
			else        n_state <= SEND;

		end

		default             n_state <= IDLE;

	endcase

end 


/////Procedure of sending data out via Tx pin///////
////////////////////////////////////////////////////

always @ (posedge Tick)  begin

	if(!write_en) begin   // Leitoyrgei ws synchronized reset

		done      <= 1'b0;
		start_bit <= 1'b1;
		stop_bit  <= 1'b0;

	end

	else begin  // enable on 

		counter <= counter + 1;
		
		if(start_bit && !stop_bit) begin  // We set the Tx_out  low 
		
			t_out      <= 1'b0;
			msg_in_reg <= Message_in;
		
		end

		if( (counter == {4{1'b1}} ) && (start_bit)  ) begin //After a period we send 1 bit

			start_bit  <=  1'b0;
			msg_in_reg <=  { 1'b0, msg_in_reg[7:1] };
			t_out      <=  msg_in_reg[0]; 

		end 

		if( (counter == {4{1'b1}} ) && (!start_bit) && (bit_counter < N_bits - 1) ) begin 

			msg_in_reg  <=  { 1'b0, msg_in_reg[7:1] };
			bit_counter <=  bit_counter + 1;
			t_out       <=  msg_in_reg[0];
			start_bit   <=  1'b0;
			counter <=  4'b0;

		end

		
		if( (counter == {4{1'b1}} ) && (bit_counter == N_bits-1) && (!stop_bit) ) begin // We send the stop bit , N_bits is the wordlength

			t_out   <= 1'b1;
			counter <= 4'b0;
			stop_bit <=1'b1;

		end

		
		if( (counter == {4{1'b1}} ) && (bit_counter == N_bits-1) && (stop_bit) ) begin // Reset values to await next send process

			bit_counter <= 4'b0;
			done        <= 1'b1;
			counter     <= 4'b0;

		end 
		
	end

end 

endmodule 