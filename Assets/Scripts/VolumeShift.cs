using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KnobsAsset;

public class VolumeShift : MonoBehaviour
{
    public float minVol;
    public float maxVol;
    private CsoundUnity csoundUnity;
    public GameObject csound;
    public SliderKnob volKnob;
    public string volChannel;

    // Start is called before the first frame update
    void Start()
    {
        csoundUnity = csound.GetComponent<CsoundUnity>();
    }

    // Update is called once per frame
    void Update()
    {
        // Get the normalized knob value from the SliderKnob script
        float knobValue = volKnob.GetKnobValue();

        // Map the normalized value to the desired range
        float mappedVol = Mathf.Lerp(minVol, maxVol, knobValue);

        // Set the csound channels with the mapped volume value
        csoundUnity.SetChannel(volChannel, mappedVol);
        //csoundUnity.SetChannel("amp0", 0.5);
        
    }
}
