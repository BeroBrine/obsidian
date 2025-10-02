02-10-2025 23:15

Status:

Tags:

## Special Function Registers (SFR)
- These are special registers built in the 8051 to perform specialized functions. 
	- The address range is 80H to FFH.


**Registers**
- B , ACC , PSW , IP , P3 , IE , P2 , SBUF , SCON , P1 , TH1 , TH0 , TL1 , TL0 , TMOD , TCON , PCON , DPH , DPL , SP , P0 

- Math registers -> ACC , B
- I/O Ports -> P0 , P1 , P2 , P3
- Peripheral Control Registers -> IE , IP , TCON , SCON , PCON , TMOD
- Peripheral Data Registers -> TH0 , TH1 , TL1 , TL0 , SBUF
- Status Registers -> PSW (Program Status Word)
- Pointer Registers -> DPL , DPH, SP 

**Math Registers**
- A or ACC
	- This is the most important and most used register in 8051.
		- Used to hold data for almost all ALU operations 
	- ***address is E0H**
- B 
	- This register is used for multplication or division with A register.
	- Multiplication
		- During multiplication , one of the operand is stored inside of the B register and the higher byte of the result
	- Division 
		- During division , B stores the divisor and the remainder of the operation.
	- It can also be used as a general purpose register
	- ***address is F0H**
	
- PSW
	- This register is used to hold the state of the program in which programmer can check the condition of the result
	- It consists of various bit flags
		![[FT_2025-10-03 00:53:20.373.png]]

***Pointer Registers**

**Data Registers (DPTL) **
- DPH and DPL






## References
- 
