using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OnOrOff : MonoBehaviour
{

    public AudioSource audioSource;
    public AudioReverbFilter audioReverb;
    public AudioEchoFilter audioEcho;

    public GameObject audioOnOff;
    public GameObject reverbOnOff;
    public GameObject echoOnOff;


    // Update is called once per frame
    void Update()
    {

        if (audioSource.enabled)
        {
            audioOnOff.SetActive(true);
        }
        else
        {
            audioOnOff.SetActive(false);
        }

        if (audioReverb.enabled)
        {
            reverbOnOff.SetActive(true);
        }
        else
        {
            reverbOnOff.SetActive(false);
        }

        if (audioEcho.enabled)
        {
            echoOnOff.SetActive(true);
        }
        else
        {
            echoOnOff.SetActive(false); 
        }

    }
}
