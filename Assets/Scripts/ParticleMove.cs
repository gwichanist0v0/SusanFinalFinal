using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ParticleMove : MonoBehaviour
{
    public List<GameObject> objectsToMove;
    public float minSpeed = 1.0f;
    public float maxSpeed = 3.0f;
    public float moveableRange = 10.0f; // Range around the current Y position

    private List<float> speeds;
    private List<float> directions;
    private List<float> targetHeights;

    void Start()
    {
        speeds = new List<float>();
        directions = new List<float>();
        targetHeights = new List<float>();

        // Initialize random speeds, directions, and target heights for each object
        foreach (GameObject obj in objectsToMove)
        {
            float speed = Random.Range(minSpeed, maxSpeed);
            speeds.Add(speed);

            float direction = Random.value > 0.5f ? 1.0f : -1.0f;
            directions.Add(direction);

            float currentHeight = obj.transform.position.y;
            float targetHeight = currentHeight + Random.Range(-moveableRange, moveableRange);
            targetHeights.Add(targetHeight);
        }
    }

    void Update()
    {
        for (int i = 0; i < objectsToMove.Count; i++)
        {
            GameObject obj = objectsToMove[i];
            float speed = speeds[i];
            float direction = directions[i];
            float targetHeight = targetHeights[i];

            // Move the object up and down
            float newY = obj.transform.position.y + speed * direction * Time.deltaTime;
            obj.transform.position = new Vector3(obj.transform.position.x, newY, obj.transform.position.z);

            // Change direction when reaching target height
            if (direction > 0 && newY >= targetHeight || direction < 0 && newY <= targetHeight)
            {
                directions[i] *= -1.0f;

                // Calculate new random target height within moveable range
                float currentHeight = obj.transform.position.y;
                targetHeights[i] = currentHeight + Random.Range(-moveableRange, moveableRange);
            }
        }
    }
}
