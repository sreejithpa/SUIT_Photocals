;pro throughput_sa (Stand Alone
;; throughput.pro :  A code to calculate throughput values of SUIT onboard ADITYA. 

;; Inputs
;;      : keyfile - Name with full path to keyfile.txt, where all input parameters are specifies
;;      : fw1 -  Slot position of Filter Wheel 1 [ A - H] as specified in keyfile.txt
;;      : fw2 - Slot position of Filter wheen 2 [ A- H ] as specified in keyfile.txt
;;      : expt -  Exposure time in seconds.

;; OUTPUT
;;      : OSTR - Output structure containing various parameters

;; HISTORY
;; 15-Feb-2018 February created by Sreejith Padinhatteeri (sreejith@iucaa.in)
;; 




;;#Key file defeningtion

keyfile="~/SUIT/PhotoCals/prog/keyfile.txt"
readcol,keyfile,strtags,vals,type, meta, comment='#', format='A,A,A,A', delim=';',/silent
strtags=strtrim(strtags,2)
vals=strtrim(vals,2)
type=strtrim(type,2)
;meta=strtrim(meta,2)

;Make array of data types for each field in structure
dataspec=strjoin(type,',')

create_struct,keyparams, '',strtags,dataspec
for i=0,n_elements(strtags)-1 do keyparams.(i)=vals[i]

stdwv=indgen(1000)+200 ;in nm - 200nm - 1200 nm, with 1 nm step 


;;Reading Each Cal files 
pmfname=strcompress(keyparams.SUITcaldir+'/'+keyparams.PMrfl,/remove_all)
readcol,pmfname,pmrwv,pmrfl,/silent ; in %
linterp,Pmrwv,pmrfl,stdwv,pmrfl1
smfname=strcompress(keyparams.SUITcaldir+'/'+keyparams.Smrfl,/remove_all)
readcol,smfname,smrwv,smrfl,/silent ; in %
linterp,smrwv,smrfl,stdwv,smrfl1
thfname=strcompress(keyparams.SUITcaldir+'/'+keyparams.Thftrns,/remove_all)
readcol,thfname,thflwv,thtrns,/silent ; in %
;linterp,thflwv,thrfl,stdwv,thrfl1
linterp,thflwv,thtrns,stdwv,thtrns1

;;;	FWheel- 1 
fw1af=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1a,/remove_all)
readcol,fw1af,fw1awv,fw1atrns,/silent ; in %
linterp,fw1awv,fw1atrns,stdwv,fw1atrns1
fw1bf=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1b,/remove_all)
readcol,fw1bf,fw1bwv,fw1btrns,/silent ; in %
linterp,fw1bwv,fw1btrns,stdwv,fw1btrns1
fw1cf=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1c,/remove_all)
readcol,fw1cf,fw1cwv,fw1ctrns,/silent ; in %
linterp,fw1cwv,fw1ctrns,stdwv,fw1ctrns1
fw1df=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1d,/remove_all)
readcol,fw1df,fw1dwv,fw1dtrns,/silent ; in %
linterp,fw1dwv,fw1dtrns,stdwv,fw1dtrns1
fw1ef=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1e,/remove_all)
readcol,fw1ef,fw1ewv,fw1etrns,/silent ; in %
linterp,fw1ewv,fw1etrns,stdwv,fw1etrns1
fw1ff=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1f,/remove_all)
readcol,fw1ff,fw1fwv,fw1ftrns,/silent ; in %
linterp,fw1fwv,fw1ftrns,stdwv,fw1ftrns1
fw1gf=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1g,/remove_all)
readcol,fw1gf,fw1gwv,fw1gtrns,/silent ; in %
linterp,fw1gwv,fw1gtrns,stdwv,fw1gtrns1
fw1hf=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1h,/remove_all)
readcol,fw1hf,fw1hwv,fw1htrns,/silent ; in %
linterp,fw1hwv,fw1htrns,stdwv,fw1htrns1

;;;	FWheel- 1 
fw2af=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2a,/remove_all)
readcol,fw2af,fw2awv,fw2atrns,/silent ; in %
linterp,fw2awv,fw2atrns,stdwv,fw2atrns1
fw2bf=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2b,/remove_all)
readcol,fw2bf,fw2bwv,fw2btrns,/silent ; in %
linterp,fw2bwv,fw2btrns,stdwv,fw2btrns1
fw2cf=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2c,/remove_all)
readcol,fw2cf,fw2cwv,fw2ctrns,/silent ; in %
linterp,fw2cwv,fw2ctrns,stdwv,fw2ctrns1
fw2df=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2d,/remove_all)
readcol,fw2df,fw2dwv,fw2dtrns,/silent ; in %
linterp,fw2dwv,fw2dtrns,stdwv,fw2dtrns1
fw2ef=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2e,/remove_all)
readcol,fw2ef,fw2ewv,fw2etrns,/silent ; in %
linterp,fw2ewv,fw2etrns,stdwv,fw2etrns1
fw2ff=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2f,/remove_all)
readcol,fw2ff,fw2fwv,fw2ftrns,/silent ; in %
linterp,fw2fwv,fw2ftrns,stdwv,fw2ftrns1
fw2gf=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2g,/remove_all)
readcol,fw2gf,fw2gwv,fw2gtrns,/silent ; in %
linterp,fw2gwv,fw2gtrns,stdwv,fw2gtrns1
fw2hf=strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2h,/remove_all)
readcol,fw2hf,fw2hwv,fw2htrns,/silent ; in %
linterp,fw2hwv,fw2htrns,stdwv,fw2htrns1

;;; Lense

readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.lenstrns,/remove_all),lenswv,lenstrns,/silent ; in %
linterp,lenswv,lenstrns,stdwv,lenstrns1

;;Detector

readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.detqe,/remove_all),qewv,qe,/silent ; in %
linterp,qewv,qe,stdwv,qe1

;; Input flux file

readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.iflux,/remove_all),ifluxwv,iflux,/silent ; in %
linterp,ifluxwv,iflux,stdwv,iflux1

;;Effective area calculation

fw1tmp=''
fw2tmp=''
expt=1.0

print,''
print,'------------------------------------'
print,FORMAT='(10X,"FW1",30X,"Fw1")'
print,FORMAT ='("A.",A-25,10X,"A.", A-25)',strcompress(keyparams.fw1a,/remove_all),strcompress(keyparams.fw2a,/remove_all)
print,FORMAT ='("B.",A-25,10X,"B.", A-25)',strcompress(keyparams.fw1b,/remove_all),strcompress(keyparams.fw2b,/remove_all)
print,FORMAT ='("C.",A-25,10X,"C.", A-25)',strcompress(keyparams.fw1c,/remove_all),strcompress(keyparams.fw2c,/remove_all)
print,FORMAT ='("D.",A-25,10X,"D.", A-25)',strcompress(keyparams.fw1d,/remove_all),strcompress(keyparams.fw2d,/remove_all)
print,FORMAT ='("E.",A-25,10X,"E.", A-25)',strcompress(keyparams.fw1e,/remove_all),strcompress(keyparams.fw2e,/remove_all)
print,FORMAT ='("F.",A-25,10X,"F.", A-25)',strcompress(keyparams.fw1f,/remove_all),strcompress(keyparams.fw2f,/remove_all)
print,FORMAT ='("G.",A-25,10X,"G.", A-25)',strcompress(keyparams.fw1g,/remove_all),strcompress(keyparams.fw2g,/remove_all)
print,FORMAT ='("H.",A-25,10X,"H.", A-25)',strcompress(keyparams.fw1h,/remove_all),strcompress(keyparams.fw2h,/remove_all)
print,'------------------------------------'
print,''
print,''

read,fw1tmp,prompt="Enter Filter Wheel-1 slot [A-H]:" 
read,fw2tmp,prompt="Enter Filter Wheel-2 slot [A-H]:" 
read,expt,prompt=" Enter exposure time: "
print,''

print,'------------------------------------'
print,"FW1-Slot-"+fw1tmp+" Response file is = ",(scope_varfetch('fw1'+fw1tmp+'f', /enter, level=1))
print,"FW2-Slot-"+fw2tmp+" Response file is = ",(scope_varfetch('fw2'+fw2tmp+'f', /enter, level=1))
print,'------------------------------------'

print,''
print,''

fw1=(scope_varfetch('fw1'+fw1tmp+'trns1', /enter, level=1))
fw2=(scope_varfetch('fw2'+fw2tmp+'trns1', /enter, level=1))

;; Aeff(λ)=Ageo*ThT(λ)*RP(λ)*RS(λ)*SF1(λ)*SF1(λ)*Q(λ)*D(λ). 

Aeff=keyparams.geoarea*thtrns1*pmrfl1*smrfl1*fw1*fw2*lenstrns1*qe1*keyparams.degrade* 1e-16  ; in m^2

;;Total Gain of CCD-readout system G(λ)=(1239.8/λ/3.65)g (where λ is in nm)
;; G = (1239.8/λ ) ev photon^-1 * (1/3.65) electron ev^-1 * g DN electron^-1  == DN/photon

tgain = (keyparams.detigain*1239.8)/(stdwv*3.65)  ; DN / photon


;; Instrument Response R(λ,t)= Aeff(λ, t) x G(λ) ; m^2 DN/photon

response =  tgain * Aeff  ; DN m^2 / photon

 ;; Count calculation
;; count rate=  I((λ) J S^-1 m ^ -2   x R(λ) m^2 DN/Photons

;; I J/S/m2 =I*6.242e+18 ev/S/m2  = I*6.242e+18/(1239.8/λ) photons/S/m2
;; count rate =  I(photons/S/m2) * R (DN m2/photons)  == DN/S

photonrate = (iflux1*stdwv*6.242e+18/1239.8) ; photons/S/m2
ccdphotonrate=photonrate*aeff  ; photons/S  falling on the total ccd
ccdphotons= total(ccdphotonrate*expt)
cntrate = photonrate*response 		; DN/S
counts=cntrate*expt ; DN
tcounts=total(counts)

print,''
print,''
print,'-------------------------------------------------------'
print,FORMAT='("Total photons falling at CCD =",E11.3)',ccdphotons
print,FORMAT='("Total counts (DN) =",10X,E11.3)',tcounts
print,FORMAT='("Average counts (DN) per pixel (if equally spread) =",E11.3)',tcounts/(4096.*4096.)
print,FORMAT='("Average counts (DN) on solar disk region of image =",E11.3)', tcounts/((!pi*1920*1920/4)/(0.7*0.7))  ; aprox pixels on which sun image falls 
	
print,'-------------------------------------------------------'
print,''
print,''

stop
end
