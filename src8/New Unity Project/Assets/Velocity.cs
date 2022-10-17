using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Velocity : MonoBehaviour
{
	RigidBody2D rb;
    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<RigidBody2D>();
    }

    void FixedUpdate()
    {
    	float x = Input.GetAxis("Horizontal");
    	float y = Input.GetAxis("Vertical");

    	rb.velocity = new Vector2(x,y);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
