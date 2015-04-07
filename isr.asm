
		; include "header.asm"
		
RG0SAV EQU 0xF3DF
RG1SAV equ 0xF3E0
RG7SAV equ 0xF3E6 ; border color
RG8SAV equ 0xF3E7 ; VDP Register 8 Save copy.

_jiffy: equ 0xFC9E 

	; global _intinit,_intreset,_scroll_sx,_scroll_dx
	; global _jiffy
	; global _xoffset
	; global _displaypage
	; global _direction
	; global _jiffy


_isrinit:
	di
	ld	hl,0x0038
	ld	(hl),0xC3
	inc	hl
	ld	(hl),low _scroll
	inc	hl
	ld	(hl),high _scroll

; set interrupt line
	LD    A,YSIZE-2
	OUT   (0x99),A
	LD    A,0x93
	OUT   (0x99),A
	
; enable line interrupt
	LD    A,(RG0SAV)
	OR    0x10
	LD    (RG0SAV),A
	OUT   (0x99),A
	LD    A,0x80
	OUT   (0x99),A
	ei
	ret
	
_intreset:
; disable line interrupt
	di
	LD    A,(RG0SAV)
	and    0xEF
	LD    (RG0SAV),A
	OUT   (0x99),A
	LD    A,0x80
	OUT   (0x99),A
	ei
	ret
	
;;;;;;;;;;;;;;;;;;;;;;
; actual ISR handler
;;;;;;;;;;;;;;;;;;;;;;

_scroll:
	di
	push	af
	
	xor	a 			; read S#0
	out (0x99),a
	ld a,128+15
	out (0x99),a
	in	a,(0x99)
	rlca
	jp	c,vblank
	
	ld a,1 			; read S#1
	out (0x99),a
	ld a,128+15
	out (0x99),a
	in a,(0x99)
	rra
	jp	c,lint	
	
	pop	af			; none of them (?)
	ei
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; manage scorebar at YSIZE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	
lint:					
	ld	a,(RG1SAV)
	and	0xBF			; disable screen
	out	(0x99),a
	ld	a,1+128
	out	(0x99),a

	ld a,2 				; read S#2
	out (0x99),a
	ld a,128+15
	out (0x99),a		; poll for HBLANK

1:	in	a,(0x99)		; we are in HBLANK already, so wait until end of HBLANK
	and	0x20
	jp	nz,1b			
2:	in	a,(0x99)		; wait until end of the active area
	and	0x20
	jp	z,2b
						; now we are at the start of HBLANK
	xor	a
	out	(099h),a
	ld	a,18+128
	out	(099h),a		; setadjust 0,0
	
	LD    A,192-(YSIZE-2)	; SCROLL DOWN
	OUT   (0x99),A
	LD    A,23+128
	OUT   (0x99),A

	ld a,00011111B		; 0XX11111B
	out (0x99),a
	ld a,2+128			; R#2 
	out (0x99),a		; score bar in page 0

	ld	a,(RG8SAV)
	or	2				; disable sprites
	out	(0x99),a
	ld	a,8+128
	out	(0x99),a

	ld	a,(RG1SAV)
	or 	0x42			; enable screen
	out	(0x99),a
	ld	a,1+128
	out	(0x99),a
	
	ld	a,border_color;00000001B		; dark blue colour
	out	(0x99),a
	ld	a,7+128
	out	(0x99),a
	
	push   hl         
	push   de         
	push   bc         
	push   af         
	exx               
	ex     af,af'     
	push   hl         
	push   de         
	push   bc         
	push   af         
	push   iy         
	push   ix         
	
	ld	a,00100101B		; dark blue colour
	out	(0x99),a
	ld	a,7+128
	out	(0x99),a
	
	call plot_enemy
	
	ld	a,00101101B
	out	(0x99),a
	ld	a,7+128
	out	(0x99),a
	
	ld	hl,.exit
	push	hl
	ld	a,(_direction)
	rlc a
	jr	z,1f
	jp	nc,inc_xoffset			; >0 == dx
	jp	 c,dec_xoffset			; <0 == sx
1:	pop	hl
.exit:

	call	replay_route		; first output data
	call	replay_play			; calculate next output

	xor		a				; black colour
	out		(0x99),a
	ld		a,128+7
	out		(0x99),a

	pop    ix         
	pop    iy         
	pop    af         
	pop    bc         
	pop    de         
	pop    hl         
	ex     af,af'     
	exx               
	pop    af         
	pop    bc         
	pop    de         
	pop    hl         

	pop		af
	ei
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;   manage normal vblank routine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

vblank:
	ld	a,(RG8SAV)		; enable sprites
	and	11111101B
	out	(0x99),a
	ld	a,8+128
	out	(0x99),a
	ld	a,(_displaypage)
[5]	add a,a 			; x32
	or	00011111B
	out (0x99),a
	ld a,2+128
	out (0x99),a

	push	hl
	ld	hl,(_jiffy)
	inc	hl
	ld	(_jiffy),hl
	pop		hl

	LD    A,(_yoffset)		; SCROLL DOWN
	OUT   (0x99),A
	LD    A,23+128
	OUT   (0x99),A

	LD    A,(_yoffset)		; set interrupt line
	add    A,YSIZE-2
	OUT   (0x99),A
	LD    A,0x93
	OUT   (0x99),A
			
	; ld      a,2              ; wait VDPready
	; out     (0x99),a         ; select s#2
	; ld      a,15+128
	; out     (0x99),a
; 1:	in      a,(0x99)
	; rra
	; jp      c,1b			; do not set R#18 if vdp is busy

	ld	a,(_xoffset)		; set R#18 only if not scrolling
	add	a,-8
	and	0Fh
	out	(099h),a
	ld	a,18+128
	out	(099h),a
	
	pop		af
	ei
	ret
