;----------------------------------------------------------------------------
;----------------------------------------------------------------------------

        output "urd_scr8.rom"

		defpage	 0,0x4000, 0x2000		; page 0 main code + far call routines
		defpage	 1,0x6000, 0x2000		; page 1 main code + far call routines
		defpage	 2,0x8000, 0x2000		; swapped data 
		defpage	 3,0xA000, 0x2000		; swapped data 
		
		defpage	 4,0xA000, 0x2000		; swapped data 
		defpage	 5..11					; 64KB of swapped data 

		defpage	12,0x4000, 0x2000		; swapped code
		defpage	13,0x6000, 0x2000		; swapped code 

		defpage	14,0x8000, 0x2000		; swapped data 
		defpage	15,0xA000, 0x2000		; swapped data 

		;	konami scc
		
_kBank1:	equ 05000h ;- 57FFh (5000h used)
_kBank2: 	equ 07000h ;- 77FFh (7000h used)
_kBank3: 	equ 09000h ;- 97FFh (9000h used)
_kBank4: 	equ 0B000h ;- B7FFh (B000h used)
	
mapWidth	equ	128
mapHeight	equ	11
		
	macro setpage_a
		ld	(_kBank3),a
		inc	a
		ld	(_kBank4),a
	endmacro
  
		page 0
		
        org 4000h
        dw  4241h,START,0,0,0,0,0,0

		include "header.asm"
		include "rominit64.asm"
		include "vdpio.asm"
		include "turbo.asm"
		include "isr.asm"
	
; // Line Bit_7 Bit_6 Bit_5 Bit_4 Bit_3 Bit_2 Bit_1 Bit_0
; // 0 "7" "6" "5" "4" "3" "2" "1" "0"
; // 1 ";" "]" "[" "\" "=" "-" "9" "8"
; // 2 "B" "A" ??? "/" "." "," "'" "`"
; // 3 "J" "I" "H" "G" "F" "E" "D" "C"
; // 4 "R" "Q" "P" "O" "N" "M" "L" "K"
; // 5 "Z" "Y" "X" "W" "V" "U" "T" "S"
; // 6 F3 F2 F1 CODE CAP GRAPH CTRL SHIFT
; // 7 RET SEL BS STOP TAB ESC F5 F4
; // 8 RIGHT DOWN UP LEFT DEL INS HOME SPACE

checkkbd:
		in	a,(0aah)
		and 011110000B			; upper 4 bits contain info to preserve
		or	e
		out (0aah),a
		in	a,(0a9h)
		ld	l,a
		ret

;-------------------------------------		
		
		; include plot_frame.asm
		
;-------------------------------------
; Entry point
;-------------------------------------
START:
		ld e,6
		call	checkkbd
		ld	a,1
		rrc	l				; shift
		jp	nc,_ntsc
		xor	a
_ntsc:	ld	(SEL_NTSC),a	; if set NSTC, if reset PAL

		call	set_scr

		call 	_set_r800
;-------------------------------------
;   Power-up routine for 32K ROM
;   set pages and sub slot
;-------------------------------------
        call    search_slot
        call    search_slotram
		call	setrompage2
		call	setrampage0
		ld		a,0xc9
		ld		(0x38),a

		xor	a
		ld	(_kBank1),a
		inc	a
		ld	(_kBank2),a
		
		call	_cls
		; call 	_hw_sprite_init

		ld		c,0
		ld		de,0FA00h
		call	_vdpsetvramwr
		ld		a,0xD8
		out 	(0x98),a

	;--- initialise demo song
		ld	a, :demo_song
		setpage_a
		
		ld	hl,demo_song
		call	replay_init

		call	_clean_buffs

		; call	_SetPalet
		ld		e,0
        call	_setpage
		
		; unpack level map (bit field for collisions)
		ld	a, :_level_bf
		setpage_a
		
		; ld	bc,	mapWidth*mapHeight
		; ld	hl,	_level_bf
		; ld	de,	_cur_level_bf
		; ldir


		;copy in ram the map 
		
		ld	a, :_level
		setpage_a
		
		ld		hl,_level
		ld		de,_levelmap
		ld		bc,mapWidth*mapHeight
		ldir

				
		
		; unpack mc frames
		; ld		a, :_mc_sprites
		; setpage_a
		; xor	a
		; ld		(_vbit16 ),a
		; ld		de,	_mc_sprites
		; ld		bc,192*128+256*128
		; call	_vuitpakker 
				

		
		; di
		; ld	a,:int_sprites
		; ld	(_kBank2),a
		; call	int_sprites
		; ld	a,1
		; ld	(_kBank2),a
		; ei
		
		; main init
		
		; call	init_hero
		ei
		
		ld		hl,0
		ld		a,h
		ld		(_ymappos),a
		ld		(_xmappos),hl
		
		ld		(_nframes),hl
		ld		(_currentpage),a
		ld		(_mcdx),hl
		ld		(_mcframe),a
		
		ld		(_xoffset),a		;  0 tutto a destra
									; 15 tutto a sinistra

		ld		hl,_levelmap+1
		ld		(_levelmap_pos),hl
									
		ld		a,1
		ld		(_displaypage),a		
		call	init_page1

		xor		a
		ld		(_displaypage),a		
		call	init_page0

		xor		a
		ld		(_direction),a

		call	_intinit
		
main_loop:
		ld	hl,0
		ld	(_jiffy),hl

		ld	hl,.nomove
		push	hl
		ld	e,8
		call	checkkbd

		bit	7,l
		jp	z,test_move_right
		bit	4,l
		jp	z,test_move_left
		
		bit	6,l
		jp	z,_dw
		bit	5,l
		jp	z,_up
		
		pop	hl				
		
.nomove:
		call	_compute_fps
		call	_print_fps
		call	_print_probe
		
		ld		hl,(_nframes)
		inc		hl
		ld		(_nframes),hl

1:		ld	hl,(_jiffy)		; wait for vblank (and not for linit)
		ld	a,l
		or	h
		jr	z,1b
	
		jp      main_loop

;-------------------------------------
test_move_right:
		ld		a,(_xoffset)
		and		a
		ret		nz
		ld		a,1
		ld		(_direction),a			; moving right
		ret
test_move_left
		ld		a,(_xoffset)
		cp		15
		ret		nz
		ld		a,-1
		ld		(_direction),a			; moving left
		ret
;-------------------------------------

_dw:	ld		a,(_direction)
		and		a
		ret		z
		ld		(_old_direction),a
		xor		a
		ld		(_direction),a
		ret
		
_up:	ld		a,(_old_direction)
		and		a
		ret		z
		ld		(_direction),a
		ret
;-------------------------------------				
inc_xoffset
		call	blank_line_lft
		call	plot_line_rgt
		ld		a,(_xoffset)
		and		a
		jr		nz,.case1_15
.case0
		ld 		a,(_displaypage)
		xor		1
		ld 		d,a
		ld		e,240
		ld		l,00100101B
		call	clrboder
		jr	.cont
.case1_15
[4]		add		a,a
		ld		e,a
		sub		a,16
		ld		d,a
		call	move_block
.cont
		ld		a,(_xoffset)
		inc	a
		and	15
		ld		(_xoffset),a
		ret	nz
		ld		a,(_displaypage)
		xor		1
		ld		(_displaypage),a
		ld		hl,(_levelmap_pos)
		inc		hl
		ld		(_levelmap_pos),hl
		ret
dec_xoffset
		call	blank_line_rgt
		call	plot_line_lft
		ld		a,(_xoffset)
		cp	15
		jr		nz,.case0_14
.case15
		ld 		a,(_displaypage)
		xor		1
		ld 		d,a
		ld		e,0
		ld		l,00100101B
		call	clrboder
		jr	.cont
.case0_14
[4]		add		a,a
		ld		e,a
		add		a,16
		ld		d,a
		call	move_block
.cont	
		ld		a,(_xoffset)
		dec	a
		and	15
		ld		(_xoffset),a
		cp	15
		ret	nz
		ld		a,(_displaypage)
		xor		1
		ld		(_displaypage),a
		ld		hl,(_levelmap_pos)
		dec		hl
		ld		(_levelmap_pos),hl
		ret
;-------------------------------------

;-------------------------------------


 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	include vuitpakker.asm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	; include plot_tile.asm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_clean_buffs:
	ld	bc,2*32*24*2-1
	ld	hl,_shadow0
	ld	(hl),-1
	ld	de,_shadow0+1
	ldir
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_print_probe
	ld	a,(_mcprobeb)
	ld	e,a
	ld	d,0
	ld	hl,32*(64-2)
	add	hl,de
	ex	de,hl
	ld	hl,2*(23*32+0)
	; call 	plot_foreground
	
	ld	de,(_ticxframe)
	ld	d,0
	ld	bc,_buffer
	call	int2ascii
	
	ld	a,(_buffer+2)
	ld	e,a
	ld	d,0
	ld	hl,32*(64-2)-'0'
	add	hl,de
	ex	de,hl
	ld	hl,2*(22*32)
	; call 	plot_foreground

	ld	a,(_buffer+3)
	ld	e,a
	ld	d,0
	ld	hl,32*(64-2)-'0'
	add	hl,de
	ex	de,hl
	ld	hl,2*(22*32+1)
	; call 	plot_foreground

	ld	a,(_buffer+4)
	ld	e,a
	ld	d,0
	ld	hl,32*(64-2)-'0'
	add	hl,de
	ex	de,hl
	ld	hl,2*(22*32+2)
	; call 	plot_foreground
	ret
	
	
_print_fps:
	ld	a,(_buffer+3)
	ld	e,a
	ld	d,0
	ld	hl,32*(64-2)-'0'
	add	hl,de
	ex	de,hl
	
	ld	hl,2*(23*32+30)
	; call 	plot_foreground

	ld	a,(_buffer+4)
	ld	e,a
	ld	d,0
	ld	hl,32*(64-2)-'0'
	add	hl,de
	ex	de,hl
	
	ld	hl,2*(23*32+31)
	; call 	plot_foreground
	ret

;-------------------------------------
_compute_fps:
	ld	de,(_fps)
	ld	bc,_buffer

int2ascii:
	
; in de input 
; in bc output

	ex  de,hl
	ld  e,c
	ld  d,b

Num2asc:
	ld  bc,-10000
	call    Num1
	ld  bc,-1000
	call    Num1
	ld  bc,-100
	call    Num1
	ld  c,-10
	call    Num1
	ld  c,-1

Num1:   
	ld  a,'0'-1  ; '0' in the tileset

Num2:   
	inc a
	add hl,bc
	jr  c,Num2
	sbc hl,bc

	ld  (de),a
	inc de
	ret
	
	; include enemies.asm
	include plot_line.asm
	
	; page 16,17	
	; include text.asm	
	
	page 0,1	
_metatable:
	; incbin 	metatable.bin
	
	page 1
_backmap:
	; incbin	backmap.bin

	; include hwsprites.asm
	
	; include mainhero_LMMM.asm
	; include probe_level.asm


	page 2,3
_frame:
	; incbin "_frame.bin"
_mc_sprites:	
	; incbin "_sprites.bin"			
	
	page 4
_tiles0:
	incbin "tiles.bin",0x0000,0x2000
	page 5
	incbin "tiles.bin",0x2000,0x2000
	page 6
	incbin "tiles.bin",0x4000,0x2000
	page 7
	incbin "tiles.bin",0x6000;,0x2000
	; page 8
	; incbin "tiles.bin",0x8000,0x2000
	; page 9
	; incbin "tiles.bin",0xA000,0x2000
	; page 10
	; incbin "tiles.bin",0xC000,0x2000
	; page 11
	; incbin "tiles.bin",0xE000,0x2000
	
	
	page 14,15
_level:
	incbin "datamap.bin"
	
_level_bf:	
	; incbin "BitField.bin"	
	
	page 10,11
sprtdata
	; include 	SPROL.ASM
	
	page 14
demo_song:
	include	".\demosong.asm"
	page 15
	include	"..\TriloTracker-Re-player\code\ttreplayDAT.asm"
	page 0,1
	include	"..\TriloTracker-Re-player\code\ttreplay.asm"
	
FINISH:


;---------------------------------------------------------
; Variables
;---------------------------------------------------------


	
	MAP 0xC000
	include	"..\TriloTracker-Re-player\code\ttreplayRAM.asm"

_levelmap:			#mapWidth*mapHeight

_cur_level_bf:		#mapWidth*mapHeight/2
; enemylist:			#enemy*nenemies

slotvar				#1
slotram				#1
SEL_NTSC			#1

joystick			#1

_mcx				#2	; relative with in the frame on the screen
_mcy				#2

_mclx				#2	; absolute with the level in ram
_mcly				#2

_mcframe			#1
_mcstate			#1

_mcdx				#2
_mcdy				#2

_mcprobe:			#1
_mcprobeb:			#1

_ticxframe			#1

_buffer:			#16
_fps:				#2
_nframes:			#2
_vbit16:			#2

_ymappos:			#1
_xmappos:			#2
_levelmap_pos:		#2

_shadowbuff:		#2
_currentpage:		#1

_displaypage:		#1
_direction:			#1
_old_direction:		#1
_xoffset:			#1

_shadow0:			#32*24*2
_shadow1:			#32*24*2


	ENDMAP