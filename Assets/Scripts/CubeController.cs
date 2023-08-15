using UnityEngine;
using System.Collections;

public class CubeController : MonoBehaviour
{
    private Renderer rend;
    public bool state = false;
    private int cubeIndex;
    public Material offMaterial;
    public Material onMaterial;
    public GameObject GameManager;

    void Start()
    {
        rend = GetComponent<Renderer>();
        string cubeName = gameObject.name;
        int.TryParse(cubeName.Substring(cubeName.IndexOf("(") + 1, 1), out cubeIndex);
    }

    void OnMouseDown()
    {
        state = !state;

        if (state)
        {
            rend.material = onMaterial;
            Debug.Log("Is On");
        }
        else
        {
            rend.material = offMaterial;
        }

        Debug.Log("Cubbed"); 
        GameManager.GetComponent<MainController>().EnableCubeToPlaySound(cubeIndex);
    }
}
