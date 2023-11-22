	.public _sin_table
	.public _gen_sin
	.extern __rshift_laccum
	.extern __laccum_to_int
	.extern __lshift_laccum
	.xdata_ovly
__extractedConst_0_1
	.dw  (0x0)
	.dw  (0xc90fdaa2)
	.dw  (0x2130f000)
	.xdata_ovly
__extractedConst_1_1
	.dw  (0x1)
	.dw  (0x921fb544)
	.dw  (0x4261e000)
	.xdata_ovly
__extractedConst_2_1
	.dw  (0x2)
	.dw  (0x5b2f8fe6)
	.dw  (0x6392e000)
	.xdata_ovly
_sin_table
	.dw  (0x0)
	.dw  (0xc9107f)
	.dw  (0x19220ff)
	.dw  (0x25b291b)
	.dw  (0x32428d4)
	.dw  (0x3ed288c)
	.dw  (0x4b6177e)
	.dw  (0x57efe0c)
	.dw  (0x647dc37)
	.dw  (0x710a137)
	.dw  (0x7d95dd4)
	.dw  (0x8a20147)
	.dw  (0x96a93f2)
	.dw  (0xa330510)
	.dw  (0xafb6566)
	.dw  (0xbc3ac92)
	.dw  (0xc8bd230)
	.dw  (0xd53dea4)
	.dw  (0xe1bc126)
	.dw  (0xee38a7e)
	.dw  (0xfab29e4)
	.dw  (0x10729f59)
	.dw  (0x1139f340)
	.dw  (0x120114d2)
	.dw  (0x12c80c73)
	.dw  (0x138eda22)
	.dw  (0x1455757d)
	.dw  (0x151bde82)
	.dw  (0x15e21533)
	.dw  (0x16a8112b)
	.dw  (0x176ddace)
	.dw  (0x183369b9)
	.dw  (0x18f8b588)
	.dw  (0x19bdcf03)
	.dw  (0x1a829cfd)
	.dw  (0x1b473040)
	.dw  (0x1c0b8066)
	.dw  (0x1ccf8d71)
	.dw  (0x1d934efc)
	.dw  (0x1e56cd6c)
	.dw  (0x1f19f7f8)
	.dw  (0x1fdcdf69)
	.dw  (0x209f72f7)
	.dw  (0x2161b2a2)
	.dw  (0x2223a6ce)
	.dw  (0x22e53eb3)
	.dw  (0x23a68b19)
	.dw  (0x24677b39)
	.dw  (0x25280f12)
	.dw  (0x25e846a5)
	.dw  (0x26a821f2)
	.dw  (0x2767a0f9)
	.dw  (0x2826bb55)
	.dw  (0x28e57108)
	.dw  (0x29a3c211)
	.dw  (0x2a61ae70)
	.dw  (0x2b1f3626)
	.dw  (0x2bdc50ce)
	.dw  (0x2c98fe69)
	.dw  (0x2d553ef6)
	.dw  (0x2e110a13)
	.dw  (0x2ecc6822)
	.dw  (0x2f8750c1)
	.dw  (0x3041c3ef)
	.dw  (0x30fbc1ac)
	.dw  (0x31b549f9)
	.dw  (0x326e5471)
	.dw  (0x3326e115)
	.dw  (0x33deefe4)
	.dw  (0x349680e0)
	.dw  (0x354d9407)
	.dw  (0x36041893)
	.dw  (0x36ba1f4b)
	.dw  (0x376f9fcb)
	.dw  (0x382491af)
	.dw  (0x38d8fd5c)
	.dw  (0x398cda6e)
	.dw  (0x3a403148)
	.dw  (0x3af2f123)
	.dw  (0x3ba51a00)
	.dw  (0x3c56bca5)
	.dw  (0x3d07bfe7)
	.dw  (0x3db8348f)
	.dw  (0x3e6809d4)
	.dw  (0x3f17481b)
	.dw  (0x3fc5ef62)
	.dw  (0x4073eee5)
	.dw  (0x41215768)
	.dw  (0x41ce2089)
	.dw  (0x427a41e5)
	.dw  (0x4325c3de)
	.dw  (0x43d09e12)
	.dw  (0x447ad080)
	.dw  (0x452452c5)
	.dw  (0x45cd35a8)
	.dw  (0x46756861)
	.dw  (0x471ceaf2)
	.dw  (0x47c3c5bd)
	.dw  (0x4869e7fb)
	.dw  (0x490f5a10)
	.dw  (0x49b41398)
	.dw  (0x4a581cf7)
	.dw  (0x4afb6dca)
	.dw  (0x4b9e060f)
	.dw  (0x4c3fdd65)
	.dw  (0x4ce0fc2e)
	.dw  (0x4d81626b)
	.dw  (0x4e2107b7)
	.dw  (0x4ebfec13)
	.dw  (0x4f5e071c)
	.dw  (0x4ffb6134)
	.dw  (0x5097fa5d)
	.dw  (0x5133ca31)
	.dw  (0x51ced0b3)
	.dw  (0x52691644)
	.dw  (0x530281ba)
	.dw  (0x539b2c40)
	.dw  (0x54330510)
	.dw  (0x54ca0c28)
	.dw  (0x55604189)
	.dw  (0x55f5a533)
	.dw  (0x568a3726)
	.dw  (0x571deefe)
	.dw  (0x57b0d51f)
	.dw  (0x5842e126)
	.dw  (0x58d40aae)
	.dw  (0x59646280)
	.dw  (0x59f3e037)
	.dw  (0x5a827b6f)
	.dw  (0x5b10342a)
	.dw  (0x5b9d12ca)
	.dw  (0x5c290eed)
	.dw  (0x5cb4202d)
	.dw  (0x5d3e4ef0)
	.dw  (0x5dc79b34)
	.dw  (0x5e5004fb)
	.dw  (0x5ed77b7c)
	.dw  (0x5f5e0f7f)
	.dw  (0x5fe3b03e)
	.dw  (0x60686e7e)
	.dw  (0x60ec3979)
	.dw  (0x616f112f)
	.dw  (0x61f0fe04)
	.dw  (0x6271f794)
	.dw  (0x62f1fdde)
	.dw  (0x637110e4)
	.dw  (0x63ef30a4)
	.dw  (0x646c5d20)
	.dw  (0x64e8858f)
	.dw  (0x6563c31d)
	.dw  (0x65ddfc9f)
	.dw  (0x66573a79)
	.dw  (0x66cf850d)
	.dw  (0x6746cb96)
	.dw  (0x67bd0e12)
	.dw  (0x683254e6)
	.dw  (0x68a6a012)
	.dw  (0x6919e731)
	.dw  (0x698c21e1)
	.dw  (0x69fd60e9)
	.dw  (0x6a6d9be4)
	.dw  (0x6adcca70)
	.dw  (0x6b4af4f0)
	.dw  (0x6bb81301)
	.dw  (0x6c242d05)
	.dw  (0x6c8f3237)
	.dw  (0x6cf9335d)
	.dw  (0x6d622813)
	.dw  (0x6dca1059)
	.dw  (0x6e30e3cd)
	.dw  (0x6e96aad1)
	.dw  (0x6efb5d03)
	.dw  (0x6f5f02c4)
	.dw  (0x6fc193b3)
	.dw  (0x70230fcf)
	.dw  (0x70837718)
	.dw  (0x70e2c98e)
	.dw  (0x71410731)
	.dw  (0x719e3001)
	.dw  (0x71fa3b9a)
	.dw  (0x725529fe)
	.dw  (0x72af038e)
	.dw  (0x7307bfe7)
	.dw  (0x735f676e)
	.dw  (0x73b5e95b)
	.dw  (0x740b5675)
	.dw  (0x745f9df5)
	.dw  (0x74b2c83e)
	.dw  (0x7504d551)
	.dw  (0x7555bcca)
	.dw  (0x75a5870d)
	.dw  (0x75f42bb6)
	.dw  (0x7641b328)
	.dw  (0x768e0c9d)
	.dw  (0x76d948dc)
	.dw  (0x77235f80)
	.dw  (0x776c508b)
	.dw  (0x77b41bfb)
	.dw  (0x77fab96f)
	.dw  (0x78403148)
	.dw  (0x78848387)
	.dw  (0x78c7a7c9)
	.dw  (0x7909a671)
	.dw  (0x794a7f80)
	.dw  (0x798a222d)
	.dw  (0x79c89f40)
	.dw  (0x7a05ee56)
	.dw  (0x7a420f6f)
	.dw  (0x7a7d028a)
	.dw  (0x7ab6c7a7)
	.dw  (0x7aef672b)
	.dw  (0x7b26c7ea)
	.dw  (0x7b5d0310)
	.dw  (0x7b9207d4)
	.dw  (0x7bc5de9c)
	.dw  (0x7bf88765)
	.dw  (0x7c29f9ce)
	.dw  (0x7c5a3e39)
	.dw  (0x7c894c44)
	.dw  (0x7cb723ee)
	.dw  (0x7ce3cd9a)
	.dw  (0x7d0f40e5)
	.dw  (0x7d397dd0)
	.dw  (0x7d628cbd)
	.dw  (0x7d8a5ce5)
	.dw  (0x7db0ff10)
	.dw  (0x7dd66277)
	.dw  (0x7dfa97e1)
	.dw  (0x7e1d96e9)
	.dw  (0x7e3f572d)
	.dw  (0x7e5fe111)
	.dw  (0x7e7f3cf7)
	.dw  (0x7e9d5a18)
	.dw  (0x7eba3875)
	.dw  (0x7ed5e8d5)
	.dw  (0x7ef05a70)
	.dw  (0x7f0995aa)
	.dw  (0x7f219220)
	.dw  (0x7f385836)
	.dw  (0x7f4de7ea)
	.dw  (0x7f6238da)
	.dw  (0x7f754b05)
	.dw  (0x7f872f33)
	.dw  (0x7f97cc39)
	.dw  (0x7fa732df)
	.dw  (0x7fb56323)
	.dw  (0x7fc254a3)
	.dw  (0x7fce0fc2)
	.dw  (0x7fd883ba)
	.dw  (0x7fe1c9b4)
	.dw  (0x7fe9c886)
	.dw  (0x7ff090f7)
	.dw  (0x7ff62307)
	.dw  (0x7ffa7653)
	.dw  (0x7fffd60e)
	.dw  (0x7ffff79c)
	.code_ovly



_gen_sin:			/* LN: 31 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = a2g; i7 += 1			# LN: 31, 31 | 
	xmem[i7] = a2h; i7 += 1			# LN: 31, 31 | 
	xmem[i7] = a2l; i7 += 1			# LN: 31, 31 | 
	xmem[i7] = b2g; i7 += 1			# LN: 31, 31 | 
	xmem[i7] = b2h; i7 += 1			# LN: 31, 31 | 
	xmem[i7] = b2l			# LN: 31 | 
	b1 =+ a0			# LN: 31 | 
	a1 = 0			# LN: 44 | 
	a1g = (0x51)			# LN: 44 | 
	uhalfword(a2) = (0x8)			# LN: 44 | 
	a0 =+ a1; b0 =+ b1			# LN: 44, 52 | 
	a1 =+ a2			# LN: 44 | 
	call (__rshift_laccum)			# LN: 44 | 
	b2g = xmem[__extractedConst_0_1 + 0]			# LN: 52 | 
	b2h = xmem[__extractedConst_0_1 + 1]			# LN: 52 | 
	b2l = xmem[__extractedConst_0_1 + 2]			# LN: 52 | 
	b0 = b0 >> 1			# LN: 52 | 
	a2 =+ a0			# LN: 44 | 
	b2 = b2 >> 1			# LN: 52 | 
	a0 =+ a2			# LN: 44 | 
	x0 = a0; b0 - b2			# LN: 45, 52 | 
	if (b > 0) jmp (else_0)			# LN: 52 | 
	b1 = b1 >> 1			# LN: 55 | 
	x1 = b1			# LN: 56 | 
	a0 = x1 * x0			# LN: 58 | 
	a0 = a0 << 8			# LN: 59 | 
	a0 = a0 << 1			# LN: 59 | 
	call (__laccum_to_int)			# LN: 60 | 
	i0 = a0			# LN: 62 | 
	nop #empty cycle
	i0 = i0 + (_sin_table + 0)			# LN: 62 | 
	a0 = xmem[i0]			# LN: 62 | 
	jmp (__epilogue_104)			# LN: 62 | 
else_0:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
	a1g = xmem[__extractedConst_1_1 + 0]			# LN: 64 | 
	a1h = xmem[__extractedConst_1_1 + 1]			# LN: 64 | 
	a1l = xmem[__extractedConst_1_1 + 2]			# LN: 64 | 
	a0 =+ b1; b0 =+ a1			# LN: 64, 64 | 
	a0 = a0 >> 1; b0 = b0 >> 1			# LN: 64, 64 | 
	a0 - b0			# LN: 64 | 
	if (a > 0) jmp (else_1)			# LN: 64 | 
	a0g = xmem[__extractedConst_1_1 + 0]			# LN: 66 | 
	a0h = xmem[__extractedConst_1_1 + 1]			# LN: 66 | 
	a0l = xmem[__extractedConst_1_1 + 2]			# LN: 66 | 
	a0 = a0 - b1			# LN: 66 | 
	a0 = a0 >> 1			# LN: 68 | 
	x1 = a0			# LN: 69 | 
	a0 = x1 * x0			# LN: 71 | 
	a0 = a0 << 8			# LN: 72 | 
	a0 = a0 << 1			# LN: 72 | 
	call (__laccum_to_int)			# LN: 73 | 
	i0 = a0			# LN: 75 | 
	nop #empty cycle
	i0 = i0 + (_sin_table + 0)			# LN: 75 | 
	a0 = xmem[i0]			# LN: 75 | 
	jmp (__epilogue_104)			# LN: 75 | 
else_1:			/* LN: 64 | CYCLE: 0 | RULES: () */ 
	a1g = xmem[__extractedConst_2_1 + 0]			# LN: 77 | 
	a1h = xmem[__extractedConst_2_1 + 1]			# LN: 77 | 
	a1l = xmem[__extractedConst_2_1 + 2]			# LN: 77 | 
	a0 =+ b1; b0 =+ a1			# LN: 77, 77 | 
	a0 = a0 >> 1; b0 = b0 >> 1			# LN: 77, 77 | 
	a0 - b0			# LN: 77 | 
	if (a > 0) jmp (else_2)			# LN: 77 | 
	a0g = xmem[__extractedConst_1_1 + 0]			# LN: 79 | 
	a0h = xmem[__extractedConst_1_1 + 1]			# LN: 79 | 
	a0l = xmem[__extractedConst_1_1 + 2]			# LN: 79 | 
	a0 = a0 - b1			# LN: 79 | 
	a0 =- a0			# LN: 79 | 
	a0 = a0 >> 1			# LN: 81 | 
	x1 = a0			# LN: 82 | 
	a0 = x1 * x0			# LN: 84 | 
	a0 = a0 << 8			# LN: 85 | 
	a0 = a0 << 1			# LN: 85 | 
	call (__laccum_to_int)			# LN: 86 | 
	i0 = a0			# LN: 88 | 
	nop #empty cycle
	i0 = i0 + (_sin_table + 0)			# LN: 88 | 
	a0 = xmem[i0]			# LN: 88 | 
	a0 =- a0			# LN: 88 | 
	jmp (__epilogue_104)			# LN: 88 | 
else_2:			/* LN: 77 | CYCLE: 0 | RULES: () */ 
	ufixed16(a0) = (0x921f)			# LN: 92 | 
	lo16(a0) = (0xb544)			# LN: 92 | 
	a0l = (0x4261)			# LN: 92 | 
	lo16(a0l) = (0xe000)			# LN: 92 | 
	a0g = (0x1)			# LN: 92 | 
	uhalfword(a1) = (0x1)			# LN: 92 | 
	call (__lshift_laccum)			# LN: 92 | 
	a0 = a0 - b1			# LN: 93 | 
	a0 = a0 >> 1			# LN: 95 | 
	x1 = a0			# LN: 96 | 
	a0 = x1 * x0			# LN: 98 | 
	a0 = a0 << 8			# LN: 99 | 
	a0 = a0 << 1			# LN: 99 | 
	call (__laccum_to_int)			# LN: 100 | 
	i0 = a0			# LN: 102 | 
	nop #empty cycle
	i0 = i0 + (_sin_table + 0)			# LN: 102 | 
	a0 = xmem[i0]			# LN: 102 | 
	a0 =- a0			# LN: 102 | 
__epilogue_104:			/* LN: 105 | CYCLE: 0 | RULES: () */ 
	b2l = xmem[i7]; i7 -= 1			# LN: 105, 105 | 
	b2h = xmem[i7]; i7 -= 1			# LN: 105, 105 | 
	b2g = xmem[i7]; i7 -= 1			# LN: 105, 105 | 
	a2l = xmem[i7]; i7 -= 1			# LN: 105, 105 | 
	a2h = xmem[i7]; i7 -= 1			# LN: 105, 105 | 
	a2g = xmem[i7]			# LN: 105 | 
	ret			# LN: 105 | 
