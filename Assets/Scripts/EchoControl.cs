using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KnobsAsset;

public class EchoControl : MonoBehaviour
{

    public AudioEchoFilter audioEcho;
    public RotaryKnob delayKnob;
    public RotaryKnob decayRatioKnob;
    public RotaryKnob dryKnob;
    public RotaryKnob wetKnob;


    // Start is called before the first frame update
    public void ToggleAudioEcho()
    {
        if (audioEcho != null)
        {
            audioEcho.enabled = !audioEcho.enabled;
        }

    }

    // Update is called once per frame
    void Update()
    {
        float normalisedDelay = delayKnob.ValueNormalized;
        float normalisedDecayRat = decayRatioKnob.ValueNormalized;
        float normalisedDry = dryKnob.ValueNormalized;
        float normalisedWet = wetKnob.ValueNormalized;

        float mappedDelay = Mathf.Lerp(10, 5000, normalisedDelay);
        float mappedDecayRat = Mathf.Lerp(0, 1, normalisedDecayRat);
        float mappedDry = Mathf.Lerp(0, 1, normalisedDry);
        float mappedWet = Mathf.Lerp(0, 1, normalisedWet);

        audioEcho.delay = mappedDelay;
        audioEcho.decayRatio = mappedDecayRat;
        audioEcho.dryMix = mappedDry;
        audioEcho.wetMix = mappedWet;

    }
}
