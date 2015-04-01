
_screen_refresh:
	jp	f110
f111:
;level.c: 30: for (x=c=0;x<240;x+=16,c++) {
	ld	a,0
	ld	(_c),a
	ld	(_x),a
	jp	l12
l9:
;level.c: 31: unsigned char *p = &level[xw+c][yw+0];
	ld	a,(_yw)
	ld	b,a
	ld	hl,(_xw)
	ld	a,(_c)
	ld	c,a
	ld	a,c
	add	a,l
	ld	l,a
	ld	a,h
	adc	a,0
	ld	h,a
	add	hl,hl
	ld	d,h
	ld	e,l
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,de

	ld	a,b
	add	a,l
	ld	l,a
	ld	a,0
	bit	7,b
	jr	z,u15
	dec	a
u15:
	adc	a,h
	ld	h,a
	ld	de,_level
	add	hl,de
	ld	(ix+0+-2),l
	ld	(ix+1+-2),h
;level.c: 33: for (y=0;y<11*16;y+=16) {

	ld	a,0
	ld	(_y),a
	jp	l16
l13:
;level.c: 34: unsigned char* t = &tile[*p++][0];

	global	_tile
	ld	l,(ix+0+-2)
	ld	h,(ix+1+-2)
	inc	hl
	ld	(ix+0+-2),l
	ld	(ix+1+-2),h
	dec	hl
	ld	l,(hl)
	ld	h,0
	ld	h,l
	ld	l,0
	ld	de,_tile
	add	hl,de
	ld	(ix+0+-4),l
	ld	(ix+1+-4),h
;level.c: 35: unsigned char i,j;

;level.c: 36: unsigned char* s=t;

	ld	l,(ix+0+-4)
	ld	h,(ix+1+-4)
	ld	(ix+0+-8),l
	ld	(ix+1+-8),h
;level.c: 37: uint addr = y*256+x;

	ld	a,(_y)
	ld	b,a
	ld	a,(_x)
	ld	h,b
	ld	l,a
	ld	(ix+0+-10),l
	ld	(ix+1+-10),h
;level.c: 39: for (j=0;j<16;j++)

	ld	(ix+0+-6),0
	ld	a,(ix+0+-6)
	cp	010h
	jp	llt,l17
	jp	l18
;level.c: 40: {

l17:
;level.c: 41: asm(" di");

# 41 "level.c"
 di ;#

;level.c: 42: t=s++;

#
	psect	text
	ld	l,(ix+0+-8)
	ld	h,(ix+1+-8)
	inc	hl
	ld	(ix+0+-8),l
	ld	(ix+1+-8),h
	dec	hl
	ld	(ix+0+-4),l
	ld	(ix+1+-4),h
;level.c: 43: vdpsetvramwr(addr,displaypage);
	ld	a,(_displaypage)
	ld	c,a
	ld	e,(ix+0+-10)
	ld	d,(ix+1+-10)
	
	call	_vdpsetvramwr
	; 0 bytes adjustment

;level.c: 44: for (i=0;i<16;i++) {

	ld	(ix+0+-5),0
	ld	a,(ix+0+-5)
	cp	010h
	jp	llt,l20
	jp	l21
l20:
;level.c: 45: (*(port unsigned char *)(0x98) = (*t));

	ld	l,(ix+0+-4)
	ld	h,(ix+1+-4)
	ld	a,(hl)
	out	(0x98),a
;level.c: 46: t+=16;

	ld	bc,16
	ld	l,(ix+0+-4)
	ld	h,(ix+1+-4)
	add	hl,bc
	ld	(ix+0+-4),l
	ld	(ix+1+-4),h
;level.c: 47: }

	inc	(ix+0+-5)
	ld	a,(ix+0+-5)
	cp	010h
	jp	llt,l20
l21:
;level.c: 48: addr+=256;

	ld	bc,256
	ld	l,(ix+0+-10)
	ld	h,(ix+1+-10)
	add	hl,bc
	ld	(ix+0+-10),l
	ld	(ix+1+-10),h

	ei ;#

;level.c: 50: }
	inc	(ix+0+-6)
	ld	a,(ix+0+-6)
	cp	010h
	jp	llt,l17
l18:
;level.c: 51: }

	ld	a,(_y)
	add	a,010h
	ld	(_y),a
l16:
	ld	a,(_y)
	cp	-80
	jp	llt,l13
l14:
;level.c: 52: }

	ld	a,(_x)
	add	a,010h
	ld	(_x),a
	ld	a,(_c)
	add	a,01h
	ld	(_c),a
l12:
	ld	a,(_x)
	cp	-16
	jp	llt,l9
l10:
;level.c: 53: }

l8:
	ld	sp,ix
	pop	ix
	ret
f110:
	push	ix
	ld	ix,0
	add	ix,sp
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	jp	f111
;level.c: 59: void new_line_lft(unsigned char i)

;level.c: 60: {

	global	_new_line_lft
	signat	_new_line_lft,4152
_new_line_lft:
	psect	text
	jp	f150
f151:
;level.c: 61: asm(" di");

# 61 "level.c"
 di ;#

;level.c: 62: addr = i;

#
	psect	text
	ld	l,e
	ld	h,0
	ld	(_addr),hl
;level.c: 63: offs = (i<<4);

	ld	l,e
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	(_offs),hl
;level.c: 64: p = &level[xw+0][yw+0];

	ld	hl,(_xw)
	add	hl,hl
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,bc

	ld	a,(_yw)
	ld	b,a
	ld	a,b
	add	a,l
	ld	l,a
	ld	a,0
	bit	7,b
	jr	z,u25
	dec	a
u25:
	adc	a,h
	ld	h,a
	ld	bc,_level
	add	hl,bc
	ld	(_p),hl
# 66 "level.c"
 global _new_line2 ;#

 jp _new_line2 ;#

;level.c: 69: }

#
	psect	text
l23:
	ret
f150:
	jp	f151
;level.c: 71: void new_line_rgt(unsigned char i)

;level.c: 72: {

	global	_new_line_rgt
	signat	_new_line_rgt,4152
_new_line_rgt:
	psect	text
	jp	f160
f161:
;level.c: 73: asm(" di");

	di ;#

;level.c: 74: addr = 240+i;

	ld	hl,240
	ld	a,e
	add	a,l
	ld	l,a
	ld	a,h
	adc	a,0
	ld	h,a
	ld	(_addr),hl
;level.c: 75: offs = (i<<4);

	ld	l,e
	ld	h,0
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	(_offs),hl
;level.c: 76: p = &level[xw+15][yw+0];

	ld	hl,(_xw)
	add	hl,hl
	ld	b,h
	ld	c,l
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,bc

	ld	a,(_yw)
	ld	b,a
	ld	a,b
	add	a,l
	ld	l,a
	ld	a,0
	bit	7,b
	jr	z,u35
	dec	a
u35:
	adc	a,h
	ld	h,a
	ld	bc,_level+010Eh
	add	hl,bc
	ld	(_p),hl
# 78 "level.c"
 global _new_line2 ;#

 jp _new_line2 ;#

;level.c: 81: }

#
	psect	text
l24:
	ret
f160:
	jp	f161
# 84 "level.c"
 global _tile ;#

 global inner,_copy_cmd ;#

 ;#

_new_line2: ;#

 ld a,(_displaypage) ;#

 add a,a ;#

 add a,a ; R#14 ;#

 ;#

     ex af,af' ;#

 ld de,(_addr) ;#

 ld a,d ;#

 and 0x3f ;#

 or 64 ;#

 ld d,a ;#

  di ;#

 ex af,af' ;#

 out (0x99),a ; set bits 15-17 ;#

 ex af,af'  ;#

 ld a,14+128 ;#

 out (0x99),a ;#

 ;#

  call inner ;#

 call inner ;#

  call inner ;#

  call inner ;#

 ;#

  ld a,(_xoffset) ; set R#18 only when the vdp is not busy and the raster is in vblank area ;#

 add a,-8 ;#

 and 0Fh ;#

 out (099h),a ;#

 ld a,18+128 ;#

 out (099h),a ;#

 ;#

  ld c,0x9B ;#

 ld a,32 ;#

 out (0x99),a ;#

 ld a,17+128 ;#

 out (0x99),a ;#

 ld hl,(_pcmd) ;#

 rept 15 ; 15x OUTI (faster than OTIR) ;#

  outi ;#

 endm ;#

 ;#

   ei ;#

  ex af,af' ;#

 inc a ;#

 ex af,af' ;#

 ld de,(_addr) ;#

 ld hl,16*4 ;#

 add hl,de ;#

 ld (_addr),de ;#

 ;#

 ld a,d ;#

 and 0x3f ;#

 or 64 ;#

 ld d,a ;#

  di ;#

 ex af,af' ;#

 out (0x99),a ; set bits 15-17 ;#

 ex af,af'  ;#

 ld a,14+128 ;#

 out (0x99),a ;#

  call inner ;#

  call inner ;#

  call inner ;#

  call inner ;#

  ei ;#

 ;#

   ex af,af' ;#

 inc a ;#

 ex af,af' ;#

 ld de,(_addr) ;#

 ld hl,16*4 ;#

 add hl,de ;#

 ld (_addr),de ;#

 ;#

; LAST 3 LINES ;#

# 161 "level.c"
 ;#

 ld a,d ;#

 and 0x3f ;#

 or 64 ;#

 ld d,a ;#

  di ;#

 ex af,af' ;#

 out (0x99),a ; set bits 15-17 ;#

 ex af,af'  ;#

 ld a,14+128 ;#

 out (0x99),a ;#

  call inner ;#

  call inner ;#

  call inner ;#

 ei ;#

 ret ;#

 ;#

 inner: ;#

  ld hl,(_p) ; q = &tile[*p++][offs]; ;#

  ld a,(hl) ;#

 inc hl ;#

 ld (_p),hl ;#

 ld bc,(_offs) ;#

 add a,b ;#

 ld b,a ;#

 ld hl,_tile ;#

 add hl,bc ; from here hl points the current tile column ;#

 ;#

   ld c,0x98 ;#

 ;#

 rept 16 ;#

 ld a,e ; set bits 0-7 ;#

 out (0x99),a ;#

 ld a,d ; set bits 8-14 ;#

 out (0x99),a ;#

 inc d ;#

 outi ;#

 endm ;#

 ;#

 ret ;#

;level.c: 206: char xoffset=0;

;level.c: 211: struct commands copy_cmd = { 0, 0, 0, 0,16, 11*16,0,0,0xD0};

#
	psect	data,class=DATA
	psect	data
	global	_copy_cmd
_copy_cmd:
	defw	0
	defw	0
	defw	0
	defw	0
	defw	16
	defw	176
	defb	0
	defb	0
	defb	-48
;level.c: 212: struct commands line_cmd = { 0, 0, 0, 0, 1, 11*16,0,0,0xC0};

	global	_line_cmd
_line_cmd:
	defw	0
	defw	0
	defw	0
	defw	0
	defw	1
	defw	176
	defb	0
	defb	0
	defb	-64
;level.c: 213: struct commands bord_cmd = { 0, 0, 0, 0,16, 11*16,0,0,0xC0};

	global	_bord_cmd
_bord_cmd:
	defw	0
	defw	0
	defw	0
	defw	0
	defw	16
	defw	176
	defb	0
	defb	0
	defb	-64
;level.c: 216: void waitvdp(void);

;level.c: 219: void scroll_dx(void)

;level.c: 220: {

	global	_scroll_dx
	signat	_scroll_dx,24
	psect	text
_scroll_dx:
	psect	text
	jp	f210
f211:
;level.c: 221: if ( xoffset == 0) {

	global	_xoffset
	ld	a,(_xoffset)
	or	a
	jp	anz,l26
;level.c: 222: bord_cmd.dx = 240;

	global	_bord_cmd
	ld	hl,240
	ld	(_bord_cmd+04h),hl
;level.c: 223: bord_cmd.dy = (activepage)<<8;

	global	_activepage
	ld	a,(_activepage)
	ld	l,a
	rla
	sbc	a,a
	ld	h,a
	ld	h,l
	ld	l,0
	ld	(_bord_cmd+06h),hl
;level.c: 224: pcmd = &bord_cmd;

	global	_pcmd
	ld	hl,_bord_cmd
	ld	(_pcmd),hl
;level.c: 225: new_line_rgt(0);

	ld	e,0
	
	call	_new_line_rgt
	; 0 bytes adjustment

;level.c: 226: }

;level.c: 227: else

	jp	l27
l26:
;level.c: 228: {

;level.c: 229: line_cmd.dx = xoffset-1;

	global	_line_cmd
	ld	hl,-1
	ld	a,(_xoffset)
	ld	b,a
	ld	a,b
	add	a,l
	ld	l,a
	ld	a,0
	bit	7,b
	jr	z,u45
	dec	a
u45:
	adc	a,h
	ld	h,a
	ld	(_line_cmd+04h),hl
;level.c: 230: line_cmd.dy = displaypage<<8;

	ld	a,(_displaypage)
	ld	l,a
	rla
	sbc	a,a
	ld	h,a
	ld	h,l
	ld	l,0
	ld	(_line_cmd+06h),hl
;level.c: 231: send_vdpcmd(&line_cmd);

	global	_send_vdpcmd
	signat	_send_vdpcmd,4152
	ld	de,_line_cmd
	
	call	_send_vdpcmd
	; 0 bytes adjustment

;level.c: 232: copy_cmd.sy = displaypage<<8;

	global	_copy_cmd
	ld	a,(_displaypage)
	ld	l,a
	rla
	sbc	a,a
	ld	h,a
	ld	h,l
	ld	l,0
	ld	(_copy_cmd+02h),hl
;level.c: 233: copy_cmd.dy = activepage<<8;

	ld	a,(_activepage)
	ld	l,a
	rla
	sbc	a,a
	ld	h,a
	ld	h,l
	ld	l,0
	ld	(_copy_cmd+06h),hl
;level.c: 234: copy_cmd.sx = xoffset<<4;

	ld	a,(_xoffset)
	ld	l,a
	rla
	sbc	a,a
	ld	h,a
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	(_copy_cmd),hl
;level.c: 235: copy_cmd.dx = copy_cmd.sx - 16;

	ld	hl,(_copy_cmd)
	ld	de,-16
	add	hl,de
	ld	(_copy_cmd+04h),hl
;level.c: 236: pcmd = &copy_cmd;

	ld	hl,_copy_cmd
	ld	(_pcmd),hl
;level.c: 237: new_line_rgt(xoffset);

	ld	a,(_xoffset)
	ld	e,a
	
	call	_new_line_rgt
	; 0 bytes adjustment

;level.c: 238: }

l27:
;level.c: 240: asm(" di");

# 240 "level.c"
 di ;#

;level.c: 241: if (xoffset==15)

#
	psect	text
	ld	a,(_xoffset)
	cp	0Fh
	jp	nz,l28
;level.c: 242: {

;level.c: 243: displaypage = activepage;

	ld	a,(_activepage)
	ld	(_displaypage),a
;level.c: 244: activepage^=1;

	ld	a,(_activepage)
	xor	01h
	ld	(_activepage),a
;level.c: 245: xw++;

	ld	hl,(_xw)
	inc	hl
	ld	(_xw),hl
;level.c: 246: if (xw+15>=128)

	ld	de,128
	ld	hl,(_xw)
	ld	bc,0Fh
	add	hl,bc
	global	wrelop
	call	wrelop
	jp	alt,l29
;level.c: 247: xw-=128;

	ld	bc,128
	ld	hl,(_xw)
	or	a
	sbc	hl,bc
	ld	(_xw),hl
;level.c: 249: xoffset=0;

l29:
	ld	a,0
	ld	(_xoffset),a
;level.c: 250: }

;level.c: 251: else

	jp	l30
l28:
;level.c: 252: xoffset++;

	ld	a,(_xoffset)
	add	a,01h
	ld	(_xoffset),a
l30:
;level.c: 253: asm(" ei");

# 253 "level.c"
 ei ;#

;level.c: 254: }

#
	psect	text
l25:
	ret
f210:
	jp	f211
;level.c: 257: void scroll_sx(void)

;level.c: 258: {

	global	_scroll_sx
	signat	_scroll_sx,24
_scroll_sx:
	psect	text
	jp	f240
f241:
;level.c: 259: if ( xoffset == 15) {

	ld	a,(_xoffset)
	cp	0Fh
	jp	nz,l32
;level.c: 260: bord_cmd.dx = 0;

	ld	hl,0
	ld	(_bord_cmd+04h),hl
;level.c: 261: bord_cmd.dy = (activepage)<<8;

	ld	a,(_activepage)
	ld	l,a
	rla
	sbc	a,a
	ld	h,a
	ld	h,l
	ld	l,0
	ld	(_bord_cmd+06h),hl
;level.c: 262: pcmd = &bord_cmd;

	ld	hl,_bord_cmd
	ld	(_pcmd),hl
;level.c: 263: new_line_lft(15);

	ld	e,0Fh
	
	call	_new_line_lft
	; 0 bytes adjustment

;level.c: 264: }

;level.c: 265: else

	jp	l33
l32:
;level.c: 266: {

;level.c: 267: line_cmd.dx = 241+xoffset;

	ld	hl,241
	ld	a,(_xoffset)
	ld	b,a
	ld	a,b
	add	a,l
	ld	l,a
	ld	a,0
	bit	7,b
	jr	z,u55
	dec	a
u55:
	adc	a,h
	ld	h,a
	ld	(_line_cmd+04h),hl
;level.c: 268: line_cmd.dy = displaypage<<8;

	ld	a,(_displaypage)
	ld	l,a
	rla
	sbc	a,a
	ld	h,a
	ld	h,l
	ld	l,0
	ld	(_line_cmd+06h),hl
;level.c: 269: send_vdpcmd(&line_cmd);

	ld	de,_line_cmd
	
	call	_send_vdpcmd
	; 0 bytes adjustment

;level.c: 270: copy_cmd.sy = displaypage<<8;

	ld	a,(_displaypage)
	ld	l,a
	rla
	sbc	a,a
	ld	h,a
	ld	h,l
	ld	l,0
	ld	(_copy_cmd+02h),hl
;level.c: 271: copy_cmd.dy = activepage<<8;

	ld	a,(_activepage)
	ld	l,a
	rla
	sbc	a,a
	ld	h,a
	ld	h,l
	ld	l,0
	ld	(_copy_cmd+06h),hl
;level.c: 272: copy_cmd.sx = (xoffset)<<4;

	ld	a,(_xoffset)
	ld	l,a
	rla
	sbc	a,a
	ld	h,a
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ld	(_copy_cmd),hl
;level.c: 273: copy_cmd.dx = copy_cmd.sx + 16;

	ld	hl,(_copy_cmd)
	ld	de,010h
	add	hl,de
	ld	(_copy_cmd+04h),hl
;level.c: 274: pcmd = &copy_cmd;

	ld	hl,_copy_cmd
	ld	(_pcmd),hl
;level.c: 275: new_line_lft(xoffset);

	ld	a,(_xoffset)
	ld	e,a
	
	call	_new_line_lft
	; 0 bytes adjustment

;level.c: 276: }

l33:
;level.c: 278: asm(" di");

# 278 "level.c"
 di ;#

;level.c: 279: if (xoffset==0)

#
	psect	text
	ld	a,(_xoffset)
	or	a
	jp	anz,l34
;level.c: 280: {

;level.c: 281: displaypage = activepage;

	ld	a,(_activepage)
	ld	(_displaypage),a
;level.c: 282: activepage^=1;

	ld	a,(_activepage)
	xor	01h
	ld	(_activepage),a
;level.c: 283: xw--;

	ld	hl,(_xw)
	dec	hl
	ld	(_xw),hl
;level.c: 284: if (xw<0)

	ld	hl,(_xw)
	bit	7,h
	jp	z,l35
;level.c: 285: xw+=128;

	ld	bc,128
	ld	hl,(_xw)
	add	hl,bc
	ld	(_xw),hl
;level.c: 287: xoffset=15;

l35:
	ld	a,0Fh
	ld	(_xoffset),a
;level.c: 288: }

;level.c: 289: else

	jp	l36
l34:
;level.c: 290: xoffset--;

	ld	a,(_xoffset)
	sub	01h
	ld	(_xoffset),a
l36:
;level.c: 291: asm(" ei");

# 291 "level.c"
 ei ;#

;level.c: 292: }

#
	psect	text
l31:
	ret
f240:
	jp	f241
	psect	bss,class=DATA
	psect	bss
_c:
	defs	1
_x:
	defs	1
_xoffset:
	defs	1
_y:
	defs	1
_yw:
	defs	1
_addr:
	defs	2
_offs:
	defs	2
_p:
	defs	2
_pcmd:
	defs	2
_xw:
	defs	2
_level:
	defs	2304
