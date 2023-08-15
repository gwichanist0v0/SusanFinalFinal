<Cabbage>
form caption("Untitled") size(400, 300), guiMode("queue") pluginId("def1")
rslider bounds(296, 162, 100, 100), channel("gain"), range(0, 1, 0, 1, .01), text("Gain"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs  = 1

instr SEQ
    kNotes[] fillarray 0, 0, 0, 0, 0, 0, 0, 0
    kBeat init 0
    kTempo chnget "tempo"
       if metro(kTempo) == 1 then
            if kNotes[kBeat] == 1 then
              if (kBeat == 0) then
                 event "i", "SYNTH0", 0, 1, 0
              elseif (kBeat == 1) then
                 event "i", "SYNTH1", 0, 1, 1
              elseif (kBeat == 2) then
                 event "i", "SYNTH2", 0, 1, 2
              elseif (kBeat == 3) then
                 event "i", "SYNTH3", 0, 1, 3
              elseif (kBeat == 4) then
                 event "i", "SYNTH4", 0, 1, 4
              elseif (kBeat == 5) then
                 event "i", "SYNTH5", 0, 1, 5
              elseif (kBeat == 6) then
                 event "i", "SYNTH6", 0, 1, 6
              elseif (kBeat == 7) then
                 event "i", "SYNTH7", 0, 1, 7
              endif
           endif
          chnset kBeat, "beat"
          kBeat = (kBeat<7 ? kBeat+1 : 0)
      endif
      
      kUpdateIndex chnget "updateTable"
    
    if changed(kUpdateIndex) == 1 then
        kNotes[kUpdateIndex] = kNotes[kUpdateIndex] ==1 ? 0 : 1
    endif
endin

instr SYNTH0

kfreq1  chnget  "freq0"
kamp	 chnget 	"amp0"

kmod    chnget  "mod0"
krat    chnget  "rat0"

kcps1 mtof kfreq1


a1 foscil 0.5, kcps1, 1, kmod, krat, 1


aenv madsr 0.3, 0.1, 0.5, 0.1

outs a1*aenv, a1*aenv

endin

instr SYNTH1

kfreq1  chnget  "freq1"
kamp	 chnget 	"amp1"

kmod    chnget  "mod1"
krat    chnget  "rat1"

kcps1 mtof kfreq1


a1 foscil 0.5, kcps1, 1, kmod, krat, 1


aenv madsr 0.3, 0.1, 0.5, 0.1

outs a1*aenv, a1*aenv

endin

instr SYNTH2

kfreq1  chnget  "freq2"
kamp	 chnget 	"amp2"

kmod    chnget  "mod2"
krat    chnget  "rat2"

kcps1 mtof kfreq1


a1 foscil 0.5, kcps1, 1, kmod, krat, 1


aenv madsr 0.3, 0.1, 0.5, 0.1

outs a1*aenv, a1*aenv

endin

instr SYNTH3

kfreq1  chnget  "freq3"
kamp	 chnget 	"amp3"

kmod    chnget  "mod3"
krat    chnget  "rat3"

kcps1 mtof kfreq1


a1 foscil 0.5, kcps1, 1, kmod, krat, 1


aenv madsr 0.3, 0.1, 0.5, 0.1

outs a1*aenv, a1*aenv

endin

instr SYNTH4

kfreq1  chnget  "freq4"
kamp	 chnget 	"amp4"

kmod    chnget  "mod4"
krat    chnget  "rat4"

kcps1 mtof kfreq1


a1 foscil 0.5, kcps1, 1, kmod, krat, 1


aenv madsr 0.3, 0.1, 0.5, 0.1

outs a1*aenv, a1*aenv

endin

instr SYNTH5

kfreq1  chnget  "freq5"
kamp	 chnget 	"amp5"

kmod    chnget  "mod5"
krat    chnget  "rat5"

kcps1 mtof kfreq1


a1 foscil 0.5, kcps1, 1, kmod, krat, 1


aenv madsr 0.3, 0.1, 0.5, 0.1

outs a1*aenv, a1*aenv

endin


instr SYNTH6

kfreq1  chnget  "freq6"
kamp	 chnget 	"amp6"

kmod    chnget  "mod6"
krat    chnget  "rat6"

kcps1 mtof kfreq1


a1 foscil 0.5, kcps1, 1, kmod, krat, 1


aenv madsr 0.3, 0.1, 0.5, 0.1

outs a1*aenv, a1*aenv

endin


instr SYNTH7

kfreq1  chnget  "freq7"
kamp	 chnget 	"amp7"

kmod    chnget  "mod7"
krat    chnget  "rat7"

kcps1 mtof kfreq1


a1 foscil 0.5, kcps1, 1, kmod, krat, 1


aenv madsr 0.3, 0.1, 0.5, 0.1

outs a1*aenv, a1*aenv

endin


instr SEQ2
	kNotes[] fillarray 0, 0, 0, 0, 0, 0, 0, 0

	kBeat init 0
	kTempo chnget "tempo"
	if metro(kTempo) == 1 then
		if kNotes[kBeat] == 1 then
			event "i", "SYNTH", 0, 1, kBeat
		endif
		chnset kBeat, "beat"
		kBeat = (kBeat<7 ? kBeat+1 : 0)
		
	endif

	kUpdateIndex chnget "updateTable"

	if changed(kUpdateIndex) == 1 then
		kNotes[kUpdateIndex] = kNotes[kUpdateIndex]==1 ? 0 : 1
		printks "Updating table - index: %d - value %d", 0, kUpdateIndex, kNotes[kUpdateIndex]
	endif
endin

instr SYNTH200

a1 vco2 0.5, 800

outs a1, a1

endin

</CsInstruments>
<CsScore>
f 1 0 16384 10 1                ;sine
i"SEQ" 0 [3600*12]
i"SEQ2" 0 [3600*12]
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
