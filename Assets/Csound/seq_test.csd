<Cabbage>
form caption("Untitled") size(400, 300), guiMode("queue") pluginId("def1")
rslider bounds(296, 162, 100, 100), channel("gain"), range(0, 1, 0, 1, .01), text("Gain"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")

hslider bounds(134, 74, 150, 50) channel("pitch") range(0, 1, 0, 1, 0.001)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1


instr SEQ
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
instr SYNTH

;kamp    chnget  "amp0"
;kcps    chnget  "freq0"
;
;katt    chnget  "attk0"
;kdec    chnget  "dec0"
;ksus    chnget  "sus0"
;krel    chnget  "rel0"

;kfreq mtof kcps
aenv madsr 0.1, 0.1, 0.1, 0.1
;aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig pluck 1, 300, 800, 0, 1
outs asig*aenv, asig*aenv
endin



</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
//f 1 0 16384 10 1
;starts instrument 1 and runs it for a week
//i 1 0 1
i "SEQ" 0 [3600*12]

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
