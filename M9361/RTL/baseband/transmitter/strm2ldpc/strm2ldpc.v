module strm2ldpc(/*AUTOARG*/
   // Outputs
   o_dout, o_valid, o_ldpc_start, o_ldpc_mode, o_st_done,
   o_strmfifo_maxdcnt,
   // Inputs
   i_din, i_valid, i_st_start, i_st_opt, clk, reset_n
   );



  // --------------------------------------------------------------------------
  // Outputs
  output  [7:0]      o_dout;
  output             o_valid;
  output             o_ldpc_start;
  output  [1:0]      o_ldpc_mode;
  output             o_st_done;
  output  [12:0]     o_strmfifo_maxdcnt;

  // Inputs
  input  [7:0]       i_din;
  input              i_valid;
  input              i_st_start;
  input  [19:0]      i_st_opt;
  input              clk;
  input              reset_n;

  // --------------------------------------------------------------------------
  // Regs & Wires
  reg                stbusy;
  reg  [17:0]        stcnt;
  reg  [17:0]        segmax;
  reg  [1:0]         ldpcmode;
  reg                ldpc_start;
  reg  [1:0]         scnt;
  reg                st_done;
  reg                drdy;
  reg  [12:0]        fifodcnt;
  reg  [12:0]        maxdcnt;

  wire [17:0]        stcnt_plus;
  wire               stcnt_eq_segmax;
  wire [1:0]         scnt_plus;
  wire               scnt_eq_00;
  wire               scnt_eq_03;
  wire               pop;
  wire               empb;
  wire               fulb;
  wire [7:0]         dbits;
  wire               fifoa_overflow;
  wire [12:0]        fifodcnt_plus;
  wire [12:0]        fifodcnt_minus;

  // --------------------------------------------------------------------------
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      stbusy <= 1'b0;
    end else if (i_st_start) begin
      stbusy <= 1'b1;
    end else if (pop & stcnt_eq_segmax) begin
      stbusy <= 1'b0;
    end
  end

  // --------------------------------------------------------------------------
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      stcnt <= 18'd0;
    end else if (i_st_start | (pop & stcnt_eq_segmax)) begin
      stcnt <= 18'b0;
    end else if (pop) begin
      stcnt <= stcnt_plus;
    end
  end

  // --------------------------------------------------------------------------
  assign stcnt_plus  = ( stcnt +  18'b1  ) ;

  assign stcnt_eq_segmax = (stcnt == segmax);

  // --------------------------------------------------------------------------
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      segmax <= 'b0;
    end else if (i_st_start) begin
      segmax <= i_st_opt[19:2];
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      ldpcmode <= 'b0;
    end else if (i_st_start) begin
      ldpcmode <= i_st_opt[1:0];
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      ldpc_start <= 'b0;
    end else begin
      ldpc_start <= i_st_start;
    end
  end

  assign o_ldpc_start = ldpc_start;
  assign o_ldpc_mode  = ldpcmode;

  // --------------------------------------------------------------------------
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      scnt <= 2'd0;
    end else if ((pop & stcnt_eq_segmax)) begin
      scnt <= 2'b1;
    end else if ((~scnt_eq_00)) begin
      scnt <= scnt_plus;
    end
  end

  // --------------------------------------------------------------------------
  assign scnt_plus  = ( scnt +  2'b1  ) ;
  assign scnt_eq_00 = ( scnt == 2'd0  ) ;
  assign scnt_eq_03 = ( scnt == 2'd3  ) ;

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      st_done <= 1'b0;
    end else begin
      st_done <= scnt_eq_03;
    end
  end

  assign o_st_done = st_done;

  // --------------------------------------------------------------------------
  assign pop = stbusy & empb;

  // --------------------------------------------------------------------------
  /* dfifo AUTO_TEMPLATE(
  .i_push ( i_valid ) ,
  .i_din  ( i_din   ) ,
  .i_pop  ( pop     ) ,
  .o_dout ( dbits   ) ,
  .o_drdy ( drdy    ) ,
  .o_empb ( empb    ) ,
  .o_fulb ( fulb    ) ,
  );*/
  dfifo #(.LOG2_DEPTH ( 4   ) ,
          .DATA_WIDTH ( 8   ) ) 
  ufifo(/*AUTOINST*/
        // Outputs
        .o_dout                         ( dbits   ),            
        .o_fulb                         ( fulb    ),            
        .o_empb                         ( empb    ),            
        // Inputs
        .i_push                         ( i_valid ),            
        .i_pop                          ( pop     ),            
        .i_din                          ( i_din   ),            
        .clk                            (clk),
        .reset_n                        (reset_n));

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      drdy <= 1'b0;
    end else begin
      drdy <= pop;
    end
  end

  assign o_valid = drdy;
  assign o_dout  = dbits;

  /////////////////////////////////////////////////////////////////////////////
  // DEBUG CODE                                                              //
  /////////////////////////////////////////////////////////////////////////////
  assign fifoa_overflow  = (~fulb ) & i_valid;

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      fifodcnt <= 13'd0;
    end else if ((  i_valid ) & ( ~pop )) begin
      fifodcnt <= fifodcnt_plus;
    end else if (( ~i_valid ) & (  pop )) begin
      fifodcnt <= fifodcnt_minus;
    end
  end

  // --------------------------------------------------------------------------
  assign fifodcnt_plus  = ( fifodcnt +  13'b1  ) ;
  assign fifodcnt_minus = ( fifodcnt -  13'b1  ) ;

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      maxdcnt <= 'b0;
    end else if (fifodcnt > maxdcnt) begin
      maxdcnt <= fifodcnt;
    end
  end

  assign o_strmfifo_maxdcnt = maxdcnt;

  // --------------------------------------------------------------------------
endmodule 
// ----------------------------------------------------------------------------
// Local Variables:
// verilog-library-directories: ("." "../../dw")
// End:
// ----------------------------------------------------------------------------
