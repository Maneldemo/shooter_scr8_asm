
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


plot_enemy2:
	ld	iy,ram_sat+4*3
	ld	ix,enemies
	ld	b,max_enem + max_bullets + max_enem_bullets
	ld	c,3				; main ship and its shadow

.npc_loop1:
	ld	a,(ix+enemy_data.status)
	and 1
	jr	z,.spriteoff

	;XXXXXXXXXXXX
	; devo processare separatamente  MC,max_enem,max_bullets,max_enem_bullets
	; in modo da allocare queste categorie di sprite in posizioni fisse in SAT
	
.next
	ld	de,enemy_data
	add ix,de
	djnz	.npc_loop1
	ld	a,c
[2]	add a,a				; x4 -> sat data
	ld	(visible_sprts),a
	ret
	
.spriteoff
	ld	(iy+0),0xD9
	ld	de,4
	add iy,de
	jp	.next
