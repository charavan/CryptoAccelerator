module T_one( input  [31:0] h, s1, ch, k, w  ,
              output [31:0] out               );


assign out = h + s1 + ch + k + w; 

endmodule 