; Compiled using tt_compile.exe V0.2.1 [30-03-2015]
; Copyright 2015 Richard Cornelisse

; Song: A N A L - M A U L               
; By:   Arr. John Hassink 2009-2013     

;	org $c000

; [ Song start data ]
	db $06				; Initial song speed.
	dw .waveform_start 		; Start of the waveform data.
	dw .instrument_start 		; Start of the instrument data.

; [ Song order pointer list ]
		dw .track_0,.track_1,.track_2,.track_3,.track_4,.track_5,.track_6,.track_7		; Sequence step 0 /pattern 0
		dw .track_8,.track_9,.track_10,.track_11,.track_12,.track_13,.track_14,.track_15		; Sequence step 1 /pattern 1
.restart:
		dw .track_16,.track_17,.track_18,.track_19,.track_20,.track_21,.track_22,.track_23		; Sequence step 2 /pattern 2
		dw .track_16,.track_24,.track_25,.track_26,.track_27,.track_28,.track_29,.track_30		; Sequence step 3 /pattern 3
		dw .track_16,.track_31,.track_32,.track_26,.track_20,.track_21,.track_33,.track_34		; Sequence step 4 /pattern 4
		dw .track_35,.track_36,.track_37,.track_26,.track_38,.track_39,.track_37,.track_40		; Sequence step 5 /pattern 5
		dw .track_16,.track_31,.track_41,.track_42,.track_20,.track_21,.track_41,.track_43		; Sequence step 6 /pattern 6
		dw .track_16,.track_44,.track_45,.track_46,.track_27,.track_28,.track_47,.track_48		; Sequence step 7 /pattern 7
		dw .track_16,.track_31,.track_49,.track_50,.track_51,.track_21,.track_52,.track_53		; Sequence step 8 /pattern 8
		dw .track_54,.track_55,.track_56,.track_57,.track_58,.track_59,.track_56,.track_60		; Sequence step 9 /pattern 9
		dw .track_61,.track_62,.track_63,.track_19,.track_64,.track_65,.track_66,.track_67		; Sequence step 10 /pattern 10
		dw .track_68,.track_69,.track_70,.track_26,.track_71,.track_72,.track_73,.track_74		; Sequence step 11 /pattern 11
		dw .track_75,.track_76,.track_77,.track_26,.track_78,.track_79,.track_80,.track_81		; Sequence step 12 /pattern 12
		dw .track_82,.track_83,.track_84,.track_26,.track_85,.track_86,.track_87,.track_88		; Sequence step 13 /pattern 13
		dw .track_16,.track_17,.track_18,.track_19,.track_20,.track_21,.track_22,.track_23		; Sequence step 14 /pattern 2
		dw .track_16,.track_24,.track_25,.track_26,.track_27,.track_28,.track_29,.track_30		; Sequence step 15 /pattern 3
		dw .track_16,.track_31,.track_32,.track_26,.track_20,.track_21,.track_33,.track_34		; Sequence step 16 /pattern 4
		dw .track_35,.track_36,.track_37,.track_26,.track_38,.track_39,.track_37,.track_40		; Sequence step 17 /pattern 5
		dw .track_16,.track_31,.track_41,.track_42,.track_20,.track_21,.track_41,.track_43		; Sequence step 18 /pattern 6
		dw .track_16,.track_44,.track_45,.track_46,.track_27,.track_28,.track_47,.track_48		; Sequence step 19 /pattern 7
		dw .track_16,.track_31,.track_49,.track_50,.track_51,.track_21,.track_52,.track_53		; Sequence step 20 /pattern 8
		dw .track_54,.track_55,.track_56,.track_57,.track_58,.track_59,.track_56,.track_60		; Sequence step 21 /pattern 9
		dw .track_61,.track_62,.track_63,.track_19,.track_64,.track_65,.track_66,.track_67		; Sequence step 22 /pattern 10
		dw .track_68,.track_69,.track_70,.track_26,.track_71,.track_72,.track_73,.track_74		; Sequence step 23 /pattern 11
		dw .track_75,.track_76,.track_77,.track_129,.track_78,.track_79,.track_80,.track_81		; Sequence step 24 /pattern 20
		dw .track_82,.track_83,.track_89,.track_90,.track_85,.track_86,.track_91,.track_92		; Sequence step 25 /pattern 14
		dw .track_93,.track_94,.track_95,.track_96,.track_97,.track_21,.track_95,.track_98		; Sequence step 26 /pattern 15
		dw .track_99,.track_100,.track_101,.track_102,.track_103,.track_28,.track_104,.track_105		; Sequence step 27 /pattern 16
		dw .track_106,.track_107,.track_108,.track_109,.track_110,.track_111,.track_112,.track_113		; Sequence step 28 /pattern 17
		dw .track_114,.track_115,.track_116,.track_117,.track_118,.track_119,.track_120,.track_121		; Sequence step 29 /pattern 18
		dw .track_122,.track_123,.track_124,.track_125,.track_126,.track_127,.track_128,.track_128		; Sequence step 30 /pattern 19
		dw 0x0000, .restart			; End of sequence delimiter + restart address.

.waveform_start:
	db $00,$70,$50,$20,$50,$70,$30,$00,$50,$7F,$60,$10,$30,$40,$00,$B0,$10,$60,$00,$E0,$F0,$00,$B0,$90,$C0,$10,$E0,$A0,$C0,$F0,$C0,$A0	; Waveform 0
	db $30,$50,$50,$30,$00,$00,$10,$40,$60,$70,$60,$30,$F0,$E0,$E0,$00,$20,$20,$10,$C0,$A0,$90,$A0,$C0,$00,$00,$D0,$B0,$B0,$D0,$00,$00	; Waveform 1
	db $00,$20,$30,$40,$50,$58,$60,$68,$70,$68,$60,$58,$50,$40,$30,$20,$00,$E0,$D0,$C0,$B0,$A0,$98,$90,$88,$90,$98,$A0,$B0,$C0,$D0,$E0	; Waveform 2
	db $00,$19,$31,$47,$5A,$6A,$75,$7D,$7F,$7D,$75,$6A,$5A,$47,$31,$19,$00,$E0,$C0,$A0,$80,$A0,$C0,$E0,$00,$20,$40,$60,$7F,$60,$40,$20	; Waveform 3
	db $00,$4E,$62,$6D,$75,$7A,$7D,$7E,$7F,$7E,$7D,$7A,$75,$6D,$62,$4E,$00,$B1,$9D,$92,$8A,$85,$82,$81,$80,$81,$82,$85,$8A,$92,$9D,$B1	; Waveform 4
	db $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$7F	; Waveform 5
	db $80,$C8,$20,$7F,$30,$C8,$80,$90,$A8,$C0,$E0,$00,$20,$38,$50,$60,$70,$78,$7C,$7F,$7C,$78,$70,$60,$50,$38,$20,$00,$E0,$C0,$A8,$90	; Waveform 6
	db $80,$88,$90,$98,$A0,$B0,$B0,$B8,$C0,$C8,$D0,$D8,$E0,$E8,$F0,$F8,$00,$08,$10,$18,$20,$28,$30,$38,$40,$48,$50,$58,$60,$68,$70,$78	; Waveform 7
	db $00,$68,$48,$18,$48,$68,$28,$00,$48,$77,$58,$08,$28,$38,$00,$B8,$08,$58,$00,$E8,$F8,$00,$B8,$98,$C8,$08,$E8,$A8,$C8,$F8,$C8,$A8	; Waveform 8
	db $A0,$90,$90,$A0,$A0,$B0,$B0,$B0,$C0,$C0,$D0,$D0,$E0,$E0,$F0,$F0,$00,$00,$10,$10,$20,$20,$30,$30,$40,$40,$50,$50,$60,$60,$60,$50	; Waveform 9
	db $00,$F8,$F0,$E8,$E0,$D8,$D0,$C8,$C0,$B8,$B0,$A8,$A0,$98,$90,$88,$80,$7F,$70,$68,$60,$58,$50,$48,$40,$38,$30,$28,$20,$18,$10,$08	; Waveform 10
	db $00,$00,$00,$00,$00,$40,$40,$00,$00,$B0,$B0,$B0,$00,$00,$00,$00,$40,$40,$40,$00,$B0,$B0,$00,$00,$00,$00,$40,$40,$00,$00,$B0,$B0	; Waveform 11
	db $00,$20,$30,$40,$50,$58,$60,$68,$70,$68,$60,$58,$50,$40,$30,$20,$00,$E0,$D0,$C0,$B0,$A0,$98,$90,$88,$90,$98,$A0,$B0,$C0,$D0,$E0	; Waveform 12
	db $00,$7F,$00,$80,$A0,$C0,$D8,$F0,$08,$20,$30,$40,$50,$60,$70,$78,$7C,$7F,$7C,$78,$70,$60,$50,$40,$30,$20,$08,$F0,$D8,$C0,$A0,$80	; Waveform 13
	db $80,$B0,$C0,$10,$1A,$2A,$2C,$1A,$00,$E0,$D0,$E0,$22,$53,$70,$75,$70,$31,$EA,$80,$88,$8A,$8C,$8E,$00,$7F,$75,$73,$62,$00,$C0,$90	; Waveform 14
	db $80,$8E,$A0,$C0,$E0,$00,$20,$3F,$3E,$3C,$3A,$37,$31,$29,$20,$1C,$10,$00,$E6,$C0,$D0,$00,$20,$3F,$10,$E0,$80,$C0,$00,$20,$00,$90	; Waveform 15
	db $01,$2A,$40,$50,$5C,$68,$70,$78,$7F,$78,$70,$68,$5C,$50,$40,$2A,$FF,$D6,$C0,$B0,$A4,$98,$90,$88,$81,$88,$90,$98,$A4,$B0,$C0,$D6	; Waveform 16
	db $00,$40,$7F,$40,$01,$C0,$81,$C0,$01,$40,$7F,$40,$01,$C0,$01,$40,$01,$E0,$01,$20,$01,$F0,$01,$10,$01,$FF,$FF,$FF,$FF,$40,$40,$40	; Waveform 17
	db $00,$40,$7F,$40,$01,$10,$20,$2D,$37,$44,$4E,$59,$63,$6C,$73,$78,$7C,$7F,$7C,$78,$73,$6C,$59,$4E,$44,$37,$2D,$20,$10,$03,$02,$01	; Waveform 18
	db $00,$40,$7F,$40,$10,$01,$EA,$D6,$C3,$B9,$AF,$A4,$9C,$95,$8F,$8A,$86,$83,$81,$83,$86,$8A,$8F,$95,$9C,$A4,$AF,$B9,$C3,$D6,$EA,$FF	; Waveform 19
	db $00,$40,$7F,$40,$00,$C0,$FF,$C0,$05,$EB,$D6,$C3,$B9,$AF,$A4,$9C,$95,$8F,$89,$84,$81,$84,$89,$8F,$95,$9C,$A4,$AF,$B9,$C3,$D6,$EA	; Waveform 20
	db $00,$F0,$E0,$D0,$C0,$B0,$A0,$90,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$7F,$70,$60,$50,$40,$30,$20,$10	; Waveform 21
	db $00,$30,$50,$60,$70,$60,$50,$30,$00,$D0,$B0,$A0,$90,$A0,$B0,$D0,$00,$40,$60,$70,$60,$40,$00,$C0,$A0,$90,$A0,$C0,$00,$70,$00,$90	; Waveform 22
	db $30,$50,$50,$30,$00,$00,$10,$40,$60,$70,$60,$30,$F0,$E0,$E0,$00,$20,$20,$10,$C0,$A0,$90,$A0,$C0,$00,$00,$D0,$B0,$B0,$D0,$00,$00	; Waveform 23
	db $A0,$90,$90,$A0,$A0,$B0,$B0,$B0,$C0,$C0,$D0,$D0,$E0,$E0,$F0,$F0,$00,$00,$10,$10,$20,$20,$30,$30,$40,$40,$50,$50,$60,$60,$60,$50	; Waveform 24
	db $00,$7F,$00,$80,$A0,$C0,$D8,$F0,$08,$20,$30,$40,$50,$60,$70,$78,$7C,$7F,$7C,$78,$70,$60,$50,$40,$30,$20,$08,$F0,$D8,$C0,$A0,$80	; Waveform 25
	db $7F,$80,$7F,$80,$7F,$80,$7F,$80,$7F,$80,$7F,$80,$7F,$80,$7F,$80,$7F,$80,$7F,$80,$7F,$80,$7F,$80,$7F,$80,$7F,$80,$7F,$80,$7F,$80	; Waveform 26
	db $7F,$80,$7F,$80,$7F,$80,$7F,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$7F,$80,$7F,$80,$7F,$80,$7F,$80	; Waveform 27
	db $00,$70,$50,$20,$50,$70,$30,$00,$50,$7F,$60,$10,$30,$40,$00,$B0,$10,$60,$00,$E0,$F0,$00,$B0,$90,$C0,$10,$E0,$A0,$C0,$F0,$C0,$A0	; Waveform 28
	db $80,$88,$90,$98,$A0,$B0,$B0,$B8,$C0,$C8,$D0,$D8,$E0,$E8,$F0,$F8,$00,$08,$10,$18,$20,$28,$30,$38,$40,$48,$50,$58,$60,$68,$70,$78	; Waveform 29
	db $00,$00,$00,$00,$00,$78,$78,$00,$00,$80,$80,$80,$00,$00,$00,$00,$78,$78,$78,$00,$80,$80,$00,$00,$00,$00,$78,$78,$00,$00,$80,$80	; Waveform 30
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00	; Waveform 31

.instrument_start:
	dw .ins_1,.ins_2,.ins_3,.ins_4,.ins_5,.ins_6,.ins_7,.ins_8,.ins_9,.ins_10,.ins_11,.ins_12,.ins_13,.ins_14,.ins_15,.ins_16,.ins_17,.ins_18,.ins_19,.ins_20,.ins_21,.ins_22,.ins_23,.ins_24,.ins_25,.ins_26,.ins_27,.ins_28,.ins_29,.ins_30,.ins_31
.ins_1:						; Violin          
		db 1					; Waveform
		db .rst_i1-(.ins_1 +2)		; Restart
		db $11,$0A
		db $11,$0A
		db $11,$0B
		db $11,$0B
		db $11,$0C
		db $11,$0C
		db $11,$0C
		db $11,$0A
		db $11,$09
.rst_i1:
		db $15,$08,$01,$00
		db $15,$08,$02,$00
		db $15,$07,$FE,$FF
		db $15,$07,$FF,$FF
		db $15,$07,$FF,$FF
		db $15,$07,$FE,$FF
		db $15,$07,$02,$00
		db $1D,$07,$01,$00
.ins_2:						; Guitar          
		db 2					; Waveform
		db .rst_i2-(.ins_2 +2)		; Restart
		db $11,$0C
		db $11,$0B
		db $11,$0C
		db $11,$0B
		db $11,$0B
		db $11,$0B
		db $11,$0B
		db $11,$0A
		db $11,$09
.rst_i2:
		db $11,$08
		db $11,$08
		db $19,$08
.ins_3:						; Piano           
.ins_4:						; Flute           
		db 4					; Waveform
		db .rst_i4-(.ins_4 +2)		; Restart
		db $11,$03
		db $11,$03
		db $11,$04
		db $11,$04
		db $11,$05
		db $11,$05
		db $11,$06
		db $11,$06
		db $11,$07
		db $11,$07
		db $11,$06
.rst_i4:
		db $15,$05,$01,$00
		db $15,$05,$02,$00
		db $15,$05,$FD,$FF
		db $15,$05,$FF,$FF
		db $15,$05,$FE,$FF
		db $1D,$05,$03,$00
.ins_5:						; Clarinet        
		db 5					; Waveform
		db .rst_i5-(.ins_5 +2)		; Restart
		db $11,$0D
		db $11,$0A
		db $11,$0C
		db $11,$0B
		db $11,$0B
		db $11,$0B
		db $11,$0B
		db $11,$0A
		db $11,$09
.rst_i5:
		db $11,$08
		db $11,$08
		db $15,$08,$01,$00
		db $15,$08,$02,$00
		db $15,$08,$FD,$FF
		db $15,$08,$FF,$FF
		db $15,$08,$FE,$FF
		db $1D,$08,$03,$00
.ins_6:						; Oboe            
		db 6					; Waveform
		db .rst_i6-(.ins_6 +2)		; Restart
		db $11,$0C
		db $11,$0A
		db $11,$0C
		db $11,$0B
		db $11,$0B
		db $11,$0B
		db $11,$0B
		db $11,$0A
		db $11,$09
.rst_i6:
		db $11,$08
		db $11,$08
		db $15,$07,$01,$00
		db $15,$07,$02,$00
		db $15,$07,$FD,$FF
		db $15,$07,$FF,$FF
		db $15,$07,$FE,$FF
		db $1D,$07,$03,$00
.ins_7:						; Trumpet         
.ins_8:						; Organ           
.ins_9:						; Horn            
.ins_10:						; Synth           
.ins_11:						; Harpsichord     
.ins_12:						; Vibraphone      
.ins_13:						; Synth Bass      
.ins_14:						; Acoustic Bass   
		db 14					; Waveform
		db .rst_i14-(.ins_14 +2)		; Restart
		db $11,$0C
		db $11,$0B
		db $11,$0C
		db $11,$0B
		db $11,$0B
		db $11,$0B
		db $11,$0B
		db $11,$0A
		db $11,$09
.rst_i14:
		db $15,$08,$01,$00
		db $15,$08,$02,$00
		db $15,$07,$FE,$FF
		db $15,$07,$FF,$FF
		db $15,$07,$FF,$FF
		db $15,$07,$FE,$FF
		db $15,$07,$02,$00
		db $1D,$07,$01,$00
.ins_15:						; Electric Guitar 
.ins_16:						; USER            
		db 14					; Waveform
		db .rst_i16-(.ins_16 +2)		; Restart
		db $15,$0F,$28,$01
		db $15,$0B,$D8,$FE
		db $11,$0C
		db $11,$0B
		db $11,$0B
		db $11,$0B
		db $11,$0B
		db $11,$0A
		db $11,$09
.rst_i16:
		db $15,$08,$01,$00
		db $15,$08,$02,$00
		db $15,$07,$FE,$FF
		db $15,$07,$FF,$FF
		db $15,$07,$FF,$FF
		db $15,$07,$FE,$FF
		db $15,$07,$02,$00
		db $1D,$07,$01,$00
.ins_17:						; Bass drum       
		db 31					; Waveform
		db .rst_i17-(.ins_17 +2)		; Restart
		db $15,$0F,$28,$01
.rst_i17:
		db $09,$00
.ins_18:						; Snare drum      
		db 31					; Waveform
		db .rst_i18-(.ins_18 +2)		; Restart
		db $91,$0F
		db $91,$0E
		db $81,$0E
		db $81,$0E
		db $81,$0C
		db $81,$0C
		db $81,$0C
.rst_i18:
		db $8B,$FF
.ins_19:						; Tom             
		db 31					; Waveform
		db .rst_i19-(.ins_19 +2)		; Restart
		db $15,$0F,$2F,$00
		db $15,$0E,$2F,$00
		db $15,$0D,$2F,$00
.rst_i19:
		db $1F,$FF,$2F,$00
.ins_20:						; Closed hi-hat   
		db 31					; Waveform
		db .rst_i20-(.ins_20 +2)		; Restart
		db $81,$0E
.rst_i20:
		db $09,$00
.ins_21:						; Cymbal          
		db 31					; Waveform
		db .rst_i21-(.ins_21 +2)		; Restart
		db $E1,$0E,$01
		db $E1,$0B,$01
		db $E1,$0B,$01
.rst_i21:
		db $8B,$FF
.ins_22:						; Open hi-hat     
		db 31					; Waveform
		db .rst_i22-(.ins_22 +2)		; Restart
		db $81,$0F
		db $81,$0D
.rst_i22:
		db $8B,$FF
.ins_23:						;                 
.ins_24:						;                 
.ins_25:						;                 
.ins_26:						;                 
.ins_27:						;                 
.ins_28:						;                 
.ins_29:						;                 
.ins_30:						;                 
.ins_31:						;                 
		db 0					; Waveform
		db .rst_i31-(.ins_31 +2)		; Restart
.rst_i31:
		db $09,$00

; [ Song track data ]
.track_0:
	db $34		;[Note] 53
	db $6F		;[Volume] 15
	db $84		;[Instrument] 21
	db $CF		;[Wait] 16
	db $26		;[Note] 39
	db $82		;[Instrument] 19
	db $C2		;[Wait] 3
	db $26		;[Note] 39
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $22		;[Note] 35
	db $6F		;[Volume] 15
				;[Skip delay] 3
	db $22		;[Note] 35
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $1E		;[Note] 31
	db $6F		;[Volume] 15
				;[Skip delay] 3
	db $1E		;[Note] 31
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $84		;[Instrument] 21
	db $CF		;[Wait] 16
	db $2A		;[Note] 43
	db $82		;[Instrument] 19
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $2A		;[Note] 43
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $26		;[Note] 39
	db $6F		;[Volume] 15
	db $C2		;[Wait] 3
	db $26		;[Note] 39
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $26		;[Note] 39
	db $6F		;[Volume] 15
	db $C1		;[Wait] 2
	db $22		;[Note] 35
	db $C2		;[Wait] 3
	db $22		;[Note] 35
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_1:
	db $17		;[Note] 24
	db $6E		;[Volume] 14
	db $7D		;[Instrument] 14
	db $CE		;[Wait] 15
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $17		;[Note] 24
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $17		;[Note] 24
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $83		;[Instrument] 20
				;[Skip delay] 2
	db $23		;[Note] 36
				;[Skip delay] 2
	db $17		;[Note] 24
	db $7D		;[Instrument] 14
				;[Skip delay] 2
	db $23		;[Note] 36
	db $83		;[Instrument] 20
				;[Skip delay] 2
	db $19		;[Note] 26
	db $7D		;[Instrument] 14
	db $CD		;[Wait] 14
	db $60		;[Note] 97
	db $C1		;[Wait] 2
	db $19		;[Note] 26
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $1A		;[Note] 27
	db $C1		;[Wait] 2
	db $26		;[Note] 39
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $1C		;[Note] 29
	db $7D		;[Instrument] 14
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_2:
	db $60		;[Note] 97
	db $6F		;[Volume] 15
	db $70		;[Instrument] 1
	db $9E, $00	; short arp
	db $C2		;[Wait] 3
	db $2F		;[Note] 48
	db $67		;[Volume] 7
	db $71		;[Instrument] 2
	db $95, $03	; track detune
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $26		;[Note] 39
				;[Skip delay] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $28		;[Note] 41
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $39		;[Note] 58
				;[Skip delay] 2
	db $37		;[Note] 56
				;[Skip delay] 2
	db $32		;[Note] 51
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_3:
	db $1E		;[Note] 31
	db $6F		;[Volume] 15
	db $74		;[Instrument] 5
	db $CF		;[Wait] 16
	db $1E		;[Note] 31
	db $C5		;[Wait] 6
	db $21		;[Note] 34
				;[Skip delay] 6
	db $23		;[Note] 36
	db $C3		;[Wait] 4
	db $21		;[Note] 34
	db $CF		;[Wait] 16
	db $25		;[Note] 38
	db $C5		;[Wait] 6
	db $21		;[Note] 34
				;[Skip delay] 6
	db $25		;[Note] 38
	db $C3		;[Wait] 4
	db $BF		;[End-Of-Track]
.track_4:
	db $2F		;[Note] 48
	db $6D		;[Volume] 13
	db $71		;[Instrument] 2
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $26		;[Note] 39
				;[Skip delay] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $28		;[Note] 41
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $39		;[Note] 58
				;[Skip delay] 2
	db $37		;[Note] 56
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_5:
	db $0B		;[Note] 12
	db $6E		;[Volume] 14
	db $7D		;[Instrument] 14
	db $CE		;[Wait] 15
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $0B		;[Note] 12
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $0B		;[Note] 12
	db $C3		;[Wait] 4
	db $60		;[Note] 97
	db $C1		;[Wait] 2
	db $0B		;[Note] 12
	db $C2		;[Wait] 3
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $0D		;[Note] 14
	db $CD		;[Wait] 14
	db $60		;[Note] 97
	db $C1		;[Wait] 2
	db $0D		;[Note] 14
	db $C3		;[Wait] 4
	db $60		;[Note] 97
	db $C1		;[Wait] 2
	db $0E		;[Note] 15
	db $C3		;[Wait] 4
	db $60		;[Note] 97
	db $C1		;[Wait] 2
	db $10		;[Note] 17
	db $C3		;[Wait] 4
	db $BF		;[End-Of-Track]
.track_6:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $74		;[Instrument] 5
	db $CF		;[Wait] 16
	db $23		;[Note] 36
	db $C5		;[Wait] 6
	db $25		;[Note] 38
				;[Skip delay] 6
	db $26		;[Note] 39
	db $C3		;[Wait] 4
	db $25		;[Note] 38
	db $CF		;[Wait] 16
	db $28		;[Note] 41
	db $C5		;[Wait] 6
	db $25		;[Note] 38
				;[Skip delay] 6
	db $28		;[Note] 41
	db $C3		;[Wait] 4
	db $BF		;[End-Of-Track]
.track_7:
	db $66		;[Volume] 6
	db $74		;[Instrument] 5
	db $95, $03	; track detune
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $CF		;[Wait] 16
	db $23		;[Note] 36
	db $C5		;[Wait] 6
	db $25		;[Note] 38
				;[Skip delay] 6
	db $26		;[Note] 39
	db $C3		;[Wait] 4
	db $25		;[Note] 38
	db $CF		;[Wait] 16
	db $28		;[Note] 41
	db $C5		;[Wait] 6
	db $25		;[Note] 38
				;[Skip delay] 6
	db $28		;[Note] 41
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_8:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $84		;[Instrument] 21
	db $C7		;[Wait] 8
	db $23		;[Note] 36
				;[Skip delay] 8
	db $23		;[Note] 36
				;[Skip delay] 8
	db $23		;[Note] 36
				;[Skip delay] 8
	db $23		;[Note] 36
	db $C5		;[Wait] 6
	db $23		;[Note] 36
				;[Skip delay] 6
	db $23		;[Note] 36
				;[Skip delay] 6
	db $23		;[Note] 36
				;[Skip delay] 6
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $84		;[Instrument] 21
	db $C3		;[Wait] 4
	db $BF		;[End-Of-Track]
.track_9:
	db $1E		;[Note] 31
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C1		;[Wait] 2
	db $1E		;[Note] 31
				;[Skip delay] 2
	db $1C		;[Note] 29
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $1C		;[Note] 29
	db $7D		;[Instrument] 14
	db $C1		;[Wait] 2
	db $1C		;[Note] 29
				;[Skip delay] 2
	db $1A		;[Note] 27
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $1A		;[Note] 27
	db $7D		;[Instrument] 14
	db $C1		;[Wait] 2
	db $1A		;[Note] 27
				;[Skip delay] 2
	db $19		;[Note] 26
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $19		;[Note] 26
	db $7D		;[Instrument] 14
	db $C1		;[Wait] 2
	db $19		;[Note] 26
				;[Skip delay] 2
	db $1F		;[Note] 32
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $1F		;[Note] 32
	db $7D		;[Instrument] 14
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
				;[Skip delay] 2
	db $1C		;[Note] 29
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $1C		;[Note] 29
	db $7D		;[Instrument] 14
	db $C1		;[Wait] 2
	db $1C		;[Note] 29
				;[Skip delay] 2
	db $21		;[Note] 34
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $21		;[Note] 34
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $7D		;[Instrument] 14
				;[Skip delay] 2
	db $25		;[Note] 38
	db $C3		;[Wait] 4
	db $25		;[Note] 38
	db $C1		;[Wait] 2
	db $25		;[Note] 38
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_10:
	db $C0		;[Wait] 1
	db $34		;[Note] 53
	db $C1		;[Wait] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $39		;[Note] 58
				;[Skip delay] 2
	db $37		;[Note] 56
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $37		;[Note] 56
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $37		;[Note] 56
				;[Skip delay] 2
	db $3B		;[Note] 60
				;[Skip delay] 2
	db $39		;[Note] 58
				;[Skip delay] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $39		;[Note] 58
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_11:
	db $25		;[Note] 38
	db $C1		;[Wait] 2
	db $60		;[Note] 97
	db $C3		;[Wait] 4
	db $21		;[Note] 34
	db $C1		;[Wait] 2
	db $25		;[Note] 38
	db $CF		;[Wait] 16
	db $25		;[Note] 38
	db $C2		;[Wait] 3
	db $25		;[Note] 38
				;[Skip delay] 3
	db $25		;[Note] 38
	db $C1		;[Wait] 2
	db $26		;[Note] 39
	db $CF		;[Wait] 16
	db $2A		;[Note] 43
	db $C7		;[Wait] 8
	db $2D		;[Note] 46
	db $C6		;[Wait] 7
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_12:
	db $36		;[Note] 55
	db $C1		;[Wait] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $36		;[Note] 55
				;[Skip delay] 2
	db $39		;[Note] 58
				;[Skip delay] 2
	db $37		;[Note] 56
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $37		;[Note] 56
				;[Skip delay] 2
	db $32		;[Note] 51
				;[Skip delay] 2
	db $37		;[Note] 56
				;[Skip delay] 2
	db $3B		;[Note] 60
				;[Skip delay] 2
	db $39		;[Note] 58
				;[Skip delay] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $31		;[Note] 50
				;[Skip delay] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $39		;[Note] 58
				;[Skip delay] 2
	db $3D		;[Note] 62
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_13:
	db $12		;[Note] 19
	db $C3		;[Wait] 4
	db $12		;[Note] 19
	db $C1		;[Wait] 2
	db $12		;[Note] 19
				;[Skip delay] 2
	db $10		;[Note] 17
	db $C3		;[Wait] 4
	db $10		;[Note] 17
	db $C1		;[Wait] 2
	db $10		;[Note] 17
				;[Skip delay] 2
	db $0E		;[Note] 15
	db $C3		;[Wait] 4
	db $0E		;[Note] 15
	db $C1		;[Wait] 2
	db $0E		;[Note] 15
				;[Skip delay] 2
	db $0D		;[Note] 14
	db $C3		;[Wait] 4
	db $0D		;[Note] 14
	db $C1		;[Wait] 2
	db $0D		;[Note] 14
				;[Skip delay] 2
	db $13		;[Note] 20
	db $C3		;[Wait] 4
	db $13		;[Note] 20
	db $C1		;[Wait] 2
	db $13		;[Note] 20
				;[Skip delay] 2
	db $10		;[Note] 17
	db $C3		;[Wait] 4
	db $10		;[Note] 17
	db $C1		;[Wait] 2
	db $10		;[Note] 17
				;[Skip delay] 2
	db $15		;[Note] 22
	db $C3		;[Wait] 4
	db $15		;[Note] 22
	db $C1		;[Wait] 2
	db $15		;[Note] 22
				;[Skip delay] 2
	db $19		;[Note] 26
	db $C3		;[Wait] 4
	db $19		;[Note] 26
	db $C1		;[Wait] 2
	db $19		;[Note] 26
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_14:
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $60		;[Note] 97
	db $C3		;[Wait] 4
	db $25		;[Note] 38
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $CF		;[Wait] 16
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $28		;[Note] 41
				;[Skip delay] 3
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $2B		;[Note] 44
	db $CF		;[Wait] 16
	db $2D		;[Note] 46
	db $C7		;[Wait] 8
	db $31		;[Note] 50
				;[Skip delay] 8
	db $BF		;[End-Of-Track]
.track_15:
	db $C2		;[Wait] 3
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $60		;[Note] 97
	db $C3		;[Wait] 4
	db $25		;[Note] 38
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $CF		;[Wait] 16
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $28		;[Note] 41
				;[Skip delay] 3
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $2B		;[Note] 44
	db $CF		;[Wait] 16
	db $2D		;[Note] 46
	db $C7		;[Wait] 8
	db $31		;[Note] 50
	db $C4		;[Wait] 5
	db $BF		;[End-Of-Track]
.track_16:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C1		;[Wait] 2
	db $23		;[Note] 36
				;[Skip delay] 2
	db $23		;[Note] 36
	db $C3		;[Wait] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C4		;[Wait] 5
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C1		;[Wait] 2
	db $23		;[Note] 36
				;[Skip delay] 2
	db $23		;[Note] 36
	db $C3		;[Wait] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C4		;[Wait] 5
	db $BF		;[End-Of-Track]
.track_17:
	db $17		;[Note] 24
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $17		;[Note] 24
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $C3		;[Wait] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $21		;[Note] 34
	db $7D		;[Instrument] 14
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $80		;[Instrument] 17
				;[Skip delay] 2
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $23		;[Note] 36
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $15		;[Note] 22
	db $C5		;[Wait] 6
	db $15		;[Note] 22
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $C3		;[Wait] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $1F		;[Note] 32
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $80		;[Instrument] 17
				;[Skip delay] 2
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_18:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $70		;[Instrument] 1
	db $9E, $00	; short arp
	db $CB		;[Wait] 12
	db $2D		;[Note] 46
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2F		;[Note] 48
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2D		;[Note] 46
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $60		;[Note] 97
				;[Skip delay] 3
	db $28		;[Note] 41
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $D7		;[Wait] 24
	db $BF		;[End-Of-Track]
.track_19:
	db $60		;[Note] 97
	db $FE		;[Wait] 63
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_20:
	db $2F		;[Note] 48
	db $6D		;[Volume] 13
	db $73		;[Instrument] 4
	db $CD		;[Wait] 14
	db $60		;[Note] 97
	db $C1		;[Wait] 2
	db $2F		;[Note] 48
	db $C5		;[Wait] 6
	db $3B		;[Note] 60
				;[Skip delay] 6
	db $36		;[Note] 55
	db $C3		;[Wait] 4
	db $39		;[Note] 58
	db $CF		;[Wait] 16
	db $34		;[Note] 53
				;[Skip delay] 16
	db $BF		;[End-Of-Track]
.track_21:
	db $0B		;[Note] 12
	db $C5		;[Wait] 6
	db $0B		;[Note] 12
	db $C1		;[Wait] 2
	db $17		;[Note] 24
	db $C3		;[Wait] 4
	db $0B		;[Note] 12
				;[Skip delay] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $12		;[Note] 19
				;[Skip delay] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $09		;[Note] 10
	db $C5		;[Wait] 6
	db $09		;[Note] 10
	db $C1		;[Wait] 2
	db $15		;[Note] 22
	db $C3		;[Wait] 4
	db $09		;[Note] 10
				;[Skip delay] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $13		;[Note] 20
				;[Skip delay] 4
	db $12		;[Note] 19
				;[Skip delay] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_22:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $74		;[Instrument] 5
	db $CB		;[Wait] 12
	db $2D		;[Note] 46
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2F		;[Note] 48
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2D		;[Note] 46
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $60		;[Note] 97
				;[Skip delay] 3
	db $28		;[Note] 41
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $D7		;[Wait] 24
	db $BF		;[End-Of-Track]
.track_23:
	db $60		;[Note] 97
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $66		;[Volume] 6
	db $74		;[Instrument] 5
	db $95, $03	; track detune
	db $CB		;[Wait] 12
	db $2D		;[Note] 46
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2F		;[Note] 48
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2D		;[Note] 46
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $60		;[Note] 97
				;[Skip delay] 3
	db $28		;[Note] 41
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $D4		;[Wait] 21
	db $BF		;[End-Of-Track]
.track_24:
	db $13		;[Note] 20
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $13		;[Note] 20
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
	db $C3		;[Wait] 4
	db $13		;[Note] 20
				;[Skip delay] 4
	db $1F		;[Note] 32
				;[Skip delay] 4
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C1		;[Wait] 2
	db $1E		;[Note] 31
	db $80		;[Instrument] 17
				;[Skip delay] 2
	db $1C		;[Note] 29
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $1F		;[Note] 32
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $15		;[Note] 22
	db $C5		;[Wait] 6
	db $15		;[Note] 22
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $C3		;[Wait] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $23		;[Note] 36
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $80		;[Instrument] 17
				;[Skip delay] 2
	db $25		;[Note] 38
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_25:
	db $28		;[Note] 41
	db $CB		;[Wait] 12
	db $2A		;[Note] 43
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2B		;[Note] 44
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $25		;[Note] 38
	db $C3		;[Wait] 4
	db $26		;[Note] 39
	db $C7		;[Wait] 8
	db $28		;[Note] 41
				;[Skip delay] 8
	db $2A		;[Note] 43
				;[Skip delay] 8
	db $32		;[Note] 51
	db $6B		;[Volume] 11
	db $84		;[Instrument] 21
				;[Skip delay] 8
	db $BF		;[End-Of-Track]
.track_26:
	db $FE		;[Wait] 63
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_27:
	db $32		;[Note] 51
	db $CF		;[Wait] 16
	db $2F		;[Note] 48
				;[Skip delay] 16
	db $39		;[Note] 58
				;[Skip delay] 16
	db $34		;[Note] 53
				;[Skip delay] 16
	db $BF		;[End-Of-Track]
.track_28:
	db $07		;[Note] 8
	db $C5		;[Wait] 6
	db $07		;[Note] 8
	db $C1		;[Wait] 2
	db $13		;[Note] 20
	db $C3		;[Wait] 4
	db $07		;[Note] 8
				;[Skip delay] 4
	db $13		;[Note] 20
				;[Skip delay] 4
	db $12		;[Note] 19
				;[Skip delay] 4
	db $10		;[Note] 17
				;[Skip delay] 4
	db $13		;[Note] 20
				;[Skip delay] 4
	db $09		;[Note] 10
	db $C5		;[Wait] 6
	db $09		;[Note] 10
	db $C1		;[Wait] 2
	db $15		;[Note] 22
	db $C3		;[Wait] 4
	db $09		;[Note] 10
				;[Skip delay] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $19		;[Note] 26
				;[Skip delay] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_29:
	db $28		;[Note] 41
	db $CB		;[Wait] 12
	db $2A		;[Note] 43
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2B		;[Note] 44
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $25		;[Note] 38
	db $C3		;[Wait] 4
	db $26		;[Note] 39
	db $C7		;[Wait] 8
	db $28		;[Note] 41
				;[Skip delay] 8
	db $2A		;[Note] 43
	db $CF		;[Wait] 16
	db $BF		;[End-Of-Track]
.track_30:
	db $C2		;[Wait] 3
	db $28		;[Note] 41
	db $CB		;[Wait] 12
	db $2A		;[Note] 43
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2B		;[Note] 44
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $25		;[Note] 38
	db $C3		;[Wait] 4
	db $26		;[Note] 39
	db $C7		;[Wait] 8
	db $28		;[Note] 41
				;[Skip delay] 8
	db $2A		;[Note] 43
	db $CC		;[Wait] 13
	db $BF		;[End-Of-Track]
.track_31:
	db $17		;[Note] 24
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $17		;[Note] 24
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $C3		;[Wait] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $21		;[Note] 34
	db $7D		;[Instrument] 14
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $80		;[Instrument] 17
				;[Skip delay] 2
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $23		;[Note] 36
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $15		;[Note] 22
	db $C5		;[Wait] 6
	db $15		;[Note] 22
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $C3		;[Wait] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $1F		;[Note] 32
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
	db $80		;[Instrument] 17
				;[Skip delay] 2
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_32:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $70		;[Instrument] 1
	db $CB		;[Wait] 12
	db $2D		;[Note] 46
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2F		;[Note] 48
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2D		;[Note] 46
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $60		;[Note] 97
				;[Skip delay] 3
	db $28		;[Note] 41
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $D7		;[Wait] 24
	db $BF		;[End-Of-Track]
.track_33:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $CB		;[Wait] 12
	db $2D		;[Note] 46
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2F		;[Note] 48
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2D		;[Note] 46
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $60		;[Note] 97
				;[Skip delay] 3
	db $28		;[Note] 41
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $D7		;[Wait] 24
	db $BF		;[End-Of-Track]
.track_34:
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $66		;[Volume] 6
	db $CB		;[Wait] 12
	db $2D		;[Note] 46
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2F		;[Note] 48
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2D		;[Note] 46
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $60		;[Note] 97
				;[Skip delay] 3
	db $28		;[Note] 41
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $D4		;[Wait] 21
	db $BF		;[End-Of-Track]
.track_35:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C1		;[Wait] 2
	db $23		;[Note] 36
				;[Skip delay] 2
	db $23		;[Note] 36
	db $C3		;[Wait] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C4		;[Wait] 5
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C1		;[Wait] 2
	db $23		;[Note] 36
				;[Skip delay] 2
	db $2A		;[Note] 43
	db $82		;[Instrument] 19
				;[Skip delay] 2
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $29		;[Note] 42
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $26		;[Note] 39
	db $6F		;[Volume] 15
	db $C2		;[Wait] 3
	db $26		;[Note] 39
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $26		;[Note] 39
	db $6F		;[Volume] 15
	db $C1		;[Wait] 2
	db $22		;[Note] 35
	db $C2		;[Wait] 3
	db $22		;[Note] 35
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_36:
	db $13		;[Note] 20
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $13		;[Note] 20
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
	db $C3		;[Wait] 4
	db $13		;[Note] 20
				;[Skip delay] 4
	db $1F		;[Note] 32
				;[Skip delay] 4
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C1		;[Wait] 2
	db $1E		;[Note] 31
	db $80		;[Instrument] 17
				;[Skip delay] 2
	db $1C		;[Note] 29
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $1F		;[Note] 32
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $17		;[Note] 24
	db $C5		;[Wait] 6
	db $17		;[Note] 24
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $C3		;[Wait] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $25		;[Note] 38
				;[Skip delay] 4
	db $26		;[Note] 39
	db $7D		;[Instrument] 14
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_37:
	db $26		;[Note] 39
	db $CB		;[Wait] 12
	db $28		;[Note] 41
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2A		;[Note] 43
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $28		;[Note] 41
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $26		;[Note] 39
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $25		;[Note] 38
	db $C3		;[Wait] 4
	db $23		;[Note] 36
	db $DF		;[Wait] 32
	db $BF		;[End-Of-Track]
.track_38:
	db $32		;[Note] 51
	db $CB		;[Wait] 12
	db $34		;[Note] 53
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $36		;[Note] 55
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $34		;[Note] 53
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $32		;[Note] 51
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $31		;[Note] 50
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
	db $DF		;[Wait] 32
	db $BF		;[End-Of-Track]
.track_39:
	db $07		;[Note] 8
	db $C5		;[Wait] 6
	db $07		;[Note] 8
	db $C1		;[Wait] 2
	db $13		;[Note] 20
	db $C3		;[Wait] 4
	db $07		;[Note] 8
				;[Skip delay] 4
	db $13		;[Note] 20
				;[Skip delay] 4
	db $12		;[Note] 19
				;[Skip delay] 4
	db $10		;[Note] 17
				;[Skip delay] 4
	db $13		;[Note] 20
				;[Skip delay] 4
	db $0B		;[Note] 12
	db $C5		;[Wait] 6
	db $0B		;[Note] 12
	db $C1		;[Wait] 2
	db $17		;[Note] 24
	db $C3		;[Wait] 4
	db $0B		;[Note] 12
				;[Skip delay] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $19		;[Note] 26
				;[Skip delay] 4
	db $1A		;[Note] 27
				;[Skip delay] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_40:
	db $C2		;[Wait] 3
	db $26		;[Note] 39
	db $CB		;[Wait] 12
	db $28		;[Note] 41
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2A		;[Note] 43
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $28		;[Note] 41
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $26		;[Note] 39
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $25		;[Note] 38
	db $C3		;[Wait] 4
	db $23		;[Note] 36
	db $DC		;[Wait] 29
	db $BF		;[End-Of-Track]
.track_41:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $CA		;[Wait] 11
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2D		;[Note] 46
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2F		;[Note] 48
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2D		;[Note] 46
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $60		;[Note] 97
				;[Skip delay] 3
	db $28		;[Note] 41
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $D7		;[Wait] 24
	db $BF		;[End-Of-Track]
.track_42:
	db $60		;[Note] 97
	db $EB		;[Wait] 44
	db $23		;[Note] 36
	db $6E		;[Volume] 14
	db $75		;[Instrument] 6
	db $C1		;[Wait] 2
	db $26		;[Note] 39
				;[Skip delay] 2
	db $2D		;[Note] 46
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
				;[Skip delay] 4
	db $26		;[Note] 39
				;[Skip delay] 4
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_43:
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $66		;[Volume] 6
	db $CA		;[Wait] 11
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2D		;[Note] 46
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2F		;[Note] 48
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2D		;[Note] 46
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $60		;[Note] 97
				;[Skip delay] 3
	db $28		;[Note] 41
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $D4		;[Wait] 21
	db $BF		;[End-Of-Track]
.track_44:
	db $13		;[Note] 20
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $13		;[Note] 20
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
	db $C3		;[Wait] 4
	db $13		;[Note] 20
				;[Skip delay] 4
	db $1F		;[Note] 32
				;[Skip delay] 4
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C1		;[Wait] 2
	db $1E		;[Note] 31
	db $80		;[Instrument] 17
				;[Skip delay] 2
	db $1C		;[Note] 29
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $1F		;[Note] 32
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $15		;[Note] 22
	db $C5		;[Wait] 6
	db $15		;[Note] 22
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $C3		;[Wait] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $25		;[Note] 38
	db $7D		;[Instrument] 14
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_45:
	db $28		;[Note] 41
	db $CB		;[Wait] 12
	db $2A		;[Note] 43
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2B		;[Note] 44
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C5		;[Wait] 6
	db $25		;[Note] 38
	db $C3		;[Wait] 4
	db $26		;[Note] 39
	db $C7		;[Wait] 8
	db $28		;[Note] 41
				;[Skip delay] 8
	db $2A		;[Note] 43
				;[Skip delay] 8
	db $32		;[Note] 51
	db $6B		;[Volume] 11
	db $84		;[Instrument] 21
				;[Skip delay] 8
	db $BF		;[End-Of-Track]
.track_46:
	db $60		;[Note] 97
	db $DF		;[Wait] 32
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $74		;[Instrument] 5
	db $C7		;[Wait] 8
	db $25		;[Note] 38
				;[Skip delay] 8
	db $26		;[Note] 39
	db $CE		;[Wait] 15
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_47:
	db $28		;[Note] 41
	db $CB		;[Wait] 12
	db $2A		;[Note] 43
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2B		;[Note] 44
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C5		;[Wait] 6
	db $25		;[Note] 38
	db $C3		;[Wait] 4
	db $26		;[Note] 39
	db $C7		;[Wait] 8
	db $28		;[Note] 41
				;[Skip delay] 8
	db $2A		;[Note] 43
	db $CF		;[Wait] 16
	db $BF		;[End-Of-Track]
.track_48:
	db $C2		;[Wait] 3
	db $28		;[Note] 41
	db $CB		;[Wait] 12
	db $2A		;[Note] 43
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2B		;[Note] 44
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $28		;[Note] 41
	db $C5		;[Wait] 6
	db $25		;[Note] 38
	db $C3		;[Wait] 4
	db $26		;[Note] 39
	db $C7		;[Wait] 8
	db $28		;[Note] 41
				;[Skip delay] 8
	db $2A		;[Note] 43
	db $CC		;[Wait] 13
	db $BF		;[End-Of-Track]
.track_49:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $70		;[Instrument] 1
	db $CB		;[Wait] 12
	db $2D		;[Note] 46
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2F		;[Note] 48
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2D		;[Note] 46
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $31		;[Note] 50
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
	db $C2		;[Wait] 3
	db $60		;[Note] 97
				;[Skip delay] 3
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $D7		;[Wait] 24
	db $BF		;[End-Of-Track]
.track_50:
	db $60		;[Note] 97
	db $EF		;[Wait] 48
	db $23		;[Note] 36
	db $6E		;[Volume] 14
	db $75		;[Instrument] 6
	db $C1		;[Wait] 2
	db $26		;[Note] 39
				;[Skip delay] 2
	db $28		;[Note] 41
				;[Skip delay] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $2B		;[Note] 44
				;[Skip delay] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_51:
	db $2F		;[Note] 48
	db $6D		;[Volume] 13
	db $73		;[Instrument] 4
	db $D5		;[Wait] 22
	db $3B		;[Note] 60
	db $C5		;[Wait] 6
	db $36		;[Note] 55
	db $C3		;[Wait] 4
	db $39		;[Note] 58
	db $CF		;[Wait] 16
	db $3D		;[Note] 62
				;[Skip delay] 16
	db $BF		;[End-Of-Track]
.track_52:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $CB		;[Wait] 12
	db $2D		;[Note] 46
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2F		;[Note] 48
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2D		;[Note] 46
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $31		;[Note] 50
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
	db $C2		;[Wait] 3
	db $60		;[Note] 97
				;[Skip delay] 3
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $D7		;[Wait] 24
	db $BF		;[End-Of-Track]
.track_53:
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $66		;[Volume] 6
	db $CB		;[Wait] 12
	db $2D		;[Note] 46
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2F		;[Note] 48
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $2D		;[Note] 46
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $C4		;[Wait] 5
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $31		;[Note] 50
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
	db $C2		;[Wait] 3
	db $60		;[Note] 97
				;[Skip delay] 3
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
	db $D4		;[Wait] 21
	db $BF		;[End-Of-Track]
.track_54:
	db $2A		;[Note] 43
	db $6F		;[Volume] 15
	db $82		;[Instrument] 19
	db $C2		;[Wait] 3
	db $2A		;[Note] 43
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $22		;[Note] 35
	db $6F		;[Volume] 15
				;[Skip delay] 3
	db $22		;[Note] 35
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $39		;[Note] 58
	db $6F		;[Volume] 15
	db $84		;[Instrument] 21
	db $C3		;[Wait] 4
	db $26		;[Note] 39
	db $82		;[Instrument] 19
	db $C2		;[Wait] 3
	db $26		;[Note] 39
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $1E		;[Note] 31
	db $6F		;[Volume] 15
				;[Skip delay] 3
	db $1E		;[Note] 31
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $39		;[Note] 58
	db $6F		;[Volume] 15
	db $84		;[Instrument] 21
	db $C3		;[Wait] 4
	db $23		;[Note] 36
	db $83		;[Instrument] 20
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C1		;[Wait] 2
	db $23		;[Note] 36
				;[Skip delay] 2
	db $2A		;[Note] 43
	db $82		;[Instrument] 19
				;[Skip delay] 2
	db $2A		;[Note] 43
	db $C2		;[Wait] 3
	db $2A		;[Note] 43
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $6F		;[Volume] 15
	db $C2		;[Wait] 3
	db $2A		;[Note] 43
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $6F		;[Volume] 15
	db $C1		;[Wait] 2
	db $26		;[Note] 39
				;[Skip delay] 2
	db $22		;[Note] 35
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_55:
	db $13		;[Note] 20
	db $7D		;[Instrument] 14
	db $C5		;[Wait] 6
	db $13		;[Note] 20
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
	db $C3		;[Wait] 4
	db $13		;[Note] 20
				;[Skip delay] 4
	db $15		;[Note] 22
	db $C5		;[Wait] 6
	db $15		;[Note] 22
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $C3		;[Wait] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $17		;[Note] 24
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $17		;[Note] 24
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $C3		;[Wait] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $1E		;[Note] 31
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $1E		;[Note] 31
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_56:
	db $2B		;[Note] 44
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
				;[Skip delay] 6
	db $2B		;[Note] 44
	db $C3		;[Wait] 4
	db $2D		;[Note] 46
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
				;[Skip delay] 6
	db $31		;[Note] 50
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
	db $DF		;[Wait] 32
	db $BF		;[End-Of-Track]
.track_57:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $74		;[Instrument] 5
	db $C5		;[Wait] 6
	db $2A		;[Note] 43
				;[Skip delay] 6
	db $28		;[Note] 41
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
	db $C5		;[Wait] 6
	db $2A		;[Note] 43
				;[Skip delay] 6
	db $2D		;[Note] 46
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
	db $DE		;[Wait] 31
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_58:
	db $37		;[Note] 56
	db $C5		;[Wait] 6
	db $3B		;[Note] 60
				;[Skip delay] 6
	db $37		;[Note] 56
	db $C3		;[Wait] 4
	db $39		;[Note] 58
	db $C5		;[Wait] 6
	db $3B		;[Note] 60
				;[Skip delay] 6
	db $3D		;[Note] 62
	db $C3		;[Wait] 4
	db $3B		;[Note] 60
	db $DF		;[Wait] 32
	db $BF		;[End-Of-Track]
.track_59:
	db $07		;[Note] 8
	db $C5		;[Wait] 6
	db $07		;[Note] 8
	db $C1		;[Wait] 2
	db $13		;[Note] 20
	db $C3		;[Wait] 4
	db $07		;[Note] 8
				;[Skip delay] 4
	db $09		;[Note] 10
	db $C5		;[Wait] 6
	db $09		;[Note] 10
	db $C1		;[Wait] 2
	db $15		;[Note] 22
	db $C3		;[Wait] 4
	db $09		;[Note] 10
				;[Skip delay] 4
	db $0B		;[Note] 12
	db $C5		;[Wait] 6
	db $0B		;[Note] 12
	db $C1		;[Wait] 2
	db $17		;[Note] 24
	db $C3		;[Wait] 4
	db $0B		;[Note] 12
				;[Skip delay] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $12		;[Note] 19
				;[Skip delay] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $12		;[Note] 19
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_60:
	db $C2		;[Wait] 3
	db $2B		;[Note] 44
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
				;[Skip delay] 6
	db $2B		;[Note] 44
	db $C3		;[Wait] 4
	db $2D		;[Note] 46
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
				;[Skip delay] 6
	db $31		;[Note] 50
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
	db $DC		;[Wait] 29
	db $BF		;[End-Of-Track]
.track_61:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $C3		;[Wait] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C5		;[Wait] 6
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $CA		;[Wait] 11
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $CC		;[Wait] 13
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C6		;[Wait] 7
	db $BF		;[End-Of-Track]
.track_62:
	db $1E		;[Note] 31
	db $6F		;[Volume] 15
	db $7F		;[Instrument] 16
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
				;[Skip delay] 2
	db $60		;[Note] 97
				;[Skip delay] 2
	db $1F		;[Note] 32
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $1E		;[Note] 31
	db $7F		;[Instrument] 16
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
	db $7D		;[Instrument] 14
				;[Skip delay] 2
	db $60		;[Note] 97
	db $C5		;[Wait] 6
	db $1F		;[Note] 32
	db $80		;[Instrument] 17
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
	db $C5		;[Wait] 6
	db $21		;[Note] 34
	db $C3		;[Wait] 4
	db $21		;[Note] 34
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $23		;[Note] 36
	db $7D		;[Instrument] 14
				;[Skip delay] 6
	db $25		;[Note] 38
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $26		;[Note] 39
	db $C5		;[Wait] 6
	db $25		;[Note] 38
	db $7D		;[Instrument] 14
				;[Skip delay] 6
	db $21		;[Note] 34
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $BF		;[End-Of-Track]
.track_63:
	db $2B		;[Note] 44
	db $6F		;[Volume] 15
	db $70		;[Instrument] 1
	db $C5		;[Wait] 6
	db $3B		;[Note] 60
	db $6B		;[Volume] 11
	db $84		;[Instrument] 21
	db $C9		;[Wait] 10
	db $2B		;[Note] 44
	db $6F		;[Volume] 15
	db $70		;[Instrument] 1
	db $C5		;[Wait] 6
	db $2D		;[Note] 46
				;[Skip delay] 6
	db $2F		;[Note] 48
	db $C3		;[Wait] 4
	db $31		;[Note] 50
	db $C5		;[Wait] 6
	db $3B		;[Note] 60
	db $6B		;[Volume] 11
	db $84		;[Instrument] 21
	db $C9		;[Wait] 10
	db $2D		;[Note] 46
	db $6F		;[Volume] 15
	db $70		;[Instrument] 1
	db $C5		;[Wait] 6
	db $3B		;[Note] 60
	db $6B		;[Volume] 11
	db $84		;[Instrument] 21
	db $C9		;[Wait] 10
	db $BF		;[End-Of-Track]
.track_64:
	db $37		;[Note] 56
	db $6B		;[Volume] 11
	db $73		;[Instrument] 4
	db $CF		;[Wait] 16
	db $34		;[Note] 53
				;[Skip delay] 16
	db $39		;[Note] 58
				;[Skip delay] 16
	db $3D		;[Note] 62
				;[Skip delay] 16
	db $BF		;[End-Of-Track]
.track_65:
	db $12		;[Note] 19
	db $C1		;[Wait] 2
	db $13		;[Note] 20
				;[Skip delay] 2
	db $60		;[Note] 97
				;[Skip delay] 2
	db $13		;[Note] 20
	db $C3		;[Wait] 4
	db $12		;[Note] 19
	db $C1		;[Wait] 2
	db $13		;[Note] 20
				;[Skip delay] 2
	db $60		;[Note] 97
	db $D1		;[Wait] 18
	db $15		;[Note] 22
	db $C5		;[Wait] 6
	db $17		;[Note] 24
				;[Skip delay] 6
	db $19		;[Note] 26
	db $C3		;[Wait] 4
	db $1A		;[Note] 27
	db $C5		;[Wait] 6
	db $19		;[Note] 26
				;[Skip delay] 6
	db $15		;[Note] 22
	db $C3		;[Wait] 4
	db $BF		;[End-Of-Track]
.track_66:
	db $2B		;[Note] 44
	db $CF		;[Wait] 16
	db $2B		;[Note] 44
	db $C5		;[Wait] 6
	db $2D		;[Note] 46
				;[Skip delay] 6
	db $2F		;[Note] 48
	db $C3		;[Wait] 4
	db $31		;[Note] 50
	db $CF		;[Wait] 16
	db $2D		;[Note] 46
				;[Skip delay] 16
	db $BF		;[End-Of-Track]
.track_67:
	db $C2		;[Wait] 3
	db $2B		;[Note] 44
	db $CF		;[Wait] 16
	db $2B		;[Note] 44
	db $C5		;[Wait] 6
	db $2D		;[Note] 46
				;[Skip delay] 6
	db $2F		;[Note] 48
	db $C3		;[Wait] 4
	db $31		;[Note] 50
	db $CF		;[Wait] 16
	db $2D		;[Note] 46
	db $CC		;[Wait] 13
	db $BF		;[End-Of-Track]
.track_68:
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $C3		;[Wait] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C5		;[Wait] 6
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C4		;[Wait] 5
	db $26		;[Note] 39
	db $6F		;[Volume] 15
	db $82		;[Instrument] 19
	db $C2		;[Wait] 3
	db $26		;[Note] 39
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $1E		;[Note] 31
	db $6F		;[Volume] 15
				;[Skip delay] 3
	db $1E		;[Note] 31
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $22		;[Note] 35
	db $82		;[Instrument] 19
	db $C2		;[Wait] 3
	db $22		;[Note] 35
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $1E		;[Note] 31
	db $6F		;[Volume] 15
				;[Skip delay] 3
	db $1E		;[Note] 31
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $BF		;[End-Of-Track]
.track_69:
	db $1C		;[Note] 29
	db $6F		;[Volume] 15
	db $7F		;[Instrument] 16
	db $C1		;[Wait] 2
	db $1E		;[Note] 31
				;[Skip delay] 2
	db $60		;[Note] 97
				;[Skip delay] 2
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $1C		;[Note] 29
	db $7F		;[Instrument] 16
	db $C1		;[Wait] 2
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
				;[Skip delay] 2
	db $60		;[Note] 97
	db $C5		;[Wait] 6
	db $1F		;[Note] 32
	db $80		;[Instrument] 17
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
	db $C5		;[Wait] 6
	db $21		;[Note] 34
	db $C3		;[Wait] 4
	db $1F		;[Note] 32
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $1A		;[Note] 27
	db $7D		;[Instrument] 14
				;[Skip delay] 4
	db $1E		;[Note] 31
				;[Skip delay] 4
	db $1F		;[Note] 32
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $1E		;[Note] 31
				;[Skip delay] 4
	db $1A		;[Note] 27
	db $C1		;[Wait] 2
	db $7D		;[Instrument] 14
				;[Skip delay] 2
	db $1C		;[Note] 29
	db $C3		;[Wait] 4
	db $1E		;[Note] 31
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_70:
	db $2A		;[Note] 43
	db $6F		;[Volume] 15
	db $70		;[Instrument] 1
	db $CF		;[Wait] 16
	db $2A		;[Note] 43
	db $C5		;[Wait] 6
	db $2B		;[Note] 44
				;[Skip delay] 6
	db $2D		;[Note] 46
	db $C3		;[Wait] 4
	db $2B		;[Note] 44
	db $C7		;[Wait] 8
	db $3B		;[Note] 60
	db $84		;[Instrument] 21
				;[Skip delay] 8
	db $2A		;[Note] 43
				;[Skip delay] 8
	db $3B		;[Note] 60
				;[Skip delay] 8
	db $BF		;[End-Of-Track]
.track_71:
	db $36		;[Note] 55
	db $CF		;[Wait] 16
	db $32		;[Note] 51
				;[Skip delay] 16
	db $37		;[Note] 56
				;[Skip delay] 16
	db $36		;[Note] 55
				;[Skip delay] 16
	db $BF		;[End-Of-Track]
.track_72:
	db $10		;[Note] 17
	db $C1		;[Wait] 2
	db $12		;[Note] 19
				;[Skip delay] 2
	db $60		;[Note] 97
				;[Skip delay] 2
	db $12		;[Note] 19
	db $C3		;[Wait] 4
	db $10		;[Note] 17
	db $C1		;[Wait] 2
	db $12		;[Note] 19
				;[Skip delay] 2
	db $60		;[Note] 97
	db $D1		;[Wait] 18
	db $13		;[Note] 20
	db $C3		;[Wait] 4
	db $0E		;[Note] 15
				;[Skip delay] 4
	db $12		;[Note] 19
				;[Skip delay] 4
	db $13		;[Note] 20
				;[Skip delay] 4
	db $12		;[Note] 19
				;[Skip delay] 4
	db $0E		;[Note] 15
				;[Skip delay] 4
	db $10		;[Note] 17
				;[Skip delay] 4
	db $12		;[Note] 19
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_73:
	db $2A		;[Note] 43
	db $CF		;[Wait] 16
	db $2A		;[Note] 43
	db $C5		;[Wait] 6
	db $2B		;[Note] 44
				;[Skip delay] 6
	db $2D		;[Note] 46
	db $C3		;[Wait] 4
	db $2B		;[Note] 44
	db $CF		;[Wait] 16
	db $2A		;[Note] 43
				;[Skip delay] 16
	db $BF		;[End-Of-Track]
.track_74:
	db $C2		;[Wait] 3
	db $2A		;[Note] 43
	db $CF		;[Wait] 16
	db $2A		;[Note] 43
	db $C5		;[Wait] 6
	db $2B		;[Note] 44
				;[Skip delay] 6
	db $2D		;[Note] 46
	db $C3		;[Wait] 4
	db $2B		;[Note] 44
	db $CF		;[Wait] 16
	db $2A		;[Note] 43
	db $CC		;[Wait] 13
	db $BF		;[End-Of-Track]
.track_75:
	db $2F		;[Note] 48
	db $83		;[Instrument] 20
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
				;[Skip delay] 6
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C4		;[Wait] 5
	db $26		;[Note] 39
	db $6F		;[Volume] 15
	db $82		;[Instrument] 19
	db $C2		;[Wait] 3
	db $26		;[Note] 39
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $22		;[Note] 35
	db $6F		;[Volume] 15
	db $C2		;[Wait] 3
	db $22		;[Note] 35
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $1E		;[Note] 31
	db $6F		;[Volume] 15
	db $C2		;[Wait] 3
	db $1E		;[Note] 31
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
				;[Skip delay] 6
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C4		;[Wait] 5
	db $2F		;[Note] 48
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $23		;[Note] 36
	db $6F		;[Volume] 15
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $BF		;[End-Of-Track]
.track_76:
	db $1C		;[Note] 29
	db $7D		;[Instrument] 14
	db $C5		;[Wait] 6
	db $1C		;[Note] 29
	db $74		;[Instrument] 5
	db $C1		;[Wait] 2
	db $60		;[Note] 97
	db $C3		;[Wait] 4
	db $1C		;[Note] 29
	db $70		;[Instrument] 1
	db $C7		;[Wait] 8
	db $1A		;[Note] 27
	db $C3		;[Wait] 4
	db $19		;[Note] 26
				;[Skip delay] 4
	db $1C		;[Note] 29
				;[Skip delay] 4
	db $1D		;[Note] 30
	db $C5		;[Wait] 6
	db $1D		;[Note] 30
	db $C1		;[Wait] 2
	db $60		;[Note] 97
	db $C3		;[Wait] 4
	db $1D		;[Note] 30
	db $C7		;[Wait] 8
	db $1A		;[Note] 27
	db $7F		;[Instrument] 16
	db $C1		;[Wait] 2
	db $1A		;[Note] 27
	db $80		;[Instrument] 17
				;[Skip delay] 2
	db $19		;[Note] 26
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $1D		;[Note] 30
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_77:
	db $28		;[Note] 41
	db $70		;[Instrument] 1
	db $CB		;[Wait] 12
	db $3B		;[Note] 60
	db $6B		;[Volume] 11
	db $84		;[Instrument] 21
	db $C3		;[Wait] 4
	db $25		;[Note] 38
	db $6F		;[Volume] 15
	db $70		;[Instrument] 1
	db $C7		;[Wait] 8
	db $39		;[Note] 58
	db $84		;[Instrument] 21
				;[Skip delay] 8
	db $29		;[Note] 42
	db $70		;[Instrument] 1
	db $CB		;[Wait] 12
	db $39		;[Note] 58
	db $6B		;[Volume] 11
	db $84		;[Instrument] 21
	db $C3		;[Wait] 4
	db $25		;[Note] 38
	db $6F		;[Volume] 15
	db $70		;[Instrument] 1
	db $C7		;[Wait] 8
	db $39		;[Note] 58
	db $84		;[Instrument] 21
				;[Skip delay] 8
	db $BF		;[End-Of-Track]
.track_78:
	db $34		;[Note] 53
	db $D3		;[Wait] 20
	db $32		;[Note] 51
	db $C3		;[Wait] 4
	db $31		;[Note] 50
				;[Skip delay] 4
	db $2F		;[Note] 48
				;[Skip delay] 4
	db $35		;[Note] 54
	db $D3		;[Wait] 20
	db $31		;[Note] 50
	db $C3		;[Wait] 4
	db $30		;[Note] 49
				;[Skip delay] 4
	db $35		;[Note] 54
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_79:
	db $10		;[Note] 17
	db $C5		;[Wait] 6
	db $10		;[Note] 17
	db $C1		;[Wait] 2
	db $60		;[Note] 97
	db $C3		;[Wait] 4
	db $10		;[Note] 17
	db $C7		;[Wait] 8
	db $0E		;[Note] 15
	db $C3		;[Wait] 4
	db $0D		;[Note] 14
				;[Skip delay] 4
	db $10		;[Note] 17
				;[Skip delay] 4
	db $11		;[Note] 18
	db $C5		;[Wait] 6
	db $11		;[Note] 18
	db $C1		;[Wait] 2
	db $60		;[Note] 97
	db $C3		;[Wait] 4
	db $11		;[Note] 18
	db $C7		;[Wait] 8
	db $0E		;[Note] 15
	db $C3		;[Wait] 4
	db $0D		;[Note] 14
				;[Skip delay] 4
	db $11		;[Note] 18
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_80:
	db $28		;[Note] 41
	db $CF		;[Wait] 16
	db $25		;[Note] 38
				;[Skip delay] 16
	db $29		;[Note] 42
				;[Skip delay] 16
	db $25		;[Note] 38
				;[Skip delay] 16
	db $BF		;[End-Of-Track]
.track_81:
	db $C2		;[Wait] 3
	db $28		;[Note] 41
	db $CF		;[Wait] 16
	db $25		;[Note] 38
				;[Skip delay] 16
	db $29		;[Note] 42
				;[Skip delay] 16
	db $25		;[Note] 38
	db $CC		;[Wait] 13
	db $BF		;[End-Of-Track]
.track_82:
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C7		;[Wait] 8
	db $2F		;[Note] 48
				;[Skip delay] 8
	db $2F		;[Note] 48
				;[Skip delay] 8
	db $2F		;[Note] 48
				;[Skip delay] 8
	db $2F		;[Note] 48
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
	db $82		;[Instrument] 19
	db $C2		;[Wait] 3
	db $2A		;[Note] 43
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $22		;[Note] 35
	db $6F		;[Volume] 15
				;[Skip delay] 3
	db $22		;[Note] 35
	db $67		;[Volume] 7
				;[Skip delay] 3
	db $26		;[Note] 39
	db $6F		;[Volume] 15
	db $C1		;[Wait] 2
	db $26		;[Note] 39
	db $C2		;[Wait] 3
	db $26		;[Note] 39
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $1E		;[Note] 31
	db $6F		;[Volume] 15
	db $C1		;[Wait] 2
	db $2F		;[Note] 48
	db $83		;[Instrument] 20
				;[Skip delay] 2
	db $2F		;[Note] 48
				;[Skip delay] 2
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_83:
	db $1E		;[Note] 31
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $1E		;[Note] 31
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $1E		;[Note] 31
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $1E		;[Note] 31
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $1E		;[Note] 31
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $1E		;[Note] 31
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $1C		;[Note] 29
	db $7F		;[Instrument] 16
	db $C3		;[Wait] 4
	db $1C		;[Note] 29
	db $7D		;[Instrument] 14
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $1C		;[Note] 29
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $1A		;[Note] 27
	db $C3		;[Wait] 4
	db $1A		;[Note] 27
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $1A		;[Note] 27
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $19		;[Note] 26
	db $C1		;[Wait] 2
	db $19		;[Note] 26
	db $80		;[Instrument] 17
				;[Skip delay] 2
	db $19		;[Note] 26
	db $7D		;[Instrument] 14
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $19		;[Note] 26
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_84:
	db $2A		;[Note] 43
	db $70		;[Instrument] 1
	db $FB		;[Wait] 60
	db $3B		;[Note] 60
	db $6B		;[Volume] 11
	db $84		;[Instrument] 21
	db $C3		;[Wait] 4
	db $BF		;[End-Of-Track]
.track_85:
	db $36		;[Note] 55
	db $FF		;[Wait] 64
	db $BF		;[End-Of-Track]
.track_86:
	db $12		;[Note] 19
	db $C3		;[Wait] 4
	db $12		;[Note] 19
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $12		;[Note] 19
	db $C3		;[Wait] 4
	db $12		;[Note] 19
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $12		;[Note] 19
	db $C3		;[Wait] 4
	db $12		;[Note] 19
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $12		;[Note] 19
	db $C3		;[Wait] 4
	db $12		;[Note] 19
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $12		;[Note] 19
	db $C3		;[Wait] 4
	db $12		;[Note] 19
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $12		;[Note] 19
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $10		;[Note] 17
	db $C3		;[Wait] 4
	db $10		;[Note] 17
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $10		;[Note] 17
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $0E		;[Note] 15
	db $C3		;[Wait] 4
	db $0E		;[Note] 15
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $0E		;[Note] 15
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $0D		;[Note] 14
	db $C3		;[Wait] 4
	db $0D		;[Note] 14
	db $C0		;[Wait] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $0D		;[Note] 14
				;[Skip delay] 1
	db $60		;[Note] 97
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_87:
	db $2A		;[Note] 43
	db $FF		;[Wait] 64
	db $BF		;[End-Of-Track]
.track_88:
	db $C2		;[Wait] 3
	db $2A		;[Note] 43
	db $FC		;[Wait] 61
	db $BF		;[End-Of-Track]
.track_89:
	db $2A		;[Note] 43
	db $70		;[Instrument] 1
	db $F6		;[Wait] 55
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $2B		;[Note] 44
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_90:
	db $1E		;[Note] 31
	db $FD		;[Wait] 62
	db $60		;[Note] 97
	db $C0		;[Wait] 1
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_91:
	db $2A		;[Note] 43
	db $F6		;[Wait] 55
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $2B		;[Note] 44
				;[Skip delay] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_92:
	db $C2		;[Wait] 3
	db $2A		;[Note] 43
	db $F6		;[Wait] 55
	db $60		;[Note] 97
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $2B		;[Note] 44
				;[Skip delay] 2
	db $2D		;[Note] 46
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_93:
	db $34		;[Note] 53
	db $6F		;[Volume] 15
	db $84		;[Instrument] 21
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
	db $83		;[Instrument] 20
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
				;[Skip delay] 4
	db $2F		;[Note] 48
				;[Skip delay] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C4		;[Wait] 5
	db $34		;[Note] 53
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
				;[Skip delay] 4
	db $2F		;[Note] 48
				;[Skip delay] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C4		;[Wait] 5
	db $BF		;[End-Of-Track]
.track_94:
	db $17		;[Note] 24
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $17		;[Note] 24
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $17		;[Note] 24
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $15		;[Note] 22
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $15		;[Note] 22
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $15		;[Note] 22
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $1F		;[Note] 32
				;[Skip delay] 4
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_95:
	db $2F		;[Note] 48
	db $CF		;[Wait] 16
	db $2F		;[Note] 48
	db $C7		;[Wait] 8
	db $32		;[Note] 51
				;[Skip delay] 8
	db $31		;[Note] 50
	db $CF		;[Wait] 16
	db $2D		;[Note] 46
				;[Skip delay] 16
	db $BF		;[End-Of-Track]
.track_96:
	db $3B		;[Note] 60
	db $6D		;[Volume] 13
	db $71		;[Instrument] 2
	db $C2		;[Wait] 3
	db $36		;[Note] 55
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $3B		;[Note] 60
				;[Skip delay] 3
	db $36		;[Note] 55
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $3B		;[Note] 60
				;[Skip delay] 3
	db $36		;[Note] 55
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $3B		;[Note] 60
				;[Skip delay] 3
	db $36		;[Note] 55
	db $C1		;[Wait] 2
	db $39		;[Note] 58
	db $C2		;[Wait] 3
	db $34		;[Note] 53
				;[Skip delay] 3
	db $31		;[Note] 50
				;[Skip delay] 3
	db $39		;[Note] 58
				;[Skip delay] 3
	db $34		;[Note] 53
				;[Skip delay] 3
	db $31		;[Note] 50
				;[Skip delay] 3
	db $39		;[Note] 58
				;[Skip delay] 3
	db $34		;[Note] 53
				;[Skip delay] 3
	db $31		;[Note] 50
				;[Skip delay] 3
	db $39		;[Note] 58
				;[Skip delay] 3
	db $34		;[Note] 53
	db $C0		;[Wait] 1
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_97:
	db $3B		;[Note] 60
	db $6B		;[Volume] 11
	db $73		;[Instrument] 4
	db $CF		;[Wait] 16
	db $36		;[Note] 55
	db $C7		;[Wait] 8
	db $3E		;[Note] 63
				;[Skip delay] 8
	db $3D		;[Note] 62
	db $CF		;[Wait] 16
	db $39		;[Note] 58
				;[Skip delay] 16
	db $BF		;[End-Of-Track]
.track_98:
	db $C0		;[Wait] 1
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $2F		;[Note] 48
	db $CF		;[Wait] 16
	db $2F		;[Note] 48
	db $C7		;[Wait] 8
	db $32		;[Note] 51
				;[Skip delay] 8
	db $31		;[Note] 50
	db $CF		;[Wait] 16
	db $2D		;[Note] 46
	db $CC		;[Wait] 13
	db $BF		;[End-Of-Track]
.track_99:
	db $34		;[Note] 53
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
				;[Skip delay] 4
	db $2F		;[Note] 48
				;[Skip delay] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C4		;[Wait] 5
	db $34		;[Note] 53
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
				;[Skip delay] 4
	db $2F		;[Note] 48
				;[Skip delay] 4
	db $26		;[Note] 39
	db $82		;[Instrument] 19
	db $C2		;[Wait] 3
	db $26		;[Note] 39
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $1E		;[Note] 31
	db $6F		;[Volume] 15
	db $C2		;[Wait] 3
	db $1E		;[Note] 31
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_100:
	db $13		;[Note] 20
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $13		;[Note] 20
	db $C1		;[Wait] 2
	db $1F		;[Note] 32
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $13		;[Note] 20
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $1F		;[Note] 32
				;[Skip delay] 4
	db $1E		;[Note] 31
				;[Skip delay] 4
	db $1C		;[Note] 29
	db $7D		;[Instrument] 14
				;[Skip delay] 4
	db $1F		;[Note] 32
				;[Skip delay] 4
	db $15		;[Note] 22
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $15		;[Note] 22
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $15		;[Note] 22
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $25		;[Note] 38
	db $7D		;[Instrument] 14
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_101:
	db $2B		;[Note] 44
	db $70		;[Instrument] 1
	db $CF		;[Wait] 16
	db $2B		;[Note] 44
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
				;[Skip delay] 6
	db $32		;[Note] 51
	db $C3		;[Wait] 4
	db $31		;[Note] 50
	db $C5		;[Wait] 6
	db $32		;[Note] 51
				;[Skip delay] 6
	db $31		;[Note] 50
	db $C3		;[Wait] 4
	db $2D		;[Note] 46
	db $C7		;[Wait] 8
	db $2D		;[Note] 46
	db $85		;[Instrument] 22
				;[Skip delay] 8
	db $BF		;[End-Of-Track]
.track_102:
	db $37		;[Note] 56
	db $C2		;[Wait] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $2F		;[Note] 48
				;[Skip delay] 3
	db $37		;[Note] 56
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $2F		;[Note] 48
				;[Skip delay] 3
	db $37		;[Note] 56
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $2F		;[Note] 48
				;[Skip delay] 3
	db $37		;[Note] 56
				;[Skip delay] 3
	db $32		;[Note] 51
	db $C1		;[Wait] 2
	db $39		;[Note] 58
	db $C2		;[Wait] 3
	db $34		;[Note] 53
				;[Skip delay] 3
	db $31		;[Note] 50
				;[Skip delay] 3
	db $39		;[Note] 58
				;[Skip delay] 3
	db $34		;[Note] 53
				;[Skip delay] 3
	db $31		;[Note] 50
				;[Skip delay] 3
	db $39		;[Note] 58
				;[Skip delay] 3
	db $34		;[Note] 53
				;[Skip delay] 3
	db $31		;[Note] 50
				;[Skip delay] 3
	db $39		;[Note] 58
				;[Skip delay] 3
	db $34		;[Note] 53
	db $C0		;[Wait] 1
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_103:
	db $37		;[Note] 56
	db $CF		;[Wait] 16
	db $34		;[Note] 53
	db $C7		;[Wait] 8
	db $37		;[Note] 56
				;[Skip delay] 8
	db $39		;[Note] 58
	db $CF		;[Wait] 16
	db $34		;[Note] 53
	db $C7		;[Wait] 8
	db $39		;[Note] 58
				;[Skip delay] 8
	db $BF		;[End-Of-Track]
.track_104:
	db $2B		;[Note] 44
	db $CF		;[Wait] 16
	db $2B		;[Note] 44
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
				;[Skip delay] 6
	db $32		;[Note] 51
	db $C3		;[Wait] 4
	db $31		;[Note] 50
	db $C5		;[Wait] 6
	db $32		;[Note] 51
				;[Skip delay] 6
	db $31		;[Note] 50
	db $C3		;[Wait] 4
	db $2D		;[Note] 46
	db $C7		;[Wait] 8
	db $2A		;[Note] 43
				;[Skip delay] 8
	db $BF		;[End-Of-Track]
.track_105:
	db $C2		;[Wait] 3
	db $2B		;[Note] 44
	db $CF		;[Wait] 16
	db $2B		;[Note] 44
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
				;[Skip delay] 6
	db $32		;[Note] 51
	db $C3		;[Wait] 4
	db $31		;[Note] 50
	db $C5		;[Wait] 6
	db $32		;[Note] 51
				;[Skip delay] 6
	db $31		;[Note] 50
	db $C3		;[Wait] 4
	db $2D		;[Note] 46
	db $C7		;[Wait] 8
	db $2A		;[Note] 43
	db $C4		;[Wait] 5
	db $BF		;[End-Of-Track]
.track_106:
	db $34		;[Note] 53
	db $6F		;[Volume] 15
	db $84		;[Instrument] 21
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
	db $83		;[Instrument] 20
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
				;[Skip delay] 4
	db $2F		;[Note] 48
				;[Skip delay] 4
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C4		;[Wait] 5
	db $34		;[Note] 53
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
				;[Skip delay] 4
	db $2F		;[Note] 48
				;[Skip delay] 4
	db $2A		;[Note] 43
	db $82		;[Instrument] 19
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $22		;[Note] 35
				;[Skip delay] 2
	db $1E		;[Note] 31
				;[Skip delay] 2
	db $BF		;[End-Of-Track]
.track_107:
	db $17		;[Note] 24
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $17		;[Note] 24
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $17		;[Note] 24
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $1E		;[Note] 31
	db $7D		;[Instrument] 14
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $15		;[Note] 22
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $15		;[Note] 22
	db $C1		;[Wait] 2
	db $21		;[Note] 34
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $15		;[Note] 22
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $25		;[Note] 38
	db $7D		;[Instrument] 14
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_108:
	db $2F		;[Note] 48
	db $70		;[Instrument] 1
	db $CB		;[Wait] 12
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $2F		;[Note] 48
	db $C7		;[Wait] 8
	db $36		;[Note] 55
				;[Skip delay] 8
	db $34		;[Note] 53
	db $CB		;[Wait] 12
	db $32		;[Note] 51
	db $C1		;[Wait] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $31		;[Note] 50
	db $C7		;[Wait] 8
	db $2D		;[Note] 46
	db $85		;[Instrument] 22
				;[Skip delay] 8
	db $BF		;[End-Of-Track]
.track_109:
	db $3B		;[Note] 60
	db $C2		;[Wait] 3
	db $36		;[Note] 55
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $3B		;[Note] 60
				;[Skip delay] 3
	db $36		;[Note] 55
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $3B		;[Note] 60
				;[Skip delay] 3
	db $36		;[Note] 55
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $3B		;[Note] 60
				;[Skip delay] 3
	db $36		;[Note] 55
	db $C1		;[Wait] 2
	db $39		;[Note] 58
	db $C2		;[Wait] 3
	db $34		;[Note] 53
				;[Skip delay] 3
	db $31		;[Note] 50
				;[Skip delay] 3
	db $39		;[Note] 58
				;[Skip delay] 3
	db $34		;[Note] 53
				;[Skip delay] 3
	db $31		;[Note] 50
				;[Skip delay] 3
	db $39		;[Note] 58
				;[Skip delay] 3
	db $34		;[Note] 53
				;[Skip delay] 3
	db $31		;[Note] 50
				;[Skip delay] 3
	db $39		;[Note] 58
				;[Skip delay] 3
	db $34		;[Note] 53
	db $C0		;[Wait] 1
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_110:
	db $3B		;[Note] 60
	db $CF		;[Wait] 16
	db $36		;[Note] 55
	db $C7		;[Wait] 8
	db $42		;[Note] 67
				;[Skip delay] 8
	db $40		;[Note] 65
	db $CF		;[Wait] 16
	db $3D		;[Note] 62
				;[Skip delay] 16
	db $BF		;[End-Of-Track]
.track_111:
	db $0B		;[Note] 12
	db $C5		;[Wait] 6
	db $0B		;[Note] 12
	db $C1		;[Wait] 2
	db $17		;[Note] 24
	db $C3		;[Wait] 4
	db $0B		;[Note] 12
				;[Skip delay] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $12		;[Note] 19
				;[Skip delay] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $09		;[Note] 10
	db $C5		;[Wait] 6
	db $09		;[Note] 10
	db $C1		;[Wait] 2
	db $15		;[Note] 22
	db $C3		;[Wait] 4
	db $09		;[Note] 10
				;[Skip delay] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $19		;[Note] 26
				;[Skip delay] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_112:
	db $2F		;[Note] 48
	db $CB		;[Wait] 12
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $2F		;[Note] 48
	db $C7		;[Wait] 8
	db $36		;[Note] 55
				;[Skip delay] 8
	db $34		;[Note] 53
	db $CB		;[Wait] 12
	db $32		;[Note] 51
	db $C1		;[Wait] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $31		;[Note] 50
	db $CF		;[Wait] 16
	db $BF		;[End-Of-Track]
.track_113:
	db $C2		;[Wait] 3
	db $2F		;[Note] 48
	db $CB		;[Wait] 12
	db $2A		;[Note] 43
	db $C1		;[Wait] 2
	db $2D		;[Note] 46
				;[Skip delay] 2
	db $2F		;[Note] 48
	db $C7		;[Wait] 8
	db $36		;[Note] 55
				;[Skip delay] 8
	db $34		;[Note] 53
	db $CB		;[Wait] 12
	db $32		;[Note] 51
	db $C1		;[Wait] 2
	db $34		;[Note] 53
				;[Skip delay] 2
	db $31		;[Note] 50
	db $C0		;[Wait] 1
	db $36		;[Note] 55
	db $6C		;[Volume] 12
	db $9E, $00	; short arp
	db $C3		;[Wait] 4
	db $34		;[Note] 53
				;[Skip delay] 4
	db $32		;[Note] 51
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_114:
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
				;[Skip delay] 6
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
				;[Skip delay] 6
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C4		;[Wait] 5
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C4		;[Wait] 5
	db $BF		;[End-Of-Track]
.track_115:
	db $13		;[Note] 20
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $13		;[Note] 20
				;[Skip delay] 6
	db $13		;[Note] 20
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $15		;[Note] 22
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $12		;[Note] 19
				;[Skip delay] 6
	db $15		;[Note] 22
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $17		;[Note] 24
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $17		;[Note] 24
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $17		;[Note] 24
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $17		;[Note] 24
	db $C5		;[Wait] 6
	db $17		;[Note] 24
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $17		;[Note] 24
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_116:
	db $2B		;[Note] 44
	db $70		;[Instrument] 1
	db $C5		;[Wait] 6
	db $36		;[Note] 55
				;[Skip delay] 6
	db $34		;[Note] 53
	db $C3		;[Wait] 4
	db $32		;[Note] 51
	db $C5		;[Wait] 6
	db $31		;[Note] 50
				;[Skip delay] 6
	db $2D		;[Note] 46
	db $85		;[Instrument] 22
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
	db $70		;[Instrument] 1
	db $DF		;[Wait] 32
	db $BF		;[End-Of-Track]
.track_117:
	db $37		;[Note] 56
	db $C2		;[Wait] 3
	db $3B		;[Note] 60
				;[Skip delay] 3
	db $3E		;[Note] 63
				;[Skip delay] 3
	db $3D		;[Note] 62
				;[Skip delay] 3
	db $3E		;[Note] 63
				;[Skip delay] 3
	db $40		;[Note] 65
				;[Skip delay] 3
	db $42		;[Note] 67
				;[Skip delay] 3
	db $40		;[Note] 65
				;[Skip delay] 3
	db $3E		;[Note] 63
				;[Skip delay] 3
	db $40		;[Note] 65
				;[Skip delay] 3
	db $3E		;[Note] 63
	db $C1		;[Wait] 2
	db $3B		;[Note] 60
	db $C2		;[Wait] 3
	db $36		;[Note] 55
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $2F		;[Note] 48
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $36		;[Note] 55
				;[Skip delay] 3
	db $3B		;[Note] 60
				;[Skip delay] 3
	db $36		;[Note] 55
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $2F		;[Note] 48
				;[Skip delay] 3
	db $32		;[Note] 51
	db $C0		;[Wait] 1
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_118:
	db $37		;[Note] 56
	db $C5		;[Wait] 6
	db $42		;[Note] 67
				;[Skip delay] 6
	db $40		;[Note] 65
	db $C3		;[Wait] 4
	db $3E		;[Note] 63
	db $C5		;[Wait] 6
	db $3D		;[Note] 62
				;[Skip delay] 6
	db $40		;[Note] 65
	db $C3		;[Wait] 4
	db $3B		;[Note] 60
	db $DF		;[Wait] 32
	db $BF		;[End-Of-Track]
.track_119:
	db $07		;[Note] 8
	db $C5		;[Wait] 6
	db $07		;[Note] 8
				;[Skip delay] 6
	db $07		;[Note] 8
	db $C3		;[Wait] 4
	db $09		;[Note] 10
	db $C5		;[Wait] 6
	db $06		;[Note] 7
				;[Skip delay] 6
	db $09		;[Note] 10
	db $C3		;[Wait] 4
	db $0B		;[Note] 12
	db $C5		;[Wait] 6
	db $0B		;[Note] 12
	db $C1		;[Wait] 2
	db $17		;[Note] 24
	db $C3		;[Wait] 4
	db $0B		;[Note] 12
				;[Skip delay] 4
	db $0B		;[Note] 12
	db $C5		;[Wait] 6
	db $0B		;[Note] 12
	db $C1		;[Wait] 2
	db $17		;[Note] 24
	db $C3		;[Wait] 4
	db $0B		;[Note] 12
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_120:
	db $2B		;[Note] 44
	db $C5		;[Wait] 6
	db $36		;[Note] 55
				;[Skip delay] 6
	db $34		;[Note] 53
	db $C3		;[Wait] 4
	db $32		;[Note] 51
	db $C5		;[Wait] 6
	db $31		;[Note] 50
				;[Skip delay] 6
	db $34		;[Note] 53
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
	db $DF		;[Wait] 32
	db $BF		;[End-Of-Track]
.track_121:
	db $26		;[Note] 39
	db $6F		;[Volume] 15
	db $9E, $00	; short arp
	db $C5		;[Wait] 6
	db $32		;[Note] 51
				;[Skip delay] 6
	db $31		;[Note] 50
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
	db $C5		;[Wait] 6
	db $2D		;[Note] 46
				;[Skip delay] 6
	db $31		;[Note] 50
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
	db $DF		;[Wait] 32
	db $BF		;[End-Of-Track]
.track_122:
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C5		;[Wait] 6
	db $2F		;[Note] 48
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $81		;[Instrument] 18
	db $C2		;[Wait] 3
	db $23		;[Note] 36
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $2F		;[Note] 48
	db $6F		;[Volume] 15
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $2A		;[Note] 43
	db $82		;[Instrument] 19
	db $C1		;[Wait] 2
	db $2A		;[Note] 43
				;[Skip delay] 2
	db $22		;[Note] 35
	db $C2		;[Wait] 3
	db $22		;[Note] 35
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $26		;[Note] 39
	db $6F		;[Volume] 15
	db $C2		;[Wait] 3
	db $26		;[Note] 39
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $1E		;[Note] 31
	db $6F		;[Volume] 15
	db $C2		;[Wait] 3
	db $1E		;[Note] 31
	db $67		;[Volume] 7
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_123:
	db $17		;[Note] 24
	db $7F		;[Instrument] 16
	db $C5		;[Wait] 6
	db $17		;[Note] 24
	db $C1		;[Wait] 2
	db $23		;[Note] 36
	db $7D		;[Instrument] 14
	db $C3		;[Wait] 4
	db $17		;[Note] 24
	db $7F		;[Instrument] 16
				;[Skip delay] 4
	db $23		;[Note] 36
	db $7D		;[Instrument] 14
				;[Skip delay] 4
	db $21		;[Note] 34
				;[Skip delay] 4
	db $1E		;[Note] 31
				;[Skip delay] 4
	db $23		;[Note] 36
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_124:
	db $CF		;[Wait] 16
	db $2F		;[Note] 48
	db $83		;[Instrument] 20
	db $C3		;[Wait] 4
	db $2F		;[Note] 48
	db $CB		;[Wait] 12
	db $BF		;[End-Of-Track]
.track_125:
	db $3B		;[Note] 60
	db $C2		;[Wait] 3
	db $36		;[Note] 55
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $2F		;[Note] 48
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $36		;[Note] 55
				;[Skip delay] 3
	db $3B		;[Note] 60
				;[Skip delay] 3
	db $36		;[Note] 55
				;[Skip delay] 3
	db $32		;[Note] 51
				;[Skip delay] 3
	db $2F		;[Note] 48
				;[Skip delay] 3
	db $32		;[Note] 51
	db $C0		;[Wait] 1
				;[Skip delay] 1
	db $BF		;[End-Of-Track]
.track_126:
	db $DD		;[Wait] 30
	db $60		;[Note] 97
	db $C1		;[Wait] 2
	db $BF		;[End-Of-Track]
.track_127:
	db $0B		;[Note] 12
	db $C5		;[Wait] 6
	db $0B		;[Note] 12
	db $C1		;[Wait] 2
	db $17		;[Note] 24
	db $C3		;[Wait] 4
	db $0B		;[Note] 12
				;[Skip delay] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $15		;[Note] 22
				;[Skip delay] 4
	db $12		;[Note] 19
				;[Skip delay] 4
	db $17		;[Note] 24
				;[Skip delay] 4
	db $BF		;[End-Of-Track]
.track_128:
	db $DF		;[Wait] 32
	db $BF		;[End-Of-Track]
.track_129:
	db $60		;[Note] 97
	db $CF		;[Wait] 16
	db $23		;[Note] 36
	db $6D		;[Volume] 13
	db $74		;[Instrument] 5
				;[Skip delay] 16
	db $24		;[Note] 37
	db $D7		;[Wait] 24
	db $21		;[Note] 34
	db $C6		;[Wait] 7
	db $C0		;[Wait] 1
	db $BF		;[End-Of-Track]
.track_130:
	db $BF		;[End-Of-Track]
; [ Song sub-track data ]
