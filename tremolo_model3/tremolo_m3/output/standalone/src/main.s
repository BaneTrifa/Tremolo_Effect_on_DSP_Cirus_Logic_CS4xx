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
	.extern _processing
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
	xmem[i7] = i7			# LN: 32 | 
	i7 += 1			# LN: 32 | 
	i7 = i7 + (0x2)			# LN: 32 | 
	i0 = i7 - (0x1)			# LN: 32 | 
	xmem[i0] = a0h			# LN: 32 | 
	i0 = i7 - (0x2)			# LN: 32 | 
	xmem[i0] = a1h			# LN: 32 | 
cline_32_0:			/* LN: 34 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_0_2 + 0]			# LN: 34 | 
	xmem[_input_gain + 0] = a0h			# LN: 34 | 
cline_34_0:			/* LN: 35 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_0_2 + 0]			# LN: 35 | 
	xmem[_headroom_gain + 0] = a0h			# LN: 35 | 
cline_35_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 36 | 
	a0 = xmem[i0]			# LN: 36 | 
	xmem[_tremolo_postGain + 0] = a0h			# LN: 36 | 
cline_36_0:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 37 | 
	a0 = xmem[i0]			# LN: 37 | 
	xmem[_LR_postGain + 0] = a0h			# LN: 37 | 
cline_37_0:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 39 | 
	xmem[_enable + 0] = a0h			# LN: 39 | 
cline_39_0:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 40 | 
	xmem[_mode + 0] = a0h			# LN: 40 | 
cline_40_0:			/* LN: 42 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 42 | 
	xmem[_phLeft + 0] = a0g			# LN: 42 | 
	xmem[_phLeft + 1] = a0h			# LN: 42 | 
	xmem[_phLeft + 2] = a0l			# LN: 42 | 
cline_42_0:			/* LN: 43 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 43 | 
	xmem[_phRight + 0] = a0g			# LN: 43 | 
	xmem[_phRight + 1] = a0h			# LN: 43 | 
	xmem[_phRight + 2] = a0l			# LN: 43 | 
cline_43_0:			/* LN: 44 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_250)			# LN: 44 | 
__epilogue_250:			/* LN: 44 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x2)			# LN: 44 | 
	i7 -= 1			# LN: 44 | 
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

_main:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 63 | 
	i7 += 1			# LN: 63 | 
	i7 = i7 + (0x216)			# LN: 63 | 
	i1 = i7 - (0x1)			# LN: 63 | 
	xmem[i1] = a0h			# LN: 63 | 
	i1 = i7 - (0x2)			# LN: 63 | 
	xmem[i1] = i0			# LN: 63 | 
cline_63_0:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_1_1 + 0]			# LN: 84 | 
	a1 = xmem[__extractedConst_2_1 + 0]			# LN: 84 | 
	call (_initGainProcessing)			# LN: 84 | 
cline_84_0:			/* LN: 87 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 87 | 
	a0 = 0			# LN: 87 | 
	xmem[i0] = a0h			# LN: 87 | 
	do (0x8), label_end_93			# LN: 87 | 
cline_87_0:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
label_begin_93:			/* LN: 87 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 88 | 
	a0 = 0			# LN: 88 | 
	xmem[i0] = a0h			# LN: 88 | 
	do (0x10), label_end_92			# LN: 88 | 
cline_88_0:			/* LN: 89 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 89 | 
	a0 = xmem[i0]; a1 = 0			# LN: 89, 89 | 
	a0 = a0 << 4			# LN: 89 | 
	i0 = a0			# LN: 89 | 
	i1 = i7 - (0x4)			# LN: 89 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 89 | 
	a0 = xmem[i1]			# LN: 89 | 
	b0 = i0			# LN: 89 | 
	a0 = a0 + b0			# LN: 89 | 
	AnyReg(i0, a0h)			# LN: 89 | 
	nop #empty cycle
	ymem[i0] = a1h			# LN: 89 | 
cline_89_0:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 89 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 88 | 
	a0 = xmem[i0]			# LN: 88 | 
	uhalfword(a1) = (0x1)			# LN: 88 | 
	a0 = a0 + a1			# LN: 88 | 
	i0 = i7 - (0x4)			# LN: 88 | 
label_end_92:			# LN: 88 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 88 | 
cline_88_1:			/* LN: 87 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 89 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 87 | 
	a0 = xmem[i0]			# LN: 87 | 
	uhalfword(a1) = (0x1)			# LN: 87 | 
	a0 = a0 + a1			# LN: 87 | 
	i0 = i7 - (0x3)			# LN: 87 | 
label_end_93:			# LN: 87 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 87 | 
cline_87_1:			/* LN: 93 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 87 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 93 | 
	i0 = xmem[i0]			# LN: 93 | 
	i1 = i7 - (260 - 0)			# LN: 93 | 
	i4 = xmem[i0]			# LN: 93 | 
	i0 = i1			# LN: 93 | 
	i1 = i4			# LN: 93 | 
	call (_strcpy)			# LN: 93 | 
cline_93_0:			/* LN: 94 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (260 - 0)			# LN: 94 | 
	call (_cl_wavread_open)			# LN: 94 | 
	AnyReg(i0, a0h)			# LN: 94 | 
	i1 = i7 - (0x105)			# LN: 94 | 
	xmem[i1] = i0			# LN: 94 | 
cline_94_0:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 95 | 
	a0 = xmem[i0]			# LN: 95 | 
	a0 & a0			# LN: 95 | 
	if (a != 0) jmp (else_2)			# LN: 95 | 
cline_95_0:			/* LN: 97 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_0)			# LN: 97 | 
	call (_printf)			# LN: 97 | 
cline_97_0:			/* LN: 98 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 98 | 
	jmp (__epilogue_256)			# LN: 98 | 
cline_98_0:			/* LN: 104 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 104 | 
	i0 = xmem[i0]			# LN: 104 | 
	call (_cl_wavread_getnchannels)			# LN: 104 | 
	i0 = i7 - (0x106)			# LN: 104 | 
	xmem[i0] = a0h			# LN: 104 | 
cline_104_0:			/* LN: 105 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 105 | 
	i0 = xmem[i0]			# LN: 105 | 
	call (_cl_wavread_bits_per_sample)			# LN: 105 | 
	i0 = i7 - (0x107)			# LN: 105 | 
	xmem[i0] = a0h			# LN: 105 | 
cline_105_0:			/* LN: 106 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 106 | 
	i0 = xmem[i0]			# LN: 106 | 
	call (_cl_wavread_frame_rate)			# LN: 106 | 
	i0 = i7 - (0x108)			# LN: 106 | 
	xmem[i0] = a0h			# LN: 106 | 
cline_106_0:			/* LN: 107 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 107 | 
	i0 = xmem[i0]			# LN: 107 | 
	call (_cl_wavread_number_of_frames)			# LN: 107 | 
	i0 = i7 - (0x109)			# LN: 107 | 
	xmem[i0] = a0h			# LN: 107 | 
cline_107_0:			/* LN: 112 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 112 | 
	i0 = xmem[i0]			# LN: 112 | 
	i1 = i7 - (521 - 0)			# LN: 112 | 
	i0 += 1			# LN: 112 | 
	i4 = xmem[i0]			# LN: 112 | 
	i0 = i1			# LN: 112 | 
	i1 = i4			# LN: 112 | 
	call (_strcpy)			# LN: 112 | 
cline_112_0:			/* LN: 114 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_enable + 0]			# LN: 114 | 
	a0 & a0			# LN: 114 | 
	if (a == 0) jmp (else_3)			# LN: 114 | 
cline_114_0:			/* LN: 117 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_mode + 0]			# LN: 117 | 
	i0 = a0			# LN: 117 | 
	i1 = i7 - (0x20a)			# LN: 117 | 
	i0 = i0 + (_mode_to_num_out_ch + 0)			# LN: 117 | 
	a0 = xmem[i0]			# LN: 117 | 
	xmem[i1] = a0h			# LN: 117 | 
cline_117_0:			/* LN: 120 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_mode + 0]			# LN: 120 | 
	uhalfword(a1) = (0x2)			# LN: 120 | 
	a0 - a1			# LN: 120 | 
	if (a != 0) jmp (elsecondition_0)			# LN: 120 | 
	uhalfword(a0) = (0x3)			# LN: 120 | 
	jmp (endcondition_0)			# LN: 120 | 
elsecondition_0:			/* LN: 120 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 120 | 
endcondition_0:			/* LN: 120 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 120 | 
	xmem[i0] = a0h			# LN: 120 | 
	jmp (endif_3)			# LN: 120 | 
cline_120_0:			/* LN: 124 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 114 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 124 | 
	uhalfword(a0) = (0x2)			# LN: 124 | 
	xmem[i0] = a0h			# LN: 124 | 
cline_124_0:			/* LN: 125 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 125 | 
	a0 = 0			# LN: 125 | 
	xmem[i0] = a0h			# LN: 125 | 
cline_125_0:			/* LN: 128 | CYCLE: 0 | RULES: () */ 
endif_3:			/* LN: 114 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (521 - 0)			# LN: 128 | 
	i1 = i7 - (0x107)			# LN: 128 | 
	a0 = xmem[i1]			# LN: 128 | 
	i1 = i7 - (0x20a)			# LN: 128 | 
	a1 = xmem[i1]			# LN: 128 | 
	i1 = i7 - (0x108)			# LN: 128 | 
	b0 = xmem[i1]			# LN: 128 | 
	call (_cl_wavwrite_open)			# LN: 128 | 
	AnyReg(i0, a0h)			# LN: 128 | 
	i1 = i7 - (0x20c)			# LN: 128 | 
	xmem[i1] = i0			# LN: 128 | 
cline_128_0:			/* LN: 129 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 129 | 
	a0 = xmem[i0]			# LN: 129 | 
	a0 & a0			# LN: 129 | 
	if (a != 0) jmp (else_4)			# LN: 129 | 
cline_129_0:			/* LN: 131 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_1)			# LN: 131 | 
	call (_printf)			# LN: 131 | 
cline_131_0:			/* LN: 132 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 132 | 
	jmp (__epilogue_256)			# LN: 132 | 
cline_132_0:			/* LN: 145 | CYCLE: 0 | RULES: () */ 
endif_4:			/* LN: 129 | CYCLE: 0 | RULES: () */ 
else_4:			/* LN: 129 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 145 | 
	a0 = 0			# LN: 145 | 
	xmem[i0] = a0h			# LN: 145 | 
for_2:			/* LN: 145 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x109)			# LN: 145 | 
	a0 = xmem[i0]			# LN: 145 | 
	uhalfword(a1) = (0x10)			# LN: 145 | 
	call (__div)			# LN: 145 | 
	i0 = i7 - (0x20d)			# LN: 145 | 
	a1 = xmem[i0]			# LN: 145 | 
	a1 - a0			# LN: 145 | 
	if (a >= 0) jmp (for_end_2)			# LN: 145 | 
cline_145_0:			/* LN: 147 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 147 | 
	a0 = 0			# LN: 147 | 
	xmem[i0] = a0h			# LN: 147 | 
	do (0x10), label_end_94			# LN: 147 | 
cline_147_0:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
label_begin_94:			/* LN: 147 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 149 | 
	a0 = 0			# LN: 149 | 
	xmem[i0] = a0h			# LN: 149 | 
for_4:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 149 | 
	a0 = xmem[i0]			# LN: 149 | 
	i0 = i7 - (0x106)			# LN: 149 | 
	a1 = xmem[i0]			# LN: 149 | 
	a0 - a1			# LN: 149 | 
	if (a >= 0) jmp (for_end_4)			# LN: 149 | 
cline_149_0:			/* LN: 151 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 151 | 
	i0 = xmem[i0]			# LN: 151 | 
	call (_cl_wavread_recvsample)			# LN: 151 | 
	i0 = i7 - (0x210)			# LN: 151 | 
	xmem[i0] = a0h			# LN: 151 | 
cline_151_0:			/* LN: 152 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 152 | 
	a0 = xmem[i0]			# LN: 152 | 
	a0 = a0 << 4			# LN: 152 | 
	i0 = a0			# LN: 152 | 
	i1 = i7 - (0x20e)			# LN: 152 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 152 | 
	a0 = xmem[i1]			# LN: 152 | 
	a1 = i0			# LN: 152 | 
	a0 = a1 + a0			# LN: 152 | 
	AnyReg(i0, a0h)			# LN: 152 | 
	i1 = i7 - (0x210)			# LN: 152 | 
	a0 = xmem[i1]			# LN: 152 | 
	ymem[i0] = a0h			# LN: 152 | 
cline_152_0:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
init_latch_label_2:			/* LN: 153 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 149 | 
	a0 = xmem[i0]			# LN: 149 | 
	uhalfword(a1) = (0x1)			# LN: 149 | 
	a0 = a0 + a1			# LN: 149 | 
	i0 = i7 - (0x20f)			# LN: 149 | 
	xmem[i0] = a0h			# LN: 149 | 
	jmp (for_4)			# LN: 149 | 
cline_149_1:			/* LN: 147 | CYCLE: 0 | RULES: () */ 
init_latch_label_3:			/* LN: 154 | CYCLE: 0 | RULES: () */ 
for_end_4:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 147 | 
	a0 = xmem[i0]			# LN: 147 | 
	uhalfword(a1) = (0x1)			# LN: 147 | 
	a0 = a0 + a1			# LN: 147 | 
	i0 = i7 - (0x20e)			# LN: 147 | 
label_end_94:			# LN: 147 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 147 | 
cline_147_1:			/* LN: 157 | CYCLE: 0 | RULES: () */ 
for_end_3:			/* LN: 147 | CYCLE: 0 | RULES: () */ 
	call (_cl_get_cycle_count)			# LN: 157 | 
	i0 = i7 - (0x212)			# LN: 157 | 
	xmem[i0] = a0h; i0 += 1			# LN: 157, 157 | 
	xmem[i0] = a0l			# LN: 157 | 
cline_157_0:			/* LN: 159 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer)			# LN: 159 | 
	i1 = (0) + (_sampleBuffer)			# LN: 159 | 
	call (_processing)			# LN: 159 | 
cline_159_0:			/* LN: 160 | CYCLE: 0 | RULES: () */ 
	call (_cl_get_cycle_count)			# LN: 160 | 
	i0 = i7 - (0x214)			# LN: 160 | 
	xmem[i0] = a0h; i0 += 1			# LN: 160, 160 | 
	xmem[i0] = a0l			# LN: 160 | 
cline_160_0:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x214)			# LN: 162 | 
	a0 = xmem[i0]; i0 += 1			# LN: 162, 162 | 
	a0l = xmem[i0]			# LN: 162 | 
	i0 = i7 - (0x212)			# LN: 162 | 
	a1 = xmem[i0]; i0 += 1			# LN: 162, 162 | 
	a1l = xmem[i0]			# LN: 162 | 
	a0 = a0 - a1			# LN: 162 | 
	i0 = i7 - (0x216)			# LN: 162 | 
	xmem[i0] = a0h; i0 += 1			# LN: 162, 162 | 
	xmem[i0] = a0l			# LN: 162 | 
cline_162_0:			/* LN: 163 | CYCLE: 0 | RULES: () */ 
	i1 = i7 - (0x216)			# LN: 163 | 
	a0 = xmem[i1]; i1 += 1			# LN: 163, 163 | 
	a0l = xmem[i1]			# LN: 163 | 
	i0 = (0) + (_string_const_2)			# LN: 163 | 
	call (_printf)			# LN: 163 | 
cline_163_0:			/* LN: 166 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 166 | 
	a0 = 0			# LN: 166 | 
	xmem[i0] = a0h			# LN: 166 | 
	do (0x10), label_end_95			# LN: 166 | 
cline_166_0:			/* LN: 168 | CYCLE: 0 | RULES: () */ 
label_begin_95:			/* LN: 166 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 168 | 
	a0 = xmem[i0]			# LN: 168 | 
	i0 = i7 - (0x20f)			# LN: 168 | 
	xmem[i0] = a0h			# LN: 168 | 
for_6:			/* LN: 168 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 168 | 
	a0 = xmem[i0]			# LN: 168 | 
	i0 = i7 - (0x20b)			# LN: 168 | 
	a1 = xmem[i0]			# LN: 168 | 
	a0 = a0 + a1			# LN: 168 | 
	i0 = i7 - (0x20f)			# LN: 168 | 
	a1 = xmem[i0]			# LN: 168 | 
	a1 - a0			# LN: 168 | 
	if (a >= 0) jmp (for_end_6)			# LN: 168 | 
cline_168_0:			/* LN: 170 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 170 | 
	a0 = xmem[i0]			# LN: 170 | 
	a0 = a0 << 4			# LN: 170 | 
	i0 = a0			# LN: 170 | 
	i1 = i7 - (0x20e)			# LN: 170 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 170 | 
	a0 = xmem[i1]			# LN: 170 | 
	a1 = i0			# LN: 170 | 
	a0 = a1 + a0			# LN: 170 | 
	AnyReg(i0, a0h)			# LN: 170 | 
	i1 = i7 - (0x210)			# LN: 170 | 
	a0 = ymem[i0]			# LN: 170 | 
	xmem[i1] = a0h			# LN: 170 | 
cline_170_0:			/* LN: 171 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 171 | 
	i1 = i7 - (0x210)			# LN: 171 | 
	a0 = xmem[i1]			# LN: 171 | 
	i0 = xmem[i0]			# LN: 171 | 
	call (_cl_wavwrite_sendsample)			# LN: 171 | 
cline_171_0:			/* LN: 168 | CYCLE: 0 | RULES: () */ 
init_latch_label_4:			/* LN: 172 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 168 | 
	a0 = xmem[i0]			# LN: 168 | 
	uhalfword(a1) = (0x1)			# LN: 168 | 
	a0 = a0 + a1			# LN: 168 | 
	i0 = i7 - (0x20f)			# LN: 168 | 
	xmem[i0] = a0h			# LN: 168 | 
	jmp (for_6)			# LN: 168 | 
cline_168_1:			/* LN: 166 | CYCLE: 0 | RULES: () */ 
init_latch_label_5:			/* LN: 173 | CYCLE: 0 | RULES: () */ 
for_end_6:			/* LN: 168 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 166 | 
	a0 = xmem[i0]			# LN: 166 | 
	uhalfword(a1) = (0x1)			# LN: 166 | 
	a0 = a0 + a1			# LN: 166 | 
	i0 = i7 - (0x20e)			# LN: 166 | 
label_end_95:			# LN: 166 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 166 | 
cline_166_1:			/* LN: 145 | CYCLE: 0 | RULES: () */ 
init_latch_label_6:			/* LN: 174 | CYCLE: 0 | RULES: () */ 
for_end_5:			/* LN: 166 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 145 | 
	a0 = xmem[i0]			# LN: 145 | 
	uhalfword(a1) = (0x1)			# LN: 145 | 
	a0 = a0 + a1			# LN: 145 | 
	i0 = i7 - (0x20d)			# LN: 145 | 
	xmem[i0] = a0h			# LN: 145 | 
	jmp (for_2)			# LN: 145 | 
cline_145_1:			/* LN: 179 | CYCLE: 0 | RULES: () */ 
for_end_2:			/* LN: 145 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 179 | 
	i0 = xmem[i0]			# LN: 179 | 
	call (_cl_wavread_close)			# LN: 179 | 
cline_179_0:			/* LN: 180 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 180 | 
	i0 = xmem[i0]			# LN: 180 | 
	call (_cl_wavwrite_close)			# LN: 180 | 
cline_180_0:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 183 | 
	jmp (__epilogue_256)			# LN: 183 | 
cline_183_0:			/* LN: 184 | CYCLE: 0 | RULES: () */ 
__epilogue_256:			/* LN: 184 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x216)			# LN: 184 | 
	i7 -= 1			# LN: 184 | 
	ret			# LN: 184 | 



_saturation:			/* LN: 46 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 46 | 
	i7 += 1			# LN: 46 | 
	i7 = i7 + (0x3)			# LN: 46 | 
	i0 = i7 - (0x3)			# LN: 46 | 
	xmem[i0] = a0g; i0 += 1			# LN: 46, 46 | 
	xmem[i0] = a0h; i0 += 1			# LN: 46, 46 | 
	xmem[i0] = a0l			# LN: 46 | 
cline_46_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 49 | 
	a0g = xmem[i0]; i0 += 1			# LN: 49, 49 | 
	a0h = xmem[i0]; i0 += 1			# LN: 49, 49 | 
	a0l = xmem[i0]			# LN: 49 | 
	b0 =+ a0			# LN: 49 | 
	b0 = b0 >> 1			# LN: 49 | 
	a0 = xmem[_limiterThreshold + 0]			# LN: 49 | 
	a0 = a0 >> 1			# LN: 49 | 
	b0 - a0			# LN: 49 | 
	if (b <= 0) jmp (else_0)			# LN: 49 | 
cline_49_0:			/* LN: 51 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_limiterThreshold + 0]			# LN: 51 | 
	jmp (__epilogue_252)			# LN: 51 | 
cline_51_0:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_limiterThreshold + 0]			# LN: 53 | 
	i0 = i7 - (0x3)			# LN: 53 | 
	b0g = xmem[i0]; i0 += 1			# LN: 53, 53 | 
	b0h = xmem[i0]; i0 += 1			# LN: 53, 53 | 
	a0 =- a0			# LN: 53 | 
	b0l = xmem[i0]			# LN: 53 | 
	a0 = a0 >> 1; b0 = b0 >> 1			# LN: 53, 53 | 
	b0 - a0			# LN: 53 | 
	if (b >= 0) jmp (else_1)			# LN: 53 | 
cline_53_0:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_limiterThreshold + 0]			# LN: 55 | 
	a0 =- a0			# LN: 55 | 
	jmp (__epilogue_252)			# LN: 55 | 
cline_55_0:			/* LN: 58 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 58 | 
	a0g = xmem[i0]; i0 += 1			# LN: 58, 58 | 
	a0h = xmem[i0]; i0 += 1			# LN: 58, 58 | 
	a0l = xmem[i0]			# LN: 58 | 
	a0 = a0			# LN: 58 | 
	jmp (__epilogue_252)			# LN: 58 | 
cline_58_0:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
__epilogue_252:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x3)			# LN: 59 | 
	i7 -= 1			# LN: 59 | 
	ret			# LN: 59 | 
