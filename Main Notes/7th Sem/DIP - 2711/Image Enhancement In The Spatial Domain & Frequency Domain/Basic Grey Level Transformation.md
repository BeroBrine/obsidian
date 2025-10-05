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
	- This is mainly used in displaying fourier transform wher ethe 









## References
- 
