using UnityEngine;

public class FirstPersonLook : MonoBehaviour
{
    [SerializeField]
    Transform character;
    public float sensitivity = 2;

    Vector2 velocity;

    void Reset()
    {
        // Get the character from the FirstPersonMovement in parents.
        character = GetComponentInParent<FirstPersonMovement>().transform;
    }

    void Start()
    {
        // Lock the mouse cursor to the game screen.
        Cursor.lockState = CursorLockMode.Locked;
    }

    void Update()
    {
        // Get input for horizontal and vertical look.
        float horizontalInput = Input.GetAxis("Horizontal");
        float verticalInput = Input.GetAxis("Vertical");

        // Calculate rotation based on input.
        Vector3 rotationAmount = new Vector3(-verticalInput, horizontalInput, 0) * sensitivity * Time.deltaTime;

        // Apply rotation to the character.
        character.Rotate(rotationAmount);

        // Limit the vertical rotation of the character.
        Vector3 currentRotation = character.localRotation.eulerAngles;
        currentRotation.x = Mathf.Clamp(currentRotation.x, -90f, 90f);
        character.localRotation = Quaternion.Euler(currentRotation);
    }
}

