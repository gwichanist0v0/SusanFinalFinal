using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KnobsAsset;

public class VibratoChange : MonoBehaviour
{
    public float minVibDepth;
    public float maxVibDepth;
    public float minVibRate;
    public float maxVibRate;
    private CsoundUnity csoundUnity;
    public GameObject csound;
    public string vdChannel;
    public string vrChannel;
    public RotaryKnob vibDepthKnob;
    public RotaryKnob vibRateKnob;

    // Start is called before the first frame update
    void Start()
    {
        csoundUnity = csound.GetComponent<CsoundUnity>();
    }

    // Update is called once per frame
    void Update()
    {
        // Calculate normalized knob values
        float normalizedVibDepth = vibDepthKnob.ValueNormalized;
        float normalizedVibRate = vibRateKnob.ValueNormalized;

        // Map the normalized values to the desired range
        float mappedVibDepth = Mathf.Lerp(minVibDepth, maxVibDepth, normalizedVibDepth);
        float mappedVibRate = Mathf.Lerp(minVibRate, maxVibRate, normalizedVibRate);

        // Set the csound channels with the mapped values
        csoundUnity.SetChannel(vdChannel, mappedVibDepth);
        csoundUnity.SetChannel(vrChannel, mappedVibRate);
        // Debug.Log("DEPTH" + mappedVibDepth + "RATE" + mappedVibRate); 
    }
}
