module kogge_32_stone (sum,c_out,a,b,c_in) ;
   output [31:0] sum;
   input  [31:0] c_in;
   input 	 c_in;
   output 	 c_out;





always@(a,b,c_in)
  begin
   p[0][0]=1'b;
   p[0][31:1]=a[30:0]^b[30:0];
   g[0][31:1]=a[30:0]&b[30:0],

     integer r;
     
     for(r=0;r<31;r=r+1)
       begin
     p[1][r]=p[0][r+1]&p[0][r];
	  g[1][r]=(p[0][r+1]&g[0][r])|g[0][r+1];
       end
    

     integer s; 
     for(s=1;s<30;s=s+1)
       begin
	  p[2][s]=p[1][s+1]&p[1][s-1];
	  g[2][s]=(p[1][s+1]&g[1][s-1])|g[1][s+1],
	  
	  end
     p[2][0]=p[1][1]&p[0][0];
     
  g[2][0]=(p[1][1]&g[0][0])|g[1][1];
     

integer t; 
     for(t=2;t<28;t=t+1)
       begin
	  p[3][t]=p[2][s+2]&p[2][s-2];
	  g[3][t]=(p[2][s+2]&g[2][s-2])|g[2][s+2],
	  
	  end
     
     p[3][0]=p[2][2]&p[0][0];
     
     g[3][0]=(p[2][2]&g[0][0])|g[2][2];
     
     p[3][1]=p[2][3]&p[1][0];
     
     g[3][1]=(p[2][3]&g[1][0])|g[2][3];
     
integer u; 
     for(u=4;u<24;t=t+1)
       begin
	  p[4][t]=p[3][s+4]&p[3][s-4];
	  g[4][t]=(p[3][s+4]&g[3][s-4])|g[3][s+4];
	  
	  
	  end

     p[4][0]=p[3][4]&g[0][0];
   g[4][0]=(p[3][4]&g[0][0])|g[3][4];
     
     p[4][1]=p[3][5]&g[1][0];
     
     g[4][1]=(p[3][5]&g[1][0])|g[3][5];
     p[4][2]=p[3][6]&g[2][0];
     g[4][2]=(p[3][6]&g[2][0])|g[3][6];
   p[4][3]=p[3][7]&g[2][1];
     
   g[4][3]=(p[3][7]&g[2][1])|g[3][7];
     

     
integer v; 
     for(v=8;v<16;v=t+1)
       begin
	  p[5][v]=p[4][v+8]&p[4][v-8];
	  g[5][v]=(p[4][v+8]&g[4][v-8])|g[4][v+8];
	  
	  
       end


     integer w; 
     for(w=0;w<8;w=w+1)
       begin
	  p[5][w]=p[4][s+8]&p[4][s-8];
	  g[5][w]=(p[4][s+8]&g[4][s-8])|g[4][s+8];
	  
	  
	  end



     


end






















   

   integer	 i ;
   always@(a,b,c_in)
     
      for(i=0;i<32;i=i+1)
      begin
	sum[i]=p[0][i+1]^c[i] ;
       end


                 
 always@(a,b,c_in)
begin

   c[0]=g[0][0];
   
   c[1]=g[1][0];
   
   c[2]=g[2][0];
   
   c[3]=g[2][1];
   c[4]=g[3][0];
   c[5]=g[3][1];
   c[6]=g[3][2];
   c[7]=g[3][3];
   



  for(j=0;j<8;j=j+1)
      begin
	 c[8+j]=g[4][j];
	 
       end

for(k=0;k<16;k=k+1)
      begin
	 c[16+k]=g[5][j];
	 
       end


   c_out=(p[0][31]&c[31])|(a[31]&b[31]);

   end
    


   
   integer j;
 always@(a,b,c_in)
     
    
	  for(i=0;i<32;i=i+1)
      begin
	sum[i]=p[0][i+1]^c[i] ;
       end

	
     

   
   
endmodule // kogge_32_stone


module a_and_b(out,a,b);

   output out;
   input  a,b;
   assign out=a&b;
endmodule // a_and_b

module a_and_b_or_c(out,a,b,c);
   output out;
   input  a,b,c ;

   assign out=(a&b)|c;
endmodule // a_and_b_or_c

   
	
