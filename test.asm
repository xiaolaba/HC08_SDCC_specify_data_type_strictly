;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module test
	.optsdcc -mhc08
	
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CONST   (CODE)
	.area DSEG    (PAG)
	.area OSEG    (PAG, OVR)
	.area XSEG
	.area XISEG
	.area	CODEIVT (ABS)
	.org	0xfffe
	.dw	__sdcc_gs_init_startup

	.area GSINIT0
__sdcc_gs_init_startup:
	ldhx	#0x0100
	txs
	jsr	__sdcc_external_startup
	beq	__sdcc_init_data
	jmp	__sdcc_program_startup
__sdcc_init_data:
; _hc08_genXINIT() start
        ldhx #0
00001$:
        cphx #l_XINIT
        beq  00002$
        lda  s_XINIT,x
        sta  s_XISEG,x
        aix  #1
        bra  00001$
00002$:
; _hc08_genXINIT() end
	.area GSFINAL
	jmp	__sdcc_program_startup

	.area CSEG
__sdcc_program_startup:
	jsr	_main
	bra	.
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _ir_code32bit
	.globl _COPCTL
	.globl _OSCTRIMVAL
	.globl _FLBPR
	.globl _LVISR
	.globl _BRKSCR
	.globl _BRK
	.globl _BRKL
	.globl _BRKH
	.globl _FLCR
	.globl _INT3
	.globl _INT2
	.globl _INT1
	.globl _BFCF
	.globl _BRKAR
	.globl _SRSR
	.globl _BSR
	.globl _ADICLK
	.globl _ADR
	.globl _ADSCR
	.globl _OSCTRIM
	.globl _OSCSTAT
	.globl _TCH1
	.globl _TCH1L
	.globl _TCH1H
	.globl _TSC1
	.globl _TCH0
	.globl _TCH0L
	.globl _TCH0H
	.globl _TSC0
	.globl _TMOD
	.globl _TMODL
	.globl _TMODH
	.globl _TCNT
	.globl _TCNTL
	.globl _TCNTH
	.globl _TSC
	.globl _CONFIG1
	.globl _CONFIG2
	.globl _INTSCR
	.globl _KBIER
	.globl _KBSCR
	.globl _PTBPUE
	.globl _PTAPUE
	.globl _DDRB
	.globl _DDRA
	.globl _PTB
	.globl _PTA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DSEG    (PAG)
_PTA	=	0x0000
_PTB	=	0x0001
_DDRA	=	0x0004
_DDRB	=	0x0005
_PTAPUE	=	0x000b
_PTBPUE	=	0x000c
_KBSCR	=	0x001a
_KBIER	=	0x001b
_INTSCR	=	0x001d
_CONFIG2	=	0x001e
_CONFIG1	=	0x001f
_TSC	=	0x0020
_TCNTH	=	0x0021
_TCNTL	=	0x0022
_TCNT	=	0x0021
_TMODH	=	0x0023
_TMODL	=	0x0024
_TMOD	=	0x0023
_TSC0	=	0x0025
_TCH0H	=	0x0026
_TCH0L	=	0x0027
_TCH0	=	0x0026
_TSC1	=	0x0028
_TCH1H	=	0x0029
_TCH1L	=	0x002a
_TCH1	=	0x0029
_OSCSTAT	=	0x0036
_OSCTRIM	=	0x0038
_ADSCR	=	0x003c
_ADR	=	0x003e
_ADICLK	=	0x003f
;--------------------------------------------------------
; overlayable items in ram 
;--------------------------------------------------------
;--------------------------------------------------------
; absolute ram data
;--------------------------------------------------------
	.area IABS    (ABS)
	.area IABS    (ABS)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG
_ir_code32bit::
	.ds 4
;--------------------------------------------------------
; extended address mode data
;--------------------------------------------------------
	.area XSEG
_BSR	=	0xfe00
_SRSR	=	0xfe01
_BRKAR	=	0xfe02
_BFCF	=	0xfe03
_INT1	=	0xfe04
_INT2	=	0xfe05
_INT3	=	0xfe06
_FLCR	=	0xfe08
_BRKH	=	0xfe09
_BRKL	=	0xfe0a
_BRK	=	0xfe09
_BRKSCR	=	0xfe0b
_LVISR	=	0xfe0c
_FLBPR	=	0xffbe
_OSCTRIMVAL	=	0xffc0
_COPCTL	=	0xffff
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;test.c:28: void main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_main:
;test.c:36: ir_code32bit = base + ( 0b11000000  <<8); // = 0x12340000 + (-0x40 << 8 ) = 0x1233C000, need signed int extension
	ldhx	#_ir_code32bit
	lda	#0x12
	sta	,x
	lda	#0x33
	sta	1,x
	lda	#0xc0
	sta	2,x
	clra
	sta	3,x
;test.c:37: ir_code32bit = base + (-0b01000000  <<8); // = 0x12340000 - (0x40  << 8 ) = 0x1233C000, need singed int extension
	ldhx	#_ir_code32bit
	lda	#0x12
	sta	,x
	lda	#0x33
	sta	1,x
	lda	#0xc0
	sta	2,x
	clra
	sta	3,x
;test.c:39: ir_code32bit = base + (0b1100000000000000); // = 0x12340000 + 0x0000C000 = 0x1234C000, no need signed int extension 
	ldhx	#_ir_code32bit
	lda	#0x12
	sta	,x
	lda	#0x34
	sta	1,x
	lda	#0xc0
	sta	2,x
	clra
	sta	3,x
;test.c:45: ir_code32bit = base + (0xC0u <<8) + (unsigned char)(~0xF0); // correct 0x1234c03F, no need signed int extension
	ldhx	#_ir_code32bit
	lda	#0x12
	sta	,x
	lda	#0x34
	sta	1,x
	lda	#0xc0
	sta	2,x
	lda	#0x0f
	sta	3,x
;test.c:46: ir_code32bit = base + (0xC0u <<8) + (~0xF0); //  0x1234bf3F, need signed int extension
	ldhx	#_ir_code32bit
	lda	#0x12
	sta	,x
	lda	#0x34
	sta	1,x
	lda	#0xbf
	sta	2,x
	lda	#0x0f
	sta	3,x
;test.c:49: }
	rts
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
__xinit__ir_code32bit:
	.byte #0xff, #0xff, #0xff, #0xff	; 4294967295
	.area CABS    (ABS,CODE)
