`include "8bitadder.v"
module adder_32 (h,co,s,g,ci);
input [31:0]s;
input [31:0]g;
input ci;
output [31:0]h;
output co;
wire c1,c2,c3;

adder_8 a1(g[7:0],s[7:0],ci,h[7:0],c1);
adder_8 a2(g[15:8],s[15:8],c1,h[15:8],c2);
adder_8 a3(g[23:16],s[23:16],c2,h[23:16],c3);
adder_8 a4(g[31:24],s[31:24],c3,h[31:24],co);
endmodule

module testbench;
reg [31:0]g;
reg [31:0]s;
reg ci;
wire [31:0]h;
wire co;
adder_32 abc (h,co,s,g,ci);
initial
       
	   begin
$monitor(,$time,"g=%b,s=%b,ci=%b,h=%b,co=%b",g,s,ci,h,co);
#0 g=32'b00000001000000010000000100000001;s=32'b00000000000000000000000000000001;ci=1'b0;
#10 g=32'b00000001000000010000000100000001;s=32'b00000000000000000000000000000001;ci=1'b1;
#10 g=32'b11000001000000010000000100000001;s=32'b11000000000000000000000000000001;ci=1'b1;
#100 $finish;
end
endmodule