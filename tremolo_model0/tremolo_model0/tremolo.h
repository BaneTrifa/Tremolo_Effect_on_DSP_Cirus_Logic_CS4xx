#ifndef TREMOLO_H
#define TREMOLO_H

#include <math.h>
#include "sin_table.h"

#define SAMPLE_RATE 48000
#define BLOCK_SIZE 16
#define PI 3.14159265358979323846
#define PH_STEP 0.0000416

typedef enum
{
	kWaveformSine = 1,
	kWaveformTriangle,
} wave_forms_t;

typedef struct {
	double lfoPhase;
} tremolo_struct_t;


void init(tremolo_struct_t* data);
double lfo(double phase);
void processBlock(double* input, double* output, tremolo_struct_t* data, int numSamples);

#endif // !TREMOLO_H

