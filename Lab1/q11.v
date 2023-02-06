module bcd_gray (a,g);
input [3:0]a;
output [3:0]g;
wire x;

not n1(x,a[3]); // x= ~a
not n2(g[3],x); // g3 = ~x
or o1(g[2],a[3],a[2]); // g2 = a+b
xor x1(g[1],a[2],a[1]); // g1= b(xor)c
xor x2(g[0],a[1],a[0]); //g0 = c(xor)d
endmodule

module testbench;
reg [3:0]a;
wire [3:0]g;
bcd_gray abc (a,g);
initial
       
	   begin
$monitor(,$time," a=%b,g=%b",a,g);
#0 a= 4'b0000;
#2 a= 4'b0001;
#5 a= 4'b0010;
#10 a= 4'b0011;
#15 a= 4'b0100;
#20 a= 4'b0101;
#20 a= 4'b0110;
#10 a= 4'b0111;
#20 a= 4'b1000;
#10 a= 4'b1001;
#100 $finish;
end
endmodule