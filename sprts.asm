
_hw_sprite_init:

		ld		c,0
		ld		de,0F000h
		call	_vdpsetvramwr
		ld		hl,sprtdata
		ld		bc,0x0098
		ld		a,8
1:		otir
		dec	a
		jr	nz,1b

		ld		c,0
		ld		de,0FA00h
		call	_vdpsetvramwr
		ld		a,0xD8
		out 	(0x98),a

		ret
	
;;;;;;;;;;;;fake
npc_init1:
	ld  b,max_bullets + max_enem_bullets
	ld  ix,any_object
	ld	de,enemy_data
	
1:	ld  (ix+enemy_data.status),1
	call	rand8
	ld	(ix+enemy_data.x+0),a
	ld	(ix+enemy_data.x+1),3
	ld	a,b
	dec a
[4]	add	a,a
	ld	(ix+enemy_data.y),a
	ld	(ix+enemy_data.frame),8*4
	add ix,de
	djnz 	1b
	
	ld  b,max_enem
1:	ld  (ix+enemy_data.status),1
	call	rand8
	ld	(ix+enemy_data.x+0),a
	ld	(ix+enemy_data.x+1),2
	ld	a,b
	dec a
[4]	add	a,a
	ld	(ix+enemy_data.y),a
	call	rand8
	and		7
[4]	add	a,a
	add	a,16*4
	ld	(ix+enemy_data.frame),a
	add ix,de
	djnz 	1b
		
	; load fake colors 
load_color_pools
	ld		c,0
	ld		de,0FA00h-512
	call	_vdpsetvramwr
				
	ld	c,max_bullets + max_enem_bullets
2:	ld	b,16
	ld	a,15
1:	out	(0x98),a
	djnz 1b		
	dec	c
	jp	nz,2b
		
	ld	c,max_enem1
2:	ld	b,16
	ld	a,8
1:	out	(0x98),a
	djnz 1b		
	ld	b,16
	ld	a,3+64
1:	out	(0x98),a
	djnz 1b
	dec	c
	jp	nz,2b

	ld	c,max_enem2
2:	ld	b,16
	ld	a,13
1:	out	(0x98),a
	djnz 1b		
	ld	b,16
	ld	a,6+64
1:	out	(0x98),a
	djnz 1b
	dec	c
	jp	nz,2b
	ret
;;;;;;;;;;;;fake	

