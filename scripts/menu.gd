extends Control

func _on_PLAY_pressed():
	get_tree().change_scene("res://escenas/Mundo.tscn")
	


func _on_SALIR_pressed():
	get_tree().quit()


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

