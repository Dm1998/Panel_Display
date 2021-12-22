module PanelDisplay_tb;

logic clk,rst,hsync,vsync;
logic [3:0] red,green,blue;

always begin//clk
	clk=1;
	#19.88ns;
	clk=0;
	#19.88ns;
end

PanelDisplay A(.clk(clk),.rst(rst),.hsync(hsync),.vsync(vsync),.red(red),.green(green),.blue(blue));

initial begin
	rst<=0;
	#1ns;
	rst<=1;
end
endmodule
