
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "WAVheader.h"
#include "tremolo.h"

#define BLOCK_SIZE 16
#define MAX_NUM_CHANNEL 8

// Number of input channels
#define INPUT_NUM_CHANNELS 2

// In and out channel IDs. 
#define LEFT_CH 0
#define RIGHT_CH 1

// Out channel IDs. 
#define CENTER_CH 2
#define LS_CH 3
#define RS_CH 4

// Gain linear values. 
#define MINUS_2DB 0.794328
#define MINUS_6DB 0.501187

// User commands
static double input_gain;
static double headroom_gain;
static bool enable;
static int mode;

// IO Buffers
static double sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];

// Parameters for tremolo effect
tremolo_struct_t tremolo_parameters_L;
tremolo_struct_t tremolo_parameters_R;

// Processing related variables
static double tremolo_postGain;
static double LR_postGain;
static double variablesGain[INPUT_NUM_CHANNELS];
static double limiterThreshold = 0.999;

// Maps the mode to the number of output channels(e.g. if mode is 2, we look in our array mode_to_num_out_ch
// on index 2 and read number of out channels)
static int mode_to_num_out_ch[4] = {5, 2, 2, 3};


void initGainProcessing(double tremoloPostGainValue, double LRPostGainValue)
{
	tremolo_postGain = tremoloPostGainValue;
	LR_postGain = LRPostGainValue;
}

double saturation(double in)
{
	// Simple limiter since we know that pre-Gain adds 6dB
	if (in > limiterThreshold)
	{
		return fmin(in, limiterThreshold);
	}
	else if (in < -limiterThreshold)
	{
		return fmax(in, -limiterThreshold);
	}

	return in;
}

void processing(double pIn[][BLOCK_SIZE], double pOut[][BLOCK_SIZE])
{
	// Pointers to channals in In buffer
	double* L_CH_In_Ptr = *(pIn + LEFT_CH);
	double* R_CH_In_Ptr = *(pIn + RIGHT_CH);

	// Pointers to channals in Out buffer
	double* L_CH_Out_Ptr = *(pOut + LEFT_CH);
	double* R_CH_Out_Ptr = *(pOut + RIGHT_CH);
	double* C_CH_Out_Ptr = *(pOut + CENTER_CH);
	double* Ls_CH_Out_Ptr = *(pOut + LS_CH);
	double* Rs_CH_Out_Ptr = *(pOut + RS_CH);

	// first stage, apply input gain (common stage for all modes)
	for (int i = 0; i < BLOCK_SIZE; i++)
	{
		*L_CH_In_Ptr *= input_gain;
		*R_CH_In_Ptr *= input_gain;

		L_CH_In_Ptr++;
		R_CH_In_Ptr++;
	}

	// Reposition pointers to L and R channels
	L_CH_In_Ptr = *(pIn + LEFT_CH);
	R_CH_In_Ptr = *(pIn + RIGHT_CH);


	// Second stage, apply tremolo on Ls and Rs
	processBlock(L_CH_In_Ptr, Ls_CH_Out_Ptr, &tremolo_parameters_L);
	processBlock(R_CH_In_Ptr, Rs_CH_Out_Ptr, &tremolo_parameters_R);

	for (int i = 0; i < BLOCK_SIZE; i++)
	{
		// second stage, sum L and R channels from first stage and apply headroom gain
		*C_CH_Out_Ptr = *L_CH_In_Ptr + *R_CH_In_Ptr;
		*C_CH_Out_Ptr = *C_CH_Out_Ptr * headroom_gain;

		// third stage, apply post gain on L and R channels (-6dB)
		*L_CH_Out_Ptr = saturation(*C_CH_Out_Ptr * LR_postGain);
		*R_CH_Out_Ptr = *L_CH_Out_Ptr;
		*C_CH_Out_Ptr = saturation(*C_CH_Out_Ptr);

		// third stage, apply post gain on tremolo (Ls and Rs) channels (-2dB)
		*Ls_CH_Out_Ptr = saturation(*Ls_CH_Out_Ptr * tremolo_postGain);
		*Rs_CH_Out_Ptr = saturation(*Rs_CH_Out_Ptr * tremolo_postGain);

		L_CH_In_Ptr++;
		R_CH_In_Ptr++;
		L_CH_Out_Ptr++;
		R_CH_Out_Ptr++;
		C_CH_Out_Ptr++;
		Ls_CH_Out_Ptr++;
		Rs_CH_Out_Ptr++;
	}
			
}

/////////////////////////////////////////////////////////////////////////////////
// @Author	Branko Trifkovic
// @Date		November 2023  
//
// Function:
// main
//
// @param - argv[1] - Input file name
//        - argv[2] - Output file name
//        - argv[3] - Enable command
//        - argv[4] - Mode
//        - argv[5] - Input gain
//        - argv[6] - Headroom gain
// @return - success code
//
/////////////////////////////////////////////////////////////////////////////////
int main(int argc, char* argv[])
{
	if (argc != 7)
	{
		printf("~The required number of arguments is 6~\n");
		return -1;
	}

	FILE* wav_in = NULL;
	FILE* wav_out = NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr, outputWAVhdr;
	int initial_output_ch;
	
	// Load arguments
	enable = atoi(argv[3]);
	mode = atoi(argv[4]);
	input_gain = atof(argv[5]);
	headroom_gain = atof(argv[6]);

	// Init parameters for tremolo effect
	init(&tremolo_parameters_L);
	init(&tremolo_parameters_R);

	// Init gains
	initGainProcessing(MINUS_2DB, MINUS_6DB);
	
	// Init channel buffers
	for (int i = 0; i < MAX_NUM_CHANNEL; i++)
		memset(&sampleBuffer[i], 0, BLOCK_SIZE);

	// Open input and output wav files
	//-------------------------------------------------
	strcpy(WavInputName, argv[1]);
	wav_in = OpenWavFileForRead(WavInputName, (char *) "rb");
	strcpy(WavOutputName, argv[2]);
	wav_out = OpenWavFileForRead(WavOutputName, (char*) "wb");
	//-------------------------------------------------

	// Read input wav header
	//-------------------------------------------------
	ReadWavHeader(wav_in, inputWAVhdr);
	//-------------------------------------------------

	// Set up output WAV header
	//-------------------------------------------------	
	outputWAVhdr = inputWAVhdr;

	if (enable)
	{
		// only mode 1 has 5 output channels, otherwise are 2
		outputWAVhdr.fmt.NumChannels = mode_to_num_out_ch[mode];

		// mode 3 has only Ls, Rs output channels, so we set LS_CH as initial (starter) channel, otherwise is LEFT_CH. 
		initial_output_ch = (mode == 2) ? LS_CH : LEFT_CH;			
	}
	else // enable is off (do passthrough only)
	{
		outputWAVhdr.fmt.NumChannels = INPUT_NUM_CHANNELS;
		initial_output_ch = LEFT_CH;
	}

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size / inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate / inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign / inputWAVhdr.fmt.NumChannels;

	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size * outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate * outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign * outputWAVhdr.fmt.NumChannels;


	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out, outputWAVhdr);

	// Processing loop
	//-------------------------------------------------	
	{
		int sample;
		int BytesPerSample = inputWAVhdr.fmt.BitsPerSample / 8;
		const double SAMPLE_SCALE=  -(double)(1 << 31);		//2^31
		int iNumSamples = inputWAVhdr.data.SubChunk2Size / (inputWAVhdr.fmt.NumChannels * inputWAVhdr.fmt.BitsPerSample / 8);

		// exact file length should be handled correctly...
		for (int i = 0; i < iNumSamples / BLOCK_SIZE; i++)
		{
			for (int j = 0; j < BLOCK_SIZE; j++)
			{
				for (int k = 0; k < inputWAVhdr.fmt.NumChannels; k++)
				{
					sample = 0; //debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = sample / SAMPLE_SCALE;				// scale sample to 1.0/-1.0 range		
				}
			}

			if(enable) // enable is off (do passthrough only)
			{
				processing(sampleBuffer, sampleBuffer);
			}

			for (int j = 0; j < BLOCK_SIZE; j++)
			{
				for (int k = initial_output_ch; k < outputWAVhdr.fmt.NumChannels + initial_output_ch; k++)
				{
					sample = sampleBuffer[k][j] * SAMPLE_SCALE;	// crude, non-rounding 			
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample / 8, 1, wav_out);
				}
			}
		}
	}

	// Close files
	//-------------------------------------------------	
	fclose(wav_in);
	fclose(wav_out);
	//-------------------------------------------------	

	return 0;
}