02-10-2025 00:02

Status:

Tags:

## Pin Configuration

![[Pasted image 20251002000319.png|300x400]]

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
	- These are pins used for external oscillator which is generally a quartz oscillator.
	- These provide external clock freq of 4Mhz to 30Mhz.
- Pin 20 -> GND
	- This is connected to ground.
- Pin 21-28 -> Port 2
	- Works like any other port but when interfaced with external memory, pins of port 2 act as higher order memory bytes 
		- Higher order memory 
			- The 8051 can interface with 64KB of external memory , thanks to it's 16-bit address bus. 
				- A0-A7 bit are lower order bit (the least significant 8 bits.)
				- A7-15 bit are higher order bit (the most significant 8 bits.)
	- When RD'/WR' , EA' , VSEN' are active
			- Port 0 sends the lower order bytes , and then data bytes.
			- Port 2 sends the higher order bytes.
- Pin 29 -> PSEN' 
	- This is called program store enable. This is used to read external memory.
- Pin 30 -> ALE/PROG'
	- This is called Address Latch Enable , used to select single memory chip when multiple are available. Also used to demultiplex the mixed data and address signal recived at P0.
- Pin 31 -> EA'/VPP
	- This stand for external access input.
		- Used to enable disable external memory interfacing.
- Pin 32 - 39 -> Port 0 
	- These are Port 0 pins.
		- Also used as AD0-AD7 when interfaced with external memory.
		- They don't have any internal pull ups.
- Pin 40 -> VCC
	- This is the +5V continous voltage pin.

**Issues**
- It needs continous 5V signal , any fluctuations can lead to malfunctions. 
- Voltage , Current Limits
- EMI (electromagnetic inference) due to other devices
- Pin conflicts.
## References
- [GFG](https://www.geeksforgeeks.org/electronics-engineering/pin-diagram-of-8051-microcontroller/) 
