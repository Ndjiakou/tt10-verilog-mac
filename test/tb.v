`default_nettype none
`timescale 1ns / 1ps

/* This testbench instantiates the mac_test module and prepares the signals
   to be controlled by the cocotb Python-based testbench environment.
*/

module tb ();

  // Declare the signals that will be controlled by the cocotb testbench
  reg clk;
  reg rst_n;
  reg sel;
  reg [7:0] ui_in;      // Inputs to the design
  reg [7:0] uio_in;     // Bidirectional inputs to the design
  wire [7:0] uo_out;    // Outputs from the design
  wire [7:0] uio_out;   // Bidirectional outputs from the design
  wire [7:0] uio_oe;    // Output enable signals for bidirectional pins

  // Generate a clock signal (period = 10ns)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Generate a clock with a period of 10ns
  end

  // Reset signal (active low)
  initial begin
    rst_n = 0;
    #20 rst_n = 1;  // Assert reset for 20ns, then deassert
  end

  // Instantiate the design (top-level module)
  mac_test user_project (
    .rst_n(rst_n),      // Active low reset
    .sel(sel),          // Select signal to choose the test mode
    .ui_in(ui_in),      // Input pins
    .uio_in(uio_in),    // Bidirectional input pins
    .uo_out(uo_out),    // Output pins
    .uio_out(uio_out),  // Bidirectional output pins
    .uio_oe(uio_oe),    // Output enable signals for bidirectional pins
    .clk(clk)           // Clock input
  );

endmodule
