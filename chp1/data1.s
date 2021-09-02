	AREA RESET,CODE
	EXPORT __Vectors
	EXPORT Reset_Handler
__Vectors
	DCD __initial_sp
	DCD Reset_Handler
		
Reset_Handler PROC
	
	MOV R0,#5
	MOV R1,#6
	ADD R2,R0,R1
	
	B .
	ENDP
			
	AREA STACK,DATA
	SPACE 0x100
__initial_sp


	END