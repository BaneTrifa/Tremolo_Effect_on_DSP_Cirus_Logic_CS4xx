#include "tremolo.h"

void init(tremolo_struct_t* data)
{

	// Set default values:
	data->LFO_frequency = 2.0;
	data->depth = 1.0;
	data->waveform = kWaveformSine;
	data->lfoPhase = 0.0;
	data->inverseSampleRate = 1.0 / SAMPLE_RATE;
}

double lfo(double phase, wave_forms_t waveform)

{

	switch (waveform)

	{

	case kWaveformTriangle:

		if (phase < 0.25)

			return 0.5 + 2.0 * phase;

		else if (phase < 0.75)

			return 1.0 - 2.0 * (phase - 0.25);

		else

			return 2.0 * (phase - 0.75);

	case kWaveformSine:

	default:

		return 0.5 + 0.5 * sin(2.0 * PI * phase);

	}

}

void processBlock(double* input, double* output, tremolo_struct_t* data, int numSamples)
{

	double ph;


	// Make a temporary copy of any state variables which need to be

	// maintained between calls to processBlock(). Each channel needs to be processed identically

	// which means that the activity of processing one channel can't affect the state variable for

	// the next channel.



	ph = data->lfoPhase;



	for (int i = 0; i < numSamples; ++i)
	{

		const double in = input[i];

		// Ring modulation is easy! Just multiply the waveform by a periodic carrier

		output[i] = in * (1.0 - data->depth * lfo(ph, data->waveform));

		// Update the carrier and LFO phases, keeping them in the range 0-1

		ph += data->LFO_frequency * data->inverseSampleRate;

		if (ph >= 1.0)

			ph -= 1.0;

	}


	// Having made a local copy of the state variables for each channel, now transfer the result

	// back to the main state variable so they will be preserved for the next call of processBlock()



	data->lfoPhase = ph;

}


