`timescale 1ns / 1ps

module Project_Tb();
  // Inputs
  reg clk;
  reg rst;
  reg MISO_Mic;

  // Outputs
  wire SCLK_MIC;      
  wire CS_MIC;
  wire [1:0] SDATA_DA2;
  wire SYNC_DA2;
  wire SCLK_DA2;

  // Instantiate the top module
  Project_Top uut(
    .clk(clk),
    .rst(rst),
    .MISO_Mic(MISO_Mic),
    .SCLK_MIC(SCLK_MIC),        
    .CS_MIC(CS_MIC),
    .SDATA_DA2(SDATA_DA2),
    .SYNC_DA2(SYNC_DA2),
    .SCLK_DA2(SCLK_DA2)
    );

  // Clock generation: 100 MHz
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Testbench stimulus
  initial begin

    // Initialize
    rst = 1;
    MISO_Mic = 0;

    // Reset pulse
    #50;
    rst = 0;
    #20;
    // Simulate 12-bit audio sample (0xCDE = 1100_1101_1110)
    MISO_Mic = 1; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 0

    #200;

    MISO_Mic = 0; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 0
    
    #200
    MISO_Mic = 1; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 0

    #200;
    MISO_Mic = 0; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 0

    #200;
    MISO_Mic = 1; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 0

    #200;
    MISO_Mic = 1; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 0

    #200;
    MISO_Mic = 1; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 0

    #200;
    MISO_Mic = 1; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 0

    #200;
    MISO_Mic = 1; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 0

    #200;
    MISO_Mic = 1; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 0

    #200;
    MISO_Mic = 1; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 0

    #200;
    MISO_Mic = 1; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 0

    #200;
    MISO_Mic = 1; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 0

    #200;
    MISO_Mic = 1; @(negedge SCLK_MIC); // dummy bit 
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 11
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 10
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 9
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 8
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 7
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 6
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 5
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 4
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 3
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 2
    MISO_Mic = 0; @(negedge SCLK_MIC); // bit 1
    MISO_Mic = 1; @(negedge SCLK_MIC); // bit 0

    #200;
    
    
    #1000;
    $finish;
  end

endmodule
