module sramb(/*AUTOARG*/
  // Outputs
  rdat,
  // Inputs
  addr, wdat, rd, wr, clk
  );

  // --------------------------------------------------------------------------
  parameter DBITS = 12;
  parameter DEPTH = 256;

  // --------------------------------------------------------------------------
  localparam ABITS = $clog2(DEPTH);

  // --------------------------------------------------------------------------
  // inputs
  input  [ABITS-1:0]  addr;
  input  [DBITS-1:0]  wdat;
  input               rd;
  input               wr;
  input               clk;

  // outputs
  output [DBITS-1:0] rdat;

`ifndef ALTERA_FPGA

  // --------------------------------------------------------------------------
  reg [DBITS-1:0]    mem [0:DEPTH-1];
  reg [DBITS-1:0]    Q;

  // --------------------------------------------------------------------------
  always @(posedge clk) begin
    if (wr) begin
      mem[addr] <= wdat;
    end
  end

  // --------------------------------------------------------------------------
  always @(posedge clk) begin
    if (rd) begin
      Q <= mem[addr];
    end
  end

  assign rdat = Q;

`else

  altera_sp_rd_ram #(.A_WIDTH  ( ABITS ) ,
                     .D_WIDTH  ( DBITS ) ,
                     .WORD_NUM ( DEPTH ) )
  usram(
    .address ( addr ) ,
    .clock   ( clk  ) ,
    .data    ( wdat ) ,
    .rden    ( rd   ) ,
    .wren    ( wr   ) ,
    .q       ( rdat ) ) ;

`endif
  // --------------------------------------------------------------------------
endmodule // sram

