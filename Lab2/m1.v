module mux4_1(in, sel, out);
input [3:0]in; 
input [1:0]sel;
output out;
wire s1,s0,d3,d2,d1,d0;

not n1(s1,sel[1]);
not n0(s0,sel[0]);

and a1(d0, s1, s0,in[0]);
and a2(d1, s1, sel[0],in[1]);
and a3(d2, sel[1], s0,in[2]);
and a4(d3, sel[1], sel[0],in[3]);

or o1(out,d1,d2,d3,d0);
endmodule

module testbench;
reg [3:0]in;
reg [1:0]sel;
wire out;
mux4_1 x1(in, sel, out);
initial
 begin
$monitor(,$time,"in=%b,sel=%b,out=%b",in,sel,out);
#0 in= 4'b1000; sel = 2'b00;
#5 in= 4'b0100; sel = 2'b01;
#10 in= 4'b0010; sel = 2'b10;
#40 in= 4'b0001; sel = 2'b11; 
#100 $finish;
end
endmodule