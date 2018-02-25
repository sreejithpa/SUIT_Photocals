;;#Key file defeningtion

;keyfile="~/SUIT/PhotoCals/prog/keyfile.txt"
;readcol,keyfile,strtags,vals,type, meta, comment='#', format='A,A,A,A', delim=';',/silent
;strtags=strtrim(strtags,2)
;vals=strtrim(vals,2)
;type=strtrim(type,2)
;;;meta=strtrim(meta,2)

;;;Make array of data types for each field in structure
;dataspec=strjoin(type,',')

;create_struct,keyparams, '',strtags,dataspec
;for i=0,n_elements(strtags)-1 do keyparams.(i)=vals[i]

;stdwv=indgen(200)+200 ;in nm

function loadcal,keyparams,stdwv
 
;;Reading Each Cal files 
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.PMrfl,/remove_all),pwrwv,pmrfl ; in %
linterp,Pmrwv,pmrfl,stdwv,pmrfl1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.Smrfl,/remove_all),smrwv,smrfl ; in %
linterp,smrwv,smrfl,stdwv,smrfl1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.Thftrns,/remove_all),thflwv,thrfl,thtrns ; in %
linterp,thflwv,thrfl,stdwv,thrfl1
linterp,thflwv,thtrns,stdwv,thtrns1

;;;	FWheel- 1 
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1a,/remove_all),fw1awv,fw1atrns ; in %
linterp,fw1awv,fw1atrns,stdwv,fw1atrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1b,/remove_all),fw1bwv,fw1btrns ; in %
linterp,fw1bwv,fw1btrns,stdwv,fw1btrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1c,/remove_all),fw1cwv,fw1ctrns ; in %
linterp,fw1cwv,fw1ctrns,stdwv,fw1ctrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1d,/remove_all),fw1dwv,fw1dtrns ; in %
linterp,fw1dwv,fw1dtrns,stdwv,fw1dtrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1e,/remove_all),fw1ewv,fw1etrns ; in %
linterp,fw1ewv,fw1etrns,stdwv,fw1etrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1f,/remove_all),fw1fwv,fw1ftrns ; in %
linterp,fw1fwv,fw1ftrns,stdwv,fw1ftrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1g,/remove_all),fw1gwv,fw1gtrns ; in %
linterp,fw1gwv,fw1gtrns,stdwv,fw1gtrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw1h,/remove_all),fw1hwv,fw1htrns ; in %
linterp,fw1hwv,fw1htrns,stdwv,fw1htrns1

;;;	FWheel- 1 
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2a,/remove_all),fw2awv,fw2atrns ; in %
linterp,fw2awv,fw2atrns,stdwv,fw2atrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2b,/remove_all),fw2bwv,fw2btrns ; in %
linterp,fw2bwv,fw2btrns,stdwv,fw2btrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2c,/remove_all),fw2cwv,fw2ctrns ; in %
linterp,fw2cwv,fw2ctrns,stdwv,fw2ctrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2d,/remove_all),fw2dwv,fw2dtrns ; in %
linterp,fw2dwv,fw2dtrns,stdwv,fw2dtrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2e,/remove_all),fw2ewv,fw2etrns ; in %
linterp,fw2ewv,fw2etrns,stdwv,fw2etrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2f,/remove_all),fw2fwv,fw2ftrns ; in %
linterp,fw2fwv,fw2ftrns,stdwv,fw2ftrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2g,/remove_all),fw2gwv,fw2gtrns ; in %
linterp,fw2gwv,fw2gtrns,stdwv,fw2gtrns1
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.fw2h,/remove_all),fw2hwv,fw2htrns ; in %
linterp,fw2hwv,fw2htrns,stdwv,fw2htrns1

;;; Lense
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.lenstrns,/remove_all),lenswv,lenstrns ; in %
linterp,lenswv,lenstrns,stdwv,lenstrns1

;;Detector
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.detqe,/remove_all),qewv,qe ; in %
linterp,qewv,qe,stdwv,qe1

;; Input flux file
readcol,strcompress(keyparams.SUITcaldir+'/'+keyparams.iflux,/remove_all),ifuxwx,iflux ; in %
linterp,ifluxwv,iflux,stdwv,iflux1







stop
end
