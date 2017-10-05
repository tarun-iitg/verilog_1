module Mul_datapath(result,eqz,data_in,ldA,ldB,ldP,clrP,decB,clk);
   input ldA,ldB,ldP,clrP,decB,clk;
   input [15:0] data_in;
   output 	eqz;
   output  reg [15:0] result;
   wire [15:0] 	 x,y,z,Bout,Bus ; //reg x,y,z,Bout are not permissible(port iss)


//always@(posedge clk)
 //if(eqz==0) 

   PIPO_r A(x,Bus,ldA,clk);
   PIPO_p P(y,z,ldP,clrP,clk);
   ADDER AD(z,x,y);
   DEC_B DB(Bout,Bus,ldB,decB,clk);
   COMP  CP(eqz,Bout);
always@(eqz ) begin
   result<=eqz ? y : 16'bx ; end
   assign Bus = data_in ;
   
endmodule // Mul_datapath

module controller(done,ldA,ldB,ldP,clrP,decB,start,data_in,eqz,clk);
   input start,eqz,clk;
   input [15:0] data_in;
   output reg ldA,ldB,ldP,clrP,decB,done;

   parameter s0=3'b000 , s1=3'b001 ,s2=3'b010 ,s3=3'b011 ,s4=3'b100 ;

   reg [2:0]state ;

   always@(posedge clk)
     case (state)
       s0 : state<= start ? s1 : s0 ;
       s1 : state<=s2;
       s2 : state<=s3;
       s3 : state<= eqz ? s4 : s3 ;
       s4 : state<=s4;
       
       default: state<=s0 ;
    endcase
 always@(state)
case (state)
  s0 :  {done,ldA,ldB,ldP,clrP,decB}=0 ;
  s1 : begin    {done,ldB,ldP,clrP,decB}=0 ; ldA=1 ;end
  s2 : begin     {done,ldA,ldP,decB}=0 ; ldB=1; clrP=1 ;end
  s3 : begin  {done,ldA,ldB,clrP}=0 ; ldP=1; decB=1; end
  s4 : begin  {ldA,ldB,ldP,clrP,decB}=0 ; done=1; end
  default :  {done,ldA,ldB,ldP,clrP,decB}=0 ;
endcase // case (state)
endmodule // controller


module PIPO_r(out,in,ld,clk);
   input  [15:0] in;
   input  ld, clk;
   output reg [15:0] out;
   always @ ( posedge clk ) begin
      if(ld==1) out<=in ;
   end
endmodule // PIPO_r



module PIPO_p(out,in,ld,clr,clk);
   input  [15:0] in;
   input  ld, clk,clr;
   output reg [15:0] out;
   always @ ( posedge clk ) begin
      case(1'b1)
	clr : out<=0 ;
	ld : out<=in ;
	endcase
	

/*if(clr==1) out<=0 ;            //why this shows as syntax error??
      
      elseif(ld==1) out<=in ; */
   end
endmodule // PIPO_p

module ADDER (out,in1,in2 ) ;
   input [15:0]in1,in2;
   output [15:0] out;
   assign out = in1+in2;
endmodule // ADDER

module DEC_B(out,in,ld,en,clk ) ;
   input  [15:0] in;
   input  ld, clk, en;
   output reg [15:0] out;
  
   
   always@(posedge clk)
     
   case (1'b1)
     ld : out<=in ;
     en : out<=out ? out-1: out;
     default :out<=out;
   endcase // case (1'b1)

   
endmodule // DEC_B

module COMP (out,in ) ;
   input [15:0]in ;
   output      out ;
   assign out= in ? 0 :1 ;
   
endmodule // COMP

     
     
     
  
     







   
 
