module PanelDisplay (
	input logic clk,
	input logic rst,
	output logic hsync,
	output logic vsync,
	output logic [3:0] red,
	output logic [3:0] green,
	output logic [3:0] blue
);

logic flag;
logic [8:0] rows;
logic [9:0] columns;


//Clock divider
always_ff @(posedge clk, negedge rst) begin
	if(!rst) begin
		flag<=0;
	end
	else begin
		//if(flag) begin
		flag<=~flag;
		//end
	end
end


//Counters
always_ff @(posedge clk,negedge rst) begin
	if(!rst) begin
		rows<=0;
		columns<=0;
	end
	else begin
		if(flag) begin
			if( columns < 799 ) begin 	
				columns<=columns+1;
			end
			else begin
				columns<=0;	
				if( rows < 523 ) begin
					rows<=rows+1;
				end
				else 
					rows<=0;
			end
		end	
	end
end


//Colours and sychronize
always_comb begin

		//Colours

		if((rows>118 && rows<240) && (columns>198 && columns<320)) begin //Red Sqaure
			red = 15;
			green = 4'b0;
			blue = 4'b0;
		end
				
		else if((rows>118 && rows<240) && (columns>319 && columns<441)) begin //Green Sqaure
			red = 4'b0;
			green = 15;
			blue = 4'b0;
		end
				
		else if((rows>239 && rows<361) && (columns>198 && columns<320)) begin //Blue Sqaure
				red = 4'b0;
				green = 4'b0;
				blue = 15;
		end
				
		else if((rows>239 && rows<361) && (columns>319  && columns<441)) begin //White Sqaure
			red = 15;
			green = 15;
			blue = 15;
		end
				
		else begin
		
			red = 4'b0;
			green = 4'b0;
			blue = 4'b0;
				
		end
	

		//Sync
		
		//Hsync
		if(columns<752 && columns>654 ) begin
			hsync = 0;
		end	
		
		else  begin	
			hsync = 1;
		end

		//Vsync

		if(rows<493 && rows>490) begin
			vsync=0;
		end
		else  begin	
			vsync=1;	
		end
		
		
end





endmodule
