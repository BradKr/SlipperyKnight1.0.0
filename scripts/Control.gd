extends Control

func _on_Boton_de_pausa_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		$Efecto.interpolate_property($botones,"rect_position",$botones.rect_position,$botones.rect_position+Vector2(-1164,0),1,Tween.TRANS_BACK,Tween.EASE_IN)
		$Efecto.start()
	else:
		get_tree().paused= true
		$Efecto.interpolate_property($botones,"rect_position",$botones.rect_position,$botones.rect_position+Vector2(1164,0),1,Tween.TRANS_BACK,Tween.EASE_IN)
		$Efecto.start()


func _on_Salir_pressed():
	get_tree().quit()


func _on_Continuar_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		$Efecto.interpolate_property($botones,"rect_position",$botones.rect_position,$botones.rect_position+Vector2(-1164,0),1,Tween.TRANS_BACK,Tween.EASE_IN)
		$Efecto.start()
