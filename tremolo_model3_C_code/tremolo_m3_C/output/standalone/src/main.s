	.public _LR_postGain
	.extern ___TIMER0_COUNT
	.extern ___TIMER1_COUNT
	.extern ___TIMER1_ENABLE
	.public _enable
	.public _headroom_gain
	.public _input_gain
	.public _limiterThreshold
	.public _mode
	.public _phLeft
	.public _phRight
	.public _sampleBuffer
	.extern _sin_table
	.public _tremolo_postGain
	.extern _cl_get_cycle_count
	.extern _cl_wavread_bits_per_sample
	.extern _cl_wavread_close
	.extern _cl_wavread_frame_rate
	.extern _cl_wavread_getnchannels
	.extern _cl_wavread_number_of_frames
	.extern _cl_wavread_open
	.extern _cl_wavread_recvsample
	.extern _cl_wavwrite_close
	.extern _cl_wavwrite_open
	.extern _cl_wavwrite_sendsample
	.public _initGainProcessing
	.public _main
	.extern _printf
	.extern _processBlock
	.public _processing
	.public _saturation
	.extern _strcpy
	.extern __div
	.xdata_ovly
_LR_postGain
	.bss (0x1)
	.xdata_ovly
__extractedConst_0_2
	.dw  (0x7fdf3b64)
	.xdata_ovly
__extractedConst_1_1
	.dw  (0x65ac8a37)
	.xdata_ovly
__extractedConst_2_1
	.dw  (0x4026e547)
	.xdata_ovly
_enable
	.bss (0x1)
	.xdata_ovly
_headroom_gain
	.bss (0x1)
	.xdata_ovly
_input_gain
	.bss (0x1)
	.xdata_ovly
_limiterThreshold
	.dw  (0x7fdf3b64)
	.xdata_ovly
_mode
	.bss (0x1)
	.xdata_ovly
_mode_to_num_out_ch
	.dw  (0x5)
	.dw  (0x2)
	.dw  (0x2)
	.dw  (0x3)
	.xdata_ovly
_phLeft
	.bss (0x3)
	.xdata_ovly
_phRight
	.bss (0x3)
	.ydata_ovly
_sampleBuffer
	.bss (0x80)
	.xdata_ovly
_string_const_0
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.xdata_ovly
_string_const_1
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.xdata_ovly
_string_const_2
	.dw  (0x25)
	.dw  (0x6c)
	.dw  (0x6c)
	.dw  (0x75)
	.dw  (0xa)
	.dw  (0x0)
	.xdata_ovly
_tremolo_postGain
	.bss (0x1)
	.code_ovly



_initGainProcessing:			/* LN: 32 | CYCLE: 0 | RULES: () */ 
	b0 = xmem[__extractedConst_0_2 + 0]			# LN: 34 | 
	xmem[_input_gain + 0] = b0h			# LN: 34 | 
	b0 = xmem[__extractedConst_0_2 + 0]			# LN: 35 | 
	xmem[_headroom_gain + 0] = b0h			# LN: 35 | 
	xmem[_tremolo_postGain + 0] = a0h			# LN: 36 | 
	xmem[_LR_postGain + 0] = a1h			# LN: 37 | 
	uhalfword(a0) = (0x1)			# LN: 39 | 
	xmem[_enable + 0] = a0h			# LN: 39 | 
	a0 = 0			# LN: 40 | 
	xmem[_mode + 0] = a0h			# LN: 40 | 
	xmem[_phLeft + 0] = a0g			# LN: 42 | 
	xmem[_phLeft + 1] = a0h			# LN: 42 | 
	xmem[_phLeft + 2] = a0l			# LN: 42 | 
	xmem[_phRight + 0] = a0g			# LN: 43 | 
	xmem[_phRight + 1] = a0h			# LN: 43 | 
	xmem[_phRight + 2] = a0l			# LN: 43 | 
	ret			# LN: 44 | 



	# This construction should ensure linking of crt0 in case when target is a standalone program without the OS
	.if defined(_OVLY_)
		.if .strcmp('standalone',_OVLY_)=0
		.if .strcmp('crystal32',_TARGET_FAMILY_)=0
			.extern __start         # dummy use of __start to force linkage of crt0
dummy		.equ(__start)
		.else
			.extern __intvec         # dummy use of __intvec to force linkage of intvec
dummy		.equ(__intvec)
		.endif
		.endif
	.endif

_main:			/* LN: 140 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = a2g; i7 += 1			# LN: 140, 140 | 
	xmem[i7] = a2h; i7 += 1			# LN: 140, 140 | 
	xmem[i7] = a2l; i7 += 1			# LN: 140, 140 | 
	xmem[i7] = i2; i7 += 1			# LN: 140, 140 | 
	xmem[i7] = a3g; i7 += 1			# LN: 140, 140 | 
	xmem[i7] = a3h; i7 += 1			# LN: 140, 140 | 
	xmem[i7] = a3l; i7 += 1			# LN: 140, 140 | 
	xmem[i7] = b2g; i7 += 1			# LN: 140, 140 | 
	xmem[i7] = b2h; i7 += 1			# LN: 140, 140 | 
	xmem[i7] = b2l; i7 += 1			# LN: 140, 140 | 
	xmem[i7] = i3; i7 += 1			# LN: 140, 140 | 
	xmem[i7] = b3g; i7 += 1			# LN: 140, 140 | 
	xmem[i7] = b3h; i7 += 1			# LN: 140, 140 | 
	xmem[i7] = b3l; i7 += 1			# LN: 140, 140 | 
	i7 = i7 + (0x200)			# LN: 140 | 
	a0 = xmem[__extractedConst_1_1 + 0]			# LN: 161 | 
	a1 = xmem[__extractedConst_2_1 + 0]			# LN: 161 | 
	i4 = i0			# LN: 140 | 
	call (_initGainProcessing)			# LN: 161 | 
	a0 = 0			# LN: 164 | 
	do (0x8), label_end_95			# LN: 164 | 
label_begin_95:			/* LN: 164 | CYCLE: 0 | RULES: () */ 
	a1 = 0			# LN: 165 | 
	do (0x10), label_end_94			# LN: 165 | 
label_begin_94:			/* LN: 165 | CYCLE: 0 | RULES: () */ 
	b0 =+ a0			# LN: 166 | 
	b0 = b0 << 4			# LN: 166 | 
	i0 = b0; b0 = 0			# LN: 166, 166 | 
	uhalfword(b1) = (0x1)			# LN: 165 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 166 | 
	a2 = i0			# LN: 166 | 
	a2 = a2 + a1			# LN: 166 | 
	AnyReg(i0, a2h)			# LN: 166 | 
	a1 = a1 + b1			# LN: 165 | 
label_end_94:			# LN: 165 | CYCLE: 9 | RULES: ()
	ymem[i0] = b0h			# LN: 166 | 
init_latch_label_3:			/* LN: 166 | CYCLE: 0 | RULES: () */ 
for_end_3:			/* LN: 165 | CYCLE: 0 | RULES: () */ 
	uhalfword(a1) = (0x1)			# LN: 164 | 
label_end_95:			# LN: 164 | CYCLE: 1 | RULES: ()
	a0 = a0 + a1			# LN: 164 | 
for_end_2:			/* LN: 164 | CYCLE: 0 | RULES: () */ 
	i1 = xmem[i4]			# LN: 170 | 
	i0 = i7 - (256 - 0)			# LN: 170 | 
	call (_strcpy)			# LN: 170 | 
	i0 = i7 - (256 - 0)			# LN: 171 | 
	call (_cl_wavread_open)			# LN: 171 | 
	AnyReg(i2, a0h)			# LN: 171 | 
	a0 = i2			# LN: 172 | 
	a0 & a0			# LN: 172 | 
	if (a != 0) jmp (else_2)			# LN: 172 | 
	i0 = (0) + (_string_const_0)			# LN: 174 | 
	call (_printf)			# LN: 174 | 
	halfword(a0) = (0xffff)			# LN: 175 | 
	jmp (__epilogue_264)			# LN: 175 | 
endif_2:			/* LN: 172 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 172 | CYCLE: 0 | RULES: () */ 
	i0 = i2			# LN: 181 | 
	call (_cl_wavread_getnchannels)			# LN: 181 | 
	i4 += 1; a2 =+ a0			# LN: 189, 181 | 
	i0 = i2			# LN: 182 | 
	call (_cl_wavread_bits_per_sample)			# LN: 182 | 
	a1 =+ a0			# LN: 182 | 
	i0 = i2			# LN: 183 | 
	call (_cl_wavread_frame_rate)			# LN: 183 | 
	b0 =+ a0			# LN: 183 | 
	i0 = i2			# LN: 184 | 
	call (_cl_wavread_number_of_frames)			# LN: 184 | 
	i0 = i7 - (512 - 0)			# LN: 189 | 
	i1 = xmem[i4]			# LN: 189 | 
	b1 =+ a0			# LN: 184 | 
	call (_strcpy)			# LN: 189 | 
	a0 = xmem[_enable + 0]			# LN: 191 | 
	a0 & a0			# LN: 191 | 
	if (a == 0) jmp (else_3)			# LN: 191 | 
	a0 = xmem[_mode + 0]			# LN: 194 | 
	i0 = a0			# LN: 194 | 
	a0 = xmem[_mode + 0]			# LN: 197 | 
	i0 = i0 + (_mode_to_num_out_ch + 0)			# LN: 194 | 
	uhalfword(a3) = (0x2)			# LN: 197 | 
	b2 = xmem[i0]; a0 - a3			# LN: 194, 197 | 
	if (a != 0) jmp (elsecondition_0)			# LN: 197 | 
	uhalfword(a3) = (0x3)			# LN: 197 | 
	jmp (endif_3)			# LN: 197 | 
elsecondition_0:			/* LN: 197 | CYCLE: 0 | RULES: () */ 
	a3 = 0			# LN: 197 | 
	jmp (endif_3)			# LN: 197 | 
else_3:			/* LN: 191 | CYCLE: 0 | RULES: () */ 
	a3 = 0			# LN: 202 | 
	uhalfword(b2) = (0x2)			# LN: 202 | 
endif_3:			/* LN: 191 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (512 - 0)			# LN: 205 | 
	a0 =+ a1			# LN: 205 | 
	a1 =+ b2			# LN: 205 | 
	call (_cl_wavwrite_open)			# LN: 205 | 
	AnyReg(i3, a0h)			# LN: 205 | 
	a0 = i3			# LN: 206 | 
	a0 & a0			# LN: 206 | 
	if (a != 0) jmp (else_4)			# LN: 206 | 
	i0 = (0) + (_string_const_1)			# LN: 208 | 
	call (_printf)			# LN: 208 | 
	halfword(a0) = (0xffff)			# LN: 209 | 
	jmp (__epilogue_264)			# LN: 209 | 
endif_4:			/* LN: 206 | CYCLE: 0 | RULES: () */ 
else_4:			/* LN: 206 | CYCLE: 0 | RULES: () */ 
	uhalfword(a1) = (0x10)			# LN: 222 | 
	a0 =+ b1			# LN: 222 | 
	call (__div)			# LN: 222 | 
	AnyReg(i0, a0h)			# LN: 222 | 
	nop #empty cycle
	do (i0), label_end_99			# LN: 222 | 
label_begin_99:			/* LN: 222 | CYCLE: 0 | RULES: () */ 
	b3 = 0			# LN: 224 | 
	do (0x10), label_end_97			# LN: 224 | 
label_begin_97:			/* LN: 224 | CYCLE: 0 | RULES: () */ 
	AnyReg(i0, a2h)			# LN: 226 | 
	b0 = 0			# LN: 226 | 
	do (i0), label_end_96			# LN: 226 | 
label_begin_96:			/* LN: 226 | CYCLE: 0 | RULES: () */ 
	i0 = i2			# LN: 228 | 
	call (_cl_wavread_recvsample)			# LN: 228 | 
	a1 =+ a0; b1 =+ b0			# LN: 228, 229 | 
	b1 = b1 << 4			# LN: 229 | 
	i0 = b1; a0 =+ a1			# LN: 229, 229 | 
	uhalfword(a1) = (0x1)			# LN: 226 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 229 | 
	b1 = i0; b0 = b0 + a1			# LN: 229, 226 | 
	a1 =+ b1			# LN: 229 | 
	a1 = a1 + b3			# LN: 229 | 
	AnyReg(i0, a1h)			# LN: 229 | 
	nop #empty cycle
label_end_96:			# LN: 226 | CYCLE: 12 | RULES: ()
	ymem[i0] = a0h			# LN: 229 | 
init_latch_label_5:			/* LN: 231 | CYCLE: 0 | RULES: () */ 
for_end_6:			/* LN: 226 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 224 | 
label_end_97:			# LN: 224 | CYCLE: 1 | RULES: ()
	b3 = b3 + a0			# LN: 224 | 
for_end_5:			/* LN: 224 | CYCLE: 0 | RULES: () */ 
	call (_cl_get_cycle_count)			# LN: 234 | 
	i0 = (0) + (_sampleBuffer)			# LN: 236 | 
	i1 = (0) + (_sampleBuffer)			# LN: 236 | 
	b3 =+ a0			# LN: 234 | 
	call (_processing)			# LN: 236 | 
	call (_cl_get_cycle_count)			# LN: 237 | 
	a0 = a0 - b3			# LN: 239 | 
	i0 = (0) + (_string_const_2)			# LN: 240 | 
	call (_printf)			# LN: 240 | 
	a1 = 0			# LN: 243 | 
	do (0x10), label_end_98			# LN: 243 | 
label_begin_98:			/* LN: 243 | CYCLE: 0 | RULES: () */ 
	b0 =+ a3			# LN: 245 | 
for_8:			/* LN: 245 | CYCLE: 0 | RULES: () */ 
	a0 = a3 + b2			# LN: 245 | 
	b0 - a0			# LN: 245 | 
	if (b >= 0) jmp (for_end_8)			# LN: 245 | 
	a0 =+ b0			# LN: 247 | 
	a0 = a0 << 4			# LN: 247 | 
	i1 = a0			# LN: 247 | 
	i0 = i3			# LN: 248 | 
	i1 = i1 + (_sampleBuffer + 0)			# LN: 247 | 
	a0 = i1			# LN: 247 | 
	a0 = a0 + a1			# LN: 247 | 
	AnyReg(i1, a0h)			# LN: 247 | 
	uhalfword(a0) = (0x1)			# LN: 245 | 
	b1 = ymem[i1]; b0 = b0 + a0			# LN: 247, 245 | 
	a0 =+ b1			# LN: 247 | 
	call (_cl_wavwrite_sendsample)			# LN: 248 | 
	jmp (for_8)			# LN: 245 | 
init_latch_label_7:			/* LN: 250 | CYCLE: 0 | RULES: () */ 
for_end_8:			/* LN: 245 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 243 | 
label_end_98:			# LN: 243 | CYCLE: 1 | RULES: ()
	a1 = a1 + a0			# LN: 243 | 
init_latch_label_8:			/* LN: 251 | CYCLE: 0 | RULES: () */ 
for_end_7:			/* LN: 243 | CYCLE: 0 | RULES: () */ 
label_end_99:			# LN: 222 | CYCLE: 0 | RULES: ()
	nop #empty cycle
for_end_4:			/* LN: 222 | CYCLE: 0 | RULES: () */ 
	i0 = i2			# LN: 256 | 
	call (_cl_wavread_close)			# LN: 256 | 
	i0 = i3			# LN: 257 | 
	call (_cl_wavwrite_close)			# LN: 257 | 
	a0 = 0			# LN: 260 | 
__epilogue_264:			/* LN: 261 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x200)			# LN: 261 | 
	i7 -= 1			# LN: 261 | 
	b3l = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	b3h = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	b3g = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	i3 = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	b2l = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	b2h = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	b2g = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	a3l = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	a3h = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	a3g = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	i2 = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	a2l = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	a2h = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	a2g = xmem[i7]			# LN: 261 | 
	ret			# LN: 261 | 



_processing:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i2; i7 += 1			# LN: 61, 61 | 
	xmem[i7] = i3; i7 += 1			# LN: 61, 61 | 
	xmem[i7] = i6; i7 += 1			# LN: 61, 61 | 
	xmem[i7] = a2g; i7 += 1			# LN: 61, 61 | 
	xmem[i7] = a2h; i7 += 1			# LN: 61, 61 | 
	xmem[i7] = a2l; i7 += 1			# LN: 61, 61 | 
	i7 = i7 + (0x3)			# LN: 61 | 
	i4 = i0			# LN: 67 | 
	i5 = i0 + (0x10)			# LN: 68 | 
	i2 = i7 - (0x2)			# LN: 71 | 
	xmem[i2] = i1			# LN: 71 | 
	i2 = i1 + (0x10)			# LN: 72 | 
	i3 = i7 - (0x1)			# LN: 72 | 
	xmem[i3] = i2			# LN: 72 | 
	i2 = i1 + (0x20)			# LN: 73 | 
	i3 = i7 - (0x3)			# LN: 73 | 
	xmem[i3] = i2			# LN: 73 | 
	i2 = i1 + (0x30)			# LN: 74 | 
	i1 = i1 + (0x40)			# LN: 75 | 
	i3 = i1			# LN: 75 | 
	do (0x10), label_end_92			# LN: 84 | 
label_begin_92:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
	x0 = ymem[i4]			# LN: 86 | 
	x1 = xmem[_input_gain + 0]			# LN: 86 | 
	a0 = x0 * x1			# LN: 86 | 
	ymem[i4] = a0; i4 += 1			# LN: 86, 89 | 
	x0 = ymem[i5]			# LN: 87 | 
	x1 = xmem[_input_gain + 0]			# LN: 87 | 
	a0 = x0 * x1			# LN: 87 | 
label_end_92:			# LN: 84 | CYCLE: 7 | RULES: ()
	ymem[i5] = a0; i5 += 1			# LN: 87, 90 | 
for_end_0:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
	i6 = i0			# LN: 94 | 
	i5 = i0 + (0x10)			# LN: 95 | 
	i4 = (0) + (_phLeft)			# LN: 99 | 
	i0 = i6			# LN: 99 | 
	i1 = i2			# LN: 99 | 
	a0 = xmem[_tremolo_postGain + 0]			# LN: 99 | 
	i2 = i5			# LN: 95 | 
	call (_processBlock)			# LN: 99 | 
	i0 = i2			# LN: 100 | 
	i1 = i3			# LN: 100 | 
	a0 = xmem[_tremolo_postGain + 0]			# LN: 100 | 
	i4 = (0) + (_phRight)			# LN: 100 | 
	call (_processBlock)			# LN: 100 | 
	do (0x10), label_end_93			# LN: 102 | 
label_begin_93:			/* LN: 102 | CYCLE: 0 | RULES: () */ 
	a0 = ymem[i6]; i6 += 1			# LN: 106, 129 | 
	a1 = ymem[i2]; i2 += 1			# LN: 107, 130 | 
	a0 = a0 + a1			# LN: 108 | 
	a0 = a0 >> 1			# LN: 110 | 
	x0 = a0			# LN: 111 | 
	x1 = xmem[_headroom_gain + 0]			# LN: 112 | 
	a2 = x0 * x1			# LN: 112 | 
	a0 =+ a2			# LN: 114 | 
	a0 = a0 << 1			# LN: 114 | 
	call (_saturation)			# LN: 115 | 
	i0 = i7 - (0x3)			# LN: 115 | 
	i0 = xmem[i0]			# LN: 115 | 
	x0 = a2			# LN: 118 | 
	ymem[i0] = a0h; i0 += 1			# LN: 115, 133 | 
	i1 = i7 - (0x3)			# LN: 133 | 
	xmem[i1] = i0			# LN: 133 | 
	x1 = xmem[_LR_postGain + 0]			# LN: 119 | 
	a0 = x0 * x1			# LN: 119 | 
	a0 = a0 << 1			# LN: 120 | 
	call (_saturation)			# LN: 122 | 
	i0 = i7 - (0x2)			# LN: 122 | 
	i0 = xmem[i0]			# LN: 122 | 
	i1 = i7 - (0x2)			# LN: 131 | 
	ymem[i0] = a0h			# LN: 122 | 
	a0 = ymem[i0]; i0 += 1			# LN: 123, 131 | 
	xmem[i1] = i0			# LN: 131 | 
	i0 = i7 - (0x1)			# LN: 123 | 
	i0 = xmem[i0]			# LN: 123 | 
	i1 = i7 - (0x1)			# LN: 132 | 
	ymem[i0] = a0h; i0 += 1			# LN: 123, 132 | 
label_end_93:			# LN: 102 | CYCLE: 30 | RULES: ()
	xmem[i1] = i0			# LN: 132 | 
for_end_1:			/* LN: 102 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x3)			# LN: 138 | 
	i7 -= 1			# LN: 138 | 
	a2l = xmem[i7]; i7 -= 1			# LN: 138, 138 | 
	a2h = xmem[i7]; i7 -= 1			# LN: 138, 138 | 
	a2g = xmem[i7]; i7 -= 1			# LN: 138, 138 | 
	i6 = xmem[i7]; i7 -= 1			# LN: 138, 138 | 
	i3 = xmem[i7]; i7 -= 1			# LN: 138, 138 | 
	i2 = xmem[i7]			# LN: 138 | 
	ret			# LN: 138 | 



_saturation:			/* LN: 46 | CYCLE: 0 | RULES: () */ 
	b1 =+ a0			# LN: 46 | 
	a1 = xmem[_limiterThreshold + 0]			# LN: 49 | 
	a0 =+ a1; b0 =+ b1			# LN: 49, 49 | 
	a0 = a0 >> 1; b0 = b0 >> 1			# LN: 49, 49 | 
	b0 - a0			# LN: 49 | 
	if (b <= 0) jmp (else_0)			# LN: 49 | 
	a0 = xmem[_limiterThreshold + 0]			# LN: 51 | 
	jmp (__epilogue_260)			# LN: 51 | 
else_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_limiterThreshold + 0]			# LN: 53 | 
	a1 =- a0			# LN: 53 | 
	a0 =+ a1; b0 =+ b1			# LN: 53, 53 | 
	a0 = a0 >> 1; b0 = b0 >> 1			# LN: 53, 53 | 
	b0 - a0			# LN: 53 | 
	if (b >= 0) jmp (else_1)			# LN: 53 | 
	a0 = xmem[_limiterThreshold + 0]			# LN: 55 | 
	a0 =- a0			# LN: 55 | 
	jmp (__epilogue_260)			# LN: 55 | 
endif_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
	a0 = b1			# LN: 58 | 
__epilogue_260:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
	ret			# LN: 59 | 
