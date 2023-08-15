using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KnobsAsset; 

public class ReverbControl : MonoBehaviour
{

    public AudioReverbFilter audioReverb;
    public RotaryKnob dryKnob;
    public RotaryKnob roomKnob;
    public RotaryKnob roomHFKnob;
    public RotaryKnob roomLFKnob;
    public RotaryKnob decayTKnob;
    public RotaryKnob decayHfRKnob;
    public RotaryKnob reflectLvlKnob;
    public RotaryKnob reflectDelKnob;
    public RotaryKnob rvbLvlKnob;
    public RotaryKnob rvbDelKnob;
    public RotaryKnob HFRefKnob;
    public RotaryKnob LFRefKnob;
    public RotaryKnob diffKnob;
    public RotaryKnob densKnob; 


    public void ToggleAudioReverb()
    {
        if (audioReverb != null)
        {
            audioReverb.enabled = !audioReverb.enabled; 
        }

    }

    // Update is called once per frame
    void Update()
    {
        float normalisedDry = dryKnob.ValueNormalized;
        float normalisedRoom = roomKnob.ValueNormalized;
        float normalisedRoomHF = roomHFKnob.ValueNormalized;
        float normalisedRoomLF = roomLFKnob.ValueNormalized;
        float normalisedDecTime = decayTKnob.ValueNormalized;
        float normalisedDecHFRatio = decayHfRKnob.ValueNormalized;
        float normalisedReflectLvl = reflectLvlKnob.ValueNormalized;
        float normalisedReflectDel = reflectDelKnob.ValueNormalized;
        float normalisedRvbLvl = rvbLvlKnob.ValueNormalized;
        float normalisedRvbDel = rvbDelKnob.ValueNormalized;
        float normalisedHFRef = HFRefKnob.ValueNormalized;
        float normalisedLFRef = LFRefKnob.ValueNormalized;
        float normalisedDiffusion = diffKnob.ValueNormalized;
        float normalisedDensity = densKnob.ValueNormalized;


        float mappedDry = Mathf.Lerp(-10000, 0, normalisedDry);
        float mappedRoom = Mathf.Lerp(-10000, 0, normalisedRoom);
        float mappedRoomHF = Mathf.Lerp(-10000, 0, normalisedRoomHF);
        float mappedRoomLF = Mathf.Lerp(-10000, 0, normalisedRoomLF);
        float mappedDecTime = Mathf.Lerp(0.1f, 20, normalisedDecTime);
        float mappedDecHFRat = Mathf.Lerp(0.1f, 2, normalisedDecHFRatio);
        float mappedReflectLvl = Mathf.Lerp(-10000, 1000, normalisedReflectLvl);
        float mappedReflectDel = Mathf.Lerp(0, 0.3f, normalisedReflectDel);
        float mappedRvbLvl = Mathf.Lerp(-10000, 2000, normalisedRvbLvl);
        float mappedRvbDel = Mathf.Lerp(0, 0.1f, normalisedRvbDel);
        float mappedHFRef = Mathf.Lerp(1000, 20000, normalisedHFRef);
        float mappedLFRef = Mathf.Lerp(20, 1000, normalisedLFRef);
        float mappedDiff = Mathf.Lerp(0, 100, normalisedDiffusion);
        float mappedDens = Mathf.Lerp(0, 100, normalisedDensity);


        audioReverb.dryLevel = mappedDry;
        audioReverb.room = mappedRoom;
        audioReverb.roomHF = mappedRoomHF;
        audioReverb.roomLF = mappedRoomLF;
        audioReverb.decayTime = mappedDecTime;
        audioReverb.decayHFRatio = mappedDecHFRat;
        audioReverb.reflectionsLevel = mappedReflectLvl;
        audioReverb.reflectionsDelay = mappedReflectDel;
        audioReverb.reverbLevel = mappedRvbLvl;
        audioReverb.reverbDelay = mappedRvbDel;
        audioReverb.hfReference = mappedHFRef;
        audioReverb.lfReference = mappedLFRef;
        audioReverb.diffusion = mappedDiff;
        audioReverb.density = mappedDens; 
        
    }
}
