module Ch( input [31:0] e, f , g , 
	   output[31:0]            out);

// (e or f) xor ( not(e) or g) 
//Maybe there is an equivalent logic function that is more efficient

assign out = (e&f) ^ (~e&g);



endmodule 