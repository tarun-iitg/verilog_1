   
module flo_64multiplier (result,a,b ) ;

   output reg  [63:0] result;
   input  [63:0] a, b;

   reg 		 a_S,b_S;
   
   reg [10:0] 	 a_E,b_E;
   reg [51:0] 	 a_F,b_F;
   always@(a,b)
     begin
	a_S=a[63];
	b_S=b[63];
	a_E=a[62:52];
	b_E=b[62:52];
	a_F=a[51:0];
	b_F=b[51:0];
     end

   always@(a,b)
     begin
	result[63]=a_S^b_S;
	result[62:52]=a_E+b_E-1023 ;
     end

   
   reg [105:0] ex_mul ;
   reg 	      error ;
   

   
   always@(a,b)
     begin
     ex_mul={1'b1,a_F}*{1'b1,b_F};
	error=ex_mul[23] ? 1'b1 : 1'b0 ;
	result[51:0]=ex_mul[103:52];
     end
   
   
   
   
endmodule // flo_64multiplier
