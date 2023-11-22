	.extern _sin_table
	.extern _gen_sin
	.public _lfo
	.public _processBlock
	.public _saturation_tremolo
	.xdata_ovly
__extractedConst_0_1
	.dw  (0x1)
	.dw  (0x921fb544)
	.dw  (0x4261e000)
	.xdata_ovly
__extractedConst_1_1
	.dw  (0x7fdf3b64)
	.xdata_ovly
__extractedConst_2_1
	.dw  (0x0)
	.dw  (0x15cf7)
	.dw  (0x51db94e6)
	.code_ovly



_lfo:			/* LN: 19 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 19 | 
	i7 += 1			# LN: 19 | 
	i7 = i7 + (0x5)			# LN: 19 | 
	i0 = i7 - (0x1)			# LN: 19 | 
	xmem[i0] = a0h			# LN: 19 | 
cline_19_0:			/* LN: 24 | CYCLE: 0 | RULES: () */ 
	a0g = xmem[__extractedConst_0_1 + 0]			# LN: 24 | 
	a0h = xmem[__extractedConst_0_1 + 1]			# LN: 24 | 
	a0l = xmem[__extractedConst_0_1 + 2]			# LN: 24 | 
	i0 = i7 - (0x4)			# LN: 24 | 
	xmem[i0] = a0g; i0 += 1			# LN: 24, 24 | 
	xmem[i0] = a0h; i0 += 1			# LN: 24, 24 | 
	xmem[i0] = a0l			# LN: 24 | 
cline_24_0:			/* LN: 25 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 25 | 
	a0g = xmem[i0]; i0 += 1			# LN: 25, 25 | 
	a0h = xmem[i0]; i0 += 1			# LN: 25, 25 | 
	a0l = xmem[i0]			# LN: 25 | 
	a0 = a0 >> 1			# LN: 25 | 
	a0 = a0 >> 1			# LN: 25 | 
	i0 = i7 - (0x4)			# LN: 25 | 
	xmem[i0] = a0g; i0 += 1			# LN: 25, 25 | 
	xmem[i0] = a0h; i0 += 1			# LN: 25, 25 | 
	xmem[i0] = a0l			# LN: 25 | 
cline_25_0:			/* LN: 27 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 27 | 
	a0g = xmem[i0]; i0 += 1			# LN: 27, 27 | 
	a0h = xmem[i0]; i0 += 1			# LN: 27, 27 | 
	a0l = xmem[i0]			# LN: 27 | 
	i0 = i7 - (0x5)			# LN: 27 | 
	xmem[i0] = a0			# LN: 27 | 
cline_27_0:			/* LN: 28 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 28 | 
	x0 = xmem[i0]			# LN: 28 | 
	i0 = i7 - (0x1)			# LN: 28 | 
	x1 = xmem[i0]			# LN: 28 | 
	a0 = x0 * x1			# LN: 28 | 
	i0 = i7 - (0x4)			# LN: 28 | 
	xmem[i0] = a0g; i0 += 1			# LN: 28, 28 | 
	xmem[i0] = a0h; i0 += 1			# LN: 28, 28 | 
	xmem[i0] = a0l			# LN: 28 | 
cline_28_0:			/* LN: 29 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 29 | 
	a0g = xmem[i0]; i0 += 1			# LN: 29, 29 | 
	a0h = xmem[i0]; i0 += 1			# LN: 29, 29 | 
	a0l = xmem[i0]			# LN: 29 | 
	do (0x3), label_end_5_0			# LN: 29 | 
label_begin_5_0:			/* LN: 29 | CYCLE: 0 | RULES: (CBitwiseFixPointShiftConstNonstandardValue) */ 
label_end_5_0:			# LN: 29 | CYCLE: 0 | RULES: (CBitwiseFixPointShiftConstNonstandardValue)
	a0 = a0 << 1			# LN: 29 | 
	i0 = i7 - (0x4)			# LN: 29 | 
	xmem[i0] = a0g; i0 += 1			# LN: 29, 29 | 
	xmem[i0] = a0h; i0 += 1			# LN: 29, 29 | 
	xmem[i0] = a0l			# LN: 29 | 
cline_29_0:			/* LN: 31 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 31 | 
	a0g = xmem[i0]; i0 += 1			# LN: 31, 31 | 
	a0h = xmem[i0]; i0 += 1			# LN: 31, 31 | 
	a0l = xmem[i0]			# LN: 31 | 
	call (_gen_sin)			# LN: 31 | 
	i0 = i7 - (0x4)			# LN: 31 | 
	xmem[i0] = a0g; i0 += 1			# LN: 31, 31 | 
	xmem[i0] = a0h; i0 += 1			# LN: 31, 31 | 
	xmem[i0] = a0l			# LN: 31 | 
cline_31_0:			/* LN: 32 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 32 | 
	a0g = xmem[i0]; i0 += 1			# LN: 32, 32 | 
	a0h = xmem[i0]; i0 += 1			# LN: 32, 32 | 
	a0l = xmem[i0]			# LN: 32 | 
	a0 = a0 >> 1			# LN: 32 | 
	i0 = i7 - (0x4)			# LN: 32 | 
	xmem[i0] = a0g; i0 += 1			# LN: 32, 32 | 
	xmem[i0] = a0h; i0 += 1			# LN: 32, 32 | 
	xmem[i0] = a0l			# LN: 32 | 
cline_32_0:			/* LN: 34 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 34 | 
	a0g = xmem[i0]; i0 += 1			# LN: 34, 34 | 
	a0h = xmem[i0]; i0 += 1			# LN: 34, 34 | 
	a0l = xmem[i0]			# LN: 34 | 
	ufixed16(a1) = (0x4000)			# LN: 34 | 
	a0 = a0 + a1			# LN: 34 | 
	i0 = i7 - (0x4)			# LN: 34 | 
	xmem[i0] = a0g; i0 += 1			# LN: 34, 34 | 
	xmem[i0] = a0h; i0 += 1			# LN: 34, 34 | 
	xmem[i0] = a0l			# LN: 34 | 
cline_34_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 36 | 
	a0g = xmem[i0]; i0 += 1			# LN: 36, 36 | 
	a0h = xmem[i0]; i0 += 1			# LN: 36, 36 | 
	a0l = xmem[i0]			# LN: 36 | 
	jmp (__epilogue_108)			# LN: 36 | 
cline_36_0:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
__epilogue_108:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x5)			# LN: 37 | 
	i7 -= 1			# LN: 37 | 
	ret			# LN: 37 | 



_processBlock:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 39 | 
	i7 += 1			# LN: 39 | 
	i7 = i7 + (0xa)			# LN: 39 | 
	i5 = i7 - (0x1)			# LN: 39 | 
	xmem[i5] = i0			# LN: 39 | 
	i0 = i7 - (0x2)			# LN: 39 | 
	xmem[i0] = i1			# LN: 39 | 
	i0 = i7 - (0x3)			# LN: 39 | 
	xmem[i0] = i4			# LN: 39 | 
	i0 = i7 - (0x4)			# LN: 39 | 
	xmem[i0] = a0h			# LN: 39 | 
cline_39_0:			/* LN: 47 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 47 | 
	i0 = xmem[i0]			# LN: 47 | 
	i1 = i7 - (0x5)			# LN: 47 | 
	a0g = xmem[i0]; i0 += 1			# LN: 47, 47 | 
	a0h = xmem[i0]; i0 += 1			# LN: 47, 47 | 
	a0l = xmem[i0]			# LN: 47 | 
	xmem[i1] = a0			# LN: 47 | 
cline_47_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 49 | 
	a0 = 0			# LN: 49 | 
	xmem[i0] = a0h			# LN: 49 | 
	do (0x10), label_end_92			# LN: 49 | 
cline_49_0:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 52 | 
	i0 = xmem[i0]			# LN: 52 | 
	i1 = i7 - (0x7)			# LN: 52 | 
	a0 = ymem[i0]			# LN: 52 | 
	xmem[i1] = a0h			# LN: 52 | 
cline_52_0:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 55 | 
	a0 = xmem[i0]			# LN: 55 | 
	call (_lfo)			# LN: 55 | 
	i0 = i7 - (0xa)			# LN: 55 | 
	xmem[i0] = a0g; i0 += 1			# LN: 55, 55 | 
	xmem[i0] = a0h; i0 += 1			# LN: 55, 55 | 
	xmem[i0] = a0l			# LN: 55 | 
cline_55_0:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	ufixed16(a0) = (0x8000)			# LN: 56 | 
	i0 = i7 - (0xa)			# LN: 56 | 
	a1g = xmem[i0]; i0 += 1			# LN: 56, 56 | 
	a1h = xmem[i0]; i0 += 1			# LN: 56, 56 | 
	a1l = xmem[i0]			# LN: 56 | 
	a0 = a0 - a1			# LN: 56 | 
	i0 = i7 - (0xa)			# LN: 56 | 
	xmem[i0] = a0g; i0 += 1			# LN: 56, 56 | 
	xmem[i0] = a0h; i0 += 1			# LN: 56, 56 | 
	xmem[i0] = a0l			# LN: 56 | 
cline_56_0:			/* LN: 57 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 57 | 
	a0g = xmem[i0]; i0 += 1			# LN: 57, 57 | 
	a0h = xmem[i0]; i0 += 1			# LN: 57, 57 | 
	a0l = xmem[i0]			# LN: 57 | 
	a0 = a0 >> 1			# LN: 57 | 
	i0 = i7 - (0xa)			# LN: 57 | 
	xmem[i0] = a0g; i0 += 1			# LN: 57, 57 | 
	xmem[i0] = a0h; i0 += 1			# LN: 57, 57 | 
	xmem[i0] = a0l			# LN: 57 | 
cline_57_0:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 59 | 
	a0g = xmem[i0]; i0 += 1			# LN: 59, 59 | 
	a0h = xmem[i0]; i0 += 1			# LN: 59, 59 | 
	a0l = xmem[i0]			# LN: 59 | 
	i0 = i7 - (0x7)			# LN: 59 | 
	x1 = xmem[i0]; x0 = a0			# LN: 59, 59 | 
	a0 = x0 * x1			# LN: 59 | 
	i0 = i7 - (0xa)			# LN: 59 | 
	xmem[i0] = a0g; i0 += 1			# LN: 59, 59 | 
	xmem[i0] = a0h; i0 += 1			# LN: 59, 59 | 
	xmem[i0] = a0l			# LN: 59 | 
cline_59_0:			/* LN: 60 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 60 | 
	a0g = xmem[i0]; i0 += 1			# LN: 60, 60 | 
	a0h = xmem[i0]; i0 += 1			# LN: 60, 60 | 
	a0l = xmem[i0]			# LN: 60 | 
	i0 = i7 - (0x4)			# LN: 60 | 
	x1 = xmem[i0]; x0 = a0			# LN: 60, 60 | 
	a0 = x0 * x1			# LN: 60 | 
	i0 = i7 - (0xa)			# LN: 60 | 
	xmem[i0] = a0g; i0 += 1			# LN: 60, 60 | 
	xmem[i0] = a0h; i0 += 1			# LN: 60, 60 | 
	xmem[i0] = a0l			# LN: 60 | 
cline_60_0:			/* LN: 62 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 62 | 
	a0g = xmem[i0]; i0 += 1			# LN: 62, 62 | 
	a0h = xmem[i0]; i0 += 1			# LN: 62, 62 | 
	a0l = xmem[i0]			# LN: 62 | 
	a0 = a0 << 1			# LN: 62 | 
	i0 = i7 - (0xa)			# LN: 62 | 
	xmem[i0] = a0g; i0 += 1			# LN: 62, 62 | 
	xmem[i0] = a0h; i0 += 1			# LN: 62, 62 | 
	xmem[i0] = a0l			# LN: 62 | 
cline_62_0:			/* LN: 64 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 64 | 
	a0g = xmem[i0]; i0 += 1			# LN: 64, 64 | 
	a0h = xmem[i0]; i0 += 1			# LN: 64, 64 | 
	a0l = xmem[i0]			# LN: 64 | 
	call (_saturation_tremolo)			# LN: 64 | 
	i0 = i7 - (0x2)			# LN: 64 | 
	i0 = xmem[i0]			# LN: 64 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 64 | 
cline_64_0:			/* LN: 69 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 69 | 
	i0 = xmem[i0]			# LN: 69 | 
	a0g = xmem[__extractedConst_2_1 + 0]			# LN: 69 | 
	a1g = xmem[i0]; i0 += 1			# LN: 69, 69 | 
	a1h = xmem[i0]; i0 += 1			# LN: 69, 69 | 
	a1l = xmem[i0]			# LN: 69 | 
	a0h = xmem[__extractedConst_2_1 + 1]			# LN: 69 | 
	a0l = xmem[__extractedConst_2_1 + 2]			# LN: 69 | 
	i0 = i7 - (0x3)			# LN: 69 | 
	i0 = xmem[i0]			# LN: 69 | 
	a0 = a1 + a0			# LN: 69 | 
	xmem[i0] = a0g; i0 += 1			# LN: 69, 69 | 
	xmem[i0] = a0h; i0 += 1			# LN: 69, 69 | 
	xmem[i0] = a0l			# LN: 69 | 
cline_69_0:			/* LN: 71 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 71 | 
	i0 = xmem[i0]			# LN: 71 | 
	ufixed16(a0) = (0x8000)			# LN: 71 | 
	b0g = xmem[i0]; i0 += 1			# LN: 71, 71 | 
	b0h = xmem[i0]; i0 += 1			# LN: 71, 71 | 
	b0l = xmem[i0]			# LN: 71 | 
	a0 = a0 >> 1; b0 = b0 >> 1			# LN: 71, 71 | 
	b0 - a0			# LN: 71 | 
	if (b < 0) jmp (else_2)			# LN: 71 | 
cline_71_0:			/* LN: 72 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 72 | 
	i0 = xmem[i0]			# LN: 72 | 
	ufixed16(a0) = (0x8000)			# LN: 72 | 
	a1g = xmem[i0]; i0 += 1			# LN: 72, 72 | 
	a1h = xmem[i0]; i0 += 1			# LN: 72, 72 | 
	a1l = xmem[i0]			# LN: 72 | 
	i0 = i7 - (0x3)			# LN: 72 | 
	i0 = xmem[i0]			# LN: 72 | 
	a0 = a1 - a0			# LN: 72 | 
	xmem[i0] = a0g; i0 += 1			# LN: 72, 72 | 
	xmem[i0] = a0h; i0 += 1			# LN: 72, 72 | 
	xmem[i0] = a0l			# LN: 72 | 
	jmp (endif_2)			# LN: 72 | 
cline_72_0:			/* LN: 74 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 71 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 71 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 74 | 
	i0 = xmem[i0]			# LN: 74 | 
	i1 = i7 - (0x5)			# LN: 74 | 
	a0g = xmem[i0]; i0 += 1			# LN: 74, 74 | 
	a0h = xmem[i0]; i0 += 1			# LN: 74, 74 | 
	a0l = xmem[i0]			# LN: 74 | 
	xmem[i1] = a0			# LN: 74 | 
cline_74_0:			/* LN: 76 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 76 | 
	i0 = xmem[i0]			# LN: 76 | 
	i1 = i7 - (0x1)			# LN: 76 | 
	i0 += 1			# LN: 76 | 
	xmem[i1] = i0			# LN: 76 | 
cline_76_0:			/* LN: 77 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 77 | 
	i0 = xmem[i0]			# LN: 77 | 
	i1 = i7 - (0x2)			# LN: 77 | 
	i0 += 1			# LN: 77 | 
	xmem[i1] = i0			# LN: 77 | 
cline_77_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 78 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 49 | 
	a0 = xmem[i0]			# LN: 49 | 
	uhalfword(a1) = (0x1)			# LN: 49 | 
	a0 = a0 + a1			# LN: 49 | 
	i0 = i7 - (0x6)			# LN: 49 | 
label_end_92:			# LN: 49 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 49 | 
cline_49_1:			/* LN: 85 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_110)			# LN: 85 | 
__epilogue_110:			/* LN: 85 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0xa)			# LN: 85 | 
	i7 -= 1			# LN: 85 | 
	ret			# LN: 85 | 



_saturation_tremolo:			/* LN: 3 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 3 | 
	i7 += 1			# LN: 3 | 
	i7 = i7 + (0x4)			# LN: 3 | 
	i0 = i7 - (0x3)			# LN: 3 | 
	xmem[i0] = a0g; i0 += 1			# LN: 3, 3 | 
	xmem[i0] = a0h; i0 += 1			# LN: 3, 3 | 
	xmem[i0] = a0l			# LN: 3 | 
cline_3_0:			/* LN: 5 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_1_1 + 0]			# LN: 5 | 
	i0 = i7 - (0x4)			# LN: 5 | 
	xmem[i0] = a0h			# LN: 5 | 
cline_5_0:			/* LN: 7 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 7 | 
	a0g = xmem[i0]; i0 += 1			# LN: 7, 7 | 
	a0h = xmem[i0]; i0 += 1			# LN: 7, 7 | 
	a0l = xmem[i0]			# LN: 7 | 
	b0 =+ a0			# LN: 7 | 
	b0 = b0 >> 1			# LN: 7 | 
	i0 = i7 - (0x4)			# LN: 7 | 
	a0 = xmem[i0]			# LN: 7 | 
	a0 = a0 >> 1			# LN: 7 | 
	b0 - a0			# LN: 7 | 
	if (b <= 0) jmp (else_0)			# LN: 7 | 
cline_7_0:			/* LN: 9 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 9 | 
	a0 = xmem[i0]			# LN: 9 | 
	jmp (__epilogue_106)			# LN: 9 | 
cline_9_0:			/* LN: 11 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 7 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 11 | 
	a0 = xmem[i0]			# LN: 11 | 
	i0 = i7 - (0x3)			# LN: 11 | 
	b0g = xmem[i0]; i0 += 1			# LN: 11, 11 | 
	b0h = xmem[i0]; i0 += 1			# LN: 11, 11 | 
	a0 =- a0			# LN: 11 | 
	b0l = xmem[i0]			# LN: 11 | 
	a0 = a0 >> 1; b0 = b0 >> 1			# LN: 11, 11 | 
	b0 - a0			# LN: 11 | 
	if (b >= 0) jmp (else_1)			# LN: 11 | 
cline_11_0:			/* LN: 13 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 13 | 
	a0 = xmem[i0]			# LN: 13 | 
	a0 =- a0			# LN: 13 | 
	jmp (__epilogue_106)			# LN: 13 | 
cline_13_0:			/* LN: 16 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 7 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 11 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 11 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 16 | 
	a0g = xmem[i0]; i0 += 1			# LN: 16, 16 | 
	a0h = xmem[i0]; i0 += 1			# LN: 16, 16 | 
	a0l = xmem[i0]			# LN: 16 | 
	a0 = a0			# LN: 16 | 
	jmp (__epilogue_106)			# LN: 16 | 
cline_16_0:			/* LN: 17 | CYCLE: 0 | RULES: () */ 
__epilogue_106:			/* LN: 17 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x4)			# LN: 17 | 
	i7 -= 1			# LN: 17 | 
	ret			# LN: 17 | 
