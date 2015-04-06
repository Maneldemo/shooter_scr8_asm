
; _sat_update
	; push	hl
	; push	de
	; push	bc
	
	; call __sat_update
	
	; pop		bc
	; pop		de
	; pop		hl
	; ret
	
__sat_update
	ld		c,0
	ld		de,0FA00h
	call	_vdpsetvramwr
	ld		hl,_sat
	ld		bc,0x8098
1:	outi
	ld	a,(_xoffset)		; set R#18 only if not scrolling
	add	a,(hl)
	out (0x98),a
	inc hl
[2]	outi
	djnz 1b
	ret
	
	; ld	a,0xD8
	; out 	(0x98),a

