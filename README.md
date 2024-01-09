# Designing a tremolo effect for the Cirus Logic CS48x platform

**What is tremolo effect?**

Tremolo is a modulation effect that rhythmically changes the volume of your signal. This can happen in a variety of ways, but here the tremolo effect is achieved by modulating the original signal with a sine wave.


## Description
The goal of the project is to implement channel combining based on the given scheme and table for the Cirus Logic CS48x platform.

<p align="center">
  <img width="821" alt="1" src="https://github.com/BaneTrifa/Tremolo_Effect_on_DSP_Cirus_Logic_CS4xx/assets/88882867/fdacc33e-81c2-4552-aae4-93cb44da4877">
</p>
<p align="center">
  <img width="629" alt="1" src="https://github.com/BaneTrifa/Tremolo_Effect_on_DSP_Cirus_Logic_CS4xx/assets/88882867/da744b7f-9cd0-4220-a391-7cda8da0e7ad">
</p>

<br />


## Setup environment 

The project was developed in Visual Studio 2022 and in a specific development environment for the target platform (CLIDE). Therefore, it is necessary to install VS2022 (or its newer version) and CLIDE.

To install CLIDE, follow the following instructions:

1. Download [CLIDE 7 SDK](https://drive.google.com/drive/folders/1Jz7YjG7sZtbufZ_kiKX1ml97FeD38vcM).

2. Run the cirrus_dsp_sdk_7_1_7.exe installer.

3. Follow the wizard steps for installation (install it to the default location C:/CirrusDSP, follow "Next" for all other options).

4. Install the patch from the "patch" folder by following the steps outlined in the readme.txt file.

5. CLIDE is now installed and ready to use (you can launch it from the Start menu).

<br />

## Algorithm implementation flow for the target platform

Models 0, 1, and 2 are written in C, while model 3 and the final model are written in assembly.

<p align="center">
  <img width="226" alt="3" src="https://github.com/BaneTrifa/Tremolo_Effect_on_DSP_Cirus_Logic_CS4xx/assets/88882867/87b587a0-0c70-410c-b2d6-a0513580655a">
</p>

<br/>

### Model 0 - reference code

The main function of Model 0 takes the following command line arguments:

    1. argv[1] - Input file name
    2. argv[2] - Output file name
    3. argv[3] - Enable command
    4. argv[4] - Mode
    5. argv[5] - Input gain
    6. argv[6] - Headroom gain

In Model 0, a reference code has been developed for further algorithm development. The algorithm expects a stereo signal as input and places it in the variable sampleBuffer with the left channel positioned at index 0 and the right channel positioned at index 1.

The main part of the algorithm occurs in the processing function in the main.cpp file. To achieve the tremolo effect, the processBlock function from the tremolo.cpp file is called. This function modulates the input signal with a sinusoidal signal to produce the tremolo effect.

Since the tremolo modulates our input signal with a sinusoidal waveform, it's important to note that we won't be able to use the built-in function from the math.h library due to platform constraints. As a substitute for the sine function, we'll use a pre-generated sine table with 256 elements. The table will contain sine values for all angles between 0 and PI/2 (the first quadrant). The remaining three quadrants will be transformed and mapped to the first quadrant. 

As test vectors for the development of this algorithm, the following audio files will be used: WhiteNoise.wav, Amp_sweep.wav, and Multi_Tone.wav. The output values from Model 0 serve as reference values, and the output of each subsequent phase is considered correct if it matches these values. Model 0 should not be modified in the further development of the application.

<br/>

### Model 1 - Functional Optimization of C Code

Since the reference code (Model 0) is typically implemented without knowledge of the target platform's characteristics and constraints, the first step in further development is functional optimization of the C code tailored to a DSP processor.

Functional optimization of C code includes:

    1. Data organization
    2. Reducing the number of arguments in processing functions
    3. Eliminating local structures
    4. Optimizing program loops
    5. Accessing data efficiently


The first four items have already been addressed in Model 0, which involves removing most of the arguments and local variables from processing functions and transferring them as global variables to alleviate the registers and stack on the target platform, but at the expense of memory load. 

The main functional optimization performed in Model 1 is **data access**. In this software development phase, data access operations need to be adapted to the behavior of the address generator. This adaptation involves replacing indirect access to array elements, using indices and C-style access operators, with access through pointers to elements.

<br/>

### Model 2 - DSP Arithmetic Adaptation

The reference code of the algorithm from Model 1 is based on floating-point arithmetic, which cannot be directly compiled for processors with fixed-point arithmetic without modifications. In this development phase, it is necessary to adapt the functionally optimized code to the arithmetic of the target platform while ensuring that it remains translatable by a general-purpose compiler.


In order for the modified code to remain translatable by a general-purpose compiler, classes are introduced to emulate fixed-point types.
The emulation classes introduced in Model 2 are located in the **fixed_point_math.h** header file. Implementations of operations between objects of emulation classes can be found in the **fixed_point_math.cpp** and **stdfix_emu.cpp** files.

The most important characteristic of our target platform, according to which we adapt the code in Model 2, is the existence of only two types of registers for storing data:

    1. Registers for data in the S.31 format (where the memory of our DSP processor is also in this format, capable of holding values in the range [-1, 1))
    2. Accumulation registers in the S.8.63 format (capable of holding values in the range [-256, 256))

<br/>

### Model 3 - Translating C Code to Assembly

The previous models, 0, 1, were developed in Visual Studio. Since in Model 2, we managed to adapt our code to the arithmetic of our target DSP (fixed-point arithmetic), further algorithm development continues in the specialized CLIDE programming environment.

In Model 3, our main goal is to translate our code and the functions performing sample processing into assembly code for our target platform. In this step, we have not completely eliminated C code, but we have minimized it. The main.cpp file remains in C, containing functionalities for reading from a WAV file and writing to a WAV file.

<br/>

### Final Model - Code Executable on the Target Platform

In the final model, there aren't many changes and code refinements. The primary task is to integrate our algorithm with the operating system of the target platform. In this step, we completely eliminate C code and transfer exclusively to our assembly code (files processing.a, tremolo.a, and sin_gen.a).

The main change compared to previous models is that the user controls (enable, input gain, and headroom gain) that we passed through command line arguments are now integrated so that we can control them in real-time. The OS of the target platform consists of routines that are called in a specific order. Post-Kick and Block-Brick routines are crucial for us.

**The Post-Kick** routine is called at the beginning of the operating system startup and is used to initialize variables if needed. In this case, we need to initialize user controls:

    1. Enable button: Determines whether processing will occur or the input signal will pass directly to the output. 
       Initialized to 1 (processing enabled).
    2. Input gain: Refer to the diagram at the beginning of the documentation. Initialized to 0 dB (0.999).
    3. Headroom gain: Refer to the diagram at the beginning of the documentation. Initialized to 0 dB (0.999).


**The Block-Brick** routine is called when 16 new samples enter the input buffer for processing. In this routine, we invoke our main processing function (processing). Before the call, it is necessary to prepare the arguments expected by the processing function. We place the address of the input buffer in index register i0, and the address of the output buffer in index register i1. If the enable button is turned off, we skip the processing function call.

User controls are stored in a special table, the MCV table. The only modification required in our assembly files is to replace the existing fixed input and headroom gains with the input and headroom gains from the MCV table.

<br />

## Testing and Verification

To verify our algorithm, tests need to be conducted. In this case, we are testing for bit-level identity. This is done by comparing the test and reference files at the binary level. Testing is performed using the PCMCompare tool. Since it's necessary to cover a variety of test cases within testing, manual testing would be quite slow. Therefore, testing is automated through a Python script. The following audio files were used for testing this algorithm: **Multi_Tone.wav**, **WhiteNoise.wav**, and **Amp_Sweep.wav**.

| | model0/model1 | model1/model2 | model2/model3 | model3/model4 |
|----------|----------|----------|----------|----------|
| Multi_Tone.wav | 0 bit | max 1 bit | max 1 bit | 0 bit |
| WhiteNoise.wav | 0 bit | max 1 bit | max 1 bit | 0 bit |
| Amp_Sweep.wav | 0 bit | max 1 bit | max 1 bit | 0 bit |

Based on all the test cases that have been covered, it can be concluded that the algorithm has been successfully implemented on our target platform.

<br />

## Code efficiency (Profiling the processing function)

Profiling the processing function involves estimating the MIPS (Million Instructions Per Second) consumption for that function. The processing function in our algorithm is the 'processing' function.

Profiling of the function was performed when the 'processing' function was written in C code (compiled with the CCC compiler) and when the function was manually written in assembly.

The results are as follows:

  1. MIPS consumption in "pure" C code is approximately 6000.
  2. MIPS consumption in assembly code is 3500.

<br />

## Author

- [@BrankoTrifkovic](https://www.linkedin.com/in/branko-trifkovic/)
