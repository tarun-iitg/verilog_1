// 32.15 

module multiplier_fp_32bit (result,in_a ,in_b ) ;
parameter N=32 ;
   parameter Q=15 ;
   

inout [N-1:0]in_a ,in_b ;
   output reg [N-1:0] result;
   
   
   
   reg [2*N-1:0]      mult_a,mult_b ;
   reg [2*N-1:0]      mult ;
wire [2*N-1:0]mult_com;
   
   wire [2*N-1:0]      a_com,b_com;
      

   
   complement_2s c1(a_com,in_a[N-2:0]);
   complement_2s c2(b_com,in_b[N-2:0]);
   complement_2s c3(mult_com,mult[N-2+Q:Q]);
	 
always@(in_a,in_b)
  begin
     mult_a=in_a[N-1] ? a_com : in_a ;
     mult_b=in_b[N-1] ? b_com : in_b ;
  end
   
always@(mult_a,mult_b)
  mult=mult_a*mult_b;



   //sign
   always@(in_a,in_b)
begin   
  result[N-1]=in_a[N-1]^in_b[N-1] ;
  result[N-2:0]=result[N-1] ? mult_com[N-2:0] : mult[N-2+Q:Q];
   end
  //


      
endmodule // multiplier_fp_32bit




//////////////////////////2scomplement module //////

module complement_2s(out_2n,in_n_minus1);
   
  //parameter N=32 ;
   
   input [30:0]in_n_minus1;
   output  	[(2*32)-1:0]out_2n;
 
   reg [2*32-1:0] 	    data;
   always@(in_n_minus1)         data=in_n_minus1;
reg [2*32-1:0]flip;

   always@(data)
   begin
      flip=~data;
   end
   
   assign   out_2n=flip+1 ;
   
endmodule // complement_2s
