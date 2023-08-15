using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TreeRotate : MonoBehaviour
{
    public GameObject objectToRotate; // Assign the GameObject to rotate
    public float rotationSpeed = 30.0f; // Speed of rotation in degrees per second

    void Update()
    {
        if (objectToRotate != null)
        {
            // Calculate the new rotation angle
            float rotationAngle = rotationSpeed * Time.deltaTime;

            // Apply the rotation around the current position
            objectToRotate.transform.RotateAround(objectToRotate.transform.position, Vector3.up, rotationAngle);
        }
    }
}
