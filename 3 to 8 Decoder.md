### Code

```Verilog
//Verilog program for 3 to 8 decoder
module decoder(y0,y1,y2,y3,y4,y5,y6,y7,s2,s1,s0);
input s2,s1,s0;  
output y0,y1,y2,y3,y4,y5,y6,y7;
assign y7=s2?(s1?(s0?1:0):(s0?0:0)):(s1?(s0?0:0):(s0?0:0));
assign y6=s2?(s1?(s0?0:1):(s0?0:0)):(s1?(s0?0:0):(s0?0:0));
assign y5=s2?(s1?(s0?0:0):(s0?1:0)):(s1?(s0?0:0):(s0?0:0));
assign y4=s2?(s1?(s0?0:0):(s0?0:1)):(s1?(s0?0:0):(s0?0:0));
assign y3=s2?(s1?(s0?0:0):(s0?0:0)):(s1?(s0?1:0):(s0?0:0));
assign y2=s2?(s1?(s0?0:0):(s0?0:0)):(s1?(s0?0:1):(s0?0:0));
assign y1=s2?(s1?(s0?0:0):(s0?0:0)):(s1?(s0?0:0):(s0?1:0));
assign y0=s2?(s1?(s0?0:0):(s0?0:0)):(s1?(s0?0:0):(s0?0:1));
endmodule 

//Testbench of the 3 to 8 decoder so as to verify the above code is give below:-

module tb();
  reg s0,s1,s2;
  wire y0,y1,y2,y3,y4,y5,y6,y7;
  decoder a1(y0,y1,y2,y3,y4,y5,y6,y7,s2,s1,s0);
  initial 
  begin
    s0=1'b1;
    #20
    s0=1'b1;
    s1=1'b1;
    s2=1'b1;
  end
endmodule
```

### Output
![image](https://github.com/userofmeet27/Verilog/assets/154442221/a1851975-6c0f-42fe-b1ce-4fc9d560eb1d)
