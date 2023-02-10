module decoder(x,y,z,d0,d1,d2,d3,d4,d5,d6,d7);
input x,y,z;
output d0,d1,d2,d3,d4,d5,d6,d7;
wire x0,y0,z0;

not n1(x0,x);
not n2(y0,y);
not n3(z0,z);
and a1(d0,x0,y0,z0);
and a2(d1,x0,y0,z);
and a3(d2,x0,y,z0);
and a4(d3,x0,y,z);
and a5(d4,x,y0,z0);
and a6(d5,x,y0,z);
and a7(d6,x,y,z0);
and a8(d7,x,y,z);
endmodule

module testbench;
reg x,y,z;
wire d0,d1,d2,d3,d4,d5,d6,d7;
decoder abc (x,y,z,d0,d1,d2,d3,d4,d5,d6,d7);
initial
      	  
	   begin
$monitor(,$time,"x=%b,y=%b,z=%b,d0=%b,d1=%b,d2=%b,d3=%b,d4=%b,d5=%b,d6=%b,d7=%b",x,y,z,d0,d1,d2,d3,d4,d5,d6,d7);
#0 x = 1'b0;y = 1'b0; z=1'b0; 
#2 x = 1'b0;y = 1'b0; z=1'b1; 
#5 x = 1'b0;y = 1'b1; z=1'b0; 
#10 x = 1'b0;y = 1'b1; z=1'b1; 
#15 x = 1'b1;y = 1'b0; z=1'b0; 
#20 x = 1'b1;y = 1'b0; z=1'b1; 
#20 x = 1'b1;y = 1'b1; z=1'b0; 
#10 x = 1'b1;y = 1'b1; z=1'b1; 
#100 $finish;
end
endmodule
