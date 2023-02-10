`include "fulladder.v"
module addsub(s,c,v,a,b,m);
input [3:0]a;
input [3:0]b;
input m;
output [3:0]s;
output c;
output v;
wire c1,c2,c3;
wire b0,b1,b2,b3;

xor x1(b0,b[0],m);
xor x2(b1,b[1],m);
xor x2(b2,b[2],m);
xor x3(b3,b[3],m);
fulladder fa1(s[0],c1,a[0],b0,m);
fulladder fa2(s[1],c2,a[1],b1,c1);
fulladder fa3(s[2],c3,a[2],b2,c2);
fulladder fa4(s[3],c,a[3],b3,c3);
xor x5(v,c,c3);
endmodule

module testbench_AS;
  reg [3:0]A, B;
  reg Select;
  wire [3:0]Sum;
  wire Carry, Overflow;
  addsub mod(Sum, Carry, Overflow, A, B, Select);
  initial
    begin
      $monitor($time, " A=%4b, B=%4b, Select=%b, Carry=%b, Sum=%4b, Overflow=%b.", A, B, Select, Carry, Sum, Overflow);
      #0  A=4'b0000; B=4'b0000; Select=1'b0;
      #10 A=4'b1000; B=4'b0101; Select=1'b1;
      #10 A=4'b1111; B=4'b1000; Select=1'b1;
      #10 $finish;
    end
endmodule