
       
;-------------------------------------
_cls:		
		ld		de,0
		ld		c,e
		di
		call	_vdpsetvramwr
		ld		bc,0x0000
1:		ld		a,00100101B
		out		(0x98),a
		dec		bc
		ld		a,b
		or		c
		jr	nz,1b
1:		ld		a,00100101B
		out		(0x98),a
		dec		bc
		ld		a,b
		or		c
		jr	nz,1b
		ret
;-------------------------------------
		
vdpport1 equ 0x99
vdpport2 equ 0x9A

levelcolors:
	; incbin "palette.bin"

_SetPalet:   
	di
	xor a 			;Set pointer to zero.
	out (vdpport1),a        
	ld  a,16 | 010000000B
	out (vdpport1),a

	ld  hl,levelcolors
	ld bc,vdpport2+32*256
	otir
	ei
	ret

;Set VDP for writing at address CDE (17-bit) 

_vdpsetvramwr:
	ld a,c
;Set VDP for writing at address ADE (17-bit) ;
	rlc d
	rla
	rlc d
	rla
	srl d ; primo shift, il secondo dopo la out

	out (0x99),a ;set bits 14-16
	ld a,14+128
	out (0x99),a

	srl d ; secondo shift.     
_vdpsetvramwr14
	ld a,e ;set bits 0-7
	out (0x99),a
	ld a,d ;set bits 8-13
	or 0x40 ; + write access
	out (0x99),a
	ret
	
;Set VDP port #98 to start reading at address CDE (17-bit) ;

_vdpsetvramrd:
	ld a,c
;Set VDP port #98 to start reading at address ADE (17-bit) ;
	rlc d
	rla
	rlc d
	rla
	srl d ; primo shift, il secondo dopo la out

	out (0x99),a ;set bits 14-16
	ld a,14+128
	out (0x99),a

	srl d ; secondo shift.            
	ld a,e ;set bits 0-7
	out (0x99),a
	ld a,d ;set bits 8-13
	and 0x3F
	out (0x99),a
	ret

;Display page E in screen 5
_setpage:
	ld a,e
[5]	add a,a ;x32
	or	 00011111B
	di
	out (0x99),a
	ld a,2+128
	out (0x99),a
	ei            
	ret

chgmod        equ     0x005f      ;change graphic mode
RDSLT         equ     0x000c      ;read address HL in slot A
KILBUF        equ     0x0156      ;clear keyboard buffer

set_scr:
	ld  	a,8
	call	chgmod
	
	di
	// sprites 16x16
	ld		a,(0xF3E0)
	or		2
	ld		(0xF3E0),a
	out		(0x99),a
	ld		a,128+1
	out		(0x99),a

	// border color
	; ld		a,0x55
	xor		a
	out		(0x99),a
	ld		a,128+7
	out		(0x99),a
		
	// enable sprites + TP
	ld		a,(0xFFE7)
	or		32+2
	ld		(0xFFE7),a
	out		(0x99),a
	ld		a,128+8
	out		(0x99),a
		
	// Set 192 lines @50Hz (PAL assumed!)
	ld	a,(SEL_NTSC)
	and 	a
	jr		nz,1f
	
	ld		a,(0xFFE8)		; PAL
	and		01111111B
	or		2
	ld		(0xFFE8),a
	jr	2f
1:		
	ld		a,(0xFFE8)		; NTSC
	and		01111101B
	ld		(0xFFE8),a
2:	
	out		(0x99),a
	ld		a,128+9
	out		(0x99),a
	ei

	ret


_waitvdp:
	di
	ld a,2
	out (0x99),a
	ld a, 0x8f
	out (0x99),a
[2]	nop
1:  in	a,(0x99)
	rrca
	jp c, .inf;1b

	xor a
	out (0x99),a
	ld a, 0x8f
	out (0x99),a
	ei
	ret

.inf:
	ld	a,r			; random colour
	out		(0x99),a
	ld		a,7+128
	out		(0x99),a
	jp	1b
	