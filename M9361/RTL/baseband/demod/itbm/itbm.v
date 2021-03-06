module itbm (/*AUTOARG*/
   // Outputs
   o_done, o_x, o_y,
   // Inputs
   i_x, i_y, i_z, i_start, clk, reset_n
   );

  // --------------------------------------------------------------------------
  // Outputs
  output             o_done;
  output  [2:-9]     o_x;
  output  [2:-9]     o_y;

  // Inputs
  input  [2:-9]      i_x;
  input  [2:-9]      i_y;
  input  [13:0]      i_z;
  input              i_start;
  input              clk;
  input              reset_n;

  // --------------------------------------------------------------------------
  // Regs & Wires
  reg                start_1d;
  reg                start_2d;
  reg                start_3d;
  reg                start_4d;
  reg                start_5d;
  reg                start_6d;
  reg                start_7d;
  reg                start_8d;
  reg  [2:-9]        x_1d;
  reg  [2:-9]        y_1d;
  reg  [2:-9]        x_2d;
  reg  [2:-9]        y_2d;
  reg  [2:-9]        x_3d;
  reg  [2:-9]        y_3d;
  reg  [2:-9]        x_4d;
  reg  [2:-9]        y_4d;
  reg  [2:-9]        x_5d;
  reg  [2:-9]        y_5d;
  reg  [10:0]        z45_1d;
  reg  [3:0]         fs_1d;
  reg  [-1:-11]      sin_2d;
  reg  [-1:-11]      cos_2d;
  reg  [3:0]         fs_2d;
  reg  [-1:-11]      sin_3d;
  reg  [-1:-11]      cos_3d;
  reg  [3:0]         fs_3d;
  reg  [0:-11]       sina_4d;
  reg  [0:-11]       cosa_4d;
  reg  [0:-11]       sinb_4d;
  reg  [0:-11]       cosb_4d;
  reg  [1:0]         fs_4d;
  reg  [0:-11]       cos_pre;
  reg  [0:-11]       sin_pre;
  reg  [0:-11]       sin_npe;
  reg  [0:-11]       cosc;
  reg  [0:-11]       sinc;
  reg  [3:-20]       ii;
  reg  [3:-20]       qq;
  reg  [3:-20]       iq;
  reg  [3:-20]       qi;
  reg  [4:-10]       xx_7d;
  reg  [4:-10]       yy_7d;
  reg  [2:-9]        xx_8d;
  reg  [2:-9]        yy_8d;

  wire [0:-11]       sin_45a;
  wire [0:-11]       cos_45a;
  wire [0:-11]       sin_45b;
  wire [0:-11]       cos_45b;
  wire [10:0]        z45_neg;
  wire [10:0]        z45_pos;
  wire               z_eq_45;
  wire [10:0]        tabind;
  wire [-1:-11]      cos_raw;
  wire [-1:-11]      sin_raw;
  wire               z_eq_45_3d;
  wire               z_exchg_3d;
  wire [0:-11]       cosa;
  wire [0:-11]       sina;
  wire [0:-11]       cosb;
  wire [0:-11]       sinb;
  wire [1:0]         zz;
  wire [3:-20]       ii_pre;
  wire [3:-20]       qq_pre;
  wire [3:-20]       iq_pre;
  wire [3:-20]       qi_pre;
  wire [4:-20]       xx_raw;
  wire [4:-20]       yy_raw;
  wire [4:-9]        xx_rnd;
  wire [4:-9]        yy_rnd;
  wire [2:-9]        xx_clp;
  wire [2:-9]        yy_clp;

  // --------------------------------------------------------------------------
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      start_1d <= 1'b0;
    end else begin
      start_1d <= i_start;
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      start_2d <= 1'b0;
    end else begin
      start_2d <= start_1d;
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      start_3d <= 1'b0;
    end else begin
      start_3d <= start_2d;
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      start_4d <= 1'b0;
    end else begin
      start_4d <= start_3d;
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      start_5d <= 1'b0;
    end else begin
      start_5d <= start_4d;
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      start_6d <= 1'b0;
    end else begin
      start_6d <= start_5d;
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      start_7d <= 1'b0;
    end else begin
      start_7d <= start_6d;
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      start_8d <= 1'b0;
    end else begin
      start_8d <= start_7d;
    end
  end

  always @(posedge clk) begin
    begin
      x_1d <= i_x;
    end
  end

  always @(posedge clk) begin
    begin
      y_1d <= i_y;
    end
  end

  assign sin_45a = 12'd1448;
  assign cos_45a = 12'd1448;
  assign sin_45b = 12'h0A58;
  assign cos_45b = 12'h0A58;

  always @(posedge clk) begin
    begin
      x_2d <= x_1d;
    end
  end

  always @(posedge clk) begin
    begin
      y_2d <= y_1d;
    end
  end

  always @(posedge clk) begin
    begin
      x_3d <= x_2d;
    end
  end

  always @(posedge clk) begin
    begin
      y_3d <= y_2d;
    end
  end

  always @(posedge clk) begin
    begin
      x_4d <= x_3d;
    end
  end

  always @(posedge clk) begin
    begin
      y_4d <= y_3d;
    end
  end

  always @(posedge clk) begin
    begin
      x_5d <= x_4d;
    end
  end

  always @(posedge clk) begin
    begin
      y_5d <= y_4d;
    end
  end

  // --------------------------------------------------------------------------
  assign z45_pos =  i_z[10:0] ;
  assign z45_neg = ~i_z[10:0] + 1'b1;

  always @(posedge clk) begin
    if (i_z[11] & i_start) begin
      z45_1d <= z45_neg;
    end else if ((~i_z[11]) & i_start) begin
      z45_1d <= z45_pos;
    end
  end

  assign z_eq_45 = ~|{~i_z[11], z45_pos};

  always @(posedge clk) begin
    if (i_start) begin
      fs_1d <= {i_z[11], z_eq_45, i_z[13:12]};
    end
  end

  // --------------------------------------------------------------------------
  assign tabind = z45_1d;
  /* itbm_costheta AUTO_TEMPLATE(
  .addr (tabind),
  .q    (cos_raw),
  );*/ 
  itbm_costheta u_costheta(/*AUTOINST*/
                           // Outputs
                           .q                   (cos_raw),      
                           // Inputs
                           .addr                (tabind));       

  /* itbm_sintheta AUTO_TEMPLATE(
  .addr (tabind),
  .q    (sin_raw),
  );*/ 
  itbm_sintheta u_sintheta(/*AUTOINST*/
                           // Outputs
                           .q                   (sin_raw),      
                           // Inputs
                           .addr                (tabind));       

  // --------------------------------------------------------------------------
  always @(posedge clk) begin
    begin
      sin_2d <= sin_raw;
    end
  end

  always @(posedge clk) begin
    begin
      cos_2d <= cos_raw;
    end
  end

  always @(posedge clk) begin
    begin
      fs_2d <= fs_1d;
    end
  end

  // --------------------------------------------------------------------------
  always @(posedge clk) begin
    begin
      sin_3d <= sin_2d;
    end
  end

  always @(posedge clk) begin
    begin
      cos_3d <= cos_2d;
    end
  end

  always @(posedge clk) begin
    begin
      fs_3d <= fs_2d;
    end
  end

  assign z_eq_45_3d = fs_3d[2];
  assign z_exchg_3d = fs_3d[3];

  // --------------------------------------------------------------------------
  assign cosa = {1'b0, cos_3d};
  assign sina = {1'b0, sin_3d};

  assign cosb = ~cosa + 1'b1;
  assign sinb = ~sina + 1'b1;

  always @(posedge clk) begin
    if (z_eq_45_3d) begin
      sina_4d <= sin_45a;
    end else if (z_exchg_3d) begin
      sina_4d <= cosa;
    end else begin
      sina_4d <= sina;
    end
  end

  always @(posedge clk) begin
    if (z_eq_45_3d) begin
      cosa_4d <= cos_45a;
    end else if (z_exchg_3d) begin
      cosa_4d <= sina;
    end else begin
      cosa_4d <= cosa;
    end
  end

  always @(posedge clk) begin
    if (z_eq_45_3d) begin
      sinb_4d <= sin_45b;
    end else if (z_exchg_3d) begin
      sinb_4d <= cosb;
    end else begin
      sinb_4d <= sinb;
    end
  end

  always @(posedge clk) begin
    if (z_eq_45_3d) begin
      cosb_4d <= cos_45b;
    end else if (z_exchg_3d) begin
      cosb_4d <= sinb;
    end else begin
      cosb_4d <= cosb;
    end
  end

  always @(posedge clk) begin
    begin
      fs_4d <= fs_3d[1:0];
    end
  end

  // --------------------------------------------------------------------------
  assign zz = fs_4d;

  always @* begin
    case (zz)
      2'd0: begin cos_pre = cosa_4d; end
      2'd1: begin cos_pre = sinb_4d; end
      2'd2: begin cos_pre = cosb_4d; end
      2'd3: begin cos_pre = sina_4d; end
      default: begin cos_pre = cosa_4d; end
    endcase
  end

  always @* begin
    case (zz)
      2'd0: begin sin_pre = sina_4d; end
      2'd1: begin sin_pre = cosa_4d; end
      2'd2: begin sin_pre = sinb_4d; end
      2'd3: begin sin_pre = cosb_4d; end
      default: begin sin_pre = sina_4d; end
    endcase
  end

  // --------------------------------------------------------------------------
  always @(posedge clk) begin
    begin
      cosc <= cos_pre;
    end
  end

  always @(posedge clk) begin
    begin
      sinc <= sin_pre;
    end
  end

  // @5d now

  // --------------------------------------------------------------------------
  /*DS02_mult AUTO_TEMPLATE(
  .A (x_5d[2:-9]),
  .B (cosc[0:-11]),
  .C (ii_pre[3:-20]),
  ); */
  DS02_mult #(.A_WIDTH (  12 ) ,
              .B_WIDTH (  12 ) )
  udmul_x_5d (/*AUTOINST*/
              // Outputs
              .C                        (ii_pre[3:-20]),        
              // Inputs
              .A                        (x_5d[2:-9]),           
              .B                        (cosc[0:-11]));          

  /*DS02_mult AUTO_TEMPLATE(
  .A (y_5d[2:-9]),
  .B (sinc[0:-11]),
  .C (qq_pre[3:-20]),
  ); */
  DS02_mult #(.A_WIDTH (  12 ) ,
              .B_WIDTH (  12 ) )
  udmul_y_5d (/*AUTOINST*/
              // Outputs
              .C                        (qq_pre[3:-20]),        
              // Inputs
              .A                        (y_5d[2:-9]),           
              .B                        (sinc[0:-11]));          

  /*DS02_mult AUTO_TEMPLATE(
  .A (sinc[0:-11]),
  .B (x_5d[2:-9]),
  .C (iq_pre[3:-20]),
  ); */
  DS02_mult #(.A_WIDTH (  12 ) ,
              .B_WIDTH (  12 ) )
  udmul_sinc (/*AUTOINST*/
              // Outputs
              .C                        (iq_pre[3:-20]),        
              // Inputs
              .A                        (sinc[0:-11]),          
              .B                        (x_5d[2:-9]));           

  /*DS02_mult AUTO_TEMPLATE(
  .A (cosc[0:-11]),
  .B (y_5d[2:-9]),
  .C (qi_pre[3:-20]),
  ); */
  DS02_mult #(.A_WIDTH (  12 ) ,
              .B_WIDTH (  12 ) )
  udmul_cosc (/*AUTOINST*/
              // Outputs
              .C                        (qi_pre[3:-20]),        
              // Inputs
              .A                        (cosc[0:-11]),          
              .B                        (y_5d[2:-9]));           

  always @(posedge clk) begin
    if (start_5d) begin
      ii <= ii_pre;
    end
  end

  always @(posedge clk) begin
    if (start_5d) begin
      iq <= iq_pre;
    end
  end

  always @(posedge clk) begin
    if (start_5d) begin
      qq <= qq_pre;
    end
  end

  always @(posedge clk) begin
    if (start_5d) begin
      qi <= qi_pre;
    end
  end

  // @6d now

  // --------------------------------------------------------------------------
  assign xx_raw = { ii[3], ii } -
                  { qq[3], qq } ;

  assign yy_raw = { iq[3], iq } +
                  { qi[3], qi } ;

  always @(posedge clk) begin
    begin
      xx_7d <= xx_raw[4:-10];
    end
  end

  always @(posedge clk) begin
    begin
      yy_7d <= yy_raw[4:-10];
    end
  end

  // --------------------------------------------------------------------------
  /*DS02_round AUTO_TEMPLATE(
  .ipdata (xx_7d[4:-10]),
  .opdata (xx_rnd[4:-9]),
  ); */
  DS02_round #(.IP_BITS (15) ,
               .OP_BITS (14) )
  urnd_xx_rnd (/*AUTOINST*/
               // Outputs
               .opdata                  (xx_rnd[4:-9]),         
               // Inputs
               .ipdata                  (xx_7d[4:-10]));         

  /*DS02_round AUTO_TEMPLATE(
  .ipdata (yy_7d[4:-10]),
  .opdata (yy_rnd[4:-9]),
  ); */
  DS02_round #(.IP_BITS (15) ,
               .OP_BITS (14) )
  urnd_yy_rnd (/*AUTOINST*/
               // Outputs
               .opdata                  (yy_rnd[4:-9]),         
               // Inputs
               .ipdata                  (yy_7d[4:-10]));         

  /*DS02_clip AUTO_TEMPLATE(
  .ipdata (xx_rnd[4:-9]),
  .opdata (xx_clp[2:-9]),
  ); */
  DS02_clip #(.IP_BITS (14) ,
              .OP_BITS (12) )
  uclip_xx_clp (/*AUTOINST*/
                // Outputs
                .opdata                 (xx_clp[2:-9]),         
                // Inputs
                .ipdata                 (xx_rnd[4:-9]));         

  /*DS02_clip AUTO_TEMPLATE(
  .ipdata (yy_rnd[4:-9]),
  .opdata (yy_clp[2:-9]),
  ); */
  DS02_clip #(.IP_BITS (14) ,
              .OP_BITS (12) )
  uclip_yy_clp (/*AUTOINST*/
                // Outputs
                .opdata                 (yy_clp[2:-9]),         
                // Inputs
                .ipdata                 (yy_rnd[4:-9]));         

  always @(posedge clk) begin
    begin
      xx_8d <= xx_clp;
    end
  end

  always @(posedge clk) begin
    begin
      yy_8d <= yy_clp;
    end
  end

  // --------------------------------------------------------------------------
  assign o_x    = xx_8d;
  assign o_y    = yy_8d;
  assign o_done = start_8d;

  // --------------------------------------------------------------------------
endmodule

// ----------------------------------------------------------------------------
// Local Variables:
// verilog-library-directories: ("." "../dw")
// End:
// ----------------------------------------------------------------------------
