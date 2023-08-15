using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KnobsAsset; 

public class TempoShift : MonoBehaviour
{
    public float minTemp;
    public float maxTemp;
    private CsoundUnity csoundUnity;
    public GameObject csound;
    public RotaryKnob tempKnob;

    // Start is called before the first frame update
    void Start()
    {
        csoundUnity = csound.GetComponent<CsoundUnity>();
    }

    // Update is called once per frame
    void Update()
    {
        // Calculate normalized knob values
        float normalizedTempo = tempKnob.ValueNormalized;

        // Map the normalized values to the desired range
        float mappedTempo = Mathf.Lerp(minTemp, maxTemp, normalizedTempo);

        mappedTempo = Mathf.Round(mappedTempo);

        // Set the csound channels with the mapped values
        csoundUnity.SetChannel("tempo", mappedTempo);
    }
}
