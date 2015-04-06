
_hw_sprite_init:

		ld		c,0
		ld		de,0F000h
		call	_vdpsetvramwr
		ld		hl,sprtdata
		ld		bc,0x0098
[8]		otir

		ld		c,0
		ld		de,0FA00h-512
		call	_vdpsetvramwr
		ld	c,16
2:		ld	b,16
		ld	a,13
1:		out	(0x98),a
		djnz 1b		
		ld	b,16
		ld	a,7+64
1:		out	(0x98),a
		djnz 1b
		dec	c
		jr	nz,2b

		ld		c,0
		ld		de,0FA00h
		call	_vdpsetvramwr
		; ld		hl,_sat
		; ld		bc,0x8098
		; otir

		ld		a,0xD8
		out 	(0x98),a

		ld  hl,_rom_sat
		ld	de,_sat
		ld	bc,4*32
		ldir
		ret
_rom_sat
counter:=0
    repeat	4
		repeat	4
		db	24+ (@@# * 24)
		db	32+(@# * 48)
		db	0+counter*4
		db	15
		db	24+ (@@# * 24)
		db	32+(@# * 48)
		db	0+(counter+2)*4
		db	15
counter:=counter+4
		endrepeat
	endrepeat
	