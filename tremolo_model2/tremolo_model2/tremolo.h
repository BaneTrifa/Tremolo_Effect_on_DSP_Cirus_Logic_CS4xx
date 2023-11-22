#ifndef TREMOLO_H
#define TREMOLO_H

#include <math.h>
#include "sin_table.h"

#define SAMPLE_RATE 48000
#define BLOCK_SIZE 16
#define PH_STEP 0.0000416 // 2/48000 (freq/sample_rate)

typedef enum
{
	kWaveformSine = 1,
	kWaveformTriangle,
} wave_forms_t;


// Adjustable parameters:
typedef struct {
	DSPaccum accum_ph;
} tremolo_struct_t;


DSPfract saturation_tremolo(DSPaccum in);
void init(tremolo_struct_t* data);
DSPaccum lfo(DSPfract phase);
void processBlock(DSPfract* input, DSPfract* output, tremolo_struct_t* data, DSPfract postgain);

#endif // !TREMOLO_H

