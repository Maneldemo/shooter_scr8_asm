;----------------------------------------------------------------------------
;----------------------------------------------------------------------------

        output "urd_scr8.rom"

		incdir ene_code
		incdir music

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
	
mapWidth	equ	256
mapHeight	equ	11
YSIZE		equ	10*16+8

	macro setpage_a
		ld	(_kBank3),a
		inc	a
		ld	(_kBank4),a
	endmacro
  
		page 1
		include	"..\TTplayer\code\ttreplay.asm"
	
		page 0
		
        org 4000h
        dw  4241h,START,0,0,0,0,0,0

	;-------------------------------------		

		include "header.asm"
		include "rominit64.asm"
		include "vdpio.asm"
		include "turbo.asm"
		include "isr.asm"
		
		include checkkbd.asm
		include sprts.asm
		include sat_update.asm
		include collision_tst.asm
		
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

		call 	rand8_init								
		call	set_scr

		ld e,6
		call	checkkbd
		and	00000010B		; CRTL
		call nz,_set_r800	; if CRTL is pressed do not test for turbo
		
;-------------------------------------
;   Power-up routine for 32K ROM
;   set pages and sub slot
;-------------------------------------
        call    search_slot
        call    search_slotram
		call	setrompage2
		call	setrampage0

		call	_intreset

		xor	a
		ld	(_kBank1),a
		inc	a
		ld	(_kBank2),a
		
		call	_cls
		ld	a, :sprtdata
		ld	(_kBank4),a
		call 	_hw_sprite_init

		ld	a, :_scorebar
		setpage_a
		ld		c,0
		ld		de,256*(mapHeight*16+3)
		call	_vdpsetvramwr
		ld		hl,_scorebar
		ld		bc,0x0098
		ld		a,24
1:		otir
		dec	a
		jr	nz,1b
		
	;--- initialise demo song
		ld	bc,	_levelmap-ttreplayRAM
		ld	hl,	ttreplayRAM
		ld	de,	ttreplayRAM+1
		ld	(hl),0
		ldir
	
		ld	a,:demo_song
		setpage_a
		
		ld	bc,	end_demo_song-musbuff
		ld	hl,	demo_song
		ld	de,	musbuff
		ldir
			
		call	replay_init
		ld		hl,musbuff
		call	replay_loadsong

		ld		e,0
        call	_setpage
		
		
		ld	a, :_level
		ld	(_kBank3),a
		
		ld		hl,_level
		ld		de,_levelmap
		ld		bc,mapWidth*mapHeight
		ldir
				
		
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
		ld		(_yoffset),a		;  0 tutto su

		ld		hl,_levelmap+16
		ld		(_levelmap_pos),hl
		ld		hl,16*16
		ld		(xmap),hl
								
		call 	npc_init								
		call 	load_color_pools								
		
		xor		a
		ld		(_displaypage),a		
		call	init_page0

		ld		a,4
		ld		(dxmap),a		; moving right
		ld		a,6
		ld		(cur_level),a
		ld		a,80
		ld		(yship),a

		call	_isrinit
		
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
		call	wave_timer
		call	npc_loop
		call	enemy_bullet_loop

		ld	a,00100101B			; random colour
		out		(0x99),a
		ld		a,7+128
		out		(0x99),a
		
		call	_waitvdp
		
		xor		a
		out		(0x99),a
		ld		a,7+128
		out		(0x99),a
		
1:		ld	a,(_jiffy)		; wait for vblank (and not for linit)
		or	a
		jr	z,1b
	
		jp      main_loop

;-------------------------------------
test_move_right:
		ld		a,(_xoffset)
		and		a
		ret		nz

		ld		a,4
		ld		(dxmap),a			; moving right
		ret
test_move_left
		ld		a,(_xoffset)
		cp		15
		ret		nz
		
		ld		a,-4
		ld		(dxmap),a			; moving left
		ret
;-------------------------------------

_dw:	ld		a,(_yoffset)
		inc		a
		cp		mapHeight*16-YSIZE
		ret 	p
		ld		(_yoffset),a
		ret


		
_up:	ld		a,(_yoffset)
		dec		a
		ret		m
		ld		(_yoffset),a
		ret


;-------------------------------------
AFXPLAY:
		ret
;	include vuitpakker.asm
	include print.asm
	include plot_line.asm
	include plot_line2.asm
	include enemies.asm
	
;-------------------------------------
	
	; page 0,1	
; _metatable:
	; incbin 	metatable.bin
	
	; page 1
; _backmap:
	; incbin	backmap.bin

	; include hwsprites.asm
	
	; include mainhero_LMMM.asm
	; include probe_level.asm

	page 2,3
_scorebar:	
	incbin scorebar.bin
	
	page 4
_tiles0:
	incbin "tiles.bin",0x0000,0x2000
	page 5
	incbin "tiles.bin",0x2000,0x2000
	page 6
	incbin "tiles.bin",0x4000,0x2000
	page 7
	incbin "tiles.bin",0x6000,0x2000
	page 8
	incbin "tiles.bin",0x8000,0x2000
	page 9
	incbin "tiles.bin",0xA000,0x2000
	page 10
	incbin "tiles.bin",0xC000,0x2000
	page 11
	incbin "tiles.bin",0xE000;,0x2000
	
	
	page 15
_level:
	incbin "datamap.bin"
	page 15
sprtdata:
	incbin 	uridium_rev7.bin
	
	page 14,15
demo_song:
	org 0x0040
	include	"demosong.asm"
	include	"..\TTplayer\code\ttreplayDAT.asm"
end_demo_song:	

	
FINISH:


;---------------------------------------------------------
; Variables
;---------------------------------------------------------
	MAP 0x0040
musbuff:	#15*1024
	
	ENDMAP
	
	MAP 0xC000
ttreplayRAM:		#0
	include	"..\TTplayer\code\ttreplayRAM.asm"

_levelmap:			#mapWidth*mapHeight

_cur_level_bf:		#mapWidth*mapHeight/2

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

_xoffset:			#1
_yoffset:			#1

randSeed:			#2
cur_level:			#1
wave_count:			#1
landing_permission:	#1
assault_wave_timer:	#2
bullet_rate:		#1
dxmap:				#1
xmap:				#2
yship:				#1
xship:				#2
aniframe:			#1
ms_state:			#1
god_mode:			#1
visible_sprts:		#1

	struct enemy_data
y				db	0
x				dw	0
xoff			db	0
yoff			db	0
xsize			db	0
ysize			db	0
status			db	0	; B7 = DWN/UP | B6 = RIGHT/LEFT | B5 = ok/wrong clr | B0 = Inactive/Active
cntr			db	0
kind			db	0
frame			db	0
color			db	0
speed			dw	0
	ends
	
any_object:			#0
ms_bullets:			#enemy_data*max_bullets
enem_bullets:		#enemy_data*max_enem_bullets
enemies:			#0
enemies1:			#enemy_data*max_enem1
enemies2:			#enemy_data*max_enem2

	ENDMAP