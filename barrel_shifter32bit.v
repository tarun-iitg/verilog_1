module barrel_shifter32bit(out,sel,in);
   input [31:0]in ;
   input [4:0] sel ;
   output [31:0] out ;

   //right shifter
   wire [31:0] 	 w[3:0] ;
   

   
   genvar 	 i,j,k,k_k,l,l_l,m,m_m ;

   
   //stage 1
   generate
      for (i=0; i<31; i=i+1) begin
	 mux2x1 m0(w[0][i],sel[0],in[i],in[i+1]);
      end
    endgenerate
 
mux2x1 mf_0(w[0][31],sel[0],in[31],1'b0);


   //stage 2
   generate
      for (j=0; j<30; j=j+1) begin
	 mux2x1 m1(w[1][j],sel[1],w[0][j],w[0][j+1]);
    end
   endgenerate
   

mux2x1 mf_1_0(w[1][30],sel[1],w[0][30],1'b0);
   
mux2x1 mf_1_1(w[1][31],sel[1],w[0][31],1'b0);
   
   //stage 3

generate
      for (k=0; k<28; k=k+1) begin
	 mux2x1 m2(w[2][k],sel[2],w[1][k],w[1][k+1]);
    end
   endgenerate

   generate
      for (k_k=28; k_k<32; k_k=k_k+1) begin

   
mux2x1 mf_2(w[1][k_k],sel[2],w[1][k_k],1'b0);
     
 end
      
   endgenerate
   
      


//stage 4



generate
      for (l=0; l<24; l=l+1) begin
	 mux2x1 m3(w[3][l],sel[3],w[2][l],w[2][l+1]);
    end
   endgenerate

   generate
      for (l_l=24; l_l<32; l_l=l_l+1) begin
   
mux2x1 mf_3(w[3][l_l],sel[3],w[2][l_l],1'b0);
     
      end
      
   endgenerate

   //stage 5 final


generate
      for (m=0; m<16; m=m+1) begin
	 mux2x1 m4(out[m],sel[4],w[3][m],w[3][m+1]);
    end
   endgenerate

   generate
      for (m_m=16; m_m<32; m_m=m_m+1) begin
   
mux2x1 mf_4(out[m_m],sel[4],w[3][m_m],1'b0);
     
      end
      
   endgenerate

   

  

endmodule // barrel_shifter32bit


   module mux2x1 (out,sel,in0,in1) ;
   input   in0, in1, sel;
   output out;
   assign out = sel ? in1 : in0 ;

endmodule // mux2x1

