	AREA RESET,CODE
	EXPORT __Vectors
	EXPORT Reset_Handler
__Vectors
	DCD __initial_sp
	DCD Reset_Handler
		
Reset_Handler PROC
	NOP
	

x	DCW 0xdcfe, 0x98ba, 0x5476, 0x1032, 0x00, 0x00
y	DCB 0xfe, 0xdc, 0xba, 0x98, 0x76, 0x54, 0x32, 0x10, 0x00, 0x00
z	DCD 0x10325476, 0x98badcfe 
x1 	SPACE 4 
y1	dcd 4
;-----------------------------------------------------------------

	MOV R1,#0xFF
	MOV R2,#0xFF000000
	MOVW R3,#0xFFFF
	MOV R4,R2
;-----------------------

	LDR R5,=0X12345678
	
	LDR R6,z1
z1	DCD 0x11223344	
;---equal
	LDR R7,[PC,#0]
	DCD 0x11223344
		
	LDR R8,[PC,#4]
	DCD 0xeeffaabb
	DCD 0x55667788
;-----------------------

	LDR R0,=z
	
	LDR R1,[R0]
	LDR R2,[R0,#2]
	LDRH R3,[R0,#2]
	LDRB R4,[R0,#2]
	LDRD R5,R6,[R0]
	
	LDR R7,=0X20000000
	STR R2,[R7]
	STRH R3,[R7,#4]
	STRB R4,[R7,#8]
	STRD R5,R6,[R7,#12]
;-----------------------	
	
	PUSH {R0}
	POP {R1}
	PUSH {R2,R3,R4}
	POP {R5,R6,R7}
	
	
	B .
	ENDP
			
	AREA STACK,DATA
	SPACE 0x100
__initial_sp


	END