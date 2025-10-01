01-10-2025 22:09

Status:

Tags:

## Architecture.
- 8051 is a 8-bit data bus , 16-bit address bus microprocessor.
	- It follows Harvard architecture
		- Harvard architecture has seperate memory for data and program instructions.
	- It has CPU , ROM (4096 byte), RAM (128 Byte) , I/O ports , Two 16 bit event counters / timers, Full duplex UART , 4 programmable I/O ports , 64k Byte bus expansion control , and then the 8051 CPU itself. 


***Pin Configuration***
- Pins 1-8 (Port 1) 
	- These are simple I/O pins in port 1.
	- P1.2 -> P1 represents the port 1 , and the number after '.' i.e 2 , represents the pin number in that port. 
	- These are bidirectional pin
	- If the signal is 0 , it acts as output
		- If signal is 1 , it acts as input.

- RST (Pin 9)
	- This pin is an active high , input pin. 
	- Therefore , when this pin is high for more than 2 machine cycles , the microcontroller is reset to the values when it was powered on. 
		- Due to this reason it's also called power on reset pin.
- Pins 10-17 (Port 3) **Read about port latches**
	- These pins are normally just like the pins of port 1 , I/O pins.
	- But they serve additional purpose too.
		- Pin 10 -> RXD
			- This pin is used for serial data input. 
		- Pin 11 -> TXD
			- This pin is used for serial data output.
		- Pin 12 , 13 -> INT0 , INT1
			- This pin is used for external hardware interrupts 0 , 1
			- When this pin goes **low**, the microcontroller finishes the latest instruction and then jumps to the vector interrupt table to perform interrupt service routine (ISR).
				- For eg , the vector table address for INT0 is 0003H , and INT1 is 00013H.
				- The entry is often the address to the first instrcution in ISR.
		- Pin 14 , 15 -> T0 , T1 
			- These are timer 0 , timer 1 external interrupts. They can be connected to external 16 bit timers. 
		- Pin 16,17 -> WR' , RD'
			- These are used for writing , reading data from external memory.
- Pin 18 , 19 -> XTAL2 , XTAL1
	- These are pins used for 






## References
- 
