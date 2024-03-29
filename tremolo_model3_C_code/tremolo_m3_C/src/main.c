#include <stdio.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <string.h>
#include <stdlib.h>
#include <dsplib\timers.h>
#include "tremolo.h"

// User commands
DSPfract input_gain;
DSPfract headroom_gain;
DSPint enable;
DSPint mode;

// Processing related variables
DSPfract tremolo_postGain;	// postgain for Ls and Rs channels
DSPfract LR_postGain;		// postgain for L and R channels
DSPfract limiterThreshold = 0.999;

// Parameters for tremolo effect
DSPaccum phLeft; 	// current left channel phase
DSPaccum phRight; 	// current right channel phase

// IO Buffers
__memY DSPfract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];

// Maps the mode to the number of output channels(e.g. if mode is 2, we look in our array mode_to_num_out_ch
// on index 2 and read number of out channels)
static DSPint mode_to_num_out_ch[4] = {5, 2, 2, 3};

// Set all user controls and gains
void initGainProcessing(DSPfract tremoloPostGainValue, DSPfract LRPostGainValue)
{
	input_gain = (DSPfract) 0.999; //0.501187;
	headroom_gain = (DSPfract) 0.999; //0.707946;
	tremolo_postGain = tremoloPostGainValue;
	LR_postGain = LRPostGainValue;

	enable = 1;
	mode = 0;

	phLeft = 0;
	phRight = 0;
}

DSPfract saturation(DSPaccum in)
{
	// Simple limiter
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

void processing(__memY DSPfract pIn[][BLOCK_SIZE], __memY DSPfract pOut[][BLOCK_SIZE])
{
	// Iterator variable
	DSPint i;

	// Pointers to channals in In buffer
	__memY DSPfract* L_CH_In_Ptr = *(pIn + LEFT_CH);
	__memY DSPfract* R_CH_In_Ptr = *(pIn + RIGHT_CH);

	// Pointers to channals in Out buffer
	__memY DSPfract* L_CH_Out_Ptr = *(pOut + LEFT_CH);
	__memY DSPfract* R_CH_Out_Ptr = *(pOut + RIGHT_CH);
	__memY DSPfract* C_CH_Out_Ptr = *(pOut + CENTER_CH);
	__memY DSPfract* Ls_CH_Out_Ptr = *(pOut + LS_CH);
	__memY DSPfract* Rs_CH_Out_Ptr = *(pOut + RS_CH);

	// Temporary (auxiliary) variables for addition and multiplication
	DSPaccum accum_LR;
	DSPaccum accum_R;
	DSPfract fract_mul;
	DSPaccum accum_saturation;

	// first stage, apply input gain (common stage for all modes)
	for (i = 0; i < BLOCK_SIZE; i++)
	{
		*L_CH_In_Ptr = (DSPfract)*L_CH_In_Ptr * input_gain;
		*R_CH_In_Ptr = (DSPfract)*R_CH_In_Ptr * input_gain;

		L_CH_In_Ptr++;
		R_CH_In_Ptr++;
	}

	// Reposition pointers to L and R channels
	L_CH_In_Ptr = *(pIn + LEFT_CH);
	R_CH_In_Ptr = *(pIn + RIGHT_CH);


	// Second stage, apply tremolo on Ls and Rs
	processBlock(L_CH_In_Ptr, Ls_CH_Out_Ptr, &phLeft, tremolo_postGain);
	processBlock(R_CH_In_Ptr, Rs_CH_Out_Ptr, &phRight, tremolo_postGain);

	for (i = 0; i < BLOCK_SIZE; i++)
	{
		// second stage, sum L and R channels from first stage and apply headroom gain

		accum_LR = (DSPfract) *L_CH_In_Ptr;
		accum_R = (DSPfract)*R_CH_In_Ptr;
		accum_LR = accum_LR + accum_R;

		accum_LR >>= 1;
		fract_mul = accum_LR;
		accum_LR = fract_mul * headroom_gain;

		accum_saturation = accum_LR << 1;
		*C_CH_Out_Ptr = saturation(accum_saturation);

		// third stage, apply post gain on L and R channels (-6dB)
		fract_mul = accum_LR;
		accum_LR = fract_mul * LR_postGain;
		accum_LR <<= 1;

		*L_CH_Out_Ptr = saturation(accum_LR);
		*R_CH_Out_Ptr = (DSPfract)*L_CH_Out_Ptr;

		// third stage, apply post gain on tremolo (Ls and Rs) channels (-2dB)
		/**Ls_CH_Out_Ptr = saturation(*Ls_CH_Out_Ptr * tremolo_postGain);
		*Rs_CH_Out_Ptr = saturation(*Rs_CH_Out_Ptr * tremolo_postGain);*/

		L_CH_In_Ptr++;
		R_CH_In_Ptr++;
		L_CH_Out_Ptr++;
		R_CH_Out_Ptr++;
		C_CH_Out_Ptr++;
		Ls_CH_Out_Ptr++;
		Rs_CH_Out_Ptr++;
	}

}

int main(int argc, char *argv[])
 {
    WAVREAD_HANDLE *wav_in;
    WAVWRITE_HANDLE *wav_out;

	char WavInputName[256];
	char WavOutputName[256];

    DSPint inChannels;
    DSPint outChannels;
    DSPint bitsPerSample;
    DSPint sampleRate;
    DSPint iNumSamples;
    DSPint i;
    DSPint j;
    DSPint initial_output_ch;
    DSPint a;
    unsigned long long count1, count2, spent_cycles;


    // Init gains
    initGainProcessing(MINUS_2DB, MINUS_6DB);

	// Init channel buffers
	for(i=0; i<MAX_NUM_CHANNEL; i++)
		for(j=0; j<BLOCK_SIZE; j++)
			sampleBuffer[i][j] = FRACT_NUM(0.0);

	// Open input wav file
	//-------------------------------------------------
	strcpy(WavInputName,argv[0]);
	wav_in = cl_wavread_open(WavInputName);
	 if(wav_in == NULL)
    {
        printf("Error: Could not open wavefile.\n");
        return -1;
    }
	//-------------------------------------------------

	// Read input wav header
	//-------------------------------------------------
	inChannels = cl_wavread_getnchannels(wav_in);
    bitsPerSample = cl_wavread_bits_per_sample(wav_in);
    sampleRate = cl_wavread_frame_rate(wav_in);
    iNumSamples =  cl_wavread_number_of_frames(wav_in);
	//-------------------------------------------------

	// Open output wav file
	//-------------------------------------------------
	strcpy(WavOutputName,argv[1]);

	if (enable)
	{
		// only mode 1 has 5 output channels, otherwise are 2
		outChannels = mode_to_num_out_ch[mode];

		// mode 3 has only Ls, Rs output channels, so we set LS_CH as initial (starter) channel, otherwise is LEFT_CH.
		initial_output_ch = (mode == 2) ? LS_CH : LEFT_CH;
	}
	else // enable is off (do passthrough only)
	{
		outChannels = INPUT_NUM_CHANNELS;
		initial_output_ch = LEFT_CH;
	}

	wav_out = cl_wavwrite_open(WavOutputName, bitsPerSample, outChannels, sampleRate);
	if(!wav_out)
    {
        printf("Error: Could not open wavefile.\n");
        return -1;
    }
	//-------------------------------------------------

	// Processing loop
	//-------------------------------------------------
    {
		int i;
		int j;
		int k;
		int sample;

		// exact file length should be handled correctly...
		for(i=0; i<iNumSamples/BLOCK_SIZE; i++)
		{
			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=0; k<inChannels; k++)
				{
					sample = cl_wavread_recvsample(wav_in);
        			sampleBuffer[k][j] = rbits(sample);
				}
			}


			count1 = cl_get_cycle_count();
			// pozvati processing funkciju ovde
			processing(sampleBuffer, sampleBuffer);
			count2 = cl_get_cycle_count();

			spent_cycles = count2 - count1;
			printf("%llu\n", spent_cycles);


			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=initial_output_ch; k<outChannels + initial_output_ch; k++)
				{
					sample = bitsr(sampleBuffer[k][j]);
					cl_wavwrite_sendsample(wav_out, sample);
				}
			}
		}
	}

	// Close files
	//-------------------------------------------------
    cl_wavread_close(wav_in);
    cl_wavwrite_close(wav_out);
	//-------------------------------------------------

    return 0;
 }
