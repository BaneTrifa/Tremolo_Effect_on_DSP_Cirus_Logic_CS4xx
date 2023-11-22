#ifndef TREMOLO_H
#define TREMOLO_H

#include <math.h>
#include "sin_table.h"

#define SAMPLE_RATE 48000
#define BLOCK_SIZE 16
#define PI 3.141592653589
#define PH_STEP 0.0000416

typedef enum
{
	kWaveformSine = 1,
	kWaveformTriangle,
} wave_forms_t;


// Adjustable parameters:
typedef struct {
	double lfoPhase;
} tremolo_struct_t;


void init(tremolo_struct_t* data);
double lfo(double phase);
void processBlock(double* input, double* output, tremolo_struct_t* data);

#endif // !TREMOLO_H

