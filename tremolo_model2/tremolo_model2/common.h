#ifndef COMMON_H
#define COMMON_H

#include "stdfix_emu.h"

#define PI 3.141592653589
#define PI_2 1.5707963267945
#define PI_3_2 4.7123889803835

/* Basic constants */
/* TO DO: Move defined constants here */
/////////////////////////////////////////////////////////////////////////////////
// Constant definitions
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////

/* DSP type definitions */
/* DSP integer */
typedef short DSPshort;
/* DSP unsigned integer */
typedef unsigned short DSPushort;
/* native integer */
typedef int DSPint;
/* DSP fixed-point fractional */
typedef fract DSPfract;
/* DSP fixed-point fractional */
typedef long_accum DSPaccum;

#endif
