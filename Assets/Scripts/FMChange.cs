using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KnobsAsset;

public class FMChange : MonoBehaviour
{
    //public float minCar;
    //public float maxCar;
    public float minMod;
    public float maxMod;
    public float minRat;
    public float maxRat;
    private CsoundUnity csoundUnity;
    public GameObject csound;
    //public string carChannel;
    public string modChannel;
    public string ratChannel;
    //public RotaryKnob carKnob;
    public RotaryKnob modKnob;
    public RotaryKnob ratKnob;

    // Start is called before the first frame update
    void Start()
    {
        csoundUnity = csound.GetComponent<CsoundUnity>();
    }

    // Update is called once per frame
    void Update()
    {
        // Calculate normalized knob values
        //float normalisedCar = carKnob.ValueNormalized;
        float normalisedMod = modKnob.ValueNormalized;
        float normalisedRat = ratKnob.ValueNormalized;

        // Map the normalized values to the desired range
        //float mappedCar = Mathf.Lerp(minCar, maxCar, normalisedCar);
        float mappedMod = Mathf.Lerp(minMod, maxMod, normalisedMod);
        float mappedRat = Mathf.Lerp(minRat, maxRat, normalisedRat);

        // Set the csound channels with the mapped values
        //csoundUnity.SetChannel(carChannel, mappedCar);
        csoundUnity.SetChannel(modChannel, mappedMod);
        csoundUnity.SetChannel(ratChannel, mappedRat);

    }
}
