module bcd_gray (a,g);
input [3:0]a;
output [3:0]g;
wire x;

assign g[3] = a[3];
assign g[2] = a[3] ? 1'b1 : a[2];
//assign x = a[1] ? 1'b0 : 1'b1;
assign g[1] = a[2] ? a[1]! : a[1];
assign g[0] = a[0] ? a[1]! : a[1];
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