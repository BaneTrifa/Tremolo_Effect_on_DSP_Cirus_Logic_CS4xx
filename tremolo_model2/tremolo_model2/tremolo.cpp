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

void init(tremolo_struct_t* data)
{
	// Set default values:
	data->accum_ph = (DSPaccum)0;
}

DSPaccum lfo(DSPfract phase)
{
	// scale Pi by 4 (2 bits)
	DSPaccum accum_pi = (DSPaccum)PI;
	accum_pi >>= 2;

	DSPfract fract_pi = accum_pi;
	accum_pi = fract_pi * phase;	// multiply phase by PI
	accum_pi <<= 3;	// resacle result by 2 bits, and one more shift for multiplication by 2

	accum_pi = (DSPaccum)gen_sin(accum_pi);	// finde sine value 
	accum_pi >>= 1;	// multiply result by 0.5

	accum_pi += (DSPaccum)0.5;	

	return accum_pi;
}

void processBlock(DSPfract* input, DSPfract* output, tremolo_struct_t* data, DSPfract postgain)
{

	// Make local copy of phase
	DSPfract ph;


	// Make a temporary copy of any state variables which need to be

	// maintained between calls to processBlock(). Each channel needs to be processed identically

	// which means that the activity of processing one channel can't affect the state variable for

	// the next channel.



	ph = data->accum_ph;



	for (int i = 0; i < BLOCK_SIZE; ++i)
	{

		const DSPfract in = *input;

		// Ring modulation is easy! Just multiply the waveform by a periodic carrier
		DSPaccum accum_lfo = (DSPaccum) lfo(ph);
		accum_lfo = (DSPaccum)1.0 - accum_lfo;
		accum_lfo >>= 1;	// scale value by 2

		accum_lfo = (DSPfract)accum_lfo * in;	
		accum_lfo = (DSPfract)accum_lfo * postgain;	// apply tremolo postgain

		accum_lfo <<= 1;	// rescale value by 2

		*output = saturation_tremolo(accum_lfo);

		// Update the carrier and LFO phases, keeping them in the range 0-1
		
		// Update phase
		data->accum_ph += (DSPaccum)PH_STEP;

		// Keep phase in range [0, 1)
		if (data->accum_ph >= (DSPaccum)1.0)
			data->accum_ph -= (DSPaccum)1.0;

		ph = data->accum_ph;

		input++;
		output++;
	}


	// Having made a local copy of the state variables for each channel, now transfer the result

	// back to the main state variable so they will be preserved for the next call of processBlock()

}


