using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KnobsAsset; 

public class BackgroundControl : MonoBehaviour
{
    public AudioSource audioSource;
    public SliderKnob volKnob;

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        // Get the normalized knob value from the SliderKnob script
        float knobValue = volKnob.GetKnobValue();

        // Map the normalized value to the desired volume range
        float mappedVol = Mathf.Lerp(0, 1, knobValue);

        // Set the volume of the AudioSource with the mapped volume value
        audioSource.volume = mappedVol;


    }
}
