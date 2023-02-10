module fulladder(sum,cout,a,b,c);
input a,b,c;
output sum,cout;
reg sum,cout;

always@(a or b or c)
if(c==0)
   if(a==0 && b ==0)
   begin 
   sum=0;
   cout=0; 
      end
   else if(a==0 && b ==1)
   begin 
   sum=1;
   cout=0; 
      end
   else if(a==1 && b ==0)
   begin 
   sum=1;
   cout=0; 
      end
   else
   begin 
   sum=0;
   cout=1; 
      end
else	
if(a==0 && b ==0)
   begin 
   sum=1;
   cout=0; 
      end
   else if(a==0 && b ==1)
   begin 
   sum=0;
   cout=1; 
      end
   else if(a==1 && b ==0)
   begin 
   sum=0;
   cout=1; 
      end
   else
   begin 
   sum=1;
   cout=1; 
      end
endmodule

/* module testbench;
reg a,b,c;
wire sum,cout;
fulladder abc(sum,cout,a,b,c);
initial
      	  
	   begin
$monitor(,$time,"a=%b,b=%b,c=%b,sum=%b,cout=%b",a,b,c,sum,cout);
#0 a = 1'b0;b = 1'b0; c=1'b0; 
#2 a = 1'b0;b = 1'b0; c=1'b1; 
#5 a = 1'b0;b = 1'b1; c=1'b0; 
#10 a = 1'b0;b = 1'b1; c=1'b1; 
#15 a = 1'b1;b = 1'b0; c=1'b0; 
#20 a = 1'b1;b = 1'b0; c=1'b1; 
#20 a = 1'b1;b = 1'b1; c=1'b0; 
#10 a = 1'b1;b = 1'b1; c=1'b1; 
#100 $finish;
end
endmodule */