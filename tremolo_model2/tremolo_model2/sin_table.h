#pragma once

#include "common.h"

#define TABLE_SIZE 256

extern DSPfract sin_table[TABLE_SIZE];

DSPfract gen_sin(DSPaccum rad);