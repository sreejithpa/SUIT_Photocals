PhotoCalibration of SUIT Payload On Aditya
==========================================

This project is to develop a IDL based GUI Photo-calibrate SUIT files. Various componenet level response files will be input and telescope response will the primary output. This is very specifically designed corresponding to SUIT instrument components. But can be easily tweeked to create any optical telescope photo-calibration software.


Response Calculation
----------------------- 

 -**Effective Area** 

 Aeff(λ)=Ageo*ThT(λ)*RP(λ)*RS(λ)*SF1(λ)*SF2(λ)*Q(λ)*D(λ).

	Where,
		- Ageo  = Geometiric Area (Light collection area ; here entrance apperture area was used)
		- ThT(λ) = Thermal Filter transmission percentrage.
		- RP(λ) = Primary Mirror Reflectance percentage.
		- RS(λ) = Secondary Mirrir Reflectance percentage.
		- SF1(λ) = Science Filter 1 (Filter Wheel 1)
		- SF2(λ) = Science FIlter 2 (Filter Wheel 2)
		- Q(λ)  = Quantum efficiency of the Detector  (percentage of photos that will be detected)
		- D(λ)  = Degradation percentage with time/ or due to contamination etc.



