using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KnobsAsset;

public class BassPitch : MonoBehaviour
{
    public float minPitch;
    public float maxPitch;
    //public float minBuff;
    //public float maxBuff;
    private CsoundUnity csoundUnity;
    public GameObject csound;
    public SliderKnob freqKnob;
    //public SliderKnob buffKnob;
    public string freqChannel;
    //public string buffChannel;

    // Start is called before the first frame update
    void Start()
    {
        csoundUnity = csound.GetComponent<CsoundUnity>();
    }

    // Update is called once per frame
    void Update()
    {
        // Get the normalized knob value from the SliderKnob script
        float knobValue = freqKnob.GetKnobValue();
        //float buffValue = buffKnob.GetKnobValue();

        // Map the normalized value to the desired range
        float mappedPitch = Mathf.Lerp(minPitch, maxPitch, knobValue);
        //float mappedBuffer = Mathf.Lerp(minBuff, maxBuff, buffValue);

        //Round it
        mappedPitch = Mathf.Round(mappedPitch);
        //mappedBuffer = Mathf.Round(mappedBuffer);

        // Set the csound channels with the mapped volume value
        csoundUnity.SetChannel(freqChannel, mappedPitch);
        Debug.Log(mappedPitch); 
        //csoundUnity.SetChannel(buffChannel, mappedBuffer); 

    }
}
