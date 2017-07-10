#ifndef __OFDMC_ITB_H__
#define __OFDMC_ITB_H__

class CITB
{
   double phi;
   double ifreq;

   /////////////////////////////////
   // CRL (moved to itb)          //
   /////////////////////////////////
   double carrierLoopKp;
   double carrierLoopKi;

   double carrierOffset;
   double carrierPhaseError;
   double carrierCFO;
   /////////////////////////////////

public:
   CITB(
      double ifFreq, 
      double samplingRate
      );

   void doRotate(
      double   ipI,
      double   ipQ,
      double & opI,
      double & opQ
      );

   void carrierLoopSetParameters(double Kp, double Ki);

   void carrierLoopUpdatePhaseError(
      double phaseError
      );

   double crlOffset()
   {
      return (carrierPhaseError - carrierCFO);
   };
};

#endif
