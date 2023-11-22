#ifndef TREMOLO_H
#define TREMOLO_H

#include <math.h>
#include "sin_table.h"

typedef enum
{
	kWaveformSine = 1,
	kWaveformTriangle,
} wave_forms_t;

DSPfract saturation_tremolo(DSPaccum in);
DSPaccum lfo(DSPfract phase);
void processBlock(__memY DSPfract* input, __memY DSPfract* output, DSPaccum* accum_ph, DSPfract postgain);

#endif // !TREMOLO_H

