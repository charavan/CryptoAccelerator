module Ch( input [31:0] e, f , g , 
	   output[31:0]            out);


assign out = (e&f) ^ (~e&g);



endmodule 