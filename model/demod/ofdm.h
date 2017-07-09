#ifndef __SYSTEM_OFDM_H__
#define __SYSTEM_OFDM_H__

///////////////////////////////////////////////////////////////////////
#define QPSK         0
#define QAM16        1
#define QAM64        2
#define QAM256       3
#define QAM1024      4

#define BPSK         7

///////////////////////////////////////////////////////////////////////
#define MODE_1K      0
#define MODE_2K      1
#define MODE_4K      2
#define MODE_8K      3

#define GUARD_1_32   0
#define GUARD_1_16   1
#define GUARD_1_8    2
#define GUARD_1_4    3

///////////////////////////////////////////////////////////////////////
#define PILOT_MODE            ( 2               )
#define FC_SYMBOLS            ( 1               )

#define symbolsPerFrame       ( 32 + FC_SYMBOLS )

#define ENABLE_CONV_INTLVR    ( 1               )
#define ENABLE_SYM_INTLVR     ( 1               )

#define TSLOTS                ( 2               )
#define BLANKPRD              ( 40171           )
#define ACQRFRMS              ( 15              )

#define P1MODE_M              ( 1               )
#define P1SYMB_NTIMES         ( 32              )
#define P1SYMB_NDATAS         ( 15              )
#define P1SYMBOLSIZE          ( P1SYMB_NDATAS * (1 + P1SYMB_NTIMES + 4) )
///////////////////////////////////////////////////////////////////////
// INTERLEAVING DEPTH, SET TO (DMAX * DATA_SYMBOLS_PER_FRAME / 132)
#define DD ( 168 * 1 )
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
#define CR12               ( 0    )
#define CR23               ( 1    )
#define CR34               ( 2    )
#define CR56               ( 3    )
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
#define SISO1X1            ( 0    )
#define MIMO2X2            ( 1    )
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
#define SamplingRate       ( 80.0 )
#define IFrequency         (  0.0 )
#define SymbolRate         ( 40.0 )
#define DecimatorRate      (  1.0 )

#define IFreqDesiredRate   ( (IFrequency)  / (SamplingRate) )
#define resamplerRatio     ( 2                              ) 

#define SYSMODE            ( (int)(SymbolRate/10.0 + 1e-3)  )
#define ISIFSYS            ( IFrequency > 0.1               )
#define MIMO               ( SISO1X1                        )
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
/* MODESIZE, GUARDSIZE, HMAX, DMAX Tables                            */
///////////////////////////////////////////////////////////////////////
const static int modeSize[]  = { 1024, 1024, 1024, 1024, 1024 };
const static int guardSize[] = {    5,    4,    3,    2,    1 };
const static int hmaxes[]    = {  944,  944,  944,  936,  944 };
const static int dmaxes[]    = {  864,  693,  693,  693,  693 };
///////////////////////////////////////////////////////////////////////

/**********************************************************************
*  GLOBAL VARIABLES                                                   *
**********************************************************************/
///////////////////////////////////////////////////////////////////////
/* ITB */
struct itbGlobalType {
   // double gIFreqDesiredRate;
   double gIFreq;
   double gPhi;
};

extern struct itbGlobalType *pitbGlobalData;

// #define itbIFreqDesiredRate (pitbGlobalData->gIFreqDesiredRate)
// #define itbIFreq            (pitbGlobalData->gIFreq)
// #define itbPhi              (pitbGlobalData->gPhi)
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
/* AGC */
struct agcGlobalType {
      double gvgaGainReg;
      double gagcGain;
      double gagcGainFltd;
};

extern struct agcGlobalType *pagcGlobalData;

// #define vgaGainReg       (pagcGlobalData->gvgaGainReg  )
// #define agcGain          (pagcGlobalData->gagcGain     )
// #define agcGainFltd      (pagcGlobalData->gagcGainFltd )
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
/* TRL */
struct timingloopGlobalType {
   double gtimingLoopKp;
   double gtimingLoopKi;
   ///////////////////////
   double gaccumPhaseError;
   double gtimingLoopNCO;
   double gphaseAdjust;
};

extern struct timingloopGlobalType *ptimingloopGlobalData;

// #define timingLoopKp       (ptimingloopGlobalData->gtimingLoopKp   )
// #define timingLoopKi       (ptimingloopGlobalData->gtimingLoopKi   )
// #define timingLoopNCO      (ptimingloopGlobalData->gtimingLoopNCO  )
// #define timingPhaseError   (ptimingloopGlobalData->gaccumPhaseError)
// #define timingPhaseAdjust  (ptimingloopGlobalData->gphaseAdjust    )
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
/* CRL */
struct carrierLoopGlobalType {
   double gcarrierLoopKp;
   double gcarrierLoopKi;
   ///////////////////////
   double gcarrierLoopPhi;
   double gcarrierOffset;
   double gcarrierPhase;
   double gcarrierIFreq;

   double gCoarseFreqOffset;
};

extern struct carrierLoopGlobalType *pcarrierloopGlobalData;

// #define carrierLoopKp     (pcarrierloopGlobalData->gcarrierLoopKp   )
// #define carrierLoopKi     (pcarrierloopGlobalData->gcarrierLoopKi   )
// #define carrierLoopPhi    (pcarrierloopGlobalData->gcarrierLoopPhi  )
// #define carrierOffset     (pcarrierloopGlobalData->gcarrierOffset   )
// #define carrierPhaseError (pcarrierloopGlobalData->gcarrierPhase    )
// #define carrierIFreq      (pcarrierloopGlobalData->gcarrierIFreq    )
// #define carrierCFO        (pcarrierloopGlobalData->gCoarseFreqOffset)
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
/* resampler */
struct resamplerGlobalType {
      double alpha;
};

extern struct resamplerGlobalType *presamplerGlobalData;

// #define resamplerAlpha  (presamplerGlobalData->alpha)
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
/* SYR/DFA */
struct dfaGlobalType {
   int gdfaMode;
   int gdfaGuard;
   int gdfaModeSize;
   int gdfaGuardSize;
   int gdfaHMax;
   int gdfaDMax;
   int gdfaQAMMode;
   int gdfaCodeRate;
   int gdfaSymbolPerFrame;
   int gdfaSampleCounter;
   int gdfaStreams;
};

extern struct dfaGlobalType *pdfaGlobalData;

#define dfaModeSize       (pdfaGlobalData->gdfaModeSize)
#define dfaGuardSize      (pdfaGlobalData->gdfaGuardSize)
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
/* tcr */
struct tcrGlobalType {
      double gtcrIFreq;
      int    gtcrIFreqValid;

      double gtcrPhasemean;
      double gtcrPhasegrad;
      int    gtcrPhaseValid;

      int    gtcrUsingTPS;
};

extern struct tcrGlobalType *ptcrGlobalData;

// #define tcrEnableTPS  (ptcrGlobalData->gtcrUsingTPS  )
// #define tcrIFreq      (ptcrGlobalData->gtcrIFreq     )
// #define tcrIFreqValid (ptcrGlobalData->gtcrIFreqValid)

// #define tcrPhasemean  (ptcrGlobalData->gtcrPhasemean )
// #define tcrPhasegrad  (ptcrGlobalData->gtcrPhasegrad )
// #define tcrPhaseValid (ptcrGlobalData->gtcrPhaseValid)
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
/* demapper */
struct dmpGlobalType {
      double gdmpQAMThr;
      int    gdmpISel;
};

extern struct dmpGlobalType *pdmpGlobalData;

// #define dmpQAMThr  (pdmpGlobalData->gdmpQAMThr  )
// #define dmpISel    (pdmpGlobalData->gdmpISel    )
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
/* CPR */
struct cprGlobalType {
      double gcprPhi;
};

extern struct cprGlobalType *pcprGlobalData;

// #define cprPhi  (pcprGlobalData->gcprPhi)
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
/* DEBUG */
struct dbgGlobalType {
      int gcarrierOffset;
      int gtimingAdjust;
      int gfftTriggerOffset;
      
      int gdfaSampleCounter;
      int gdfaFreqoff;
      int gdfaMaxIDX;
      
      ////////////////////////
      // CRL/TRL matching
      double dbgcarrierIFreq;
      double dbgcarrierPhaseError;
      double dbgtimingAdjust;
      ///////////////////////

      int    gtcrtpsBit;
      int    gtcrAngleDiffSum;

      int    gs2bState;
      int    gs2bValue;
      int    gs2bCBits;
};

extern struct dbgGlobalType *pdbgGlobalData;

// #define dbgCarrierOffset    (pdbgGlobalData->gcarrierOffset   )
// #define dbgTimingAdjust     (pdbgGlobalData->gtimingAdjust    )
// #define dbgTriggerOffset    (pdbgGlobalData->gfftTriggerOffset)

// #define dbgDFASampleCounter (pdbgGlobalData->gdfaSampleCounter)
// #define dbgDFAFreqOffset    (pdbgGlobalData->gdfaFreqoff      )
// #define dbgDFAMaxIDX        (pdbgGlobalData->gdfaMaxIDX       )

// #define dbgCRLIFreq         ( pdbgGlobalData->dbgcarrierIFreq      )
// #define dbgCRLPhaseErr      ( pdbgGlobalData->dbgcarrierPhaseError )
// #define dbgTRLAdjust        ( pdbgGlobalData->dbgtimingAdjust      )

// #define dbgTCRTPSBit        ( pdbgGlobalData->gtcrtpsBit           )
// #define dbgTCRAngleDiffSum  ( pdbgGlobalData->gtcrAngleDiffSum     )

#define dbgS2BState         ( pdbgGlobalData->gs2bState )
#define dbgS2BValue         ( pdbgGlobalData->gs2bValue )
#define dbgS2BCBits         ( pdbgGlobalData->gs2bCBits )
///////////////////////////////////////////////////////////////////////
#endif
