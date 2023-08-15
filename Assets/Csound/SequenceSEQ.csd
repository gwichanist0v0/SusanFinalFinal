<Cabbage>
form caption("Character Sounds"), size(800, 800)
button bounds(108, 43, 80, 40) channel("clear")
button bounds(90, 30, 80, 40) channel ("on")
hslider bounds(50, 124, 289, 50) channel("freq1") range(100, 2000, 200, 1, 1)
hslider bounds(68, 216, 150, 50) channel("freq2") range(100, 2000, 400, 1, 1)
hslider bounds(68, 288, 150, 50) channel("freq3") range(100, 2000, 600, 1, 1))
hslider bounds(70, 348, 150, 50) channel("freq4") range(100, 2000, 800, 1, 1)
hslider bounds(128, 435, 150, 50) channel("freq5") range(100, 2000, 1000, 1, 1)
hslider bounds(335, 353, 150, 50) channel("freq6") range(100, 2000, 1200, 1, 1)
hslider bounds(405, 478, 150, 50) channel("freq7") range(100, 2000, 1400, 1, 1)
hslider bounds(280, 604, 150, 50) channel("freq8") range(100, 2000, 1600, 1, 1)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -m0d
</CsOptions>
<CsInstruments>
sr 	= 	48000 
ksmps 	= 	32
nchnls 	= 	2
0dbfs	=	1 

;instr 1
;kTrig chnget "clear"
;if kTrig == 1 then
;	event "i", "CLEAR", 0, 10
;	endif 
;	endin
;	
;instr 2
;gkOn chnget "on"
;if gkOn == 1 then
;   event "i", "SEQ", 0, p3
;      endif
;   endin


//---------------------------------------//
instr SEQ
	gkNotes[] fillarray 0, 0, 0, 0, 0, 0, 0, 0

	gkBeat init 0
	kTempo chnget "tempo"
	if metro(kTempo) == 1 then
		if gkNotes[gkBeat] == 1 then
		//switch the instrument each time
			if (gkBeat == 0) then
				event "i", "SYNTH1", 0, 1, 0
			elseif (gkBeat == 1) then
				event "i", "SYNTH2", 0, 1, 1
			elseif (gkBeat == 2) then
				event "i", "SYNTH3", 0, 1, 2
			elseif (gkBeat == 3) then
				event "i", "SYNTH4", 0, 1, 3
			elseif (gkBeat == 4) then
				event "i", "SYNTH5", 0, 1, 4
			elseif (gkBeat == 5) then
				event "i", "SYNTH6", 0, 1, 5
			elseif (gkBeat == 6) then
				event "i", "SYNTH7", 0, 1, 6
			elseif (gkBeat == 7) then
				event "i", "SYNTH8", 0, 1, 7
			endif 
		endif
		chnset gkBeat, "beat"
		gkBeat = (gkBeat<7 ? gkBeat+1 : 0)
		
	endif

	kUpdateIndex chnget "updateTable"

	if changed(kUpdateIndex) == 1 then
		gkNotes[kUpdateIndex] = gkNotes[kUpdateIndex]==1 ? 0 : 1
		printks "Updating table - index: %d - value %d", 0, kUpdateIndex, gkNotes[kUpdateIndex]
	endif
	
	
	gkOff chnget "clear"

if gkOff ==1 then

turnoff

endif


endin

//---------------------------------------//



instr SYNTH1

gkfreq1     chnget  "freq1"
kamp        expon   .1, p3, 0.001

aOut        pluck   kamp, gkfreq1, 220, 0, 1
    
            outs    aOut, aOut

endin

instr SYNTH2

gkfreq2     chnget  "freq2"
kamp        expon   .1, p3, 0.001

aOut        pluck   kamp, gkfreq2, 220, 0, 1
    
            outs    aOut, aOut

endin

instr SYNTH3

gkfreq3     chnget  "freq3"
kamp        expon   .1, p3, 0.001

aOut        pluck   kamp, gkfreq3, 220, 0, 1
    
            outs    aOut, aOut

endin

instr SYNTH4

gkfreq4     chnget  "freq4"
kamp        expon   .1, p3, 0.001

aOut        pluck   kamp, gkfreq4, 220, 0, 1
    
            outs    aOut, aOut

endin

instr SYNTH5

gkfreq5     chnget  "freq5"
kamp        expon   .1, p3, 0.001

aOut        pluck   kamp, gkfreq5, 220, 0, 1
    
            outs    aOut, aOut

endin

instr SYNTH6

gkfreq6     chnget  "freq6"
kamp        expon   .1, p3, 0.001

aOut        pluck   kamp, gkfreq6, 220, 0, 1
    
            outs    aOut, aOut

endin

instr SYNTH7

gkfreq7     chnget  "freq7"
kamp        expon   .1, p3, 0.001

aOut        pluck   kamp, gkfreq7, 220, 0, 1
    
            outs    aOut, aOut

endin

instr SYNTH8

gkfreq8     chnget  "freq8"
kamp        expon   .1, p3, 0.001

aOut        pluck   kamp, gkfreq8, 220, 0, 1
    
            outs    aOut, aOut

endin

//---------------------------------------//
;
;instr CLEAR
;
;gkBeat init 1
;if (gkBeat == 1) then
;    turnoff2 "SEQ", 0, 1
;    endif
;		
;endin 

;instr CLEAR
;
;ktrig chnget "clear"
;
;if ktrig ==1 then
;
;turnoff "SEQ"
;
;endif 
;
;endin
;


//---------------------------------------//



</CsInstruments>
<CsScore>
//f100 0 8 2 0 0 0 0 0 0 0 0
i"SEQ" 0 [3600*12]
</CsScore>

</CsoundSynthesizer>


