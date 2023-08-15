using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using KnobsAsset; 

public class ADSR : MonoBehaviour
{
    private float minAttk = 0.01f;
    private float maxAttk = 1f;
    private float minDec = 0.01f;
    private float maxDec = 1f;
    private float minSus = 0.01f;
    private float maxSus = 1f;
    private float minRel = 0.01f;
    private float maxRel = 1f;
    private CsoundUnity csoundUnity;
    public GameObject csound;
    public SliderKnob attkKnob;
    public SliderKnob decKnob;
    public SliderKnob susKnob;
    public SliderKnob relKnob;
    public string aChannel;
    public string dChannel;
    public string sChannel;
    public string rChannel;

    // Start is called before the first frame update
    void Start()
    {
        csoundUnity = csound.GetComponent<CsoundUnity>();
    }

    // Update is called once per frame
    void Update()
    {
        // Get the normalized knob value from the SliderKnob script
        float attkValue = attkKnob.GetKnobValue();
        float decValue = decKnob.GetKnobValue();
        float susValue = susKnob.GetKnobValue();
        float relValue = relKnob.GetKnobValue();


        // Map the normalized value to the desired range
        float mappedAttkVal = Mathf.Lerp(minAttk, maxAttk, attkValue);
        float mappedDecVal = Mathf.Lerp(minDec, maxDec, decValue);
        float mappedSusVal = Mathf.Lerp(minSus, maxSus, susValue);
        float mappedRelVal = Mathf.Lerp(minRel, maxRel, relValue);


        // Set the csound channels with the mapped volume value
        csoundUnity.SetChannel(aChannel, mappedAttkVal);
        csoundUnity.SetChannel(dChannel, mappedDecVal);
        csoundUnity.SetChannel(sChannel, mappedSusVal);
        csoundUnity.SetChannel(rChannel, mappedRelVal);

        //csoundUnity.SetChannel("attk0", 0.1);
        //csoundUnity.SetChannel("dec0", 0.1);
        //csoundUnity.SetChannel("sus0", 0.1);
        //csoundUnity.SetChannel("rel0", 0.1);

    }
}
