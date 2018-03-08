
pro fltrcalib
 
keyfile="~/SUIT/PhotoCals/prog/keyfile.txt"

fltrcombf='fltrcombs.txt'
readcol,fltrcombf,fltrcode1,fltrcode2,exptime,comment='#', format='A,A,F', delim=';',/silent

close,/all
openw,1,'scifltrcalib2.csv'
printf,1,"Fltr1,Fltr2,ExpTim(s),Iband(nm),counts/px, Rband(nm), Rleak/px, Bband(nm), Bleak/px"

for ii=0,n_elements(fltrcode1)-1 do begin
	throughput,keyfile,fltrcode1[ii],fltrcode2[ii],exptime[ii],inband,rband,bband,ibpxcnt,rlpxcnt,blpxcnt
	printf,1,format='(A-10,",",A-10,",",F5.3,",","[",F8.2,":",F8.2,"]",",",I,",","[",F8.2,":",F8.2,"]",",",I,",","[",F8.2,":",F8.2,"]",",",I )',fltrcode1[ii],fltrcode2[ii],exptime[ii],inband[0],inband[1],round(ibpxcnt),rband[0],rband[1],round(rlpxcnt),bband[0],bband[1],round(blpxcnt)

endfor


close,1

stop
end
