module Sigma_one ( input   [31:0] e  ,
            output  [31:0] out );


// Rotation right by 6 , 11 and 25 

assign out = { e[5:0] , e[31:6] } ^ { e[10:0] , e[31:11] } ^ { e[24:0] , e[31:25] } ;

endmodule 