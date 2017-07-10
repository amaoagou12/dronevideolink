#include <math.h>

#include "ofdm.h"
#include "fixopr.h"
#include "rotate.h"

#define IF_FREQ_BITWIDTH   ( 30   )
#define CARRIER_FREQ_FRAC  ( 20   )
#define CARRIER_PHASE_BITS ( 30   )

static void rotateX(
  double   ang,
  double   xi, double   xq,
  double & yi, double & yq
  )
{
   double cosa = cos(ang * PI);
   double sina = sin(ang * PI);

   int sgncosa = ((cosa < 0.0) ? 0 : 1);
   int sgnsina = ((sina < 0.0) ? 0 : 1);

   cosa = fabs(cosa);
   sina = fabs(sina);

   cosa = fixRoundS(cosa, 1, 11);
   sina = fixRoundS(sina, 1, 11);

   cosa = fixClipS (cosa, 0, 11);
   sina = fixClipS (sina, 0, 11);

   if (sgncosa == 0){
      cosa = -cosa;
   }

   if (sgnsina == 0){
      sina = -sina;
   }

   double xx = xi;
   double yy = xq;

   double xx_cos = xx * cosa;
   double xx_sin = xx * sina;
   double yy_cos = yy * cosa;
   double yy_sin = yy * sina;

   double ii = xx_cos - yy_sin;
   double qq = xx_sin + yy_cos;

   ii = fixRoundS(ii, 4, 9);
   qq = fixRoundS(qq, 4, 9);

   ii = fixClipS (ii, 2, 9);
   qq = fixClipS (qq, 2, 9);

   yi = ii;
   yq = qq;
}

#include "itb.h"

CITB::CITB(double ifFreq, double samplingRate)
{
   phi   = 0.0;
   ifreq = fixRoundS(((ifFreq) / (samplingRate)), 0, IF_FREQ_BITWIDTH);

   //////////////////////////////////
   // CRL
   carrierLoopKp = 1.0/8.0;
   carrierLoopKi = 1.0/32.0;

   carrierPhaseError = 0.0;
   carrierOffset     = 0.0;
   carrierCFO        = 0.0;
   //////////////////////////////////
};

void CITB::carrierLoopSetParameters(double Kp, double Ki)
{
   Kp = Kp * 2.0;
   Ki = Ki * 8.0;
   
   carrierLoopKp = fixRoundS(Kp, 0, 10) / 2.0;
   carrierLoopKi = fixRoundS(Ki, 0, 10) / 8.0;

   // carierloopKi cannot be zero 
   if (carrierLoopKi < (1.0 / (1 << 13)))
   {
      carrierLoopKi = (1.0 / (1 << 13));
   }
}

void CITB::doRotate(
   double   ipI,
   double   ipQ,
   double & opI,
   double & opQ
   )
{
   #define bitsUsedForAngleRotation (18)

   ipI = fixRoundS(ipI, 2, 9);
   ipQ = fixRoundS(ipQ, 2, 9);

#if (0)   
   ////////////////////////////////////////
   int ang = ((int)(fixTrunc(phi, 0, 17) * (1 << 17)));

   opI = ipI;
   opQ = ipQ;

   rotate(opI, opQ, ang, 10, 17, 13);
   ////////////////////////////////////////

   ////////////////////////////////////////
   // -------------------------------------
   // do fix for rotate
   opI = opI * 155.0 / 128.0;
   opQ = opQ * 155.0 / 128.0;

   opI = fixRoundS(opI, 5, 9);
   opQ = fixRoundS(opQ, 5, 9);

   opI = fixClipS (opI, 2, 9);
   opQ = fixClipS (opQ, 2, 9);
   // -------------------------------------
   ////////////////////////////////////////

#else

   double ang = phi * 2.0;
   ang = fixTrunc(ang, 0, 13);
   
   rotateX(
      ang,
      ipI, ipQ,
      opI, opQ
      );

#endif

   phi = phi - ifreq  + (carrierPhaseError - carrierCFO) / (resamplerRatio * DecimatorRate);
};

void CITB::carrierLoopUpdatePhaseError(
   double phaseError
)
{
   double tAdj;
   
   /* adjust accumulated phase error to adjust IFreq */
   phaseError = fixRoundS(phaseError, 2, 20);
   
   tAdj = carrierLoopKi * phaseError; // s2.20 * s-3.13 = s0.33
   tAdj = fixRoundS(tAdj, 0, CARRIER_FREQ_FRAC);
   
   // integration part (frequency adjust)
   carrierOffset = carrierOffset - tAdj;
   carrierOffset = fixClipS(carrierOffset, 0, CARRIER_FREQ_FRAC);

   carrierPhaseError = carrierOffset / ((double)(dfaModeSize));
   carrierPhaseError = fixRoundS(carrierPhaseError, 0, CARRIER_PHASE_BITS);
};
