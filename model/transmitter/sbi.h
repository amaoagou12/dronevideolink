#ifndef __SYSTEM_SBI_H__
#define __SYSTEM_SBI_H__

#include "ofdm.h"
#include "sdimap.h"

class CSBI
{
public:
   static void sbi_even(int mode, int *Iin, int *Iout)
   {
      int outindex;
      int M = dmaxes[mode];
      
      int * sdimap = SDIMAPEX(mode);
      for(int i = 0; i < M; i++)
      {
         outindex = sdimap[i];
         Iout[outindex] = Iin[i];
      }
   };
   
   static void sbi_odd(int mode, int *Iin, int *Iout)
   {
      int outindex;
      int M = dmaxes[mode];

      int * sdimap = SDIMAPEX(mode);
      for(int i = 0; i < M; i++)
      {
         outindex = sdimap[i]; 
         Iout[i] = Iin[outindex];
      }
   };
};

#endif
