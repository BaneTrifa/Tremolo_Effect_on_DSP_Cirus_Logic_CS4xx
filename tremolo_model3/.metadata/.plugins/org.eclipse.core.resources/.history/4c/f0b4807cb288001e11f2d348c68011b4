#include "tremolo.h"

DSPfract saturation_tremolo(DSPaccum in)
{
	DSPfract limiterThreshold = 0.999;
	// Simple limiter since we know that pre-Gain adds 6dB
	if (in > limiterThreshold)
	{
		return limiterThreshold;
	}
	else if (in < -limiterThreshold)
	{
		return -limiterThreshold;
	}

	return in;
}

DSPaccum lfo(DSPfract phase)
{
	DSPfract fract_pi;
	DSPaccum accum_pi;

	accum_pi = (DSPaccum)PI;
	accum_pi >>= 2;

	fract_pi = accum_pi;
	accum_pi = fract_pi * phase;
	accum_pi <<= 3;

	accum_pi = (DSPaccum)gen_sin(accum_pi);
	accum_pi >>= 1;

	accum_pi += (DSPaccum)0.5;

	return accum_pi;
}

void processBlock (__memY DSPfract* input, __memY DSPfract* output, DSPaccum* accum_ph, DSPfract postgain)
{

	DSPfract ph;
	DSPaccum accum_lfo;
	const DSPfract in;
	DSPint i;

	ph = *accum_ph;

	for (i = 0; i < BLOCK_SIZE; ++i)
	{

		in = *input;

		// Ring modulation is easy! Just multiply the waveform by a periodic carrier
		accum_lfo = (DSPaccum) lfo(ph);
		accum_lfo = (DSPaccum)1.0 - accum_lfo;
		accum_lfo >>= 1;

		accum_lfo = (DSPfract)accum_lfo * in;
		accum_lfo = (DSPfract)accum_lfo * postgain;

		accum_lfo <<= 1;

		*output = saturation_tremolo(accum_lfo);

		// Update the carrier and LFO phases, keeping them in the range 0-1
		

		*accum_ph += (DSPaccum)PH_STEP;

		if (*accum_ph >= (DSPaccum)1.0)
			*accum_ph -= (DSPaccum)1.0;

		ph = *accum_ph;

		input++;
		output++;
	}


	// Having made a local copy of the state variables for each channel, now transfer the result

	// back to the main state variable so they will be preserved for the next call of processBlock()

}


