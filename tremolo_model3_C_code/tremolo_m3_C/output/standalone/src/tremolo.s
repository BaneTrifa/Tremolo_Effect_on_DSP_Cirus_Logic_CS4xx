	.extern _sin_table
	.extern _gen_sin
	.public _lfo
	.public _processBlock
	.public _saturation_tremolo
	.extern __rshift_laccum
	.xdata_ovly
__extractedConst_0_1
	.dw  (0x7fdf3b64)
	.xdata_ovly
__extractedConst_1_1
	.dw  (0x0)
	.dw  (0x15cf7)
	.dw  (0x51db94e6)
	.code_ovly



_lfo:			/* LN: 19 | CYCLE: 0 | RULES: () */ 
	ufixed16(a1) = (0x921f)			# LN: 25 | 
	lo16(a1) = (0xb544)			# LN: 25 | 
	a1l = (0x4261)			# LN: 25 | 
	lo16(a1l) = (0xe000)			# LN: 25 | 
	a1g = (0x1)			# LN: 25 | 
	uhalfword(b0) = (0x2)			# LN: 25 | 
	x0 = a0h; a0 =+ a1			# LN: 19, 25 | 
	a1 =+ b0			# LN: 25 | 
	call (__rshift_laccum)			# LN: 25 | 
	x1 = a0			# LN: 27 | 
	a0 = x1 * x0			# LN: 28 | 
	do (0x3), label_end_5_0			# LN: 29 | 
label_begin_5_0:			/* LN: 29 | CYCLE: 0 | RULES: (CBitwiseFixPointShiftConstNonstandardValue) */ 
label_end_5_0:			# LN: 29 | CYCLE: 0 | RULES: (CBitwiseFixPointShiftConstNonstandardValue)
	a0 = a0 << 1			# LN: 29 | 
	call (_gen_sin)			# LN: 31 | 
	a0 = a0 >> 1			# LN: 32 | 
	ufixed16(a1) = (0x4000)			# LN: 34 | 
	a0 = a0 + a1			# LN: 34 | 
	ret			# LN: 37 | 



_processBlock:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i2; i7 += 1			# LN: 39, 39 | 
	xmem[i7] = i3; i7 += 1			# LN: 39, 39 | 
	xmem[i7] = i6; i7 += 1			# LN: 39, 39 | 
	xmem[i7] = x2; i7 += 1			# LN: 39, 39 | 
	xmem[i7] = x3; i7 += 1			# LN: 39, 39 | 
	xmem[i7] = a2g; i7 += 1			# LN: 39, 39 | 
	xmem[i7] = a2h; i7 += 1			# LN: 39, 39 | 
	xmem[i7] = a2l; i7 += 1			# LN: 39, 39 | 
	i2 = i0			# LN: 39 | 
	i3 = i1			# LN: 39 | 
	i6 = i4			# LN: 39 | 
	x2 = a0h			# LN: 39 | 
	i0 = i6			# LN: 47 | 
	a0g = xmem[i6]			# LN: 47 | 
	i0 += 1			# LN: 47 | 
	a0h = xmem[i0]; i0 += 1			# LN: 47, 47 | 
	a0l = xmem[i0]			# LN: 47 | 
	a0 = a0			# LN: 47 | 
	do (0x10), label_end_92			# LN: 49 | 
label_begin_92:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	x3 = ymem[i2]			# LN: 52 | 
	call (_lfo)			# LN: 55 | 
	ufixed16(a1) = (0x8000)			# LN: 56 | 
	a0 = a1 - a0			# LN: 56 | 
	a0 = a0 >> 1			# LN: 57 | 
	x0 = a0; a2 =+ a1			# LN: 59, 71 | 
	a0 = x0 * x3			# LN: 59 | 
	x0 = a0; a2 = a2 >> 1			# LN: 60, 71 | 
	a0 = x0 * x2			# LN: 60 | 
	a0 = a0 << 1			# LN: 62 | 
	call (_saturation_tremolo)			# LN: 64 | 
	i0 = i6			# LN: 69 | 
	a1g = xmem[i6]			# LN: 69 | 
	i0 += 1			# LN: 69 | 
	a1h = xmem[i0]; i0 += 1			# LN: 69, 69 | 
	a1l = xmem[i0]			# LN: 69 | 
	b0g = xmem[__extractedConst_1_1 + 0]			# LN: 69 | 
	b0h = xmem[__extractedConst_1_1 + 1]			# LN: 69 | 
	b0l = xmem[__extractedConst_1_1 + 2]			# LN: 69 | 
	a1 = a1 + b0			# LN: 69 | 
	i0 = i6			# LN: 69 | 
	xmem[i6] = a1g			# LN: 69 | 
	i0 += 1			# LN: 69 | 
	xmem[i0] = a1h; i0 += 1			# LN: 69, 69 | 
	xmem[i0] = a1l			# LN: 69 | 
	i0 = i6			# LN: 71 | 
	a1g = xmem[i6]			# LN: 71 | 
	i0 += 1			# LN: 71 | 
	a1h = xmem[i0]; i0 += 1			# LN: 71, 71 | 
	a1l = xmem[i0]			# LN: 71 | 
	a1 = a1 >> 1			# LN: 71 | 
	ymem[i3] = a0h			# LN: 64 | 
	a1 - a2			# LN: 71 | 
	if (a < 0) jmp (else_2)			# LN: 71 | 
	i0 = i6			# LN: 72 | 
	a0g = xmem[i6]			# LN: 72 | 
	i0 += 1			# LN: 72 | 
	a0h = xmem[i0]; i0 += 1			# LN: 72, 72 | 
	a0l = xmem[i0]			# LN: 72 | 
	ufixed16(a1) = (0x8000)			# LN: 72 | 
	a0 = a0 - a1			# LN: 72 | 
	i0 = i6			# LN: 72 | 
	xmem[i6] = a0g			# LN: 72 | 
	i0 += 1			# LN: 72 | 
	xmem[i0] = a0h; i0 += 1			# LN: 72, 72 | 
	xmem[i0] = a0l			# LN: 72 | 
endif_2:			/* LN: 71 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 71 | CYCLE: 0 | RULES: () */ 
	i0 = i6			# LN: 74 | 
	a0g = xmem[i6]			# LN: 74 | 
	i0 += 1			# LN: 74 | 
	a0h = xmem[i0]; i0 += 1			# LN: 74, 74 | 
	a0l = xmem[i0]			# LN: 74 | 
	a0 = a0			# LN: 74 | 
	i2 += 1			# LN: 76 | 
label_end_92:			# LN: 49 | CYCLE: 7 | RULES: ()
	i3 += 1			# LN: 77 | 
for_end_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	i7 -= 1			# LN: 85 | 
	a2l = xmem[i7]; i7 -= 1			# LN: 85, 85 | 
	a2h = xmem[i7]; i7 -= 1			# LN: 85, 85 | 
	a2g = xmem[i7]; i7 -= 1			# LN: 85, 85 | 
	x3 = xmem[i7]; i7 -= 1			# LN: 85, 85 | 
	x2 = xmem[i7]; i7 -= 1			# LN: 85, 85 | 
	i6 = xmem[i7]; i7 -= 1			# LN: 85, 85 | 
	i3 = xmem[i7]; i7 -= 1			# LN: 85, 85 | 
	i2 = xmem[i7]			# LN: 85 | 
	ret			# LN: 85 | 



_saturation_tremolo:			/* LN: 3 | CYCLE: 0 | RULES: () */ 
	b1 =+ a0			# LN: 3 | 
	a1 = xmem[__extractedConst_0_1 + 0]			# LN: 7 | 
	a0 =+ a1; b0 =+ b1			# LN: 7, 7 | 
	a0 = a0 >> 1; b0 = b0 >> 1			# LN: 7, 7 | 
	b0 - a0			# LN: 7 | 
	if (b <= 0) jmp (else_0)			# LN: 7 | 
	a0 = xmem[__extractedConst_0_1 + 0]			# LN: 9 | 
	jmp (__epilogue_106)			# LN: 9 | 
else_0:			/* LN: 7 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_0_1 + 0]			# LN: 11 | 
	a1 =- a0			# LN: 11 | 
	a0 =+ a1; b0 =+ b1			# LN: 11, 11 | 
	a0 = a0 >> 1; b0 = b0 >> 1			# LN: 11, 11 | 
	b0 - a0			# LN: 11 | 
	if (b >= 0) jmp (else_1)			# LN: 11 | 
	a0 =+ a1			# LN: 13 | 
	jmp (__epilogue_106)			# LN: 13 | 
endif_0:			/* LN: 7 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 11 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 11 | CYCLE: 0 | RULES: () */ 
	a0 = b1			# LN: 16 | 
__epilogue_106:			/* LN: 17 | CYCLE: 0 | RULES: () */ 
	ret			# LN: 17 | 
