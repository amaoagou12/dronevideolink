#ifndef __SYSTEM_TMI_H__
#define __SYSTEM_TMI_H__

/* 1, (DD * 2 * 66 / DMAX  ) MUST BE INTEGER
   2, (DD * 2 * 66 / LDPC_N) MUST BE INTEGER
 */

/* constants, base address of each branch */
const static int intlvrbaseaddr[12] = {
     0 * DD,
    11 * DD,
    21 * DD,
    30 * DD,
    38 * DD,
    45 * DD,
    51 * DD,
    56 * DD,
    60 * DD,
    63 * DD,
    65 * DD,
    66 * DD
};

class CTMI
{
   /* resgisters for indecs of every path */
   int      intlvrcurraddr[11];

   /* current path index */
   int      intlvrindex;

   /* interleaver memory */
   int    * intlvrmem;

public:   
   CTMI()
   {
      int i;

      intlvrmem = new int[128*DD];

      for (i = 0; i < 11; i++)
      {
         intlvrcurraddr[i] = intlvrbaseaddr[i];
      }
   
      intlvrindex = 0;
   
      memset(intlvrmem, 0, sizeof(int)*128*DD);
   };
   
   ~CTMI()
   {
     delete [] intlvrmem;
   }

   int timeInterleaver(
     int byteIn
   )
   {
       int byteOut;
       int pos;
   
       if (intlvrindex == 0){
           // directly output
           byteOut = byteIn;
   
           // update registers
           intlvrindex = 11;
       }
       else{

          pos = intlvrcurraddr[intlvrindex - 1];
           // read & write memory
          byteOut = intlvrmem[pos];
   
          intlvrmem[pos] = byteIn;
   
           // update registers
          intlvrcurraddr[intlvrindex - 1] = intlvrcurraddr[intlvrindex - 1] + 1;
          if (intlvrcurraddr[intlvrindex - 1] >= intlvrbaseaddr[intlvrindex]){
             intlvrcurraddr[intlvrindex - 1] = intlvrbaseaddr[intlvrindex - 1];
          }
          intlvrindex = intlvrindex - 1;
       }
      
       return byteOut;
   }
};

#endif
