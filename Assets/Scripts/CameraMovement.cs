using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraMovement : MonoBehaviour
{
    public float moveSpeed = 5.0f;
    public float rotationSpeed = 100.0f;
    public float maxVerticalAngle = 80.0f; // Maximum vertical rotation angle in degrees

    private float pitch = 0.0f; // Current pitch angle
    private float yaw = 0.0f;   // Current yaw angle

    void Update()
    {
        // Camera movement using arrow keys
        float horizontalMovement = Input.GetAxis("Horizontal");
        float verticalMovement = Input.GetAxis("Vertical");

        Vector3 translation = new Vector3(horizontalMovement, 0, verticalMovement) * moveSpeed * Time.deltaTime;
        transform.Translate(translation);

        float horizontalRotation = 0.0f;
        float verticalRotation = 0.0f;

        // Rotation inputs
        if (Input.GetKey(KeyCode.A))
        {
            horizontalRotation = -1.0f;
        }
        else if (Input.GetKey(KeyCode.D))
        {
            horizontalRotation = 1.0f;
        }

        if (Input.GetKey(KeyCode.S))
        {
            verticalRotation = -1.0f;
        }
        else if (Input.GetKey(KeyCode.W))
        {
            verticalRotation = 1.0f;
        }

        yaw += horizontalRotation * rotationSpeed * Time.deltaTime;
        pitch -= verticalRotation * rotationSpeed * Time.deltaTime;

        pitch = Mathf.Clamp(pitch, -maxVerticalAngle, maxVerticalAngle);

        // Apply rotations
        transform.localRotation = Quaternion.Euler(pitch, yaw, 0);
    }
}
