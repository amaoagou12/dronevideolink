#ifndef __OFDMC_RESP_H__
#define __OFDMC_RESP_H__

class CRESP
{
   /* registers */
   double IDelayedOneSample,
          IDelayedTwoSample,
          IDelayedThrSample;

   double QDelayedOneSample,
          QDelayedTwoSample,
          QDelayedThrSample;

   double IDelayedOneSampleNoAlpha,
          IDelayedTwoSampleNoAlpha;

   double QDelayedOneSampleNoAlpha,
          QDelayedTwoSampleNoAlpha;

   double resamplerAlpha;

public:
   CRESP();
   void pwbResamplerFourSamplesPolyDegreeTwo(
      double   u,
      double   Iin,  double   Qin,
      double & Iout, double & Qout
      );

   double getAlpha()
   {
      return resamplerAlpha;
   };
};

#endif
