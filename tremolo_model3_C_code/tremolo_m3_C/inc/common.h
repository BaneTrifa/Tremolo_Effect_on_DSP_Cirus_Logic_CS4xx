#ifndef _COMMON_H
#define _COMMON_H

#include <stdfix.h>

#if defined(__CCC)

#include <stdfix.h>

#define FRACT_NUM(x) (x##r)
#define LONG_FRACT_NUM(x) (x##lr)
#define ACCUM_NUM(x) (x##lk)

#define FRACT_NUM_HEX(x) (x##r)

#define FRACT_TO_INT_BIT_CONV(x) (bitsr(x))
#define INT_TO_FRACT_BIT_CONV(x) (rbits(x))

#define long_accum long accum
#define long_fract long fract

#endif

/////////////////////////////////////////////////////////////////////////////////
// Constant definitions
/////////////////////////////////////////////////////////////////////////////////
#define BLOCK_SIZE 16
#define INPUT_NUM_CHANNELS 2
#define MAX_NUM_CHANNEL 8

#define PI 3.141592653589
#define PI_2 1.5707963267945	// PI/2
#define PI_3_2 4.7123889803835	// 3PI/2

#define TABLE_SIZE 256 			// size of sine lookup table
#define PH_STEP 0.0000416 		// 2/48000 (freq/sample_rate)

#define LEFT_CH 0
#define RIGHT_CH 1
#define CENTER_CH 2
#define LS_CH 3
#define RS_CH 4

#define MINUS_2DB 0.794328		// -2dB, postgain for Ls and Rs channels
#define MINUS_6DB 0.501187		// -6dB, postgain for L and R channels, and default value for input gain
#define MINUS_3DB 0.707946		// -3dB, default headroom gain
/////////////////////////////////////////////////////////////////////////////////


/* DSP type definitions */
typedef short DSPshort;					/* DSP integer */
typedef unsigned short DSPushort;		/* DSP unsigned integer */
typedef int DSPint;						/* native integer */
typedef fract DSPfract;					/* DSP fixed-point fractional, data reg, memory word format s.31 */
typedef long_accum DSPaccum;					/* DSP fixed-point fractional, accum reg format s8.63 */

#endif //_COMMON_H
