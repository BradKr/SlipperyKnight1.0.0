extends Node

var coins = 0
var tiempo = 180
func _ready():
	
	$coincollet.text = String(coins)	
	
#llamamos a la funcion ya creada
#esto hara que las monedas se sumen cada vez que se recojan poniendo en nuestra consola cada vez que se 
#recojan imprimiendo "coin collected"
func HandleCoincollected():
	 print("Coin Collected")
	 coins+=1
	 $coincollet.text = String(coins)	
#cuando se compruebe que se hayan cogido las 5 monedas cambiara la escenaw
	 if coins==5:
		 get_tree().change_scene("res://escenas/Nivel2.tscn")

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(tiempo/60) + ":"+ String(tiempo%60)

func _on_Timer_timeout():
	if (tiempo >0):
		tiempo-=1
		update_time()
	else:
		get_tree().reload_current_scene()
