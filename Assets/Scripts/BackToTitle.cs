using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class BackToTitle : MonoBehaviour
{
    public string sceneToLoad; // Assign the scene name to load in the Inspector

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            // Load the assigned scene
            SceneManager.LoadScene(sceneToLoad);
        }
    }
}
