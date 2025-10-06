06-10-2025 03:42

Status:

Tags:

## Basic Grey Level Transformation

- Intensity transforms are changes that are done on the per pixel level based on a pre-defined rule regardless of the neighbors.

 $$ s = T(r)$$   
 - Where 
	 - r is the intensity of the pixel in the input image.
	 - s is the intensity of the pixel in the output image.
	 - T is the transformation function applied. 
- Implementation
	- For images with low gray levels , eg 8-bit , these values are often stored in LUT , lookup table. This table contains output value for every possible input making the algorithm faster.

**1. Image Negatives**
- This is the simple linear transformation.
	- The purpose is to enhance white or gray details surrounded by dark regions
	- For an input image whose gray levels belong to 0 ... L - 1 where L is the max number of gray level.
	$$s = (L-1) - r$$
	- Where s is the output for the corresponding input pixel's intensity.
	- Useful in medicinal imagery , Eg Mammograph

**2. Log Transformations**
- This is non-linear transformation beneficial where the gray levels are highly dynamic.
	- It's purpose is to expand the intensity of dark areas while compressing the intensity of brigh areas. 
	- Formula being $$ s = c.log(1+r)$$ where the c is the scaling constant. The '1+' is important so that the log is not zero when r = 0.
	- This is mainly used in displaying fourier transform where the intensity can be as high as 10<sup>8</sup>. 
	- The log transform make the lower magnitude but important frequency components visible.

**3. Gamma Transformations**
- This is a versatile non linear used for constrant manipulation and display correction.
	- The purpose is to selectively expand or compress intensity ranges.
	- Formula being $$ s = c.r^\gamma$$
	where c is a constant and gamma is the exponent.
	- Gamma's value effect
		- Gamma < 1 
			- Maps a narrow range of inputs to wider range of outputs. It brightnes the image and is used to enhance details in dark region.  
		- Gamma > 1.
			- Maps a wider range of inputs to narrow range of outputs. It darkens the image and used to correct washed-out or overly bright images. 
		- Gamma = 1.
			- No change in the output image.
			
	- It is extensively used in display correction where display gamma is high and it overly darkens the image. 
		- Gamma correction value $$\gamma _{correction} = (1/\gamma_{old})$$
		is applied to ensure the display shows image as it was captured.
		

**4. Piecewise linear transformation**
- These transformation makes use of functions composed of multiple straight line segments , offering more fine tuned control

- Contrast Stretching
	- This is used to "stretch" narrow range of intensities to span the full dynamic range of the display.
	- How it works is by using functions composed of (s1 , r1) and (s2 , r2) where it expands intensities of range \[r1 ... r2] to \[s1 ... s2]. 
		- A common application is to set r1 to the minimum intensity of the input and r2 to maximum , stretching it out to the maximum available , for eg 256.
	- **Thresholding**
		- A special case where the output image is black and white binary image.

- Intensity-Level Slicing
	- This highlight a specific range of intensities. 
		- How it works 
			- By making the desired range bright eg white and all other intensities dark. 
			- By making the desired range bright and all other intensities remain untouched.










## References
- 
