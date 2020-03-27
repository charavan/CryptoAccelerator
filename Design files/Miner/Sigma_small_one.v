module Sigma_small_one( input  [31:0]    x ,
	                output [31:0]  out);


// Small sigma_1 calculates Rotr(x,17) xor Rotr(x,19) xor Shr(10)

assign out = { x[16:0] , x[31:17] } ^ {x[18:0] , x[31:19] } ^ ( x >> 10 );



endmodule 