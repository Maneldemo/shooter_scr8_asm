
		; include "header.asm"
		
// MSX 1 
RG0SAV  equ 0xF3DF  
RG1SAV  equ 0xF3E0  
RG2SAV  equ 0xF3E1
RG3SAV  equ 0xF3E2
RG4SAV  equ 0xF3E3
RG5SAV  equ 0xF3E4
RG6SAV  equ 0xF3E5
RG7SAV  equ 0xF3E6
// MSX 2
RG8SAV  equ 0xFFE7 
RG9SAV  equ 0xFFE8 
RG10SAV equ 0xFFE9 
RG11SAV equ 0xFFEA 
RG12SAV equ 0xFFEB 
RG13SAV equ 0xFFEC 
RG14SAV equ 0xFFED 
RG15SAV equ 0xFFEE 
RG16SAV equ 0xFFEF 
RG17SAV equ 0xFFF0 
RG18SAV equ 0xFFF1 
RG19SAV equ 0xFFF2 
RG20SAV equ 0xFFF3 
RG21SAV equ 0xFFF4 
RG22SAV equ 0xFFF5 
RG23SAV equ 0xFFF7 

_jiffy: equ 0xFC9E 

_fake_isr
	push	af
	xor	a 			; read S#0
	out (0x99),a
	ld a,128+15
	out (0x99),a
	push hl
	pop hl
	in	a,(0x99)
	pop	af
	ei
	ret
	
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
	out (0x99),a
	LD    A,19+128
	out (0x99),a
	
; enable line interrupt
	LD    A,(RG0SAV)
	OR    00010000B
	LD    (RG0SAV),A
	out (0x99),a
	LD    A,0+128
	out (0x99),a
	ei
	ret
	
_intreset:
; disable line interrupt
	di
	ld	hl,0x0038
	ld	(hl),0xC3
	inc	hl
	ld	(hl),low _fake_isr
	inc	hl
	ld	(hl),high _fake_isr
		
	LD    A,(RG0SAV)
	and    11101111B
	LD    (RG0SAV),A
	out (0x99),a
	LD    A,0+128
	out (0x99),a
	ei
	ret
	
;;;;;;;;;;;;;;;;;;;;;;
; actual ISR handler
;;;;;;;;;;;;;;;;;;;;;;

_scroll:
	push	af
	
	ld a,1 			; read S#1
	out (0x99),a
	ld a,128+15
	out (0x99),a
	push hl
	pop hl
	in	a,(0x99)
	rra
	jp	c,lint	

	xor	a 			; read S#0
	out (0x99),a
	ld a,128+15
	out (0x99),a
	push hl
	pop hl
	in	a,(0x99)
	rlca
	jp	c,vblank
	
	pop	af			; none of them (?)
	ei
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; manage scorebar at YSIZE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	
lint:					
	ld	a,(RG1SAV)
	and	010111111B			; disable screen
	ld	(RG1SAV),a
	out	(0x99),a
	ld	a,1+128
	out	(0x99),a

	ld a,2 				; read S#2
	out (0x99),a
	ld a,128+15
	out (0x99),a		; poll for HBLANK
	push hl
	pop hl
1:	in	a,(0x99)		; we are in HBLANK already, so wait until end of HBLANK
	and	0x20
	jp	nz,1b			
2:	in	a,(0x99)		; wait until end of the active area
	and	0x20
	jp	z,2b
						; now we are at the start of HBLANK
	
	LD    A,mapHeight*16-(YSIZE-2)	; SCROLL DOWN
	out (0x99),a
	LD    A,23+128
	out (0x99),a

	ld a,00011111B		; 0XX11111B
	out (0x99),a
	ld a,2+128			; R#2 
	out (0x99),a		; score bar in page 0

	ld	a,(RG8SAV)
	or	000000010B		; disable sprites
	ld	(RG8SAV),a
	out	(0x99),a
	ld	a,8+128
	out	(0x99),a

	in	a,(0x99)		
	rrca
	
	ld	a,0
	out	(099h),a
	ld	a,46+128
	out	(099h),a		; stop vdp

	ld	a,0
	out	(099h),a
	ld	a,18+128
	out	(099h),a		; set adjust 0,0

	jr	nc,1f
	ld		a,11010000B
	out	(099h),a
	ld	a,46+128
	out	(099h),a		; command HMMM
1:
	ld	a,(RG1SAV)
	or 	01000010B		; enable screen
	ld	(RG1SAV),a
	out	(0x99),a
	ld	a,1+128
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

	ld	a,10000010B		; cyan 
	out	(0x99),a
	ld	a,7+128
	out	(0x99),a

	call 	plot_enemy
	
	ld	a,00000100B		; red
	out	(0x99),a
	ld	a,7+128
	out	(0x99),a
	
	ld	hl,.exit
	push	hl
	ld	a,(dxmap)
	rlc a
	jr	z,1f
	jp	nc,inc_xoffset			; >0 == dx
	jp	 c,dec_xoffset			; <0 == sx
1:	pop	hl
.exit:

	xor	a					; black colour
	out (0x99),a
	ld	a,7+128
	out (0x99),a

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
	push	hl
	
	ld	a,(RG8SAV)		; enable sprites
	and	11111101B
	ld	(RG8SAV),a
	out	(0x99),a
	ld	a,8+128
	out	(0x99),a
	
	ld	a,(_displaypage)
[5]	add a,a 			; x32
	or	00011111B
	out (0x99),a
	ld a,2+128
	out (0x99),a
	
	LD    A,(_yoffset)		; SCROLL DOWN
	out (0x99),a
	add    A,YSIZE-2
	ld		l,a
	LD    A,23+128
	out (0x99),a

	ld    a,l
	out (0x99),a			; set interrupt line
	LD    A,19+128
	out (0x99),a

	ld	hl,(_jiffy)
	inc	hl
	ld	(_jiffy),hl
	
	; call	set_activewindow
			
	pop		hl	
	pop		af
	ei
	ret

	
set_activewindow:
	call _waitvdp		; no need ATM
		
	ld	a,(_xoffset)		; set R#18 only if not scrolling
	add	a,-8
	and	0Fh
	out	(099h),a
	ld	a,18+128
	out	(099h),a
	ret
	

