using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KnobsAsset;

public class HarmPitch : MonoBehaviour
{
    public float minHarm1;
    public float maxHarm1;
    //public float minHarm2;
    //public float maxHarm2;
    //public float minHarm3;
    //public float maxHarm3;
    private CsoundUnity csoundUnity;
    public GameObject csound;
    public SliderKnob harmKnob1;
    //public SliderKnob harmKnob2;
    //public SliderKnob harmKnob3;
    public string harmChannel1;
    //public string harmChannel2;
    //public string harmChannel3;

    // Start is called before the first frame update
    void Start()
    {
        csoundUnity = csound.GetComponent<CsoundUnity>();
    }

    // Update is called once per frame
    void Update()
    {
        // Get the normalized knob value from the SliderKnob script
        float knobValue1 = harmKnob1.GetKnobValue();
        //float knobValue2 = harmKnob2.GetKnobValue();
        //float knobValue3 = harmKnob3.GetKnobValue();

        // Map the normalized value to the desired range
        float mappedHarm1 = Mathf.Lerp(minHarm1, maxHarm1, knobValue1);
        //float mappedHarm2 = Mathf.Lerp(minHarm2, maxHarm2, knobValue2);
        //float mappedHarm3 = Mathf.Lerp(minHarm3, maxHarm3, knobValue3);

        //Round it
        mappedHarm1 = Mathf.Round(mappedHarm1);
        //mappedHarm2 = Mathf.Round(mappedHarm2);
        //mappedHarm3 = Mathf.Round(mappedHarm3);

        // Set the csound channels with the mapped volume value
        csoundUnity.SetChannel(harmChannel1, mappedHarm1);
        //csoundUnity.SetChannel(harmChannel2, mappedHarm2);
        //csoundUnity.SetChannel(harmChannel3, mappedHarm3);
        //Debug.Log("1+" + mappedHarm1);
        //Debug.Log("2+" + mappedHarm2);
        //Debug.Log("3+" + mappedHarm3);
    }
}
