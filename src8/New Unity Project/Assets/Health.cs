using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Health : MonoBehaviour
{
	public int health;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void TakeDamage(int damage)
    {
    	this.health -= damage;
    	if(this.health <= 0)
    	{
    		this.health = 0;
    		Die();
    	}
    }

    void Die()
    {
    	//TODO:play an animation, update the score etc.
    	Destroy(gameObject);
    }
}
