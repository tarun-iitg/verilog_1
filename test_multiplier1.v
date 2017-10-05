module test_multiplier1 ;
   wire [15:0]result ;
   wire       done ;
   reg 	      start;
   reg [15:0] data_in ;
   reg 	      clk ;
   
   wire       eqz,ldA,ldB,ldP,clrP,decB ;
   
   Mul_datapath d(result,eqz,data_in,ldA,ldB,ldP,clrP,decB,clk);
   controller c(done,ldA,ldB,ldP,clrP,decB,start,data_in,eqz,clk);

initial   $monitor("clk=%b\t ,start=%b\t, data_in=%d\t ,done=%b\t, result=%d\t ",clk,start,data_in,done,result);
   
   
   initial
     begin clk=0 ;
	start=0;
	data_in=0 ;
	#3 start=1 ;
	#22 data_in=30 ;
	#40 data_in = 5 ;
	#500 $finish ;
     end
   
   initial
     begin
	$dumpfile("wt_multiplier1.vcd");
	$dumpvars(0,test_multiplier1.d,test_multiplier1.c);	
     end

   always
   #10  clk=~clk ;
   
	
   
endmodule // test_multiplier1
