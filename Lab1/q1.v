module bcd_gray (a,b,c,d,g3,g2,g1,g0);
input a,b,c,d;
output g3,g2,g1,g0;
wire x;

not n1(x,a); // x= ~a
not n2(g3,x); // g3 = ~x
or o1(g2,a,b); // g2 = a+b
xor x1(g1,b,c); // g1= b(xor)c
xor x2(g0,c,d); //g0 = c(xor)d
endmodule

module testbench;
reg a,b,c,d;
wire g3,g2,g1,g0;
bcd_gray abc (a,b,c,d,g3,g2,g1,g0);
initial
       
	   begin
$monitor(,$time," a=%b, b=%b, ,c=%b ,d=%b, g3=%b, g2=%b ,g1=%b , g0=%b",a,b,c,d,g3,g2,g1,g0);
#0 a=1'b0;b=1'b0; c= 1'b0;d= 1'b0;
#2 a=1'b0;b=1'b0; c= 1'b0;d= 1'b1;
#5 a=1'b0;b=1'b0; c= 1'b1;d= 1'b0;
#10 a=1'b0;b=1'b0; c= 1'b1;d= 1'b1;
#15 a=1'b0;b=1'b1; c= 1'b0;d= 1'b0;
#20 a=1'b0;b=1'b1; c= 1'b0;d= 1'b1;
#20 a=1'b0;b=1'b1; c= 1'b1;d= 1'b0;
#10 a=1'b0;b=1'b1; c= 1'b1;d= 1'b1;
#20 a=1'b1;b=1'b0; c= 1'b0;d= 1'b0;
#10 a=1'b1;b=1'b0; c= 1'b0;d= 1'b1;
#100 $finish;
end
endmodule

