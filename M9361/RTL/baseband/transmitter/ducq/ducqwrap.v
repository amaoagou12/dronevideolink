module ducqwrap (/*AUTOARG*/
   // Outputs
   o_x, o_y, o_done,
   // Inputs
   i_x, i_y, i_start, i_ducfreq, clk, reset_n
   );



  // --------------------------------------------------------------------------
  // Outputs
  output  [2:-11]    o_x;
  output  [2:-11]    o_y;
  output             o_done;

  // Inputs
  input  [2:-11]     i_x;
  input  [2:-11]     i_y;
  input              i_start;
  input  [29:0]      i_ducfreq;
  input              clk;
  input              reset_n;

  // --------------------------------------------------------------------------
  // Regs & Wires
  reg  [29:0]        itbphi;

  // --------------------------------------------------------------------------
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      itbphi <= 'b0;
    end else if (i_start) begin
      itbphi <= itbphi + i_ducfreq;
    end
  end
  
  // --------------------------------------------------------------------------
  /* ducqcore AUTO_TEMPLATE(
  .i_z     (itbphi[29:18]),
  );*/
  ducqcore uitbcore(/*AUTOINST*/
                    // Outputs
                    .o_done             (o_done),
                    .o_x                (o_x[2:-11]),
                    .o_y                (o_y[2:-11]),
                    // Inputs
                    .i_x                (i_x[2:-11]),
                    .i_y                (i_y[2:-11]),
                    .i_z                (itbphi[29:18]),        
                    .i_start            (i_start),
                    .clk                (clk),
                    .reset_n            (reset_n));

  // --------------------------------------------------------------------------
endmodule
