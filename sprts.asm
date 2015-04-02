
_hw_sprite_init:

		ld	a, :sprtdata
		setpage_a
		
		ld		c,0
		ld		de,0F000h
		call	_vdpsetvramwr
		ld		hl,sprtdata
		ld		bc,0x0098
[8]		otir

		
		ld		c,0
		ld		de,0FA00h
		call	_vdpsetvramwr
		ld		a,0xD8
		out 	(0x98),a
		ret
