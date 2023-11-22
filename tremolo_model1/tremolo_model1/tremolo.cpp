#include "tremolo.h"


void init(tremolo_struct_t* data)
{
	// Set default values:
	data->lfoPhase = 0.0;
}

double lfo(double phase)
{
	return 0.5 + 0.5 * gen_sin(2.0 * PI * phase);
}

void processBlock(double* input, double* output, tremolo_struct_t* data)
{

	double ph;


	// Make a temporary copy of any state variables which need to be

	// maintained between calls to processBlock(). Each channel needs to be processed identically

	// which means that the activity of processing one channel can't affect the state variable for

	// the next channel.



	ph = data->lfoPhase;



	for (int i = 0; i < BLOCK_SIZE; ++i)
	{

		const double in = *input;

		// Ring modulation is easy! Just multiply the waveform by a periodic carrier
		*output = in * (1.0 - lfo(ph));

		// Update LFO phases, keeping them in the range 0-1
		ph += PH_STEP;

		if (ph >= 1.0)
			ph -= 1.0;

		input++;
		output++;
	}


	// Having made a local copy of the state variables for each channel, now transfer the result

	// back to the main state variable so they will be preserved for the next call of processBlock()

	data->lfoPhase = ph;

}


