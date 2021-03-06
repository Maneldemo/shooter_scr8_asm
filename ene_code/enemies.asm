	


max_enem:					equ 12		; max 12
max_enem_bullets:			equ 3
max_bullets:				equ 2		; max number of enemies*2 + ms_bullets + enem_bullets + 3 for ms	<= 32 sprites

maxspeed:					equ 4		; the actual speed is divided by 4
assault_wave_timer_preset:	equ	3*60	; a wave each 3 seconds
enemy_bullet_speed:			equ	2	
xship_rel:					equ (128-8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ms_ani:
	include ms_demo_ani.asm
ms_col_win:
	include ms_demo_frm_coll_wind.asm

;--------------------------------------------------------------------
;--------------------------------------------------------------------
add_bc_score_bin
	ret
;--------------------------------------------------------------------

; Fast random number generator using the same method
; as the CDMA used in cellular telephones
;--------------------------------------------------------------------
; init random seed 

rand8_init:
	LD      HL,(_jiffy)
	SET		0,L
	LD      (randSeed),HL
	RET


; -------------------------------------------------------------------
; rand8
; -------------------------------------------------------------------
;
; choose a random number in the set [0,127] with uniform distribution
; return: A = random value

rand8:
	ld      hl,(randSeed)
	add     hl,hl
	sbc     a,a
	and     083h
	xor     l
	ld      l,a
	ld      (randSeed),hl
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	increase the wave counter
; 	and test for landing permission
	
land_now_test:
	ld	a,(wave_count)
	inc	a
	ld	(wave_count),a
	ld	e,a
	ld	a,(cur_level)
[2]	rrca
	and	15
	add	a,25
	cp	e				; 'land now' counter after  25+cur_level/4 waves
	ret nz

	; ld	hl,land_now
	; ld	de,0x1C00+8*3*32
	; call	print_strf
	ld	a,-1
	ld	(landing_permission),a
	
	ld	a,14			; Land Now
	call AFXPLAY
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; NPC initialization 
; it removes also bullets
;
npc_init:
	ld  ix,enemies
	ld  b,max_enem
	ld	de,enemy_data
	xor	a
	
1:  ld  (ix+enemy_data.status),a
	ld  (ix+enemy_data.kind),-1
	ld	(ix+enemy_data.cntr),a
	ld	(ix+enemy_data.color),-1
	ld	(ix+enemy_data.y),0xD9

	add ix,de
	djnz    1b

	ld	hl,assault_wave_timer_preset
	ld	(assault_wave_timer),hl
	xor	a
	ld	(wave_count),a
	ld	(landing_permission),a
	
; turn off MS and enemy bullets

bull_init:
	xor a
	ld  (bullet_rate),a

	ld  ix,ms_bullets
	ld	b,max_bullets+max_enem_bullets
	ld  de,enemy_data
	
1:	ld  (ix+enemy_data.status),a
	ld	(ix+enemy_data.color),15
	add ix,de
	djnz	1b

	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;	timer for wave assaults
;
wave_timer:
	ld	hl,(assault_wave_timer)
	dec	hl
	ld	a,h
	or	l
	ld	(assault_wave_timer),hl
	ret	nz

	ld	a,1			; wave incoming
	call AFXPLAY
	
	ld	hl,assault_wave_timer_preset
	ld	a,(cur_level)
	add	a,a
	ld	e,a
	ld	d,0
	and	a
	sbc	hl,de					; at level 15 frequency is a wave each 2,5 seconds
	ld	(assault_wave_timer),hl	; 180 - 2*cur_level
	

	call	land_now_test
	
	call	rand8
	and	7			
	
	jp	z,wave0
	dec	a
	jp	z,wave1
	dec	a
	jp	z,wave2
	dec	a
	jp	z,wave3
	dec	a
	jp	z,wave4
	dec	a
	jp	z,wave5
	dec	a
	jp	z,wave6
	jp	wave7
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	; align 0x100
; spritecolors:
	; db       15,14, 9, 7
	; db        9, 3,14,15

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;	enemies n#0 coming frontally
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
wave0:
wave1:
	ld  ix,enemies
	ld	iyh,max_enem
1:
	call	rand8
	and	7
	add	a,4
	ld	b,a			; frame
	
	ld	a,(dxmap)
	and	a
	jp	p,.pos
.neg
	ld	de,-64
	ld	c,+1		; enemies going right
	ld	a,b
[4]	add	a,a
	ld	b,a
	exx	
	ld 	de,1		; enemy speed = 1
	jr	1f
.pos
	ld	de,256+32
	ld	c,1+64		; enemies going left
	ld	a,b
	add	a,a
	inc	a
[3]	add	a,a
	ld	b,a
	exx	
	ld 	de,-1		; enemy speed = -1
1:
	ld  bc,enemy_data
	exx		

	call	rand8
	and	15			; Y off set
	
	ld	hl,(xmap)
	add	hl,de

1:
	bit	0,(ix+enemy_data.status)
	jr  nz,.next

	ld  (ix+enemy_data.status),c
	ld	(ix+enemy_data.frame),b

	ld  (ix+enemy_data.kind),0
	exx
	ld	(ix+enemy_data.speed),e
	ld	(ix+enemy_data.speed+1),d
	exx

	ld 		de,16
	bit	5,a
	jr	z,2f
	ld 		de,-16
	
2:	add 	hl,de 
	ld  	(ix+enemy_data.x),l
	ld  	(ix+enemy_data.x+1),h
	ld  	(ix+enemy_data.y),a
	add		a,32
	call	set_size
	exx	
	add ix,bc
	exx
	dec	iyh
	ret	z
	cp	mapHeight*16-16
	jp	c,1b
	ret

.next
	exx	
	add ix,bc
	exx
	dec	iyh
	ret	z
	jp	1b
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;	enemies n#2 coming from back
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wave2:
	ld	a,(dxmap)
	sra a			; de' = player speed x2
	ld	e,a
	rla
	sbc a,a
	ld	d,a
	exx

	jr	z,.pos				
.neg
	ld	de,256+32
	ld	c,1+64		; enemies going left
	
	call	rand8
	and	7
	add	a,4
	add	a,a
	inc	a
[3]	add	a,a
	ld	b,a			; frame
	
	jp	1f
.pos
	ld	de,-64
	ld	c,+1		; enemies going right

	call	rand8
	and	7
	add	a,4
[4]	add	a,a
	ld	b,a			; frame
	
1:
	call	rand8
	and	15			; Y off set
	add	a,mapHeight*16-32

	ld	hl,(xmap)
	add	hl,de

	; bit	7,b			; pick up a random bit from frame number
	; ld  ix,enemies1
	; ld	iyh,max_enem1
	; jr	z,1f
	; ld  ix,enemies2
	; ld	iyh,max_enem2
; 1:
	ld  ix,enemies
	ld	iyh,max_enem

	ld  de,enemy_data
1:
	bit	0,(ix+enemy_data.status)
	jr  nz,.next

	ld  (ix+enemy_data.status),c
	ld	(ix+enemy_data.frame),b

	ld  (ix+enemy_data.kind),2

	exx	
	ld	(ix+enemy_data.speed),e
	ld	(ix+enemy_data.speed+1),d
	exx
	
	push	bc
	bit	0,a			; pick up a random bit from Y
	ld 	bc,8
	jr z,11f
	ld 	bc,-8
11:	add hl,bc 
	ld  (ix+enemy_data.x),l
	ld  (ix+enemy_data.x+1),h
	pop		bc
	
	ld  (ix+enemy_data.y),a

	call	set_size

	add ix,de
	dec	iyh
	ret	z
	sub	a,32
	jp	nc,1b
	ret

.next
	add ix,de
	dec	iyh
	ret	z
	jr	1b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; waving enemies n#5 from back
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wave3:
	ld	a,(dxmap)
	sra a			; de' = player speed x 2
	ld	e,a
	rla
	sbc a,a
	ld	d,a
	exx

	jr	z,.pos				
.neg
	ld	de,256+32
	ld	bc,256*(96+8)+1+64		; enemies going left
	jr	1f
.pos
	ld	de,-64
	ld	bc,256*96+1			; enemies going right
	
1:
	call	rand8
	and	15					; random Y offset
	add	a,mapHeight*16-48
	
	ld	hl,(xmap)
	add	hl,de

	; bit	0,a			; pick up a random bit from Y offset
	; ld  ix,enemies1
	; ld	iyh,max_enem1
	; jr	z,1f
	; ld  ix,enemies2
	; ld	iyh,max_enem2
; 1:
	ld  ix,enemies
	ld	iyh,max_enem
	ld  de,enemy_data
1:
	bit	0,(ix+enemy_data.status)
	jr  nz,.next

	ld  (ix+enemy_data.status),c
	ld	(ix+enemy_data.frame),b

	ld  (ix+enemy_data.kind),5
	ld	(ix+enemy_data.cntr),0

	exx	
	ld	(ix+enemy_data.speed),e
	ld	(ix+enemy_data.speed+1),d
	exx
	
	push	bc
	bit	4,a
	ld bc,16
	jr	z,2f
	ld	bc,-16
2:	
	add hl,bc 
	ld  (ix+enemy_data.x),l
	ld  (ix+enemy_data.x+1),h
	pop		bc
	
	ld  (ix+enemy_data.y),a

	call	set_size

	add ix,de
	dec	iyh
	ret	z
	sub	a,24
	jp	nc,1b
	ret

.next
	add ix,de
	dec	iyh
	ret	z
	jr	1b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;	enemies n#4 coming from back
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wave4:
	ld	a,(dxmap)
	sra a			; de' = player speed x 2
	ld	e,a
	rla
	sbc a,a
	ld	d,a
	exx
	
_wave4_cont:

	jr	z,.pos				
.neg
	ld	de,256+32
	ld	c,+1+64		; enemies going left
	
	call	rand8
	and	7
	add	a,4
	add	a,a
	inc	a
[3]	add	a,a
	ld	b,a			; frame

	jr	1f
.pos
	ld	de,-64
	ld	c,+1		; enemies going right

	call	rand8
	and	7
	ld	a,4
[4]	add	a,a
	ld	b,a			; frame
	
1:
	call	rand8
	and	15			; Y off set

	bit	1,a			; pick up a random bit from Y offset
	jr	z,1f
	set	7,c			; go up instead of down
1:
		
	ld	hl,(xmap)
	add	hl,de

	; bit	0,a			; pick up a random bit from Y offset
	; ld  ix,enemies1
	; ld	iyh,max_enem1
	; jr	z,1f
	; ld  ix,enemies2
	; ld	iyh,max_enem2
; 1:
	ld  ix,enemies
	ld	iyh,max_enem
	ld  de,enemy_data
1:
	bit	0,(ix+enemy_data.status)
	jr  nz,.next

	ld  (ix+enemy_data.status),c
	ld	(ix+enemy_data.frame),b

	ld  (ix+enemy_data.kind),4

	exx	
	ld	(ix+enemy_data.speed),e
	ld	(ix+enemy_data.speed+1),d
	bit	7,d
	exx
	
	push	bc
	ld bc,16
	jr	z,11f
	ld bc,-16
11:	add hl,bc 
	ld  (ix+enemy_data.x),l
	ld  (ix+enemy_data.x+1),h
	pop		bc
	
	ld  (ix+enemy_data.y),a
	add	a,24

	call	set_size

	add ix,de
	dec	iyh
	ret	z
	cp	mapHeight*16-16
	jr	c,1b
	ret

.next
	add ix,de
	dec	iyh
	ret	z
	jr	1b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; spinning enemy #6 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wave5:
	ld	a,(dxmap)
	sra a			; de' = player speed x 2
	ld	e,a
	rla
	sbc a,a
	ld	d,a
	exx

	jr	z,.pos				
.neg
	ld	de,256+32
	ld	c,+1+64		; enemies going left
	jr	1f
.pos
	ld	de,-64
	ld	c,+1		; enemies going right
	
1:
	call	rand8
	and	15
	
	bit	1,a			; pick up a random bit from Y offset
	jr	z,1f
	set	7,c			; go up instead of down
1:
	
	ld	hl,(xmap)
	add	hl,de

	; bit	0,a			; pick up a random bit from Y offset
	; ld  ix,enemies1
	; ld	iyh,max_enem1
	; jr	z,1f
	; ld  ix,enemies2
	; ld	iyh,max_enem2
; 1:
	ld  ix,enemies
	ld	iyh,max_enem
	ld  de,enemy_data
1:
	bit	0,(ix+enemy_data.status)
	jr  nz,.next

	ld  (ix+enemy_data.status),c
	ld  (ix+enemy_data.kind),6

	exx	
	ld	(ix+enemy_data.speed),e
	ld	(ix+enemy_data.speed+1),d
	bit	7,d
	exx
	
	push	bc
	ld bc,16
	jr	z,11f
	ld bc,-16
11:	add hl,bc 
	ld  (ix+enemy_data.x),l
	ld  (ix+enemy_data.x+1),h
	pop		bc
	
	ld  (ix+enemy_data.y),a
	add	a,24

	call	set_size

	add ix,de
	dec	iyh
	ret	z
	cp	mapHeight*16-16
	jr	c,1b
	ret

.next
	add ix,de
	dec	iyh
	ret	z
	jr	1b


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;	enemies n#4 coming from back double speed
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wave6:
	ld	a,(dxmap)
	ld	e,a			; de' = player speed x 4
	rla
	sbc a,a
	ld	d,a
	exx
	jp _wave4_cont
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  enemies n#7 (spinning)
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wave7:
	ld	a,(dxmap)
	sra a			; de' = player speed x 2
	ld	e,a
	rla
	sbc a,a
	ld	d,a
	exx

	jr	z,.pos				
.neg
	ld	de,256+32
	ld	c,1+64				; enemies going left
	jr	1f
.pos
	ld	de,-64
	ld	c,+1				; enemies going right
	
1:
	call	rand8
	and	15			; Y off set

	ld	hl,(xmap)
	add	hl,de

	; bit	0,a			; pick up a random bit from Y offset
	; ld  ix,enemies1
	; ld	iyh,max_enem1
	; jr	z,1f
	; ld  ix,enemies2
	; ld	iyh,max_enem2
; 1:
	ld  ix,enemies
	ld	iyh,max_enem
	ld  de,enemy_data
1:
	bit	0,(ix+enemy_data.status)
	jr  nz,.next

	ld  (ix+enemy_data.status),c

	ld  (ix+enemy_data.kind),7
	
	exx	
	ld	(ix+enemy_data.speed),e
	ld	(ix+enemy_data.speed+1),d
	exx
	
	push	bc
	ld bc,16
	add hl,bc 
	ld  (ix+enemy_data.x),l
	ld  (ix+enemy_data.x+1),h
	ld	(ix+enemy_data.cntr),l
	pop		bc
	
	ld  (ix+enemy_data.y),a
	add	a,24

	call	set_size

	add ix,de
	dec	iyh
	ret	z
	cp	mapHeight*16-16
	jr	c,1b
	ret

.next
	add ix,de
	dec	iyh
	ret	z
	jr	1b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;   logic for enemies 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

npc_loop:
	ld  ix,enemies
	ld  b,max_enem

1:	push	bc
	ld  a,(ix+enemy_data.status)
	and 1
	jr  z,next

	ld	a,(ix+enemy_data.kind)
	and	a
	jp	z,enemy0
[2]	dec a	
	jp 	z,enemy2
[2]	dec a	
	jp 	z,enemy4
	dec a			;cp	5
	jp 	z,enemy5
	dec a			;cp	6
	jp 	z,enemy6
	dec a			;cp	7
	jp 	z,enemy7

	cp	255-7
	jp z,enemy255

next:
	pop	bc
	ld  de,enemy_data
	add ix,de
	djnz    1b
	ret
;;;;;;;;;;;;;;;;;;;;
npcdies:
	ld  (iy+enemy_data.status),0	; turn off this bullet

	ld	(ix+enemy_data.color),10	; start explosion
	ld	(ix+enemy_data.kind),255
	ld	(ix+enemy_data.cntr),2
	ld	(ix+enemy_data.frame),12

	call	rand8
	and	3
	add	a,2			; random enemy explosion
	call AFXPLAY

	ld	bc,100		; score for destruction of a flying enemy
	call	add_bc_score_bin
	jp	next
	
;;;;;;;;;;;;;;;;;;;;
; explosion
;;;;;;;;;;;;;;;;;;;;
enemy255:
	dec	(ix+enemy_data.cntr)
	jp	nz,next
	ld	(ix+enemy_data.cntr),2
	inc	(ix+enemy_data.frame)
	ld	a,(ix+enemy_data.frame)
	cp	16
	jr	c,next
	ld	(ix+enemy_data.color),8		; start explosion
	cp	23+8
	jp	nz,next
	ld	(ix+enemy_data.status),0
	jp	next

;;;;;;;;;;;;;;;;;;;;

enemy0:
enemy1:
	bit 6,(ix+enemy_data.status)
	jr  z,.go_right
.go_left:

	ld	l,(ix+enemy_data.x)
	ld	h,(ix+enemy_data.x+1)
	dec	hl
	ld  (ix+enemy_data.x),l
	ld  (ix+enemy_data.x+1),h
	ld	de,(xmap)
	and	a
	sbc	hl,de
	ld	de,-32
	and	a
	sbc	hl,de
	jp  p,1f
	ld	(ix+enemy_data.status),0
	jr  1f

.go_right:

	ld	l,(ix+enemy_data.x)
	ld	h,(ix+enemy_data.x+1)
	inc	hl
	ld  (ix+enemy_data.x),l
	ld  (ix+enemy_data.x+1),h
	ld	de,(xmap)
	and	a
	sbc	hl,de
	ld	de,256+32
	and	a
	sbc	hl,de
	jp  m,1f
	ld	(ix+enemy_data.status),0
1:
	call	rand8
	and 	127
	call	z,book_enemy_shoot

	call	test_collision_msbullets
	jp	nc,next
	jp	npcdies

;;;;;;;;;;;;;;;;;;;;
enemy2:
enemy3:
	ld	l,(ix+enemy_data.x)
	ld	h,(ix+enemy_data.x+1)
	ld	e,(ix+enemy_data.speed)
	ld	d,(ix+enemy_data.speed+1)
	add	hl,de
	ld  (ix+enemy_data.x),l
	ld  (ix+enemy_data.x+1),h
	
	bit 6,(ix+enemy_data.status)
	jr  z,.go_right
.go_left:

	ld	de,(xmap)
	and	a
	sbc	hl,de
	ld	de,-32
	and	a
	sbc	hl,de
	jp  p,1f
	ld	(ix+enemy_data.status),0
	jr  1f

.go_right:

	ld	de,(xmap)
	and	a
	sbc	hl,de
	ld	de,256+32
	and	a
	sbc	hl,de
	jp  m,1f
	ld	(ix+enemy_data.status),0
1:
	call	rand8
	and 	127
	call	z,book_enemy_shoot

	call	test_collision_msbullets
	jp	nc,next
	jp 	npcdies
	
	
;;;;;;;;;;;;;;;;;;;;
enemy4:
	ld	l,(ix+enemy_data.x)
	ld	h,(ix+enemy_data.x+1)
	ld	e,(ix+enemy_data.speed)
	ld	d,(ix+enemy_data.speed+1)
	add	hl,de
	ld  (ix+enemy_data.x),l
	ld  (ix+enemy_data.x+1),h
	
	bit 6,(ix+enemy_data.status)
	jr  z,.go_right
.go_left:

	ld	de,(xmap)
	and	a
	sbc	hl,de
	ld	de,-32
	and	a
	sbc	hl,de
	jp  p,1f
	ld	(ix+enemy_data.status),0
	jr  1f

.go_right:

	ld	de,(xmap)
	and	a
	sbc	hl,de
	ld	de,256+32
	and	a
	sbc	hl,de
	jp  m,1f
	ld	(ix+enemy_data.status),0
1:
	ld	a,(ix+enemy_data.y)

	bit 7,(ix+enemy_data.status)
	jr  z,.go_dwn
.go_up:
	dec	a
	jp	nz,1f
	res	7,(ix+enemy_data.status)
	jr	1f
.go_dwn:
	inc	a
	cp	mapHeight*16-16
	jr	nz,1f
	set	7,(ix+enemy_data.status)
	; jr	1f
1:
	ld	(ix+enemy_data.y),a

	call	rand8
	and 	127
	call	z,book_enemy_shoot

	call	test_collision_msbullets
	jp	nc,next
	jp 	npcdies
	
	
;;;;;;;;;;;;;;;;;;;;
	align 0x100
rotation:
	db 0,16,32,48,48,32,16,0
;;;;;;;;;;
rotate:
	ld	a,(ix+enemy_data.cntr)
	inc a
	ld	(ix+enemy_data.cntr),a
	exx
	ld h, high rotation
[2]	rrca
	and 7
	ld	l,a
	ld a,(hl)
	exx
	ret
	

	align 0x100
sinewave:
	db 2,1,2,1,2,1,1,1,1,1,1,1,0,1,0,0,0,0,-1,0,-1,-1,-1,-1,-1,-1,-1,-2,-1,-2,-1,-2,-2,-1,-2,-1,-2,-1,-1,-1,-1,-1,-1,-1,0,-1,0,0,0,0,1,0,1,1,1,1,1,1,1,2,1,2,1,2

	
;;;;;;;;;;;;;;;;;;;;;;;;;;;
enemy5:
	ld	l,(ix+enemy_data.x)
	ld	h,(ix+enemy_data.x+1)
	ld	e,(ix+enemy_data.speed)
	ld	d,(ix+enemy_data.speed+1)
	add	hl,de
	ld  (ix+enemy_data.x),l
	ld  (ix+enemy_data.x+1),h
	
	bit 6,(ix+enemy_data.status)
	jr  z,.go_right
.go_left:

	ld	de,(xmap)
	and	a
	sbc	hl,de
	ld	de,-32
	and	a
	sbc	hl,de
	jp  p,1f
	ld	(ix+enemy_data.status),0
	jr  1f

.go_right:

	ld	de,(xmap)
	and	a
	sbc	hl,de
	ld	de,256+32
	and	a
	sbc	hl,de
	jp  m,1f
	ld	(ix+enemy_data.status),0
1:

	ld	a,(ix+enemy_data.cntr)
	inc	a
	ld	(ix+enemy_data.cntr),a
	and	63
	ld	l,a
	ld	h,high sinewave
	ld	a,(hl)
	add	a,(ix+enemy_data.y)
	ld	(ix+enemy_data.y),a
	
	call	rand8
	and	127
	call	z,book_enemy_shoot

	call	test_collision_msbullets
	jp	nc,next
	jp 	npcdies


;;;;;;;;;;;;;;;;;;;;;;;;;;;
enemy6:
	ld	l,(ix+enemy_data.x)
	ld	h,(ix+enemy_data.x+1)
	ld	e,(ix+enemy_data.speed)
	ld	d,(ix+enemy_data.speed+1)
	add	hl,de
	ld  (ix+enemy_data.x),l
	ld  (ix+enemy_data.x+1),h
	
	bit 6,(ix+enemy_data.status)
	jr  z,.go_right
.go_left:
	call	rotate
	add	a,192+8
	ld	(ix+enemy_data.frame),a
	
	ld	de,(xmap)
	and	a
	sbc	hl,de
	ld	de,-32
	and	a
	sbc	hl,de
	jp  p,1f
	ld	(ix+enemy_data.status),0
	jr  1f

.go_right:
	call	rotate
	add	a,192
	ld	(ix+enemy_data.frame),a

	ld	de,(xmap)
	and	a
	sbc	hl,de
	ld	de,256+32
	and	a
	sbc	hl,de
	jp  m,1f
	ld	(ix+enemy_data.status),0
1:
	call	set_size	; size varies with frame
		
	ld	a,(ix+enemy_data.y)

	bit 7,(ix+enemy_data.status)
	jr  z,.go_dwn
.go_up:
	dec	a
	jp	nz,1f
	res	7,(ix+enemy_data.status)
	jr	1f
.go_dwn:
	inc	a
	cp	mapHeight*16-16
	jr	nz,1f
	set	7,(ix+enemy_data.status)
1:
	ld	(ix+enemy_data.y),a

	call	rand8
	and 	127
	call	z,book_enemy_shoot

	call	test_collision_msbullets
	jp	nc,next
	jp	npcdies
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;
enemy7:	
	ld	l,(ix+enemy_data.x)
	ld	h,(ix+enemy_data.x+1)
	ld	e,(ix+enemy_data.speed)
	ld	d,(ix+enemy_data.speed+1)
	add	hl,de
	ld  (ix+enemy_data.x),l
	ld  (ix+enemy_data.x+1),h
	
	bit 6,(ix+enemy_data.status)
	jr  z,.go_right
.go_left:
	call	rotate
	add	a,192+8
	ld	(ix+enemy_data.frame),a

	ld	de,(xmap)
	and	a
	sbc	hl,de
	ld	de,-32
	and	a
	sbc	hl,de
	jp  p,1f
	ld	(ix+enemy_data.status),0
	jr  1f

.go_right:
	call	rotate
	add	a,192
	ld	(ix+enemy_data.frame),a
	
	ld	de,(xmap)
	and	a
	sbc	hl,de
	ld	de,256+32
	and	a
	sbc	hl,de
	jp  m,1f
	ld	(ix+enemy_data.status),0
1:
	call	set_size	; size varies with frame

	ld	a,(ix+enemy_data.cntr)
	inc	a
	ld	(ix+enemy_data.cntr),a
	and	63
	ld	l,a
	ld	h,high sinewave
	ld	a,(hl)
	add	a,(ix+enemy_data.y)
	ld	(ix+enemy_data.y),a

	call	rand8
	and 	127
	call	z,book_enemy_shoot

	call	test_collision_msbullets
	jp	nc,next
	jp 	npcdies
	


; enemy3:
	; bit 6,(ix+enemy_data.status)
	; jr  z,.go_right
; .go_left:
	; call	rotate
	; add	a,224
	; ld	(ix+enemy_data.frame),a
	; dec (ix+enemy_data.x)
	; ld  a,64-1
	; cp  (ix+enemy_data.x)
	; jr  nz,1f
	; res 6,(ix+enemy_data.status)
	; jr  1f
; .go_right:
	; call	rotate
	; add	a,240
	; ld	(ix+enemy_data.frame),a
	; inc (ix+enemy_data.x)
	; ld  a,192-16
	; cp  (ix+enemy_data.x)
	; jr  nz,1f
	; set 6,(ix+enemy_data.status)
; 1:
	; ld	(ix+enemy_data.color),14
	; jp	next




; in
;	IX -> enemy ship
; out
;	active bullet in list enem_bullets

book_enemy_shoot:
	; aim to the manta
	ld	c,32
	ld	e,c
	ld	a,(yship)
	ld	b,a
	ld	d,(ix+enemy_data.y)
	call	CollisionCheck_8b
	ret		nc

	; avoid shooting from outside the screen	
	ld	b,0
	ld	l,(ix+enemy_data.x)
	ld	h,(ix+enemy_data.x+1)
	ld 	c,(ix+enemy_data.xoff)
	add hl,bc
	ld 	b,(ix+enemy_data.xsize)
	
	ld	de,(xmap)
	ld 	c,255
	call	CalcCollision
	ret		nc
	

	ld  iy,enem_bullets
	ld  de,enemy_data
	
	repeat	max_enem_bullets

	bit	0,(iy+enemy_data.status)
	jr  z,.activate_this
	add iy,de

	endrepeat
	ret

.activate_this:
	bit 6,(ix+enemy_data.status)
	jr  nz,.shootsx
.shootdx
	ld  (iy+enemy_data.status),1
	; ld  hl,enemy_bullet_speed
	; ld	e,(ix+enemy_data.speed)
	; ld	d,(ix+enemy_data.speed+1)
	; add	hl,de
	ld	l,(ix+enemy_data.speed)
	ld	h,(ix+enemy_data.speed+1)
[enemy_bullet_speed]	inc hl
	jp  1f

.shootsx
	ld  (iy+enemy_data.status),1 + 64
	; ld  hl,-enemy_bullet_speed
	; ld	e,(ix+enemy_data.speed)
	; ld	d,(ix+enemy_data.speed+1)
	; add	hl,de
	ld	l,(ix+enemy_data.speed)
	ld	h,(ix+enemy_data.speed+1)
[enemy_bullet_speed]	dec hl
	
1:
	ld  (iy+enemy_data.speed),l
	ld  (iy+enemy_data.speed+1),h

	ld  a,12*4			; it could depend on enemy ship
	ld  (iy+enemy_data.frame),a

	call	set_size2	; set  xoff,yoff,xsize,ysize for sprite collision

	ld	l,(ix+enemy_data.x)
	ld	h,(ix+enemy_data.x+1)
	ld  (iy+enemy_data.x),l
	ld  (iy+enemy_data.x+1),h

	ld  a,(ix+enemy_data.y)
	ld  (iy+enemy_data.y),a
	ld  (iy+enemy_data.cntr),(256+32+24)/enemy_bullet_speed

	; ld  (iy+enemy_data.color),11
	
	ld a,8			; enemy shoot
	call AFXPLAY
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; manage active enemy bullets
;

enemy_bullet_loop:

	ld	hl,ms_ani
	ld  a,(aniframe)
	ld	c,a
	ld	b,0
	add	hl,bc
	ld	a,(hl)
	add	a,a
	add	a,a
	ld	iy,ms_col_win
	ld	c,a
	ld	b,0
	add	iy,bc	; iy aims to MS size for current frame

	;iy -> [minx(h) maxx(h) miny(h) maxy(h)]

	ld  ix,enem_bullets
	ld  de,enemy_data
	repeat	max_enem_bullets
2:
	exx
	bit  0,(ix+enemy_data.status)
	jp  z,1f

	ld  l,(ix+enemy_data.x)
	ld  h,(ix+enemy_data.x+1)
	ld  e,(ix+enemy_data.speed)
	ld  d,(ix+enemy_data.speed+1)
	add hl,de						; move right or  left
	ld  (ix+enemy_data.x),l
	ld  (ix+enemy_data.x+1),h

	ld	a,(ms_state)				; MS is immune to bullets while looping
	cp	ms_loop_right2left
	jr	z,3f
	cp	ms_loop_left2right
	jr	z,3f

	ld	a,(god_mode)
	and 	a						
	call	z,test_collision_enemy_bullets
	jp	nc,3f
	res 0,(ix+enemy_data.status)	; turn off this bullet
	jp	test_obstacles.found		; start ms explosion
3:
	dec	(ix+enemy_data.cntr)
	jp  nz,1f
	res 0,(ix+enemy_data.status)
1:
	exx
	add ix,de
	endrepeat
	ret


test_obstacles.found
	ret
