`include "adder.v"
module adder_8 (g,s,ci,h,co);
input [7:0]g;
input [7:0]s;
input ci;
output [7:0]h;
output co;
wire c0,c1,c2,c3,c4,c5,c6;

fadder fa1(s[0],g[0],ci,h[0],c0);
fadder fa2(s[1],g[1],c0,h[1],c1);
fadder fa3(s[2],g[2],c1,h[2],c2);
fadder fa4(s[3],g[3],c2,h[3],c3);
fadder fa5(s[4],g[4],c3,h[4],c4);
fadder fa6(s[5],g[5],c4,h[5],c5);
fadder fa7(s[6],g[6],c5,h[6],c6);
fadder fa8(s[7],g[7],c6,h[7],co);
endmodule

/* module testbench;
reg [7:0]g;
reg [7:0]s;
reg ci;
wire [7:0]h;
wire co;
adder_8 abc (g,s,ci,h,co);
initial
       
	   begin
$monitor(,$time,"g=%b,s=%b,ci=%b,h=%b,co=%b",g,s,ci,h,co);
#0 g=8'b00000001;s=8'b00000001;ci=1'b0;
#10 g=8'b00000001;s=8'b00000001;ci=1'b1;
#10 g=8'b00000001;s=8'b00000001;ci=1'b0;
#10 g=8'b00000001;s=8'b00000001;ci=1'b0;
#100 $finish;
end
endmodule */