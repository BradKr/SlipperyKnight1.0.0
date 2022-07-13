extends Area2D


func _on_Area2D_body_entered(body):
	#cada vez que nuestro player colisione con los colisionShape se reseteara la escena 
	if body.get_name()== "Player":
		print("Hemos caido")
		get_tree().reload_current_scene()
