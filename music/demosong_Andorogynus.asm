; Compiled using tt_compile.exe V0.2.1 [30-03-2015]
; Copyright 2015 Richard Cornelisse

; Song: Andorogynus Stage1 Test         
; By:   Arr. by Gryzor87     january2013

;	org $c000

; [ Song start data ]
	db $0A				; Initial song speed.
	dw .waveform_start 		; Start of the waveform data.
	dw .instrument_start 		; Start of the instrument data.

; [ Song order pointer list ]
.restart:
		dw .track_0,.track_1,.track_2,.track_3,.track_3,.track_3,.track_3,.track_3		; Sequence step 0 /pattern 0
		dw .track_4,.track_5,.track_6,.track_3,.track_3,.track_3,.track_3,.track_3		; Sequence step 1 /pattern 1
		dw .track_7,.track_8,.track_9,.track_10,.track_10,.track_10,.track_10,.track_10		; Sequence step 2 /pattern 2
		dw .track_0,.track_1,.track_2,.track_3,.track_3,.track_3,.track_3,.track_3		; Sequence step 3 /pattern 0
		dw .track_4,.track_5,.track_6,.track_3,.track_3,.track_3,.track_3,.track_3		; Sequence step 4 /pattern 1
		dw .track_7,.track_8,.track_9,.track_10,.track_10,.track_10,.track_10,.track_10		; Sequence step 5 /pattern 2
		dw .track_11,.track_12,.track_13,.track_14,.track_15,.track_16,.track_3,.track_3		; Sequence step 6 /pattern 3
		dw .track_0,.track_1,.track_17,.track_18,.track_19,.track_20,.track_21,.track_3		; Sequence step 7 /pattern 4
		dw .track_4,.track_5,.track_22,.track_23,.track_24,.track_25,.track_26,.track_27		; Sequence step 8 /pattern 5
		dw .track_7,.track_8,.track_28,.track_29,.track_30,.track_31,.track_32,.track_33		; Sequence step 9 /pattern 6
		dw .track_34,.track_35,.track_36,.track_37,.track_38,.track_39,.track_40,.track_41		; Sequence step 10 /pattern 7

		dw .track_43,.track_43,.track_43,.track_43,.track_43,.track_43,.track_43,.track_43		; Sequence step 11 /pattern 8
		dw 0x0000, .restart			; End of sequence delimiter + restart address.

.waveform_start:
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; Waveform 0
	db $80,$B0,$C0,$10,$1A,$2A,$2C,$1A,$00,$E0,$D0,$E0,$22,$53,$70,$75,$70,$31,$EA,$80,$88,$8A,$8C,$8E,$00,$7F,$75,$73,$62,$00,$C0,$90	; Waveform 1
	db $30,$50,$50,$30,$00,$00,$10,$40,$60,$70,$60,$30,$F0,$E0,$E0,$00,$20,$20,$10,$C0,$A0,$90,$A0,$C0,$00,$00,$D0,$B0,$B0,$D0,$00,$00	; Waveform 2
	db $78,$70,$68,$60,$58,$50,$48,$40,$38,$30,$28,$20,$18,$10,$08,$00,$78,$70,$68,$60,$58,$50,$48,$40,$38,$30,$28,$20,$18,$10,$08,$00	; Waveform 3
	db $50,$7F,$7F,$50,$B0,$80,$80,$B0,$50,$7F,$7F,$50,$B0,$80,$80,$B0,$50,$7F,$7F,$50,$B0,$80,$80,$B0,$50,$7F,$7F,$50,$B0,$80,$80,$B0	; Waveform 4
	db $00,$40,$7F,$40,$01,$C0,$81,$C0,$01,$40,$7F,$40,$01,$C0,$01,$40,$01,$E0,$01,$20,$01,$F0,$01,$10,$01,$FF,$FF,$FF,$FF,$40,$40,$40	; Waveform 5
	db $00,$19,$31,$47,$5A,$6A,$75,$7D,$7F,$7D,$75,$6A,$5A,$47,$31,$19,$00,$E0,$C0,$A0,$80,$A0,$C0,$E0,$00,$20,$40,$60,$7F,$60,$40,$20	; Waveform 6
	db $00,$4E,$62,$6D,$75,$7A,$7D,$7E,$7F,$7E,$7D,$7A,$75,$6D,$62,$4E,$00,$B1,$9D,$92,$8A,$85,$82,$81,$80,$81,$82,$85,$8A,$92,$9D,$B1	; Waveform 7
	db $00,$68,$48,$18,$48,$68,$28,$00,$48,$77,$58,$08,$28,$38,$00,$B8,$08,$58,$00,$E8,$F8,$00,$B8,$98,$C8,$08,$E8,$A8,$C8,$F8,$C8,$A8	; Waveform 8
	db $00,$F8,$F0,$E8,$E0,$D8,$D0,$C8,$C0,$B8,$B0,$A8,$A0,$98,$90,$88,$80,$7F,$70,$68,$60,$58,$50,$48,$40,$38,$30,$28,$20,$18,$10,$08	; Waveform 9
	db $00,$F0,$E0,$D0,$C0,$B0,$A0,$90,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$7F,$70,$60,$50,$40,$30,$20,$10	; Waveform 10
	db $01,$2A,$40,$50,$5C,$68,$70,$78,$7F,$78,$70,$68,$5C,$50,$40,$2A,$FF,$D6,$C0,$B0,$A4,$98,$90,$88,$81,$88,$90,$98,$A4,$B0,$C0,$D6	; Waveform 11
	db $00,$19,$31,$47,$5A,$6A,$75,$7D,$7F,$7D,$75,$6A,$5A,$47,$31,$19,$00,$E7,$CF,$B9,$A6,$96,$8B,$83,$80,$83,$8B,$96,$A6,$B9,$CF,$E7	; Waveform 12
	db $00,$19,$31,$47,$5A,$6A,$75,$7D,$7F,$7D,$75,$6A,$5A,$47,$31,$19,$80,$90,$A0,$B0,$C0,$D0,$E0,$F0,$00,$10,$20,$30,$40,$50,$60,$70	; Waveform 13
	db $00,$00,$00,$00,$00,$78,$78,$00,$00,$80,$80,$80,$00,$00,$00,$00,$78,$78,$78,$00,$80,$80,$00,$00,$00,$00,$78,$78,$00,$00,$80,$80	; Waveform 14
	db $00,$20,$30,$40,$30,$20,$E0,$C0,$B0,$C0,$E0,$20,$40,$60,$70,$70,$60,$40,$20,$E0,$B0,$90,$80,$80,$80,$80,$90,$A0,$C0,$D0,$E0,$F0	; Waveform 15
	db $00,$E0,$C0,$A0,$80,$A0,$C0,$E0,$00,$20,$40,$60,$7F,$60,$40,$20,$00,$E0,$C0,$A0,$80,$A0,$C0,$E0,$00,$20,$40,$60,$7F,$60,$40,$20	; Waveform 16

.instrument_start:
	dw .ins_1,.ins_2,.ins_3,.ins_4,.ins_5,.ins_6,.ins_7,.ins_8,.ins_9,.ins_10,.ins_11,.ins_12,.ins_13,.ins_14,.ins_15,.ins_16,.ins_17,.ins_18,.ins_19,.ins_20,.ins_21,.ins_22,.ins_23,.ins_24,.ins_25
.ins_1:						; BD POW          
		db 0					; Waveform
		db .rst_i1-(.ins_1 +2)		; Restart
		db $15,$0E,$28,$01
		db $55,$0D,$E1,$00,$03
		db $55,$0A,$E1,$30,$03
.rst_i1:
		db $5D,$00,$E1,$00,$03
.ins_2:						; SD POW          
		db 0					; Waveform
		db .rst_i2-(.ins_2 +2)		; Restart
		db $31,$0F,$1F
		db $85,$0F,$FF,$FF
		db $85,$0E,$FF,$FF
		db $A5,$0D,$05,$FF,$FF
		db $85,$0C,$FF,$FF
		db $A5,$0B,$03,$FF,$FF
		db $85,$0A,$FF,$FF
		db $85,$07,$07,$00
		db $81,$07
		db $81,$06
		db $81,$05
.rst_i2:
		db $89,$03
.ins_3:						; HH close        
		db 0					; Waveform
		db .rst_i3-(.ins_3 +2)		; Restart
		db $81,$0E
		db $81,$06
.rst_i3:
		db $89,$00
.ins_4:						; HH open         
.ins_5:						; Ride Cymbal     
.ins_6:						; Tom             
		db 0					; Waveform
		db .rst_i6-(.ins_6 +2)		; Restart
		db $15,$0F,$2F,$00
		db $15,$0E,$2F,$00
.rst_i6:
		db $14,$2F,$00
		db $1F,$FF,$2F,$00
.ins_7:						; PSG Attack      
		db 0					; Waveform
		db .rst_i7-(.ins_7 +2)		; Restart
		db $11,$0F
		db $11,$0B
.rst_i7:
		db $19,$0A
.ins_8:						; PSG Lead        
		db 0					; Waveform
		db .rst_i8-(.ins_8 +2)		; Restart
		db $11,$09
		db $11,$0A
		db $11,$0B
		db $11,$0C
		db $11,$0E
		db $11,$0F
		db $11,$0F
		db $11,$0F
.rst_i8:
		db $19,$0F
.ins_9:						;                 
.ins_10:						; SC Bass         
		db 1					; Waveform
		db .rst_i10-(.ins_10 +2)		; Restart
		db $11,$0F
		db $11,$0A
		db $11,$0A
		db $11,$0A
		db $11,$0A
		db $11,$0A
		db $11,$0A
		db $11,$0A
		db $11,$0A
		db $11,$0A
		db $11,$0A
		db $11,$07
		db $11,$07
		db $11,$07
		db $11,$07
		db $11,$06
		db $11,$05
		db $11,$04
		db $11,$03
.rst_i10:
		db $19,$02
.ins_11:						; SC Piano        
.ins_12:						; SC Lead         
.ins_13:						; SC Bell         
		db 4					; Waveform
		db .rst_i13-(.ins_13 +2)		; Restart
		db $11,$0F
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$08
		db $11,$07
		db $11,$06
		db $11,$05
		db $11,$04
.rst_i13:
		db $19,$03
.ins_14:						; SC Pad LOW      
		db 5					; Waveform
		db .rst_i14-(.ins_14 +2)		; Restart
		db $11,$03
		db $11,$05
		db $11,$08
		db $11,$0A
		db $11,$0A
		db $11,$0B
		db $11,$0B
		db $11,$0B
.rst_i14:
		db $19,$0B
.ins_15:						; SC PianoBell    
		db 6					; Waveform
		db .rst_i15-(.ins_15 +2)		; Restart
		db $11,$0F
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$09
		db $11,$08
		db $11,$07
		db $11,$06
		db $11,$05
		db $11,$04
		db $11,$03
.rst_i15:
		db $19,$02
.ins_16:						; SC Flute        
		db 6					; Waveform
		db .rst_i16-(.ins_16 +2)		; Restart
		db $11,$04
		db $11,$06
		db $11,$08
		db $11,$0A
		db $11,$0A
		db $11,$0B
		db $11,$0B
		db $11,$0C
.rst_i16:
		db $19,$0D
.ins_17:						; SC Flute2       
.ins_18:						; SC Organ        
		db 8					; Waveform
		db .rst_i18-(.ins_18 +2)		; Restart
		db $11,$07
		db $11,$0A
		db $11,$0D
		db $11,$0D
		db $11,$0C
		db $11,$0B
		db $11,$0A
		db $11,$07
		db $11,$06
.rst_i18:
		db $19,$05
.ins_19:						; SC Sawlead      
		db 9					; Waveform
		db .rst_i19-(.ins_19 +2)		; Restart
		db $11,$09
		db $11,$0A
		db $11,$0B
		db $11,$0C
		db $11,$0E
		db $11,$0F
		db $11,$0F
		db $11,$0F
.rst_i19:
		db $19,$0F
.ins_20:						; SC Brass        
.ins_21:						; SD Tom          
		db 11					; Waveform
		db .rst_i21-(.ins_21 +2)		; Restart
		db $15,$0F,$4F,$00
		db $15,$0C,$4F,$00
.rst_i21:
		db $14,$4F,$00
		db $1F,$FF,$4F,$00
.ins_22:						; SC Bass         
		db 12					; Waveform
		db .rst_i22-(.ins_22 +2)		; Restart
		db $11,$0F
		db $11,$0E
		db $11,$0D
		db $11,$0D
		db $11,$0D
		db $11,$0D
		db $11,$0D
		db $11,$0C
		db $11,$0C
		db $11,$0B
		db $11,$0B
		db $11,$0A
		db $11,$09
		db $11,$08
		db $11,$07
		db $11,$06
		db $11,$05
		db $11,$04
		db $11,$03
.rst_i22:
		db $19,$02
.ins_23:						; SC DoubleLead   
.ins_24:						; SC Clavi        
.ins_25:						; SC Bass2        
		db 15					; Waveform
		db .rst_i25-(.ins_25 +2)		; Restart
		db $11,$0F
		db $11,$0E
		db $11,$0D
		db $11,$0D
		db $11,$0D
		db $11,$0D
		db $11,$0D
		db $11,$0C
		db $11,$0C
		db $11,$0B
		db $11,$0B
		db $11,$0A
		db $11,$09
		db $11,$08
		db $11,$07
		db $11,$06
		db $11,$05
		db $11,$04
		db $11,$03
.rst_i25:
		db $19,$02

; [ Song track data ]
.track_0:
	db $1F		;[Note] 32
	db $6F		;[Volume] 15
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $21		;[Note] 34
	db $71		;[Instrument] 2
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
				;[Skip delay] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C0		;[Wait] 1
	db $21		;[Note] 34
	db $72		;[Instrument] 3
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $21		;[Note] 34
	db $71		;[Instrument] 2
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
				;[Skip delay] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $21		;[Note] 34
	db $71		;[Instrument] 2
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
				;[Skip delay] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $21		;[Note] 34
	db $71		;[Instrument] 2
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $21		;[Note] 34
				;[Skip delay] 2
	db $21		;[Note] 34
	db $C0		;[Wait] 1
	db $21		;[Note] 34
	db $72		;[Instrument] 3
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_1:
	db $13		;[Note] 20
	db $6F		;[Volume] 15
	db $76		;[Instrument] 7
	db $C0		;[Wait] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_2:
	db $2B		;[Note] 44
	db $6D		;[Volume] 13
	db $77		;[Instrument] 8
	db $C3		;[Wait] 4
	db $2D		;[Note] 46
	db $C1		;[Wait] 2
	db $2E		;[Note] 47
	db $C3		;[Wait] 4
	db $2B		;[Note] 44
				;[Skip delay] 4
	db $32		;[Note] 51
	db $94, $01	; vibrato control
				;[Skip delay] 4
	db $A7, $65	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $06	;[CMD vibrato] rep
	db $C5		;[Wait] 6
	db $A5, $06; slide-down
	db $C0		;[Wait] 1
	db $AF, $02; slide-down rep
	db $C1		;[Wait] 2
	db $32		;[Note] 51
	db $6E		;[Volume] 14
	db $AB, $04; macro offset
	db $C0		;[Wait] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $2E		;[Note] 47
				;[Skip delay] 1
	db $2D		;[Note] 46
				;[Skip delay] 1
	db $2B		;[Note] 44
	db $6D		;[Volume] 13
	db $C3		;[Wait] 4
	db $2D		;[Note] 46
	db $C1		;[Wait] 2
	db $2E		;[Note] 47
	db $C3		;[Wait] 4
	db $2B		;[Note] 44
				;[Skip delay] 4
	db $32		;[Note] 51
	db $94, $01	; vibrato control
				;[Skip delay] 4
	db $A7, $65	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $06	;[CMD vibrato] rep
	db $C5		;[Wait] 6
	db $A7, $64	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $01	;[CMD vibrato] rep
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $32		;[Note] 51
	db $6E		;[Volume] 14
	db $AB, $04; macro offset
				;[Skip delay] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $2E		;[Note] 47
				;[Skip delay] 1
	db $2D		;[Note] 46
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_3:
	db $FF		;[Wait] 64
	db $BF		;[End-Of-Track]
.track_4:
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $21		;[Note] 34
	db $71		;[Instrument] 2
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
				;[Skip delay] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C0		;[Wait] 1
	db $21		;[Note] 34
	db $72		;[Instrument] 3
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $21		;[Note] 34
	db $71		;[Instrument] 2
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
				;[Skip delay] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $21		;[Note] 34
	db $71		;[Instrument] 2
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
				;[Skip delay] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $21		;[Note] 34
	db $71		;[Instrument] 2
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $21		;[Note] 34
				;[Skip delay] 2
	db $21		;[Note] 34
	db $C0		;[Wait] 1
	db $21		;[Note] 34
	db $72		;[Instrument] 3
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_5:
	db $11		;[Note] 18
	db $6F		;[Volume] 15
	db $76		;[Instrument] 7
	db $C0		;[Wait] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $1D		;[Note] 30
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $18		;[Note] 25
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_6:
	db $2B		;[Note] 44
	db $6D		;[Volume] 13
	db $77		;[Instrument] 8
	db $C3		;[Wait] 4
	db $2D		;[Note] 46
	db $C1		;[Wait] 2
	db $2E		;[Note] 47
	db $C3		;[Wait] 4
	db $2B		;[Note] 44
				;[Skip delay] 4
	db $32		;[Note] 51
	db $94, $01	; vibrato control
				;[Skip delay] 4
	db $A7, $65	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $06	;[CMD vibrato] rep
	db $C5		;[Wait] 6
	db $A5, $06; slide-down
	db $C0		;[Wait] 1
	db $AF, $02; slide-down rep
	db $C1		;[Wait] 2
	db $32		;[Note] 51
	db $6E		;[Volume] 14
	db $AB, $04; macro offset
	db $C0		;[Wait] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $33		;[Note] 52
	db $6D		;[Volume] 13
	db $C2		;[Wait] 3
	db $A7, $66	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $02	;[CMD vibrato] rep
	db $C1		;[Wait] 2
	db $30		;[Note] 49
				;[Skip delay] 2
	db $30		;[Note] 49
	db $C1		;[Wait..] 2
	db $A7, $65	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $0B	;[CMD vibrato] rep
	db $CA		;[Wait] 11
	db $A5, $03; slide-down
	db $C0		;[Wait] 1
	db $AF, $03; slide-down rep
	db $C2		;[Wait] 3
	db $33		;[Note] 52
	db $C1		;[Wait] 2
	db $35		;[Note] 54
				;[Skip delay] 2
	db $37		;[Note] 56
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_7:
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $21		;[Note] 34
	db $71		;[Instrument] 2
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
				;[Skip delay] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C0		;[Wait] 1
	db $21		;[Note] 34
	db $72		;[Instrument] 3
				;[Skip delay] 1
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $72		;[Instrument] 3
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $21		;[Note] 34
	db $71		;[Instrument] 2
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $6E		;[Volume] 14
	db $75		;[Instrument] 6
	db $C0		;[Wait] 1
	db $1F		;[Note] 32
				;[Skip delay] 1
	db $2B		;[Note] 44
	db $6F		;[Volume] 15
				;[Skip delay] 1
	db $2B		;[Note] 44
				;[Skip delay] 1
	db $28		;[Note] 41
				;[Skip delay] 1
	db $28		;[Note] 41
				;[Skip delay] 1
	db $26		;[Note] 39
				;[Skip delay] 1
	db $26		;[Note] 39
				;[Skip delay] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1C		;[Note] 29
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_8:
	db $0E		;[Note] 15
	db $C0		;[Wait] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_9:
	db $39		;[Note] 58
	db $C2		;[Wait] 3
	db $A7, $56	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $04	;[CMD vibrato] rep
	db $C3		;[Wait] 4
	db $A7, $55	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $03	;[CMD vibrato] rep
	db $C2		;[Wait] 3
	db $37		;[Note] 56
	db $C3		;[Wait] 4
	db $36		;[Note] 55
	db $C3		;[Wait..] 4
	db $A7, $36	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $01	;[CMD vibrato] rep
				;[Skip delay] 1
	db $A5, $05; slide-down
				;[Skip delay] 1
	db $AF, $01; slide-down rep
				;[Skip delay] 1
	db $3A		;[Note] 59
	db $C3		;[Wait] 4
	db $39		;[Note] 58
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_10:
	db $DF		;[Wait] 32
	db $BF		;[End-Of-Track]
.track_11:
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C3		;[Wait] 4
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 4
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
				;[Skip delay] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
				;[Skip delay] 2
	db $1F		;[Note] 32
	db $C3		;[Wait] 4
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 4
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
				;[Skip delay] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
	db $C3		;[Wait] 4
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
				;[Skip delay] 4
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 4
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
				;[Skip delay] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
	db $C3		;[Wait] 4
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
				;[Skip delay] 4
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 4
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $21		;[Note] 34
				;[Skip delay] 2
	db $21		;[Note] 34
	db $C0		;[Wait] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_12:
	db $C0		;[Wait] 1
	db $3A		;[Note] 59
	db $6E		;[Volume] 14
	db $76		;[Instrument] 7
				;[Skip delay] 1
	db $39		;[Note] 58
	db $A5, $04; slide-down
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_13:
	db $3A		;[Note] 59
	db $6E		;[Volume] 14
	db $C0		;[Wait] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_14:
	db $F7		;[Wait] 56
	db $02		;[Note] 3
	db $6F		;[Volume] 15
	db $79		;[Instrument] 10
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $02		;[Note] 3
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $0E		;[Note] 15
	db $C0		;[Wait..] 1
	db $A5, $50; slide-down
				;[Skip delay] 1
	db $AF, $02; slide-down rep
	db $C1		;[Wait] 2
	db $BF		;[End-Of-Track]
.track_15:
	db $F7		;[Wait] 56
	db $02		;[Note] 3
	db $6F		;[Volume] 15
	db $88		;[Instrument] 25
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $02		;[Note] 3
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $0E		;[Note] 15
	db $C0		;[Wait..] 1
	db $A5, $50; slide-down
				;[Skip delay] 1
	db $AF, $02; slide-down rep
	db $C1		;[Wait] 2
	db $BF		;[End-Of-Track]
.track_16:
	db $F9		;[Wait] 58
	db $32		;[Note] 51
	db $6F		;[Volume] 15
	db $84		;[Instrument] 21
	db $C1		;[Wait] 2
	db $28		;[Note] 41
				;[Skip delay] 2
	db $1A		;[Note] 27
	db $C0		;[Wait] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_17:
	db $C1		;[Wait] 2
	db $2B		;[Note] 44
	db $69		;[Volume] 9
	db $77		;[Instrument] 8
	db $C3		;[Wait] 4
	db $2D		;[Note] 46
	db $C1		;[Wait] 2
	db $2E		;[Note] 47
	db $C3		;[Wait] 4
	db $2B		;[Note] 44
				;[Skip delay] 4
	db $32		;[Note] 51
	db $94, $01	; vibrato control
				;[Skip delay] 4
	db $A7, $65	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $06	;[CMD vibrato] rep
	db $C5		;[Wait] 6
	db $A5, $06; slide-down
	db $C0		;[Wait] 1
	db $AF, $02; slide-down rep
	db $C1		;[Wait] 2
	db $32		;[Note] 51
	db $AB, $04; macro offset
	db $C0		;[Wait] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $2E		;[Note] 47
				;[Skip delay] 1
	db $2D		;[Note] 46
				;[Skip delay] 1
	db $2B		;[Note] 44
	db $C3		;[Wait] 4
	db $2D		;[Note] 46
	db $C1		;[Wait] 2
	db $2E		;[Note] 47
	db $C3		;[Wait] 4
	db $2B		;[Note] 44
				;[Skip delay] 4
	db $32		;[Note] 51
	db $94, $01	; vibrato control
				;[Skip delay] 4
	db $A7, $65	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $06	;[CMD vibrato] rep
	db $C5		;[Wait] 6
	db $A7, $64	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $01	;[CMD vibrato] rep
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $32		;[Note] 51
	db $AB, $04; macro offset
				;[Skip delay] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_18:
	db $07		;[Note] 8
	db $6F		;[Volume] 15
	db $79		;[Instrument] 10
	db $C0		;[Wait] 1
	db $A5, $10; slide-down
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $07		;[Note] 8
	db $C1		;[Wait] 2
	db $13		;[Note] 20
	db $C0		;[Wait] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $07		;[Note] 8
	db $C1		;[Wait] 2
	db $13		;[Note] 20
	db $C0		;[Wait] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $07		;[Note] 8
	db $C1		;[Wait] 2
	db $13		;[Note] 20
	db $C0		;[Wait] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $07		;[Note] 8
	db $C1		;[Wait] 2
	db $13		;[Note] 20
	db $C0		;[Wait] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $07		;[Note] 8
	db $C1		;[Wait] 2
	db $13		;[Note] 20
	db $C0		;[Wait] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $15		;[Note] 22
				;[Skip delay] 1
	db $15		;[Note] 22
				;[Skip delay] 1
	db $16		;[Note] 23
				;[Skip delay] 1
	db $16		;[Note] 23
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $13		;[Note] 20
				;[Skip delay] 1
	db $06		;[Note] 7
	db $C1		;[Wait] 2
	db $12		;[Note] 19
	db $C0		;[Wait] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $06		;[Note] 7
	db $C1		;[Wait] 2
	db $12		;[Note] 19
	db $C0		;[Wait] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $06		;[Note] 7
	db $C1		;[Wait] 2
	db $12		;[Note] 19
	db $C0		;[Wait] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $06		;[Note] 7
	db $C1		;[Wait] 2
	db $12		;[Note] 19
	db $C0		;[Wait] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $06		;[Note] 7
	db $C1		;[Wait] 2
	db $12		;[Note] 19
	db $C0		;[Wait] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $06		;[Note] 7
	db $C1		;[Wait] 2
	db $12		;[Note] 19
	db $C0		;[Wait] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $15		;[Note] 22
				;[Skip delay] 1
	db $15		;[Note] 22
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_19:
	db $2A		;[Note] 43
	db $6D		;[Volume] 13
	db $82		;[Instrument] 19
	db $C0		;[Wait] 1
	db $2B		;[Note] 44
	db $A6, $03; tone-slide
				;[Skip delay] 1
	db $B0, $02; tone-slide rep
	db $C1		;[Wait] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $2E		;[Note] 47
	db $6C		;[Volume] 12
	db $C3		;[Wait] 4
	db $2B		;[Note] 44
	db $6B		;[Volume] 11
				;[Skip delay] 4
	db $32		;[Note] 51
	db $6A		;[Volume] 10
	db $94, $01	; vibrato control
				;[Skip delay] 4
	db $A7, $65	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $06	;[CMD vibrato] rep
	db $C5		;[Wait] 6
	db $A5, $06; slide-down
	db $C0		;[Wait] 1
	db $AF, $02; slide-down rep
	db $C1		;[Wait] 2
	db $32		;[Note] 51
	db $6E		;[Volume] 14
	db $AB, $04; macro offset
	db $C0		;[Wait] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $2E		;[Note] 47
				;[Skip delay] 1
	db $2D		;[Note] 46
				;[Skip delay] 1
	db $2B		;[Note] 44
	db $6D		;[Volume] 13
	db $C3		;[Wait] 4
	db $2D		;[Note] 46
	db $C1		;[Wait] 2
	db $2E		;[Note] 47
	db $C3		;[Wait] 4
	db $2B		;[Note] 44
				;[Skip delay] 4
	db $32		;[Note] 51
	db $94, $01	; vibrato control
				;[Skip delay] 4
	db $A7, $65	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $06	;[CMD vibrato] rep
	db $C5		;[Wait] 6
	db $A7, $64	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $01	;[CMD vibrato] rep
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $32		;[Note] 51
	db $6E		;[Volume] 14
	db $AB, $04; macro offset
				;[Skip delay] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $2E		;[Note] 47
				;[Skip delay] 1
	db $2D		;[Note] 46
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_20:
	db $37		;[Note] 56
	db $65		;[Volume] 5
	db $7C		;[Instrument] 13
	db $C0		;[Wait] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_21:
	db $2E		;[Note] 47
	db $67		;[Volume] 7
	db $7F		;[Instrument] 16
	db $C7		;[Wait] 8
	db $2D		;[Note] 46
				;[Skip delay] 8
	db $2B		;[Note] 44
				;[Skip delay] 8
	db $26		;[Note] 39
				;[Skip delay] 8
	db $2A		;[Note] 43
				;[Skip delay] 8
	db $27		;[Note] 40
				;[Skip delay] 8
	db $24		;[Note] 37
				;[Skip delay] 8
	db $21		;[Note] 34
				;[Skip delay] 8
	db $BF		;[End-Of-Track]
.track_22:
	db $C1		;[Wait] 2
	db $2B		;[Note] 44
	db $69		;[Volume] 9
	db $77		;[Instrument] 8
	db $C3		;[Wait] 4
	db $2D		;[Note] 46
	db $C1		;[Wait] 2
	db $2E		;[Note] 47
	db $C3		;[Wait] 4
	db $2B		;[Note] 44
				;[Skip delay] 4
	db $32		;[Note] 51
	db $94, $01	; vibrato control
				;[Skip delay] 4
	db $A7, $65	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $06	;[CMD vibrato] rep
	db $C5		;[Wait] 6
	db $A5, $06; slide-down
	db $C0		;[Wait] 1
	db $AF, $02; slide-down rep
	db $C1		;[Wait] 2
	db $32		;[Note] 51
	db $AB, $04; macro offset
	db $C0		;[Wait] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $33		;[Note] 52
	db $C2		;[Wait] 3
	db $A7, $66	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $02	;[CMD vibrato] rep
	db $C1		;[Wait] 2
	db $30		;[Note] 49
				;[Skip delay] 2
	db $30		;[Note] 49
	db $C1		;[Wait..] 2
	db $A7, $65	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $0B	;[CMD vibrato] rep
	db $CA		;[Wait] 11
	db $A5, $03; slide-down
	db $C0		;[Wait] 1
	db $AF, $03; slide-down rep
	db $C2		;[Wait] 3
	db $33		;[Note] 52
	db $C1		;[Wait] 2
	db $35		;[Note] 54
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_23:
	db $05		;[Note] 6
	db $6F		;[Volume] 15
	db $79		;[Instrument] 10
	db $C1		;[Wait] 2
	db $11		;[Note] 18
	db $C0		;[Wait] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $05		;[Note] 6
	db $C1		;[Wait] 2
	db $11		;[Note] 18
	db $C0		;[Wait] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $05		;[Note] 6
	db $C0		;[Wait..] 1
	db $A5, $07; slide-down
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $05		;[Note] 6
	db $C1		;[Wait] 2
	db $11		;[Note] 18
	db $C0		;[Wait] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $05		;[Note] 6
	db $C1		;[Wait] 2
	db $11		;[Note] 18
	db $C0		;[Wait] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $05		;[Note] 6
				;[Skip delay] 1
	db $05		;[Note] 6
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $05		;[Note] 6
	db $C1		;[Wait] 2
	db $11		;[Note] 18
	db $C0		;[Wait] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $05		;[Note] 6
	db $C1		;[Wait] 2
	db $11		;[Note] 18
	db $C0		;[Wait] 1
	db $11		;[Note] 18
				;[Skip delay] 1
	db $00		;[Note] 1
	db $C1		;[Wait] 2
	db $0A		;[Note] 11
	db $C0		;[Wait] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $00		;[Note] 1
	db $C0		;[Wait..] 1
	db $A5, $03; slide-down
				;[Skip delay] 1
	db $0C		;[Note] 13
	db $C1		;[Wait] 2
	db $00		;[Note] 1
				;[Skip delay] 2
	db $0C		;[Note] 13
	db $C0		;[Wait] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $00		;[Note] 1
	db $C1		;[Wait] 2
	db $0C		;[Note] 13
	db $C0		;[Wait] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $00		;[Note] 1
	db $C0		;[Wait..] 1
	db $A5, $03; slide-down
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $00		;[Note] 1
	db $C1		;[Wait] 2
	db $0A		;[Note] 11
	db $C0		;[Wait] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $00		;[Note] 1
	db $C1		;[Wait] 2
	db $0C		;[Note] 13
	db $C0		;[Wait] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $00		;[Note] 1
	db $C1		;[Wait] 2
	db $0C		;[Note] 13
	db $C0		;[Wait] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_24:
	db $2B		;[Note] 44
	db $6E		;[Volume] 14
	db $82		;[Instrument] 19
	db $C3		;[Wait] 4
	db $2D		;[Note] 46
	db $6D		;[Volume] 13
	db $C1		;[Wait] 2
	db $2E		;[Note] 47
	db $6B		;[Volume] 11
	db $C3		;[Wait] 4
	db $2B		;[Note] 44
	db $6C		;[Volume] 12
				;[Skip delay] 4
	db $32		;[Note] 51
	db $94, $01	; vibrato control
				;[Skip delay] 4
	db $A7, $65	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $06	;[CMD vibrato] rep
	db $C5		;[Wait] 6
	db $A5, $06; slide-down
	db $C0		;[Wait] 1
	db $AF, $02; slide-down rep
	db $C1		;[Wait] 2
	db $32		;[Note] 51
	db $AB, $04; macro offset
	db $C0		;[Wait] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $33		;[Note] 52
	db $C2		;[Wait] 3
	db $A7, $66	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $02	;[CMD vibrato] rep
	db $C1		;[Wait] 2
	db $30		;[Note] 49
				;[Skip delay] 2
	db $30		;[Note] 49
	db $C1		;[Wait..] 2
	db $A7, $65	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $0B	;[CMD vibrato] rep
	db $CA		;[Wait] 11
	db $A5, $03; slide-down
	db $C0		;[Wait] 1
	db $AF, $03; slide-down rep
	db $C2		;[Wait] 3
	db $33		;[Note] 52
	db $C1		;[Wait] 2
	db $35		;[Note] 54
				;[Skip delay] 2
	db $37		;[Note] 56
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_25:
	db $3C		;[Note] 61
	db $65		;[Volume] 5
	db $7C		;[Instrument] 13
	db $C0		;[Wait] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $30		;[Note] 49
	db $6F		;[Volume] 15
	db $7E		;[Instrument] 15
				;[Skip delay] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $30		;[Note] 49
	db $C1		;[Wait] 2
	db $32		;[Note] 51
	db $C0		;[Wait] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $32		;[Note] 51
	db $C1		;[Wait] 2
	db $33		;[Note] 52
	db $C0		;[Wait] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $33		;[Note] 52
	db $C1		;[Wait] 2
	db $37		;[Note] 56
	db $C0		;[Wait] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $37		;[Note] 56
	db $C1		;[Wait] 2
	db $BF		;[End-Of-Track]
.track_26:
	db $30		;[Note] 49
	db $66		;[Volume] 6
	db $7F		;[Instrument] 16
	db $C7		;[Wait] 8
	db $2B		;[Note] 44
				;[Skip delay] 8
	db $2D		;[Note] 46
				;[Skip delay] 8
	db $29		;[Note] 42
	db $C3		;[Wait] 4
	db $A5, $03; slide-down
	db $C0		;[Wait] 1
	db $AF, $03; slide-down rep
	db $C2		;[Wait] 3
	db $27		;[Note] 40
	db $C3		;[Wait] 4
	db $A4, $03; slide-up
	db $C0		;[Wait] 1
	db $AE, $03; slide-up rep
	db $C2		;[Wait] 3
	db $2B		;[Note] 44
	db $C7		;[Wait] 8
	db $2B		;[Note] 44
	db $7E		;[Instrument] 15
	db $C3		;[Wait] 4
	db $29		;[Note] 42
				;[Skip delay] 4
	db $27		;[Note] 40
				;[Skip delay] 4
	db $2B		;[Note] 44
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_27:
	db $DF		;[Wait] 32
	db $37		;[Note] 56
	db $6A		;[Volume] 10
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $A4, $01; slide-up
	db $C0		;[Wait] 1
	db $AE, $03; slide-up rep
	db $C2		;[Wait] 3
	db $3A		;[Note] 59
	db $C3		;[Wait] 4
	db $A7, $55	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $03	;[CMD vibrato] rep
	db $C2		;[Wait] 3
	db $27		;[Note] 40
	db $6F		;[Volume] 15
	db $7E		;[Instrument] 15
	db $C3		;[Wait] 4
	db $26		;[Note] 39
				;[Skip delay] 4
	db $24		;[Note] 37
				;[Skip delay] 4
	db $27		;[Note] 40
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_28:
	db $C1		;[Wait] 2
	db $39		;[Note] 58
	db $69		;[Volume] 9
	db $77		;[Instrument] 8
	db $C2		;[Wait] 3
	db $A7, $56	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $04	;[CMD vibrato] rep
	db $C3		;[Wait] 4
	db $A7, $55	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $A5, $03; slide-down
				;[Skip delay] 1
	db $AF, $02; slide-down rep
	db $C1		;[Wait] 2
	db $37		;[Note] 56
	db $C3		;[Wait] 4
	db $36		;[Note] 55
	db $C3		;[Wait..] 4
	db $A7, $36	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $01	;[CMD vibrato] rep
				;[Skip delay] 1
	db $A5, $05; slide-down
				;[Skip delay] 1
	db $AF, $01; slide-down rep
				;[Skip delay] 1
	db $3A		;[Note] 59
	db $C3		;[Wait] 4
	db $39		;[Note] 58
	db $C1		;[Wait] 2
	db $BF		;[End-Of-Track]
.track_29:
	db $02		;[Note] 3
	db $6F		;[Volume] 15
	db $79		;[Instrument] 10
	db $C1		;[Wait] 2
	db $0E		;[Note] 15
	db $C0		;[Wait] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $02		;[Note] 3
	db $C0		;[Wait..] 1
	db $A5, $0A; slide-down
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $02		;[Note] 3
	db $C0		;[Wait..] 1
	db $A5, $03; slide-down
				;[Skip delay] 1
	db $0E		;[Note] 15
	db $C1		;[Wait] 2
	db $02		;[Note] 3
				;[Skip delay] 2
	db $0E		;[Note] 15
	db $C0		;[Wait] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $02		;[Note] 3
				;[Skip delay] 1
	db $02		;[Note] 3
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $02		;[Note] 3
	db $C1		;[Wait] 2
	db $0E		;[Note] 15
	db $C0		;[Wait] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $15		;[Note] 22
				;[Skip delay] 1
	db $15		;[Note] 22
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $0C		;[Note] 13
				;[Skip delay] 1
	db $09		;[Note] 10
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_30:
	db $39		;[Note] 58
	db $6A		;[Volume] 10
	db $82		;[Instrument] 19
	db $C2		;[Wait] 3
	db $A7, $56	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $04	;[CMD vibrato] rep
	db $C3		;[Wait] 4
	db $A7, $55	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $A5, $03; slide-down
				;[Skip delay] 1
	db $AF, $02; slide-down rep
	db $C1		;[Wait] 2
	db $37		;[Note] 56
	db $C3		;[Wait] 4
	db $36		;[Note] 55
	db $C3		;[Wait..] 4
	db $A7, $36	;[CMD vibrato]
	db $C0		;[Wait] 1
	db $B1, $01	;[CMD vibrato] rep
				;[Skip delay] 1
	db $A5, $05; slide-down
				;[Skip delay] 1
	db $AF, $01; slide-down rep
				;[Skip delay] 1
	db $3A		;[Note] 59
	db $C3		;[Wait] 4
	db $39		;[Note] 58
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_31:
	db $26		;[Note] 39
	db $69		;[Volume] 9
	db $7E		;[Instrument] 15
	db $C1		;[Wait] 2
	db $32		;[Note] 51
	db $C0		;[Wait] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $26		;[Note] 39
	db $C1		;[Wait] 2
	db $32		;[Note] 51
	db $C0		;[Wait] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $26		;[Note] 39
	db $C1		;[Wait] 2
	db $32		;[Note] 51
	db $C0		;[Wait] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $26		;[Note] 39
	db $C1		;[Wait] 2
	db $32		;[Note] 51
	db $C0		;[Wait] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $26		;[Note] 39
	db $C1		;[Wait] 2
	db $32		;[Note] 51
	db $C0		;[Wait] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $26		;[Note] 39
	db $C1		;[Wait] 2
	db $32		;[Note] 51
	db $C0		;[Wait] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $2B		;[Note] 44
	db $6F		;[Volume] 15
	db $84		;[Instrument] 21
				;[Skip delay] 1
	db $2B		;[Note] 44
				;[Skip delay] 1
	db $28		;[Note] 41
				;[Skip delay] 1
	db $28		;[Note] 41
				;[Skip delay] 1
	db $26		;[Note] 39
				;[Skip delay] 1
	db $26		;[Note] 39
				;[Skip delay] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $1C		;[Note] 29
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_32:
	db $39		;[Note] 58
	db $6F		;[Volume] 15
	db $81		;[Instrument] 18
	db $C0		;[Wait] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $36		;[Note] 55
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $2D		;[Note] 46
				;[Skip delay] 1
	db $2B		;[Note] 44
				;[Skip delay] 1
	db $2A		;[Note] 43
				;[Skip delay] 1
	db $27		;[Note] 40
				;[Skip delay] 1
	db $26		;[Note] 39
				;[Skip delay] 1
	db $24		;[Note] 37
				;[Skip delay] 1
	db $22		;[Note] 35
				;[Skip delay] 1
	db $21		;[Note] 34
				;[Skip delay] 1
	db $2D		;[Note] 46
				;[Skip delay] 1
	db $2B		;[Note] 44
				;[Skip delay] 1
	db $2D		;[Note] 46
				;[Skip delay] 1
	db $2E		;[Note] 47
				;[Skip delay] 1
	db $30		;[Note] 49
				;[Skip delay] 1
	db $2E		;[Note] 47
				;[Skip delay] 1
	db $2D		;[Note] 46
				;[Skip delay] 1
	db $2A		;[Note] 43
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_33:
	db $42		;[Note] 67
	db $65		;[Volume] 5
	db $81		;[Instrument] 18
	db $C1		;[Wait] 2
	db $3F		;[Note] 64
				;[Skip delay] 2
	db $3E		;[Note] 63
				;[Skip delay] 2
	db $3C		;[Note] 61
				;[Skip delay] 2
	db $3E		;[Note] 63
				;[Skip delay] 2
	db $3C		;[Note] 61
				;[Skip delay] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $33		;[Note] 52
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $30		;[Note] 49
				;[Skip delay] 2
	db $39		;[Note] 58
				;[Skip delay] 2
	db $26		;[Note] 39
				;[Skip delay] 2
	db $18		;[Note] 25
				;[Skip delay] 2
	db $1A		;[Note] 27
				;[Skip delay] 2
	db $1A		;[Note] 27
				;[Skip delay] 2
	db $1A		;[Note] 27
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_34:
	db $2B		;[Note] 44
	db $6F		;[Volume] 15
	db $84		;[Instrument] 21
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $C5		;[Wait] 6
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
				;[Skip delay] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
				;[Skip delay] 2
	db $23		;[Note] 36
	db $84		;[Instrument] 21
				;[Skip delay] 2
	db $23		;[Note] 36
	db $C5		;[Wait] 6
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
				;[Skip delay] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
				;[Skip delay] 2
	db $23		;[Note] 36
	db $84		;[Instrument] 21
				;[Skip delay] 2
	db $23		;[Note] 36
	db $C5		;[Wait] 6
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
	db $C1		;[Wait] 2
	db $21		;[Note] 34
				;[Skip delay] 2
	db $21		;[Note] 34
	db $71		;[Instrument] 2
				;[Skip delay] 2
	db $1F		;[Note] 32
	db $70		;[Instrument] 1
				;[Skip delay] 2
	db $23		;[Note] 36
	db $84		;[Instrument] 21
				;[Skip delay] 2
	db $23		;[Note] 36
	db $C7		;[Wait] 8
	db $1C		;[Note] 29
	db $C1		;[Wait] 2
	db $1C		;[Note] 29
				;[Skip delay] 2
	db $1C		;[Note] 29
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_35:
	db $02		;[Note] 3
	db $6F		;[Volume] 15
	db $C1		;[Wait] 2
	db $02		;[Note] 3
	db $79		;[Instrument] 10
	db $C1		;[Wait..] 2
	db $A5, $03; slide-down
	db $C0		;[Wait] 1
	db $AF, $06; slide-down rep
				;[Skip delay] 1
	db $60		;[Note] 97
	db $C9		;[Wait] 10
	db $02		;[Note] 3
	db $C1		;[Wait] 2
	db $02		;[Note] 3
	db $C1		;[Wait..] 2
	db $A5, $03; slide-down
	db $C0		;[Wait] 1
	db $AF, $06; slide-down rep
				;[Skip delay] 1
	db $60		;[Note] 97
	db $C9		;[Wait] 10
	db $02		;[Note] 3
	db $C1		;[Wait] 2
	db $02		;[Note] 3
	db $C1		;[Wait..] 2
	db $A5, $03; slide-down
	db $C0		;[Wait] 1
	db $AF, $06; slide-down rep
				;[Skip delay] 1
	db $60		;[Note] 97
	db $D3		;[Wait] 20
	db $1A		;[Note] 27
	db $C1		;[Wait] 2
	db $1A		;[Note] 27
				;[Skip delay] 2
	db $02		;[Note] 3
	db $7D		;[Instrument] 14
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_36:
	db $3A		;[Note] 59
	db $6F		;[Volume] 15
	db $C0		;[Wait] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_37:
	db $02		;[Note] 3
	db $6F		;[Volume] 15
	db $79		;[Instrument] 10
	db $C1		;[Wait] 2
	db $02		;[Note] 3
	db $C1		;[Wait..] 2
	db $A5, $03; slide-down
	db $C0		;[Wait] 1
	db $AF, $06; slide-down rep
				;[Skip delay] 1
	db $60		;[Note] 97
	db $C9		;[Wait] 10
	db $02		;[Note] 3
	db $C1		;[Wait] 2
	db $02		;[Note] 3
	db $C1		;[Wait..] 2
	db $A5, $03; slide-down
	db $C0		;[Wait] 1
	db $AF, $06; slide-down rep
				;[Skip delay] 1
	db $60		;[Note] 97
	db $C9		;[Wait] 10
	db $02		;[Note] 3
	db $C1		;[Wait] 2
	db $02		;[Note] 3
	db $C1		;[Wait..] 2
	db $A5, $03; slide-down
	db $C0		;[Wait] 1
	db $AF, $06; slide-down rep
				;[Skip delay] 1
	db $60		;[Note] 97
	db $D3		;[Wait] 20
	db $1A		;[Note] 27
	db $C1		;[Wait] 2
	db $1A		;[Note] 27
				;[Skip delay] 2
	db $02		;[Note] 3
	db $7D		;[Instrument] 14
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_38:
	db $02		;[Note] 3
	db $6F		;[Volume] 15
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $A4, $22; slide-up
	db $C0		;[Wait] 1
	db $AE, $03; slide-up rep
	db $C2		;[Wait] 3
	db $0E		;[Note] 15
	db $C3		;[Wait] 4
	db $02		;[Note] 3
				;[Skip delay] 4
	db $02		;[Note] 3
	db $C2		;[Wait] 3
	db $A5, $20; slide-down
	db $C0		;[Wait] 1
	db $AF, $04; slide-down rep
	db $C3		;[Wait] 4
	db $02		;[Note] 3
	db $C7		;[Wait] 8
	db $02		;[Note] 3
	db $C3		;[Wait] 4
	db $A4, $22; slide-up
	db $C0		;[Wait] 1
	db $AE, $03; slide-up rep
	db $C2		;[Wait] 3
	db $0E		;[Note] 15
	db $C3		;[Wait] 4
	db $02		;[Note] 3
				;[Skip delay] 4
	db $02		;[Note] 3
	db $C2		;[Wait] 3
	db $A5, $20; slide-down
	db $C0		;[Wait] 1
	db $AF, $04; slide-down rep
	db $C3		;[Wait] 4
	db $02		;[Note] 3
	db $C5		;[Wait] 6
	db $0E		;[Note] 15
	db $C1		;[Wait] 2
	db $BF		;[End-Of-Track]
.track_39:
	db $2A		;[Note] 43
	db $6F		;[Volume] 15
	db $84		;[Instrument] 21
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $CD		;[Wait] 14
	db $2B		;[Note] 44
	db $C1		;[Wait] 2
	db $2B		;[Note] 44
	db $CD		;[Wait] 14
	db $2B		;[Note] 44
	db $C1		;[Wait] 2
	db $2B		;[Note] 44
	db $CD		;[Wait] 14
	db $0E		;[Note] 15
	db $C1		;[Wait] 2
	db $0E		;[Note] 15
	db $C7		;[Wait] 8
	db $1F		;[Note] 32
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
				;[Skip delay] 2
	db $1F		;[Note] 32
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_40:
	db $3A		;[Note] 59
	db $6A		;[Volume] 10
	db $7C		;[Instrument] 13
	db $C0		;[Wait] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3A		;[Note] 59
				;[Skip delay] 1
	db $39		;[Note] 58
				;[Skip delay] 1
	db $33		;[Note] 52
				;[Skip delay] 1
	db $32		;[Note] 51
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $3C		;[Note] 61
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $37		;[Note] 56
				;[Skip delay] 1
	db $35		;[Note] 54
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $43		;[Note] 68
				;[Skip delay] 1
	db $42		;[Note] 67
				;[Skip delay] 1
	db $3F		;[Note] 64
				;[Skip delay] 1
	db $3E		;[Note] 63
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_41:
	db $02		;[Note] 3
	db $6F		;[Volume] 15
	db $85		;[Instrument] 22
	db $C1		;[Wait] 2
	db $02		;[Note] 3
	db $C1		;[Wait..] 2
	db $A5, $03; slide-down
	db $C0		;[Wait] 1
	db $AF, $06; slide-down rep
				;[Skip delay] 1
	db $60		;[Note] 97
	db $C9		;[Wait] 10
	db $02		;[Note] 3
	db $C1		;[Wait] 2
	db $02		;[Note] 3
	db $C1		;[Wait..] 2
	db $A5, $03; slide-down
	db $C0		;[Wait] 1
	db $AF, $06; slide-down rep
				;[Skip delay] 1
	db $60		;[Note] 97
	db $C9		;[Wait] 10
	db $02		;[Note] 3
	db $C1		;[Wait] 2
	db $02		;[Note] 3
	db $C1		;[Wait..] 2
	db $A5, $03; slide-down
	db $C0		;[Wait] 1
	db $AF, $06; slide-down rep
				;[Skip delay] 1
	db $60		;[Note] 97
	db $D3		;[Wait] 20
	db $1A		;[Note] 27
	db $C1		;[Wait] 2
	db $1A		;[Note] 27
				;[Skip delay] 2
	db $02		;[Note] 3
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_42:
	db $C0		;[Wait] 1
	db $60		;[Note] 97
	db $C2		;[Wait] 3
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_43:
	db $C0		;[Wait] 1
	db $60		;[Note] 97
	db $C3		;[Wait] 4
	db $BF		;[End-Of-Track]
.track_44:
	db $BF		;[End-Of-Track]
; [ Song sub-track data ]
