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
;; 15-Feb-2018  created by Sreejith Padinhatteeri (sreejith@iucaa.in)
;; 7-March-2018 Modified to include any combinations of sci-filters
;; 


pro throughput,keyfile,fw1fltr,fw2fltr,exptime,inband,rband,bband,ibpxcnt,rlpxcnt,blpxcnt

;;#Key file defeningtion

;keyfile="~/SUIT/PhotoCals/prog/keyfile.txt"
;;========================================================================================
hc= 6.62607015e-34 * 3.0e+8 *1e+9  ; Jnm (Jule nano meter)
wlres=0.01 ;in nm
wlrange=[200,1100] ; in nm

wlarrsz=((wlrange[1]-wlrange[0])/wlres)+1
stdwl=findgen(wlarrsz)*wlres+wlrange[0]

;; SUIT px element area on the Sun (px element area/sun disk area )
pxarea =(0.7*0.7)/(!pi*1890*1890/4) 

;pxarea =(0.7*0.7)/(1890.*1890.)  ;Temporarily using square to match with Avyarthana's calculations

ibcutoff = 0.1 ; inband cutoff in % of transmission 
;;=================================================================================================

readcol,keyfile,strtags,vals,type, meta, comment='#', format='A,A,A,A', delim=';',/silent
strtags=strtrim(strtags,2)
vals=strtrim(vals,2)
type=strtrim(type,2)
;meta=strtrim(meta,2)

;Make array of data types for each field in structure
dataspec=strjoin(type,',')

create_struct,keyparams, '',strtags,dataspec
for i=0,n_elements(strtags)-1 do keyparams.(i)=vals[i]

tagnames=tag_names(keyparams)




;;Reading Each Cal files 

pmfname=strcompress(keyparams.SUITcaldir+'/'+keyparams.PMrfl,/remove_all)
readcol,pmfname,pmrwv,pmrfl,/silent ; in %
linterp,Pmrwv,pmrfl,stdwl,pmrfl1
smfname=strcompress(keyparams.SUITcaldir+'/'+keyparams.Smrfl,/remove_all)
readcol,smfname,smrwv,smrfl,/silent ; in %
linterp,smrwv,smrfl,stdwl,smrfl1
thfname=strcompress(keyparams.SUITcaldir+'/'+keyparams.Thftrns,/remove_all)
readcol,thfname,thflwv,thtrns,/silent ; in %
;linterp,thflwv,thrfl,stdwl,thrfl1
linterp,thflwv,thtrns,stdwl,thtrns1
;linterp,thflwv,smooth(thtrns,50)*1.02,stdwl,thtrns1

;;;	Science Filters

nb1f=strcompress(keyparams.SUITcaldir+'/'+keyparams.NB1,/remove_all)
readcol,nb1f,nb1wv,nb1trns,/silent ; in %
linterp,nb1wv,nb1trns,stdwl,nb1trns1

NB2f=strcompress(keyparams.SUITcaldir+'/'+keyparams.NB2,/remove_all)
readcol,NB2f,NB2wv,NB2trns,/silent ; in %
linterp,NB2wv,NB2trns,stdwl,NB2trns1

NB3f=strcompress(keyparams.SUITcaldir+'/'+keyparams.NB3,/remove_all)
readcol,NB3f,NB3wv,NB3trns,/silent ; in %
linterp,NB3wv,NB3trns,stdwl,NB3trns1

NB4f=strcompress(keyparams.SUITcaldir+'/'+keyparams.NB4,/remove_all)
readcol,NB4f,NB4wv,NB4trns,/silent ; in %
linterp,NB4wv,NB4trns,stdwl,NB4trns1

NB5f=strcompress(keyparams.SUITcaldir+'/'+keyparams.NB5,/remove_all)
readcol,NB5f,NB5wv,NB5trns,/silent ; in %
linterp,NB5wv,NB5trns,stdwl,NB5trns1

NB6f=strcompress(keyparams.SUITcaldir+'/'+keyparams.NB6,/remove_all)
readcol,NB6f,NB6wv,NB6trns,/silent ; in %
linterp,NB6wv,NB6trns,stdwl,NB6trns1

NB7f=strcompress(keyparams.SUITcaldir+'/'+keyparams.NB7,/remove_all)
readcol,NB7f,NB7wv,NB7trns,/silent ; in %
linterp,NB7wv,NB7trns,stdwl,NB7trns1

NB8f=strcompress(keyparams.SUITcaldir+'/'+keyparams.NB8,/remove_all)
readcol,NB8f,NB8wv,NB8trns,/silent ; in %
linterp,NB8wv,NB8trns,stdwl,NB8trns1

BB1f=strcompress(keyparams.SUITcaldir+'/'+keyparams.BB1,/remove_all)
readcol,BB1f,BB1wv,BB1trns,/silent ; in %
linterp,BB1wv,BB1trns,stdwl,BB1trns1

BB2f=strcompress(keyparams.SUITcaldir+'/'+keyparams.BB2,/remove_all)
readcol,BB2f,BB2wv,BB2trns,/silent ; in %
linterp,BB2wv,BB2trns,stdwl,BB2trns1

BB3f=strcompress(keyparams.SUITcaldir+'/'+keyparams.BB3,/remove_all)
readcol,BB3f,BB3wv,BB3trns,/silent ; in %
linterp,BB3wv,BB3trns,stdwl,BB3trns1

NDF0f=strcompress(keyparams.SUITcaldir+'/'+keyparams.NDF0,/remove_all)
readcol,NDF0f,NDF0wv,NDF0trns,/silent ; in %
linterp,NDF0wv,NDF0trns,stdwl,NDF0trns1

NDF06f=strcompress(keyparams.SUITcaldir+'/'+keyparams.NDF06,/remove_all)
readcol,NDF06f,NDF06wv,NDF06trns,/silent ; in %
linterp,NDF06wv,NDF06trns,stdwl,NDF06trns1

NDF20f=strcompress(keyparams.SUITcaldir+'/'+keyparams.NDF20,/remove_all)
readcol,NDF20f,NDF20wv,NDF20trns,/silent ; in %
linterp,NDF20wv,NDF20trns,stdwl,NDF20trns1

NDF30f=strcompress(keyparams.SUITcaldir+'/'+keyparams.NDF30,/remove_all)
readcol,NDF30f,NDF30wv,NDF30trns,/silent ; in %
linterp,NDF30wv,NDF30trns,stdwl,NDF30trns1

;;; Lense

readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.lenstrns,/remove_all),lenswv,lenstrns,/silent ; in %
linterp,lenswv,lenstrns,stdwl,lenstrns1

;;Detector

readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.detqe,/remove_all),qewv,qe,/silent ; in %
linterp,qewv,qe,stdwl,qe1

;; Input flux file

readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.iflux,/remove_all),ifluxwv,iflux,/silent ; in %
linterp,ifluxwv,iflux,stdwl,iflux1

;;Effective area calculation

;fw1tmp=''
;fw2tmp=''
;expt=1.0

;print,'Filter Wheel -1 filter only will be used for inband/outband calculation'
;print,''
;print,''
;print,'CODE for filters are : ', tagnames[5:19]
;print,''
;print,''

;read,fw1tmp,prompt="Enter Filter Wheel-1 slot [use above codes]:" 
;read,fw2tmp,prompt="Enter Filter Wheel-2 slot [use above codes]:" 
;read,expt,prompt=" Enter exposure time: "
;print,''

;print,'------------------------------------'
;print,"FW1-Slot- "+strupcase(fw1tmp)+"  Response file = ",(scope_varfetch(fw1tmp+'f', /enter, level=1))
;print,"FW2-Slot- "+strupcase(fw2tmp)+" Response file = ",(scope_varfetch(fw2tmp+'f', /enter, level=1))
;print,'------------------------------------'

;print,''
;print,''
fw1tmp=strcompress(fw1fltr,/remove_all)
fw2tmp=strcompress(fw2fltr,/remove_all)
expt = exptime

fw1=(scope_varfetch(fw1tmp+'trns1', /enter, level=0))
fw2=(scope_varfetch(fw2tmp+'trns1', /enter, level=0))

;; Aeff(λ)=Ageo*ThT(λ)*RP(λ)*RS(λ)*SF1(λ)*SF1(λ)*Lens(λ)*Q(λ)*D(λ). 

Aeff=keyparams.geoarea*thtrns1*pmrfl1*smrfl1*fw1*fw2*lenstrns1*qe1*keyparams.degrade* 1e-16  ; in m^2

key1bleak=1.
key1rleak=1.

fw1ib = where(fw1 ge ibcutoff) ; inband
fw1ob = where (fw1 lt ibcutoff) ; outband
tmp = where (fw1ob lt min(fw1ib))
if (tmp[0] ne -1) then fw1bleak=fw1ob(tmp)  else  begin
	fw1bleak=0  
	key1bleak=0.  
	print,"No Blue leak for "+fw1tmp
	endelse
tmp = where (fw1ob gt max(fw1ib))
if (tmp[0] ne -1) then fw1rleak=fw1ob(tmp) else begin
	fw1rleak=0  
	key1rleak=0.  
	print,"No Red leak for "+fw1tmp
	endelse
print,''
print,''

fw2ib = where(fw2 ge ibcutoff) ; inband
fw2ob = where (fw2 lt ibcutoff) ; outband
tmp = where (fw2ob lt min(fw2ib))
if (tmp[0] ne -1) then fw2bleak=fw2ob(tmp) else print,"No Blue leak for "+fw2tmp 
tmp = where (fw2ob gt max(fw2ib))
if (tmp[0] ne -1) then fw2rleak=fw2ob(tmp) else print,"No Red leak for "+fw2tmp

;; ==============================
ib = fw1ib
ob = fw1ob
rleak = fw1rleak
bleak = fw1bleak
krleak= key1rleak
kbleak= key1bleak
;; ==============================


;;Total Gain of CCD-readout system G(λ)=(1239.8/λ/3.65)g (where λ is in nm)
;; G = (1239.8/λ ) ev photon^-1 * (1/3.65) electron ev^-1 * g DN electron^-1  == DN/photon

;tgain = (keyparams.detigain*1239.8)/(stdwl*3.65)  ; DN / photon

tgain = keyparams.detigain  ; SUIT QE provided by E2V include the UV gain 

;; Instrument Response R(λ,t)= Aeff(λ, t) x G(λ) ; m^2 DN/photon

response =  tgain * Aeff  ; DN m^2 / photon

 ;; Count calculation

;; Photon rate =  I/(hc/λ) photons/S/m2  (Jm^-2 S^-1 / J )
;; count rate =   I(photons/S/m2) * R (DN m2/photons)  == DN/S

photonrate = (iflux1*stdwl/hc) ; photons/S/m2
cntrate = photonrate*response 		; DN/S
cnt=cntrate*expt ; DN
tcnt=tsum(stdwl,cnt)
pxcnt=tcnt*pxarea
ibpxcnt = tsum(stdwl,cnt(ib))*pxarea
if (kbleak ne 0) then blpxcnt = tsum(stdwl,cnt(bleak))*pxarea else blpxcnt =0. 
if (krleak ne 0 ) then rlpxcnt = tsum(stdwl,cnt(rleak))*pxarea else rlpxcnt =0.

inband=[min(stdwl(ib)),(max(stdwl(ib)))]
bband=[min(stdwl(bleak))*kbleak, max(stdwl(bleak))*kbleak]
rband=[min(stdwl(rleak))*krleak,max(stdwl(rleak))*krleak]
;stop
end
