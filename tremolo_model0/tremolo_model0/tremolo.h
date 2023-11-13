#ifndef TREMOLO_H
#define TREMOLO_H

#include <math.h>

#define SAMPLE_RATE 48000
#define BLOCK_SIZE 16
#define PI 3.14159265358979323846

typedef enum
{
	kWaveformSine = 1,
	kWaveformTriangle,
} wave_forms_t;


// Adjustable parameters:
typedef struct {
	int numChannels;

	double LFO_frequency;  // LFO frequency (Hz)

	double depth;      // Depth of effect (0-1)

	wave_forms_t   waveform;      // What shape should be used for the LFO

	double lfoPhase;

	double inverseSampleRate;
} tremolo_struct_t;


void init(tremolo_struct_t* data);
double lfo(double phase, wave_forms_t waveform);
void processBlock(double* input, double* output, tremolo_struct_t* data, int numSamples);

#endif // !TREMOLO_H

