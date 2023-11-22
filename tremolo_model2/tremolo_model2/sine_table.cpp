#include "sin_table.h"

DSPfract sin_table[TABLE_SIZE] = {
	0.000000, 0.006136, 0.012272, 0.018407, 0.024541, 0.030675, 0.036807, 0.042938, 0.049068, 0.055195, 0.061321, 0.067444,
	0.073565, 0.079682, 0.085797, 0.091909, 0.098017, 0.104122, 0.110222, 0.116319, 0.122411, 0.128498, 0.134581,
	0.140658, 0.146730, 0.152797, 0.158858, 0.164913, 0.170962, 0.177004, 0.183040, 0.189069, 0.195090, 0.201105,
	0.207111, 0.213110, 0.219101, 0.225084, 0.231058, 0.237024, 0.242980, 0.248928, 0.254866, 0.260794, 0.266713,
	0.272621, 0.278520, 0.284408, 0.290285, 0.296151, 0.302006, 0.307850, 0.313682, 0.319502, 0.325310, 0.331106,
	0.336890, 0.342661, 0.348419, 0.354164, 0.359895, 0.365613, 0.371317, 0.377007, 0.382683, 0.388345, 0.393992,
	0.399624, 0.405241, 0.410843, 0.416430, 0.422000, 0.427555, 0.433094, 0.438616, 0.444122, 0.449611, 0.455084,
	0.460539, 0.465976, 0.471397, 0.476799, 0.482184, 0.487550, 0.492898, 0.498228, 0.503538, 0.508830, 0.514103,
	0.519356, 0.524590, 0.529804, 0.534998, 0.540171, 0.545325, 0.550458, 0.555570, 0.560662, 0.565732, 0.570781,
	0.575808, 0.580814, 0.585798, 0.590760, 0.595699, 0.600616, 0.605511, 0.610383, 0.615232, 0.620057, 0.624859,
	0.629638, 0.634393, 0.639124, 0.643832, 0.648514, 0.653173, 0.657807, 0.662416, 0.667000, 0.671559, 0.676093,
	0.680601, 0.685084, 0.689541, 0.693971, 0.698376, 0.702755, 0.707107, 0.711432, 0.715731, 0.720003, 0.724247,
	0.728464, 0.732654, 0.736817, 0.740951, 0.745058, 0.749136, 0.753187, 0.757209, 0.761202, 0.765167, 0.769103,
	0.773010, 0.776888, 0.780737, 0.784557, 0.788346, 0.792107, 0.795837, 0.799537, 0.803208, 0.806848, 0.810457,
	0.814036, 0.817585, 0.821103, 0.824589, 0.828045, 0.831470, 0.834863, 0.838225, 0.841555, 0.844854, 0.848120,
	0.851355, 0.854558, 0.857729, 0.860867, 0.863973, 0.867046, 0.870087, 0.873095, 0.876070, 0.879012, 0.881921,
	0.884797, 0.887640, 0.890449, 0.893224, 0.895966, 0.898674, 0.901349, 0.903989, 0.906596, 0.909168, 0.911706,
	0.914210, 0.916679, 0.919114, 0.921514, 0.923880, 0.926210, 0.928506, 0.930767, 0.932993, 0.935184, 0.937339,
	0.939459, 0.941544, 0.943593, 0.945607, 0.947586, 0.949528, 0.951435, 0.953306, 0.955141, 0.956940, 0.958703,
	0.960431, 0.962121, 0.963776, 0.965394, 0.966976, 0.968522, 0.970031, 0.971504, 0.972940, 0.974339, 0.975702,
	0.977028, 0.978317, 0.979570, 0.980785, 0.981964, 0.983105, 0.984210, 0.985278, 0.986308, 0.987301, 0.988258,
	0.989177, 0.990058, 0.990903, 0.991710, 0.992480, 0.993212, 0.993907, 0.994565, 0.995185, 0.995767, 0.996313,
	0.996820, 0.997290, 0.997723, 0.998118, 0.998476, 0.998795, 0.999078, 0.999322, 0.999529, 0.999699, 0.999831,
	0.999995, 0.999999
};

// Calculating constant 162:			PI/2 : 255 = rad : const   =>   const = (rad * 255) / (PI/2) = rad * 162
//
// The sine table only contains sine values from 0 to PI/2, so we have to check in which quadrant is the value rad
// If it is outside the first quadrant, we must return it to the first quadran and  then read the value from the table 
DSPfract gen_sin(DSPaccum rad) 
{
	// Scaling constant 162,		
	DSPaccum accum_const = (DSPaccum)162;
	accum_const >>= 8;
	DSPfract fract_const = accum_const;

	// Calculating constants
	DSPaccum accum_pi = (DSPaccum)PI;
	DSPaccum accum_pi_2 = (DSPaccum)PI_2;
	DSPaccum accum_3Pi_2 = (DSPaccum)PI_3_2;

	if (rad <= accum_pi_2)			// FIRST QUADRANT
	{
		// Scaling radian
		rad >>= 1;
		DSPfract fract_rad = rad;

		DSPaccum accum_result = fract_rad * fract_const;	// multiply radian with constant to get index
		accum_result <<= 9;	// rescale index
		DSPint index = accum_result;

		return sin_table[index];
	}
	else if (rad <= accum_pi)		// SECOND QUADRANT
	{
		// Transfer radian from second to first quadrant
		rad = accum_pi - rad;

		// Scaling radian
		rad >>= 1;
		DSPfract fract_rad = rad;

		DSPaccum accum_result = fract_rad * fract_const; // multiply radian with constant to get index
		accum_result <<= 9;	// rescale index
		DSPint index = accum_result;

		return sin_table[index];
	}
	else if (rad <= accum_3Pi_2)	// THIRD QUADRANT
	{
		// Transfer radian from third to first quadrant
		rad = rad - accum_pi;

		// Scaling radian
		rad >>= 1;
		DSPfract fract_rad = rad;

		DSPaccum accum_result = fract_rad * fract_const; // multiply radian with constant to get index
		accum_result <<= 9;		// rescale index
		DSPint index = accum_result;

		return -sin_table[index];
	}
	else					// FOURTH QUADRANT
	{

		accum_pi <<= 1;	// 2*PI
		rad = accum_pi - rad;	// Transfer radian from third to first quadrant

		// Scaling radian
		rad >>= 1;
		DSPfract fract_rad = rad;

		DSPaccum accum_result = fract_rad * fract_const;	// multiply radian with constant to get index
		accum_result <<= 9;	// rescale index
		DSPint index = accum_result;

		return -sin_table[index];
	}

}