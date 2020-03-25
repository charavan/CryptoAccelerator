module Sigma_zero( input   [31:0]   a ,
                   output  [31:0] out  );


// Rotation right by 2 , 13 and 22 

assign out = { a[1:0] , a[31:2] } ^ { a[12:0] , a[31:13]} ^ { a[21:0] , a[31:22] } ;



endmodule  