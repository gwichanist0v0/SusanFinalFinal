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

kamp    chnget  "amp0"
kfreq   chnget  "freq0"
kvdepth chnget  "vdepth0"
kvrate  chnget  "vrate0"

katt    chnget  "attk0"
kdec    chnget  "dec0"
ksus    chnget  "sus0"
krel    chnget  "rel0"


aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig fmbell kamp, kfreq, 5, 5, kvdepth, kvrate


     outs asig*aenv*0.1, asig*aenv*0.1

endin


instr SYNTH1

kamp    chnget  "amp1"
kfreq   chnget  "freq1"
kvdepth chnget  "vdepth1"
kvrate  chnget  "vrate1"

katt    chnget  "attk1"
kdec    chnget  "dec1"
ksus    chnget  "sus1"
krel    chnget  "rel1"


aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig fmbell kamp, kfreq, 5, 5, kvdepth, kvrate
     outs asig*aenv*0.1, asig*aenv*0.1

endin


instr SYNTH2

kamp    chnget  "amp2"
kfreq   chnget  "freq2"
kvdepth chnget  "vdepth2"
kvrate  chnget  "vrate2"

katt    chnget  "attk2"
kdec    chnget  "dec2"
ksus    chnget  "sus2"
krel    chnget  "rel2"


aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig fmbell kamp, kfreq, 5, 5, kvdepth, kvrate
     outs asig*aenv*0.1, asig*aenv*0.1

endin


instr SYNTH3

kamp    chnget  "amp3"
kfreq   chnget  "freq3"
kvdepth chnget  "vdepth3"
kvrate  chnget  "vrate3"

katt    chnget  "attk3"
kdec    chnget  "dec3"
ksus    chnget  "sus3"
krel    chnget  "rel3"


aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig fmbell kamp, kfreq, 5, 5, kvdepth, kvrate
     outs asig*aenv*0.1, asig*aenv*0.1

endin


instr SYNTH4

kamp    chnget  "amp4"
kfreq   chnget  "freq4"
kvdepth chnget  "vdepth4"
kvrate  chnget  "vrate4"

katt    chnget  "attk4"
kdec    chnget  "dec4"
ksus    chnget  "sus4"
krel    chnget  "rel4"


aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig fmbell kamp, kfreq, 5, 5, kvdepth, kvrate
     outs asig*aenv*0.1, asig*aenv*0.1

endin


instr SYNTH5

kamp    chnget  "amp5"
kfreq   chnget  "freq5"
kvdepth chnget  "vdepth5"
kvrate  chnget  "vrate5"

katt    chnget  "attk5"
kdec    chnget  "dec5"
ksus    chnget  "sus5"
krel    chnget  "rel5"


aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig fmbell kamp, kfreq, 5, 5, kvdepth, kvrate
     outs asig*aenv*0.1, asig*aenv*0.1

endin


instr SYNTH6

kamp    chnget  "amp6"
kfreq   chnget  "freq6"
kvdepth chnget  "vdepth6"
kvrate  chnget  "vrate6"

katt    chnget  "attk6"
kdec    chnget  "dec6"
ksus    chnget  "sus6"
krel    chnget  "rel6"


aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig fmbell kamp, kfreq, 5, 5, kvdepth, kvrate
     outs asig*aenv*0.1, asig*aenv*0.1

endin


instr SYNTH7

kamp    chnget  "amp7"
kfreq   chnget  "freq7"
kvdepth chnget  "vdepth7"
kvrate  chnget  "vrate7"

katt    chnget  "attk7"
kdec    chnget  "dec7"
ksus    chnget  "sus7"
krel    chnget  "rel7"


aenv madsr i(katt), i(kdec), i(ksus), i(krel)

asig fmbell kamp, kfreq, 5, 5, kvdepth, kvrate
     outs asig*aenv*0.1, asig*aenv*0.1

endin




</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
f 1 0 32768 10 1
//i 1 0 3 0.2 
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
