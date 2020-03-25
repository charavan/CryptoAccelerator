module Sigma_small_zero( input   [31:0]   x ,
                         output  [31:0] out);

// Small sigma0 calculates Rotr(x,7) xor Rotr(x,18) xor Shr(x,3) 


assign out = { x[6:0] , x[31:7] } ^ { x[17:0] , x[31:18] } ^ ( x >> 3 ) ;


endmodule  