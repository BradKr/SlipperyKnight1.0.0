extends Area2D


signal coincollet

func _on_Coin2D_body_entered(body):
	#cada vez que nuestro player colisione con las monedas 
	if body.get_name() == "Player":
		
		body.add_Coin()
		queue_free()
		pass 
