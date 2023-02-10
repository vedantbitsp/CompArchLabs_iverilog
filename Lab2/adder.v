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

module fadder(a,b,c,sum,cout);
input a,b,c;
output sum,cout;
input k0,k1,k2,k3,k4,k5,k6,k7;

decoder d1(a,b,c,k0,k1,k2,k3,k4,k5,k6,k7);
or o1(sum,k1,k2,k4,k7);
or o2(cout,k3,k5,k6,k7);
endmodule

/* module testbench;
reg a,b,c;
wire sum,cout;
fadder abc (a,b,c,sum,cout);
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