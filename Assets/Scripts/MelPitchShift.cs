using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KnobsAsset; 

public class MelPitchShift : MonoBehaviour
{
    private CsoundUnity csoundUnity;
    public GameObject csound;
    public string pitChannel;
    public SliderKnob sliderKnob; // Reference to the SliderKnob script

    private float[] pitch = {
        130.81f, // C3
        146.83f, // D3
        164.81f, // E3
        196.00f, // G3
        220.00f, // A3
        261.63f, // C4
        293.66f, // D4
        329.63f, // E4
        392.00f, // G4
        440.00f, // A4
        523.25f  // C5
    };

    void Start()
    {
        csoundUnity = csound.GetComponent<CsoundUnity>();
    }

    // Update is called once per frame
    void Update()
    {
        // Get the knob's value (mapped to [0, 1])
        float knobValue = sliderKnob.GetKnobValue();

        // Calculate the index based on the knob value and the number of available pitch values
        int index = Mathf.FloorToInt(knobValue * pitch.Length);

        // Ensure the index stays within valid array bounds
        index = Mathf.Clamp(index, 0, pitch.Length - 1);

        // Get the frequency from the pitch array using the calculated index
        float freq = pitch[index];

        // Set the csound channel with the mapped value
        csoundUnity.SetChannel(pitChannel, freq);
    }
}
