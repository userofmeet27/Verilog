                                                #1011 sequence detector using Mealy machine 

module mealyfsm( clk, rst, inp, outp); 
input clk, rst, inp; 
output outp; 
reg [1:0] state; 
reg outp; 
always @( posedge clk, posedge rst ) begin 
if( rst ) begin 
	state <= 2'b00; 
	outp <= 0; 
end 
else begin 
	case( state ) 
	2'b00: begin 
		if( inp ) begin 
			state <= 2'b01; 
			outp <= 0; 
		end 
		else begin 
			state <= 2'b00; 
			outp <= 0; 
		end 
	end 
	2'b01: begin 
		if( inp ) begin 
			state <= 2'b01; 
			outp <= 0; 
		end 
		else begin 
			state <= 2'b10; 
			outp <= 0; 
		end 
	end 
	2'b10: begin 
		if( inp ) begin 
			state <= 2'b11; 
			outp <= 0; 
		end 
		else begin 
			state <= 2'b00; 
			outp <= 0; 
		end 
	end
	2'b11: begin
		if( inp ) begin
			state <= 2'b01;
			outp <= 1;
		end
		else begin
			state <= 2'b10;
			outp <= 0;
		end
	end
	default: begin 
		state <= 2'b00; 
		outp <= 0; 
		end 
	endcase 
	end 
end
endmodule

#Test-Bench for the above mealy machine:

module fsmtestbench();
  reg clk,rst,inp;
  wire outp;
  mealyfsm bcd( clk, rst, inp, outp);
  initial
  begin
    clk=1'b0;
    forever #5 clk=~clk;
  end
  initial
  begin 
    rst=1'b0;
    #5
    rst=1'b1;
    #20
    rst=1'b0;
    inp=1'b1;
    #10
    inp=1'b0;
    #10
    inp=1'b1;
    #20
    inp=1'b0;
  end
endmodule


                                                                                #1011 sequence detector using a moore machine

module moorefsm( clk, rst, inp, outp); 
input clk, rst, inp; 
output outp; 
reg [2:0] state; 
reg outp; 
always @( posedge clk, posedge rst ) 
begin 
if( rst ) 
	state <= 3'b000; 
else 
begin 
	case( state ) 
	3'b000: 
	begin 
		if( inp ) state <= 3'b001; 
		else state <= 3'b000; 
	end 
	3'b001:
	begin 
		if( inp ) state <= 3'b001; 
		else state <= 3'b010; 
	end 
	3'b010: 
	begin 
		if( inp ) state <= 3'b011; 
		else state <= 3'b000; 
	end 
	3'b011: 
	begin 
		if( inp ) state <= 3'b100; 
		else state <= 3'b010; 
	end
	3'b100:
		if( inp ) state <= 3'b001;
		else state <= 3'b010;
	endcase 
end 
end 
always @(posedge clk, posedge rst) 
begin 
	if( rst ) 
		outp <= 0; 
	else if( state == 3'b100 ) 
		outp <= 1; 
		else outp <= 0; 
end 
endmodule 

#Test-bench for the above code

module fsmtestbench();
  reg clk,rst,inp;
  wire outp;
  moorefsm test( clk, rst, inp, outp);
  initial
  begin
    clk=1'b0;
    forever #5 clk=~clk;
  end
  initial
  begin 
    rst=1'b0;
    #5
    rst=1'b1;
    #20
    rst=1'b0;
    inp=1'b1;
    #10
    inp=1'b0;
    #10
    inp=1'b1;
    #20
    inp=1'b0;
  end
endmodule