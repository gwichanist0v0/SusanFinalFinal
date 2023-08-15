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
0dbfs = 1

instr SEQ
    kNotes[] fillarray 0, 0, 0, 0, 0, 0, 0, 0
    kBeat init 0
    kTempo chnget "tempo"
       if metro(kTempo) == 1 then
            if kNotes[kBeat] == 1 then
              if (kBeat == 0) then
                 event "i", "SYNTH0", 0, 0.5, 0
              elseif (kBeat == 1) then
                 event "i", "SYNTH1", 0, 0.5, 1
              elseif (kBeat == 2) then
                 event "i", "SYNTH2", 0, 0.5, 2
              elseif (kBeat == 3) then
                 event "i", "SYNTH3", 0, 0.5, 3
              elseif (kBeat == 4) then
                 event "i", "SYNTH4", 0, 0.5, 4
              elseif (kBeat == 5) then
                 event "i", "SYNTH5", 0, 0.5, 5
              elseif (kBeat == 6) then
                 event "i", "SYNTH6", 0, 0.5, 6
              elseif (kBeat == 7) then
                 event "i", "SYNTH7", 0, 0.5, 7
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

kamp    chnget  "amp0"
kcps    chnget  "freq0"

katt    chnget  "attk0"
kdec    chnget  "dec0"
ksus    chnget  "sus0"
krel    chnget  "rel0"

kfreq mtof kcps

aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig pluck 1, 300, 800, 0, 1
outs asig*aenv, asig*aenv
endin


instr SYNTH1

kamp    chnget  "amp1"
kcps    chnget  "freq1"

katt    chnget  "attk1"
kdec    chnget  "dec1"
ksus    chnget  "sus1"
krel    chnget  "rel1"

kfreq mtof kcps

aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig pluck kamp, kfreq, 800, 0, 1
outs asig*aenv, asig*aenv
endin

instr SYNTH2

kamp    chnget  "amp2"
kcps    chnget  "freq2"

katt    chnget  "attk2"
kdec    chnget  "dec2"
ksus    chnget  "sus2"
krel    chnget  "rel2"

kfreq mtof kcps

aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig pluck kamp, kfreq, 800, 0, 1
outs asig*aenv, asig*aenv
endin

instr SYNTH3

kamp    chnget  "amp3"
kcps    chnget  "freq3"

katt    chnget  "attk3"
kdec    chnget  "dec3"
ksus    chnget  "sus3"
krel    chnget  "rel3"

kfreq mtof kcps

aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig pluck kamp, kfreq, 800, 0, 1
outs asig*aenv, asig*aenv
endin

instr SYNTH4

kamp    chnget  "amp4"
kcps    chnget  "freq4"

katt    chnget  "attk4"
kdec    chnget  "dec4"
ksus    chnget  "sus4"
krel    chnget  "rel4"

kfreq mtof kcps

aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig pluck kamp, kfreq, 800, 0, 1
outs asig*aenv, asig*aenv
endin

instr SYNTH5

kamp    chnget  "amp5"
kcps    chnget  "freq5"

katt    chnget  "attk5"
kdec    chnget  "dec5"
ksus    chnget  "sus5"
krel    chnget  "rel5"

kfreq mtof kcps

aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig pluck kamp, kfreq, 800, 0, 1
outs asig*aenv, asig*aenv
endin

instr SYNTH6

kamp    chnget  "amp6"
kcps    chnget  "freq6"

katt    chnget  "attk6"
kdec    chnget  "dec6"
ksus    chnget  "sus6"
krel    chnget  "rel6"

kfreq mtof kcps

aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig pluck kamp, kfreq, 800, 0, 1
outs asig*aenv, asig*aenv
endin

instr SYNTH7

kamp    chnget  "amp7"
kcps    chnget  "freq7"

katt    chnget  "attk7"
kdec    chnget  "dec7"
ksus    chnget  "sus7"
krel    chnget  "rel7"

kfreq mtof kcps

aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig pluck kamp, kfreq, 800, 0, 1
outs asig*aenv, asig*aenv
endin



</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i"SEQ" 0 [3600*12]
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
