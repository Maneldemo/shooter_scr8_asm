
color_enemy:
		
		ld		de,16*(max_bullets+max_enem_bullets)+07800h	; F800h 6 positions for bullets
		
		ld	a,3
		out (0x99),a 		;set bits 14-16 of F800h
		ld a,14+128
		out (0x99),a
		
		ld	ix,enemies		; process two layer enemies

		ld	bc,256*max_enem+0x98
		
1:		ld	a,(ix+enemy_data.status)
		and 1
		jp	z,.next
		
		ld	a,(ix+enemy_data.frame)
		cp  (ix+enemy_data.color)
		jp	z,.next
		
		ld   (ix+enemy_data.color),a
		
		ld	l,a					; color x 4
		ld	h,0
[3]		add hl,hl				; color x 32
		push	bc
		ld	bc,color_base
		add	hl,bc
		pop	bc
		ld a,e 					; set bits 0-7
		out (0x99),a
		ld a,d 					; set bits 8-13 with write access
		out (0x99),a
		ld	a,b
[32]	outi
		ld b,a

.next
		push bc
		ld	bc,enemy_data
		add ix,bc
		pop bc
		ld hl,32
		add hl,de
		ex de,hl
		
		djnz	1b
		ret
