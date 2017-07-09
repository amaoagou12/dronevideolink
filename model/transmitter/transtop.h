#ifndef __TRANSMITTER_H__
#define __TRANSMITTER_H__

class pnGenerator;
class CAWGN;

class CDTScrambler;
class CFCScrambler;

class CTXBRK;
class CTXUP1;
class CTXUP2;
class CTXRESAMPLER;
class CTXDUC;

class CTMI;
class CSBI;
class LDPC_ENCODER;

class CTransmitter
{
public:
   ////////////////////////////////////////////////////////////////////////////
   // bit2symbol
   int    symbBufa [8192];
   
   // time interleaver
   int    symbBufb [8192];
   
   // symbol interleaver
   int    symbBufc [8192];

   // mapper
   double mappedI  [8192];
   double mappedQ  [8192];
   
   // frequency domain
   double symbFreqI[8192];
   double symbFreqQ[8192];
   
   // fftshift & conjugate
   double symbConjI[8192];
   double symbConjQ[8192];
   
   // symbol In Time Domain
   double symbTimeI[8192];
   double symbTimeQ[8192];
   ////////////////////////////////////////////////////////////////////////////
   
   double signalpower;

   ////////////////////////////////////////////////////////////////////////////
   int  LDPC_N;
   int  LDPC_K;

   int  LDPC_N_FC;
   int  LDPC_K_FC;
   int  LDPC_Z_FC;
   int  LDPC_8BIT_Z_FC;

   int  coderate;

   int  DMAX, HMAX;
   int  N, G;

   int  _pmode;
   int  qammode, qambits;

   int  nMacDataPerFrame;
   int  nSymbolsPerFrame;
   // int  FRAME_N, FRAME_S;
   int  hpBlockLen;
   ////////////////////////////////////////////////////////////////////////////
   
   ////////////////////////////////////////////////////////////////////////////
   pnGenerator      * pnGen;
   CAWGN            * awgnGen;

   LDPC_ENCODER     * pldpcEncoder_FC;
   LDPC_ENCODER     * pldpcEncoder_DT;

   CTMI             * ptmiObj;
   CSBI             * psbiObj;

   CDTScrambler     * dtScrambler;
   CFCScrambler     * fcScrambler;

   CTXBRK           * txbrkObj;
   CTXUP1           * txup1Obj;
   CTXUP2           * txup2Obj;
   CTXRESAMPLER     * txresObj;
   CTXDUC           * txducObj;
   ////////////////////////////////////////////////////////////////////////////

   ////////////////////////////////////////////////////////////////////////////
   int    macBuf    [8192 * 128];
   int    fqdtSymbol[1024 *   8];
   double baseband_i[1260 + (1024 + 128) * 256];
   double baseband_q[1260 + (1024 + 128) * 256];

   double brtx_i[1260 + (1024 + 128) * 256];
   double brtx_q[1260 + (1024 + 128) * 256];

   double up1_i [(1260 + (1024 + 128) * 256)*2];
   double up1_q [(1260 + (1024 + 128) * 256)*2];

   double up2_i [(1260 + (1024 + 128) * 256)*4];
   double up2_q [(1260 + (1024 + 128) * 256)*4];

   double up3_i [(1260 + (1024 + 128) * 256)*12];
   double up3_q [(1260 + (1024 + 128) * 256)*12];
   
   double up4_i [(1260 + (1024 + 128) * 256)*24];
   double up4_q [(1260 + (1024 + 128) * 256)*24];
   ////////////////////////////////////////////////////////////////////////////

   ////////////////////////////////////////////////////////////////////////////
   // TRANSMITTER                                                            //
   ////////////////////////////////////////////////////////////////////////////
   int    datain_array [8192];
   int    encoder_array[8192];

public:

   CTransmitter(int _mode, int _guard, int _qammode, int _coderate);
  ~CTransmitter();

   int transmitter_generate_ofdmsymb(
      int      txno,
      int      symbno,
      int      qammode,
      int    * pdatabits
      );

   int upsampling(
      int      nbb, 
      double * pxi, 
      double * pxq,
      double * txi,
      double * txq
      );

   int transmitter_generate_ulframe(int, double, double *, double *);
};

#endif
