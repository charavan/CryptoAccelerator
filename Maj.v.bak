module Maj( input  [31:0] a , b , c ,
            output [31:0]            out1,out2);


// The logic below equals to the function (a or b) xor (a or c) xor (b or c) 

assign out = (a & b) | (c & (a | b) );

endmodule 