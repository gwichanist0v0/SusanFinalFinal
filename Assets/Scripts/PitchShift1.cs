using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PitchShift1 : MonoBehaviour
{
    public Transform sphere;
    public Transform cube;
    public float minValue = 100f;
    public float maxValue = 20000f;
    public string channel;
    private CsoundUnity csoundUnity;
    public GameObject csound;

    private void Start()
    {
        csoundUnity = csound.GetComponent<CsoundUnity>();
    }

    void Update()
    {
        // Calculate the mapped value based on the relative position of the sphere to the cylinder
        float cylinderHeight = cube.localScale.y;
        float cylinderPositionY = cube.transform.position.y;
        float spherePositionY = sphere.transform.position.y;

        // Calculate the radius of the sphere
        float sphereRadius = sphere.localScale.y / 2f;

        // Calculate the relative position, taking into account the radius of the sphere
        float relativePosition = Mathf.Clamp01((spherePositionY - cylinderPositionY - sphereRadius) / (cylinderHeight - sphereRadius * 2f));
        float mappedValue = (relativePosition * (maxValue - minValue)) + minValue;

        // Round the mapped value to the nearest 10
        mappedValue = Mathf.Round(mappedValue / 10f) * 10f;

        // Set the csound channel with the mapped value
        csoundUnity.SetChannel("freq1", mappedValue);
    }
}
