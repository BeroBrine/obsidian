10-09-2025 16:38

Status:

Tags: [[theory]] 

## FFT
- Fast Fourier Transform is one of the most important algorithms to learn in DSP.


**Let's Start with understanding polynomial representation**
- any degree d polynomial can be uniquely plotted on a graph using d + 1 number of points. 
- There are two ways to represent polynomials in computers
	- Coefficient Representation
		- \[ p1 , p2 , p3 ] where index(j) represents the coefficient of degree d.
			- index 3 (p3) corresponds to x^3
	- Value representation
		- {(x0 , P(x0)) ,(x1 , P(x1)) , .... , (xd , P(xd))}
		- Using value representation has the advantages that multiplication of polynomials is much easier than coeff as coeff uses O(d^2) time
	

## References
- 
